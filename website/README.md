# Website React + PHP + Nginx

Frontend React/Vite y API PHP para el entorno local de AzerothCore 3.3.5a.

## Estado actual

```text
React/Vite                 Implementado
Nginx                      Implementado
PHP-FPM                    Implementado
Validación de entradas     Implementada
Headers de seguridad       Implementados
CSRF                       Implementado para endpoints mutables
Rate limiting              Implementado en memoria de archivos local
JWT                        Infraestructura implementada
Registro SRP6              Pendiente de activar
Login SRP6                 Implementado y probado
Panel autenticado         Implementado: cuenta y personajes
```

El login web SRP6 ya está implementado y probado contra la revisión exacta de AzerothCore. El registro web continúa bloqueado hasta añadir una prueba de escritura SRP6 segura. No se debe sustituir SRP6 por bcrypt, Argon2 o `password_hash()`: el cliente WoW necesita `salt` y `verifier` compatibles.

## Estructura

```text
website/
├── Dockerfile
├── README.md
├── api.php
├── auth.php
├── db.php
├── http.php
├── nginx.conf
├── rate-limit.php
├── security.php
├── srp6.php
├── validation.php
├── composer.json
├── index.html
├── package.json
├── vite.config.js
└── src/
    ├── main.jsx
    └── styles.css
```

El SQL del usuario limitado está en:

```text
../database/website-user.sql
```

## Arquitectura

```text
Browser
  │
  ├── React/Vite durante desarrollo :4000
  │       └── proxy /api -> :9090
  │
  └── Nginx + React compilado :9090
          └── /api/* -> PHP-FPM
                    └── MySQL acore_auth
```

### Puertos

```text
Vite desarrollo:       http://127.0.0.1:4000
Nginx/API producción:  http://127.0.0.1:9090
```

El puerto `4000` es el servidor de desarrollo de Vite. El contenedor Docker publica el frontend compilado y la API por `9090`.

## Configuración local

En la raíz, `.env` debe contener valores locales coherentes:

```dotenv
WEBSITE_DB_USER=website
WEBSITE_DB_PASSWORD=change_this_website_password
JWT_SECRET=change_this_jwt_secret_to_at_least_32_bytes
JWT_ISSUER=azerothcore-website
JWT_AUDIENCE=azerothcore-client
```

Para una instalación real, cambia `WEBSITE_DB_PASSWORD` y `JWT_SECRET` por valores aleatorios. `JWT_SECRET` debe tener al menos 32 bytes.

Generar un secreto con PowerShell:

```powershell
[Convert]::ToBase64String((1..48 | ForEach-Object { Get-Random -Maximum 256 }))
```

No subas `.env` al repositorio.

## Usuario MySQL limitado

La web no debe usar `root`. El script crea un usuario con permisos de lectura para el panel y el login futuro:

```sql
CREATE USER IF NOT EXISTS 'website'@'%' IDENTIFIED BY 'change_this_website_password';
GRANT SELECT ON acore_auth.account TO 'website'@'%';
GRANT SELECT ON acore_auth.account_access TO 'website'@'%';
GRANT SELECT ON acore_characters.characters TO 'website'@'%';
FLUSH PRIVILEGES;
```

Ejecuta desde la raíz del proyecto:

```powershell
docker compose exec -T ac-database mysql -uroot -proot < .\database\website-user.sql
```

Si cambias la contraseña en `.env`, cambia también la contraseña del usuario MySQL:

```sql
ALTER USER 'website'@'%' IDENTIFIED BY 'NUEVA_CONTRASEÑA';
FLUSH PRIVILEGES;
```

El usuario tiene `SELECT` limitado y únicamente `INSERT` sobre las columnas necesarias para crear cuentas SRP6. No tiene permisos de `UPDATE`, `DELETE`, DDL ni privilegios administrativos.

## Desarrollo React con Vite

Requisitos:

- Node.js LTS
- npm

Desde PowerShell:

```powershell
cd "D:\Servidor WOW 3.3.5 Local\website"
npm install
npm run dev
```

Abre:

```text
http://127.0.0.1:4000
```

El proxy de `vite.config.js` envía `/api` a `http://127.0.0.1:9090`.

## Actualizar el website después de cambios

Desde la raíz del proyecto:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
```

Si cambias React, PHP, Nginx, Composer o variables del contenedor:

```powershell
docker compose build ac-website
docker compose up -d --force-recreate ac-website
docker compose ps ac-website
docker compose logs --tail=100 ac-website
```

Si solo cambias React durante desarrollo, usa Vite:

```powershell
cd .\website
npm install
npm run dev
```

Para detener Vite:

```text
Ctrl-C
```

## Build Docker

Desde la raíz:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose build ac-website
docker compose up -d --force-recreate ac-website
```

Abre:

```text
http://127.0.0.1:9090
```

Ver logs:

```powershell
docker compose logs -f ac-website
```

## API

### Obtener CSRF

```http
GET /api/register
```

La respuesta entrega un token y establece la cookie `csrf_token`.

### Registro

```http
POST /api/register
Content-Type: application/json
X-CSRF-Token: <token>
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

El endpoint valida correo, usuario y contraseña. La creación de cuentas permanece pendiente de activar para escribir `salt`/`verifier` SRP6.

### Login

```http
POST /api/login
Content-Type: application/json
X-CSRF-Token: <token>
```

El login usa correo electrónico, no el nombre de usuario:

```json
{
  "email": "admin@example.com",
  "password": "AdminLocal123"
}
```

El endpoint valida correo, SRP6, CSRF y rate limiting. Con credenciales correctas emite una cookie JWT `HttpOnly`; con credenciales incorrectas devuelve `401`.

### Sesión actual

```http
GET /api/me
```

Lee el JWT desde la cookie `access_token` y valida firma, emisor, audiencia y expiración.

### Personajes de la cuenta

```http
GET /api/characters
```

Devuelve únicamente `name`, `level`, `race`, `class` y `online` del account ID contenido en el JWT. No devuelve inventario, posición, dinero, sesión ni credenciales.

### Cambio de contraseña

```http
POST /api/password
Content-Type: application/json
X-CSRF-Token: <token>
```

Cuerpo:

```json
{
  "current_password": "PasswordActual",
  "new_password": "NuevaPassword123",
  "new_password_confirmation": "NuevaPassword123"
}
```

La ruta requiere JWT, verifica la contraseña actual, genera nuevos valores SRP6, actualiza solo `salt/verifier`, invalida la sesión y exige volver a iniciar sesión. El usuario MySQL solo tiene `UPDATE (salt, verifier)` para esta operación.

Debe implementarse usando `SRP6::MakeRegistrationData` equivalente para generar un nuevo `salt` y `verifier`, verificando primero la contraseña actual. No se debe usar `password_hash()` porque rompería el login del cliente WoW.

### Cerrar sesión

```http
POST /api/logout
X-CSRF-Token: <token>
```

Limpia la cookie JWT.

## JWT

La infraestructura está en `auth.php` y utiliza `firebase/php-jwt`:

- Algoritmo: HS256.
- Cookie `HttpOnly`.
- `SameSite=Strict`.
- `Secure` cuando la petición usa HTTPS.
- Expiración del access token: 15 minutos.
- Claims: `iss`, `aud`, `iat`, `nbf`, `exp`, `sub`, `username`.
- No contiene contraseñas ni nivel GM.

JWT no reemplaza SRP6. SRP6 autentica el cliente WoW; JWT autentica la sesión de la web.

Para cloud se recomienda migrar a claves asimétricas RS256 y añadir refresh tokens rotatorios persistidos en una tabla de sesiones. La implementación actual usa HS256 para mantener el entorno local sencillo y no almacenar refresh tokens todavía.

## CSRF

Los endpoints mutables requieren:

1. Cookie `csrf_token`.
2. Header `X-CSRF-Token` con el mismo valor.
3. Cookie `SameSite=Strict`.

React obtiene el token antes de enviar registro o login. No desactives esta comprobación para simplificar pruebas.

## Rate limiting

`rate-limit.php` limita por IP usando archivos temporales:

```text
Registro: 5 solicitudes cada 15 minutos
Login:    10 solicitudes cada 15 minutos
```

Esto es adecuado para desarrollo local o una sola instancia. Para cloud con varias réplicas debe sustituirse por Redis, un reverse proxy o el rate limiting del proveedor, porque los archivos temporales no son un contador distribuido.

## OWASP aplicado

### A01 Broken Access Control

- JWT en cookie `HttpOnly`.
- Validación de claims.
- Endpoint `/api/me` requiere autenticación.
- El usuario web no recibe permisos administrativos.

### A02 Cryptographic Failures

- No se guardan contraseñas web en logs.
- Cookies seguras según HTTPS.
- Secretos fuera del código.
- SRP6 no se reemplaza por un hash incompatible.

### A03 Injection

- Validación estricta de entradas.
- Usar `mysqli` preparado en la capa de datos cuando se active escritura.
- No interpolar nombres de tabla o SQL desde peticiones.

### A04 Insecure Design

- Registro bloqueado hasta validar SRP6.
- Rate limiting.
- Separación de frontend, API y base de datos.

### A05 Security Misconfiguration

- Headers de seguridad en Nginx y API.
- Archivos ocultos bloqueados.
- PHP-FPM no se publica.
- No usar `root` desde la web.

### A07 Identification and Authentication Failures

- JWT con expiración corta.
- CSRF para mutaciones.
- Rate limiting para login.
- Refresh tokens aún pendientes.

### A08 Software and Data Integrity Failures

- Dependencias declaradas en `composer.json` y `package.json`.
- Fijar versiones antes de producción.
- Revisar módulos y dependencias.

### A09 Logging and Monitoring Failures

- Errores genéricos al cliente.
- Logs disponibles mediante Docker.
- Monitorización y alertas cloud pendientes.

### A10 SSRF

- La API no acepta URLs externas.
- No crear endpoints de proxy sin una lista permitida de destinos.

## SRP6 pendiente

El archivo `srp6.php` contiene el cálculo de verificación y requiere la extensión GMP. El orden de bytes y la normalización se validaron contra una cuenta creada por `worldserver`; el login ya puede emitir JWT. El registro SRP6 está implementado y probado. El cambio de contraseña está implementado en `POST /api/password`: verifica la contraseña actual, genera nuevos valores SRP6, actualiza únicamente `salt/verifier`, invalida la cookie JWT y obliga a iniciar sesión nuevamente.

El esquema actual de AzerothCore usa:

```text
account.salt     BINARY(32)
account.verifier  BINARY(32)
```

El código oficial define:

```text
N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

Y el registro usa:

```text
v = g ^ H(salt || H(USERNAME || ':' || PASSWORD)) mod N
```

La normalización debe coincidir con `Utf8ToUpperOnlyLatin` de AzerothCore antes de calcular los valores. No se debe activar el registro hasta probar:

1. Creación desde la web.
2. Login web.
3. Login con el cliente WoW.
4. Rechazo de contraseña incorrecta.
5. Rechazo de usuario duplicado.
6. No exposición de salt/verifier en respuestas HTTP.

## Panel de cuenta

La interfaz React ya tiene una vista mínima de panel después del login:

- Nombre de la cuenta.
- Lista resumida de personajes.
- Nivel.
- Estado online.
- Cierre de sesión.

Endpoints implementados:

```text
GET /api/me
GET /api/characters
POST /api/logout
```

Cada endpoint privado verifica JWT y usa consultas `SELECT` con el usuario limitado.

Endpoints previstos:

```text
GET /api/realms
GET /api/news
POST /api/password
```

El cambio de contraseña se mantiene pendiente hasta terminar SRP6. El panel nunca debe permitir desde el frontend público:

Nunca permitas desde el panel público:

- Cambiar nivel GM.
- Modificar dinero directamente.
- Ejecutar comandos GM.
- Modificar SQL arbitrario.
- Acceder a `session_key`.
- Ver `salt` o `verifier`.

## Pruebas

Validar Compose:

```powershell
docker compose config
```

Construir:

```powershell
docker compose build ac-website
```

Recrear:

```powershell
docker compose up -d --force-recreate ac-website
```

Comprobar:

```powershell
docker compose ps ac-website
docker compose logs --tail=100 ac-website
```

Pruebas manuales:

- Abrir `http://127.0.0.1:9090`.
- Abrir `http://127.0.0.1:4000` con Vite.
- Enviar usuario inválido.
- Enviar contraseña corta.
- Enviar confirmación distinta.
- Enviar una petición POST sin CSRF y comprobar `403`.
- Superar el límite de solicitudes y comprobar `429`.
- Comprobar que el registro responde `501` hasta activar SRP6.

## Producción cloud

Antes de publicar:

- Cambia todos los secretos.
- Usa HTTPS.
- Cambia JWT a RS256 o almacena el secreto HS256 fuera del repositorio.
- No expongas MySQL ni SOAP.
- Sustituye rate limiting de archivos por Redis o proxy distribuido.
- Crea el usuario MySQL limitado.
- Añade refresh tokens rotatorios.
- Añade auditoría de login sin registrar contraseñas.
- Ejecuta pruebas de seguridad y restauración.
