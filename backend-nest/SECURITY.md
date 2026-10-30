# Estado de seguridad NestJS + Express

## Estado actual

| Control | Estado |
|---|---|
| SQL Injection | Cubierto en repositorio: `mysql2.execute` con parámetros |
| BOLA/IDOR | Cubierto en personajes: filtro por `account` autenticado |
| Rate limiting | Implementado en memoria para una instancia |
| Mass assignment | Cubierto por `ValidationPipe` con whitelist y DTOs estrictos |
| CORS | Allowlist mediante `CORS_ORIGINS`; no se usa `*` |
| Helmet | Configurado en `main.ts` |
| JWT | Firma HS256, issuer, audience y expiración corta |
| Cookies HttpOnly | Cookie `access_token` HttpOnly y SameSite Strict |
| CSRF | Double-submit: cookie `csrf_token` + header `x-csrf-token` |
| Validación | `ValidationPipe`, DTOs y `class-validator` |
| MySQL/SOAP públicos | El backend Nest no publica ninguno; revisar Compose/cloud |
| Logs seguros | `SafeLogger` omite trazas y no registra secretos |
| Tests BOLA/IDOR | Incluidos |
| Tests mass assignment | Incluidos |
| Tests SQL injection | Incluidos |

## Tests

```powershell
npm run build --prefix "D:\Servidor WOW 3.3.5 Local\backend-nest"
npm test --prefix "D:\Servidor WOW 3.3.5 Local\backend-nest"
```

Resultado verificado:

```text
Test Suites: 5 passed, 5 total
Tests:       9 passed, 9 total
```

## Base de datos

Esta fase no ejecuta `INSERT`, `UPDATE`, `DELETE` ni DDL. Las consultas del backend NestJS son de lectura y los tests usan mocks.

## Arranque aislado

Cuando Docker Desktop esté activo:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose build ac-backend-nest
docker compose up -d ac-backend-nest
docker compose ps ac-backend-nest
docker compose logs -f ac-backend-nest
```

Puerto aislado:

```text
http://127.0.0.1:9200
```

NestJS no reemplaza todavía PHP ni está conectado al frontend React.
