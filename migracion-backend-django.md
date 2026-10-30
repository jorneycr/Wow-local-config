# Migración progresiva del backend PHP a Django

Plan de migración segura para AzerothCore 3.3.5a.

## Objetivo

Migrar gradualmente el backend web actual PHP a Django + Django REST Framework sin perder:

- Login por correo con SRP6.
- Registro SRP6.
- Cambio de contraseña SRP6.
- JWT en cookie HttpOnly.
- CSRF.
- Rate limiting.
- Panel de cuenta.
- Listado de personajes.
- Ficha detallada de personajes.
- Compatibilidad con el cliente WoW.
- Datos existentes de MySQL.

El backend PHP permanece activo durante toda la transición.

## Estado inicial

```text
Frontend: React/Vite
Backend actual: PHP 8.2 + Nginx
Base de datos: MySQL 8.4
Authserver: AzerothCore SRP6
Frontend/API actual: http://127.0.0.1:9090
Vite: http://127.0.0.1:4000
```

## Arquitectura objetivo

```text
React/Vite
    │
    ▼
Nginx
    │
    ├── /api/* -> Django + Gunicorn
    │                 │
    │                 ├── acore_auth
    │                 └── acore_characters
    │
    └── frontend estático
```

Durante la migración:

```text
PHP actual:      9090
Django paralelo: 9100
```

## Reglas de seguridad

- No borrar volúmenes Docker.
- No ejecutar `docker compose down -v`.
- No modificar `ADMIN` durante las pruebas.
- Usar una cuenta temporal para pruebas.
- No cambiar `salt` o `verifier` manualmente.
- Mantener PHP activo hasta que Django tenga paridad completa.
- No exponer MySQL ni SOAP.
- No guardar contraseñas en logs.
- Usar el usuario MySQL limitado.
- Validar SRP6 contra cuentas creadas por AzerothCore.

## Contratos que Django debe conservar

```text
GET  /api/register
POST /api/register
POST /api/login
GET  /api/me
GET  /api/characters
GET  /api/character?guid=ID
POST /api/password
POST /api/logout
```

Respuestas esperadas:

```text
Login correcto:       200 + cookie JWT
Contraseña incorrecta:401
Registro correcto:    201
Duplicado:            409
CSRF ausente:         403
Rate limit:           429
Personaje ajeno:      404
```

## Estructura Django

```text
backend/
├── Dockerfile
├── requirements.txt
├── manage.py
├── config/
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── accounts/
│   ├── services/
│   │   └── srp6.py
│   ├── api.py
│   ├── urls.py
│   └── tests.py
└── characters/
    ├── api.py
    ├── urls.py
    └── tests.py
```

## Fases

### Fase 1: congelar contratos

Crear pruebas contra el backend PHP actual para registrar respuestas y errores esperados.

No se cambian datos.

### Fase 2: backend Django paralelo

El backend paralelo está creado en `backend/` y ahora incluye:

- SRP6 compatible con AzerothCore.
- JWT en cookie HttpOnly.
- CSRF de Django.
- Rate limiting por IP en memoria.
- Registro y login por correo.
- Cambio de contraseña SRP6.
- Lectura autenticada de cuentas y personajes.

El Compose lo publica en:

```text
http://127.0.0.1:9100
```

Levantarlo cuando Docker Desktop esté activo:

```powershell
docker compose build ac-backend-django
docker compose up -d ac-backend-django
docker compose logs -f ac-backend-django
```

Smoke test desde PowerShell nativo:

```powershell
$csrfResponse = Invoke-WebRequest http://127.0.0.1:9100/api/csrf -SessionVariable djangoSession
$csrf = ($csrfResponse.Content | ConvertFrom-Json).csrf_token
$headers = @{ 'X-CSRFToken' = $csrf }
$body = @{ email='django-test@example.com'; username='DJANGOTEST'; password='DjangoTest123'; password_confirmation='DjangoTest123' } | ConvertTo-Json
Invoke-WebRequest http://127.0.0.1:9100/api/register -Method Post -WebSession $djangoSession -Headers $headers -ContentType 'application/json' -Body $body
```

El frontend actual no cambia todavía. El servicio paralelo se prueba de forma independiente y no reemplaza PHP hasta completar las pruebas de paridad.

Endpoints Django paralelos:

```text
GET  /api/csrf
POST /api/register
POST /api/login
GET  /api/me
GET  /api/characters
GET  /api/character?guid=ID
POST /api/password
POST /api/logout
```

El endpoint de registro usa `/api/csrf` para obtener la cookie/token CSRF. El frontend actual no se conecta aún a Django.

### Fase 3: SRP6

Implementar:

```text
N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

Usar el mismo proceso que AzerothCore:

- Normalización ASCII/Latin compatible.
- SHA1 de `USERNAME:PASSWORD`.
- Salt binario de 32 bytes.
- Verifier binario de 32 bytes.
- Endianess compatible con `BigNumber`.

### Fase 4: autenticación

Implementar login y cambio de contraseña con:

- JWT en cookie HttpOnly.
- Expiración corta.
- CSRF.
- Rate limiting.
- Usuario MySQL limitado.

### Fase 5: lectura del panel

Implementar:

```text
GET /api/me
GET /api/characters
GET /api/character?guid=ID
```

Validar siempre que el personaje pertenece al account ID del JWT.

### Fase 6: registro y escritura

Implementar registro y cambio de contraseña con permisos mínimos.

### Fase 7: migración del frontend

Configurar Vite para probar Django en `9100`.

### Fase 8: cambio de proxy

Cuando todo pase:

```text
/api/* -> Django
```

### Fase 9: retirar PHP

Solo después de:

- Pruebas de login.
- Pruebas de registro.
- Pruebas de cambio de contraseña.
- Prueba del cliente WoW.
- Restauración de backup.
- Prueba de rollback.

## Rollback

Si Django falla:

1. Detener solo Django.
2. Restaurar el proxy a PHP.
3. Mantener MySQL intacto.
4. Revisar logs.
5. Restaurar backup solo si hubo una escritura incorrecta.

## Capacidad cloud

Django + Gunicorn consume algo más que PHP-FPM, pero una instancia de:

```text
4 vCPU
8 GB RAM
```

es suficiente para la API junto con AzerothCore en una comunidad pequeña/mediana.

## Tests Python

Los tests están organizados en:

```text
backend/accounts/tests.py
backend/characters/tests.py
backend/securitytests/tests.py
```

Ejecutar toda la suite dentro de Docker:

```powershell
docker compose exec ac-backend-django python manage.py test accounts characters securitytests -v 2
```

La suite cubre:

- Verificación SRP6.
- Normalización de usuario/contraseña.
- Password incorrecta.
- Generación de salt/verifier.
- JWT y claims.
- Validación de email y contraseña.
- Aislamiento de personajes por account ID.
- Personaje inexistente.
- Cookie CSRF.
- Rechazo de login sin CSRF.

## Criterio de finalización

La migración termina cuando Django pasa todos los contratos y el cliente WoW puede iniciar sesión con cuentas creadas o modificadas desde Django.
