# Backend NestJS + Express

Backend paralelo para migrar progresivamente desde PHP sin modificar la base de datos, React ni los servicios actuales.

## Seguridad mínima implementada

- DTOs estrictos con `class-validator`.
- `ValidationPipe` global con `whitelist` y `forbidNonWhitelisted`.
- Helmet.
- CORS con allowlist.
- JWT firmado con issuer, audience y expiración.
- Cookie HttpOnly para access token.
- CSRF double-submit.
- SQL parametrizado con `mysql2`.
- Control BOLA/IDOR por `account_id` del JWT.
- Logging seguro.
- Rate limiting en memoria configurado para una instancia.
- Tests de seguridad.

## Restricciones

- Express es el adaptador HTTP definitivo.
- No cambiar el frontend React.
- No cambiar el backend PHP.
- No modificar el esquema MySQL.
- No ejecutar `INSERT`, `UPDATE`, `DELETE` ni DDL durante las pruebas.
- Usar mocks para pruebas de seguridad.
- Mantener el servicio aislado en el puerto `9200`.

## Docker

Desde la raíz del proyecto:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose build ac-backend-nest
docker compose up -d ac-backend-nest
docker compose ps ac-backend-nest
docker compose logs -f ac-backend-nest
```

URL aislada:

```text
http://127.0.0.1:9200
```

El rate limiting local no requiere servicios externos.

## Tests

```powershell
cd "D:\Servidor WOW 3.3.5 Local\backend-nest"
npm install
npm test
```

El build y los tests SRP6 se ejecutan sin escribir en MySQL.

## Compatibilidad SRP6

El servicio usa los parámetros de AzerothCore:

```text
N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
salt: 32 bytes
verifier: 32 bytes little-endian
```

Tests incluidos:

- Generación de `salt/verifier`.
- Verificación de contraseña correcta.
- Rechazo de contraseña incorrecta.
- Normalización ASCII compatible.
- Formato binario de 32 bytes.

Una prueba de login contra una cuenta real requiere conocer su contraseña actual. No se debe cambiar una cuenta existente solo para probar NestJS durante esta fase.

## Base de datos

NestJS usa `mysql2` y consultas parametrizadas. Durante esta fase se permite únicamente lectura.

No se ejecuta:

```text
INSERT
UPDATE
DELETE
ALTER
DROP
```

Las pruebas de SQL usan mocks.

## Endpoints previstos

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

## Estado

```text
TypeScript build: OK
SRP6 unit tests:  OK
Helmet:          configurado
CORS allowlist:  configurado
DTO validation:  configurado
CSRF:            double-submit configurado
JWT:             configurado
Rate limiting:    memoria local
MySQL writes:    deshabilitadas durante pruebas
React:           sin cambios
PHP:             sin cambios
Django:          sin cambios
```
