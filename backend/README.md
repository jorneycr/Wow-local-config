# Backend Django de AzerothCore

Backend paralelo para el portal web de AzerothCore/WotLK 3.3.5a.

Este servicio implementa la nueva API en Django sin reemplazar todavía el backend PHP que continúa funcionando en el puerto `9090`.

## 1. Servicios

```text
Backend PHP actual:  http://127.0.0.1:9090
Backend Django:      http://127.0.0.1:9100
MySQL:               ac-database:3306
```

El backend Django se ejecuta dentro de Docker como:

```text
ac-backend-django
```

El frontend React sigue utilizando PHP hasta completar la migración y las pruebas de paridad.

## 2. Estructura

```text
backend/
├── Dockerfile
├── requirements.txt
├── manage.py
├── config/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── accounts/
│   ├── __init__.py
│   ├── apps.py
│   ├── api.py
│   ├── auth.py
│   ├── http.py
│   ├── rate_limit.py
│   ├── security.py
│   ├── tests.py
│   ├── urls.py
│   └── services/
│       └── security.py
├── characters/
│   ├── __init__.py
│   ├── apps.py
│   ├── api.py
│   ├── tests.py
│   └── urls.py
└── securitytests/
    ├── __init__.py
    └── tests.py
```

## 3. Dependencias

Archivo:

```text
requirements.txt
```

Dependencias principales:

```text
Django
Django REST Framework
PyJWT
mysqlclient
Gunicorn
```

Django REST Framework está preparado para ampliar la API, mientras que los endpoints actuales utilizan vistas Django ligeras y respuestas JSON.

## 4. Construir y arrancar

Desde la raíz del proyecto, no desde `backend`:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
```

Construir:

```powershell
docker compose build ac-backend-django
```

Arrancar:

```powershell
docker compose up -d ac-backend-django
```

Verificar:

```powershell
docker compose ps ac-backend-django
```

Logs:

```powershell
docker compose logs -f ac-backend-django
```

El servicio publica:

```text
http://127.0.0.1:9100
```

## 5. Comprobar Django

Ejecutar el system check:

```powershell
docker compose exec ac-backend-django python manage.py check
```

Resultado esperado:

```text
System check identified no issues (0 silenced).
```

## 6. Endpoints

### CSRF

```text
GET /api/csrf
```

Devuelve un token CSRF y establece la cookie de Django.

### Registro

```text
POST /api/register
```

Cuerpo:

```json
{
  "email": "player@example.com",
  "username": "PLAYER",
  "password": "Password123",
  "password_confirmation": "Password123"
}
```

Respuestas principales:

```text
201 Cuenta creada
409 Usuario o correo duplicado
422 Datos inválidos
403 CSRF inválido
429 Rate limit excedido
```

El registro genera:

```text
salt:     32 bytes aleatorios
verifier: 32 bytes SRP6
```

### Login

```text
POST /api/login
```

Cuerpo:

```json
{
  "email": "player@example.com",
  "password": "Password123"
}
```

Respuesta correcta:

```text
200
Set-Cookie: access_token=...
```

El JWT se guarda en una cookie `HttpOnly`; no se devuelve para que React lo almacene en `localStorage`.

### Cuenta autenticada

```text
GET /api/me
```

Requiere cookie JWT.

Devuelve información limitada:

```json
{
  "id": 1,
  "username": "PLAYER",
  "email": "player@example.com",
  "joindate": "2026-10-22T10:00:00",
  "last_login": "2026-10-22T10:10:00",
  "last_ip": "127.0.0.1"
}
```

### Personajes

```text
GET /api/characters
```

Devuelve solamente los personajes de la cuenta contenida en el JWT:

```json
{
  "characters": [
    {
      "guid": 1,
      "name": "Jorney",
      "level": 80,
      "race": 10,
      "class": 2,
      "online": false
    }
  ]
}
```

### Detalle de personaje

```text
GET /api/character?guid=1
```

El `guid` solo se puede consultar si pertenece a la cuenta autenticada.

Incluye datos ligeros:

- Nombre.
- Nivel.
- Raza y clase.
- Estado online.
- Salud.
- Oro.
- Honor.
- Arena points.
- Bajas.
- Tiempo jugado.
- Mapa y zona.
- Fecha de creación.

No devuelve:

- Inventario completo.
- `session_key`.
- Salt.
- Verifier.
- Datos administrativos.
- SQL interno.

### Cambio de contraseña

```text
POST /api/password
```

Cuerpo:

```json
{
  "current_password": "PasswordActual",
  "new_password": "NuevaPassword123",
  "new_password_confirmation": "NuevaPassword123"
}
```

El flujo:

1. Valida JWT.
2. Verifica CSRF.
3. Comprueba la contraseña actual con SRP6.
4. Genera un nuevo salt.
5. Genera un nuevo verifier.
6. Actualiza únicamente `salt` y `verifier`.
7. Invalida la cookie JWT.
8. Obliga a iniciar sesión nuevamente.

### Logout

```text
POST /api/logout
```

Requiere JWT y CSRF. Elimina la cookie `access_token`.

## 7. SRP6

El cliente WoW 3.3.5a no utiliza bcrypt ni `password_hash()`.

Django usa los mismos parámetros que AzerothCore:

```text
N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

La generación usa:

```text
USERNAME:PASSWORD
```

en mayúsculas compatibles con la normalización de AzerothCore.

El esquema MySQL utiliza:

```text
account.salt
account.verifier
```

Ambos campos son binarios de 32 bytes.

La implementación Django se valida mediante tests de:

- Generación de datos SRP6.
- Login correcto.
- Login incorrecto.
- Normalización de mayúsculas.
- Cambio de contraseña.

## 8. JWT

Configuración:

```text
Algoritmo: HS256
Duración: 15 minutos
Cookie: access_token
HttpOnly: sí
SameSite: Strict
Secure: según COOKIE_SECURE
```

Claims:

```text
iss
 aud
iat
nbf
exp
sub
username
```

El JWT no contiene:

- Contraseñas.
- Salt.
- Verifier.
- GM level.
- Inventario.
- Datos privados innecesarios.

En cloud se recomienda usar una clave fuerte y migrar a RS256 cuando existan varios servicios que necesiten validar tokens.

## 9. CSRF

Django protege las rutas mutables:

```text
POST /api/register
POST /api/login
POST /api/password
POST /api/logout
```

Flujo:

1. Cliente obtiene `/api/csrf`.
2. Django establece cookie `csrftoken`.
3. Cliente envía el mismo valor en `X-CSRFToken`.
4. Django valida cookie y header.

Una petición mutante sin CSRF debe responder:

```text
403 Forbidden
```

## 10. Rate limiting

El rate limiter actual funciona por IP en memoria del proceso:

```text
Registro: 5 solicitudes cada 15 minutos
Login:    10 solicitudes cada 15 minutos
Password: 5 solicitudes cada 15 minutos
```

Esto es suficiente para pruebas y una sola instancia. Para varias réplicas cloud se debe migrar a Redis o al reverse proxy.

## 11. Base de datos

Django utiliza el usuario limitado `website`:

```dotenv
DB_HOST=ac-database
DB_PORT=3306
DB_USER=website
DB_PASSWORD=change_this_website_password
```

Permisos requeridos:

```sql
SELECT sobre las columnas necesarias de account
INSERT de columnas de registro
UPDATE únicamente de salt y verifier
SELECT de characters
```

No se utiliza el usuario root desde Django.

No se ejecutan migraciones Django sobre las tablas de AzerothCore. La API accede a las tablas existentes mediante SQL parametrizado para evitar alterar su esquema.

## 12. Seguridad OWASP

### Injection

- SQL parametrizado.
- No concatenar valores del usuario.
- No aceptar nombres de tabla o columna desde HTTP.

### Broken Access Control

- JWT obligatorio en endpoints privados.
- Personajes filtrados por `account`.
- Un usuario no puede consultar personajes ajenos.

### Authentication Failures

- SRP6 compatible.
- JWT HttpOnly.
- Expiración corta.
- Rate limiting.
- CSRF.

### Cryptographic Failures

- No usar hashes incompatibles.
- Secretos en variables de entorno.
- No registrar contraseñas.

### Security Misconfiguration

- MySQL no debe exponerse a Internet.
- SOAP no debe exponerse a Internet.
- `DJANGO_DEBUG=0` en cloud.
- `SECRET_KEY` y `JWT_SECRET` deben cambiarse.

## 13. Tests

Los tests están en:

```text
accounts/tests.py
characters/tests.py
securitytests/tests.py
```

Ejecutar toda la suite:

```powershell
docker compose exec ac-backend-django python manage.py test accounts characters securitytests -v 2
```

Resultado esperado:

```text
Ran 12 tests
OK
```

La suite prueba:

- SRP6.
- JWT.
- Validación.
- CSRF.
- Aislamiento de personajes.
- Personajes inexistentes.
- Rechazo de login sin CSRF.

## 14. Variables de entorno

Variables utilizadas:

```dotenv
DJANGO_SECRET_KEY=secreto-django
DJANGO_DEBUG=0
JWT_SECRET=secreto-jwt-de-32-bytes-o-mas
JWT_ISSUER=azerothcore-django
JWT_AUDIENCE=azerothcore-client
COOKIE_SECURE=0
DB_HOST=ac-database
DB_PORT=3306
DB_USER=website
DB_PASSWORD=contraseña-del-usuario-limitado
```

En HTTPS cloud:

```dotenv
COOKIE_SECURE=1
```

No subas `.env` al repositorio.

## 15. Migración

Django está aislado en `9100` para no afectar PHP.

Orden recomendado:

1. Ejecutar tests.
2. Probar registro temporal.
3. Probar login temporal.
4. Probar panel.
5. Probar personajes.
6. Probar cambio de contraseña.
7. Probar el cliente WoW.
8. Cambiar el proxy de React a Django.
9. Monitorizar.
10. Retirar PHP solo después de confirmar paridad.
