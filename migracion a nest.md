# Migración a NestJS + Express + SRP6 + MySQL2 + Nginx + Docker + React

Arquitectura objetivo para evolucionar el portal de AzerothCore/WotLK 3.3.5a hacia una plataforma mantenible, escalable y segura.

> La migración debe hacerse progresivamente. El backend PHP actual permanece operativo hasta que NestJS alcance paridad funcional y supere todas las pruebas de compatibilidad.

## 1. Objetivos

- Mantener compatibilidad con AzerothCore y el cliente WoW 3.3.5a.
- Migrar el backend sin perder cuentas ni personajes.
- Mantener SRP6 exactamente compatible.
- Preparar tienda, votos, pagos y membresías para una fase posterior.
- Separar responsabilidades según SOLID.
- Aplicar controles de OWASP Top 10.
- Escalar horizontalmente cuando sea necesario.
- Mantener rollback sencillo durante toda la migración.

## 2. Arquitectura general

```text
                                ┌──────────────┐
                                │   Jugador    │
                                └──────┬───────┘
                                       │ HTTPS
                                       ▼
                                ┌──────────────┐
                                │    Nginx     │
                                │ reverse proxy│
                                └───┬──────┬───┘
                                    │      │
                         frontend   │      │ /api
                                    ▼      ▼
                            ┌─────────┐ ┌──────────────┐
                            │ React   │ │ NestJS       │
                            │ Vite    │ │ Express      │
                            │ static  │ │              │
                            └─────────┘ └──┬───────┬───┘
                                           │
                                           ▼
                                   ┌──────────────┐
                                   │ MySQL 8.4    │
                                   │ AzerothCore  │
                                   └──────────────┘

```

## 3. Stack tecnológico

```text
Frontend:       React + Vite + TypeScript
Backend:        NestJS + TypeScript
HTTP adapter:   Express
Auth:           SRP6 + JWT
Database:       MySQL 8.4
Driver SQL:     mysql2
Proxy:          Nginx
Runtime:        Node.js LTS
Deployment:     Docker + Docker Compose
Logs:           Pino estructurado
Testing:        Jest + Supertest
API docs:       OpenAPI/Swagger
```

### Fastify o Express

Para una API nueva se recomienda:

```text
NestJS + Fastify
```

Fastify ofrece menor overhead y buen throughput.

Express también es válido si el equipo ya domina su ecosistema o necesita middleware específico. NestJS mantiene la estructura y la inyección de dependencias en ambos casos.

## 4. Estructura del backend

```text
backend/
├── src/
│   ├── main.ts
│   ├── app.module.ts
│   ├── auth/
│   │   ├── auth.controller.ts
│   │   ├── auth.service.ts
│   │   ├── auth.module.ts
│   │   ├── guards/
│   │   └── strategies/
│   ├── srp6/
│   │   ├── srp6.service.ts
│   │   ├── srp6.constants.ts
│   │   └── srp6.spec.ts
│   ├── accounts/
│   │   ├── accounts.controller.ts
│   │   ├── accounts.service.ts
│   │   ├── accounts.repository.ts
│   │   ├── dto/
│   │   └── accounts.module.ts
│   ├── characters/
│   │   ├── characters.controller.ts
│   │   ├── characters.service.ts
│   │   ├── characters.repository.ts
│   │   └── characters.module.ts
│   ├── realms/
│   ├── store/
│   ├── payments/
│   ├── votes/
│   ├── memberships/
│   ├── admin/
│   ├── audit/
│   ├── jobs/
│   │   ├── queues.module.ts
│   │   ├── delivery.worker.ts
│   │   └── webhook.worker.ts
│   ├── common/
│   │   ├── guards/
│   │   ├── pipes/
│   │   ├── filters/
│   │   ├── decorators/
│   │   ├── interceptors/
│   │   └── errors/
│   └── database/
│       ├── mysql.module.ts
│       ├── mysql.provider.ts
│       └── transaction.service.ts
├── test/
│   ├── auth.e2e-spec.ts
│   ├── srp6.e2e-spec.ts
│   ├── accounts.e2e-spec.ts
│   └── characters.e2e-spec.ts
├── Dockerfile
├── package.json
├── tsconfig.json
└── nest-cli.json
```

## 5. Responsabilidades por módulo

### `auth`

- Login por correo.
- Registro.
- Logout.
- JWT.
- Refresh tokens.
- CSRF.
- Guards.
- Cookies.

### `srp6`

- Parámetros `N` y `g`.
- Normalización AzerothCore.
- Generación de `salt`.
- Generación de `verifier`.
- Verificación de contraseña.
- Tests de compatibilidad.

### `accounts`

- Consulta de datos públicos de cuenta.
- Cambio de contraseña mediante el servicio SRP6.
- Datos de perfil solo lectura.

### `characters`

- Lista de personajes de la cuenta autenticada.
- Ficha detallada.
- Validación de pertenencia por `account_id`.

### `store`

- Productos.
- Wallet.
- Ledger.
- Entregas.
- Historial.

### `payments`

- Órdenes.
- Checkout.
- Webhooks firmados.
- Idempotencia.
- Reembolsos.

### `jobs`

- Entrega de productos.
- Procesamiento de pagos.
- Notificaciones.
- Reintentos controlados.

## 6. Contratos API compatibles

Durante la migración NestJS debe mantener las rutas existentes:

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

Respuestas esperadas:

```text
200  Login, sesión, lectura correcta
201  Registro correcto
401  No autenticado o credenciales incorrectas
403  CSRF inválido o acceso prohibido
404  Personaje no encontrado
409  Usuario/correo duplicado
422  Validación incorrecta
429  Rate limit excedido
```

## 7. SRP6

El cliente WoW 3.3.5a utiliza SRP6 de AzerothCore.

Parámetros:

```text
N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

Campos de la base:

```text
account.salt
account.verifier
```

Ambos son `BINARY(32)`.

### Reglas

- Normalizar usuario como AzerothCore.
- Normalizar contraseña como AzerothCore.
- Usar SHA1 según el algoritmo del servidor.
- Mantener little-endian compatible con `BigNumber`.
- No sustituir por bcrypt.
- No sustituir por Argon2.
- No usar `password_hash()`.
- No guardar la contraseña en texto plano.

### Tests obligatorios

```text
Cuenta creada por AzerothCore + login NestJS
Cuenta creada por NestJS + login AzerothCore
Contraseña correcta
Contraseña incorrecta
Cambio de contraseña
Normalización de mayúsculas
Salt/verifier de 32 bytes
```

## 8. JWT

Configuración recomendada:

```text
Algoritmo: HS256 inicialmente; RS256 cuando haya varios servicios
Access token: 15 minutos
Refresh token: rotatorio
Cookie: HttpOnly
SameSite: Strict
Secure: true bajo HTTPS
```

Claims mínimos:

```text
iss
aud
sub
iat
nbf
exp
```

No incluir:

- Contraseña.
- Salt.
- Verifier.
- GM level.
- Inventario.
- Datos de pago.

### Refresh tokens

Guardar solo un hash del refresh token:

```text
session_id
account_id
token_hash
expires_at
revoked_at
created_ip
user_agent_hash
```

Rotar el refresh token en cada uso. Revocar la cadena completa si se detecta reutilización.

## 9. Procesamiento asíncrono futuro

El rate limiting, la caché y las colas quedan fuera del alcance de esta fase y se evaluarán cuando se implementen tienda, pagos y entregas asíncronas.

## 11. MySQL2

Usar `mysql2/promise` con consultas parametrizadas.

Ejemplo conceptual:

```typescript
const [rows] = await connection.execute(
  'SELECT guid, name, level FROM characters WHERE account = ? ORDER BY name',
  [accountId],
);
```

No hacer:

```typescript
const sql = `SELECT * FROM characters WHERE account = ${accountId}`;
```

No permitir que el usuario controle:

- Tabla.
- Columna.
- Orden SQL.
- Fragmentos de consulta.

Las bases oficiales de AzerothCore no deben administrarse con migraciones automáticas de Prisma o TypeORM.

## 12. Nginx

Nginx sirve React y hace proxy a NestJS:

```nginx
server {
    listen 80;
    root /usr/share/nginx/html;

    location /api/ {
        proxy_pass http://backend:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

En desarrollo se mantiene:

```text
React/Vite: 4000
PHP actual: 9090
NestJS:     9100
```

## 13. Docker

Servicios objetivo:

```text
frontend
backend-nest
ac-database
ac-authserver
ac-worldserver
nginx
worker
```

Durante la migración actual:

```text
ac-website:        9090
ac-backend-django: 9100
```

NestJS debe utilizar otro puerto temporal, por ejemplo:

```text
9200
```

No reemplazar PHP hasta superar la validación de paridad.

## 14. Seguridad OWASP Top 10

### A01 Broken Access Control

- Guards JWT.
- Verificar ownership de personajes.
- No confiar en `account_id` recibido del cliente.
- Separar roles de usuario y administrador.
- No exponer endpoints GM.

### A02 Cryptographic Failures

- HTTPS obligatorio en cloud.
- Cookies Secure.
- Secretos fuera del repositorio.
- SRP6 para cuentas WoW.
- Refresh tokens almacenados como hash.

### A03 Injection

- `mysql2` parametrizado.
- DTOs y `ValidationPipe`.
- Sin SQL dinámico desde inputs.
- Validar webhooks.

### A04 Insecure Design

- Separar pagos, entregas y autenticación.
- Idempotencia.
- Rollback.
- Staging antes de producción.

### A05 Security Misconfiguration

- Helmet.
- CORS estricto.
- `NODE_ENV=production`.
- Errores genéricos.
- MySQL privado.
- SOAP privado.

### A06 Vulnerable Components

- `npm audit` controlado.
- Dependabot o revisión equivalente.
- Versiones fijadas.
- Actualizaciones probadas.

### A07 Authentication Failures

- SRP6 compatible.
- JWT corto.
- Refresh rotation.
- Rate limiting antes de producción.
- CSRF.
- Logout y revocación.

### A08 Software/Data Integrity

- Webhooks firmados.
- Idempotency keys.
- Jobs verificables.
- Imágenes Docker fijadas.
- CI con tests.

### A09 Logging/Monitoring

- Pino JSON.
- Correlation ID.
- Auditoría de login y pagos.
- No registrar contraseñas ni tokens.
- Alertas de errores y entregas fallidas.

### A10 SSRF

- No aceptar URLs arbitrarias.
- Allowlist de proveedores.
- No crear proxies HTTP abiertos.
- Validar callbacks.

## 15. SOLID

### Single Responsibility

Cada módulo tiene una sola responsabilidad:

```text
SRP6Service       Criptografía SRP6
AuthService       Sesiones y autenticación
AccountRepository Acceso a account
CharacterService  Lógica de personajes
PaymentService    Pagos
DeliveryWorker    Entregas
AuditService      Auditoría
```

### Open/Closed

Agregar proveedores de pago mediante interfaces, no modificando la lógica central.

### Liskov Substitution

Los adaptadores de proveedores deben cumplir el contrato común de pago.

### Interface Segregation

Interfaces pequeñas:

```text
PaymentGateway
DeliveryProvider
TokenService
RateLimiter
```

### Dependency Inversion

Los servicios dependen de interfaces y reciben repositorios/adaptadores por inyección de dependencias.

## 16. Tests

Tests unitarios:

```text
SRP6
JWT
DTOs
guards
rate limiting
services
```

Tests de integración:

```text
MySQL2
webhooks
repositories
```

Tests E2E:

```text
Registro
Login
Panel
Personajes
Cambio de contraseña
Logout
Pago sandbox
Entrega idempotente
```

Tests de regresión obligatorios antes de cambiar el proxy:

```text
NestJS login con cuenta creada por AzerothCore
NestJS registro + login del cliente WoW
Cambio de contraseña + login WoW
Django/PHP y NestJS devuelven contratos compatibles
```

## 17. Migración por fases

### Fase 1: coexistencia

```text
PHP:     9090
Django:  9100
NestJS:  9200
```

No cambiar React.

### Fase 2: NestJS auth

Implementar y probar:

```text
/csrf
/login
/me
/logout
```

### Fase 3: NestJS personajes

```text
/characters
/character?guid=ID
```

### Fase 4: NestJS registro y password

```text
/register
/password
```

### Fase 5: cambiar proxy de prueba

En un entorno de staging:

```text
/api/* -> NestJS
```

### Fase 6: tienda y pagos

- Productos.
- Wallet.
- Ledger.
- Stripe/PayPal.
- Webhooks.
- Entregas.

### Fase 7: producción

Solo después de:

- Tests verdes.
- Backup verificado.
- Rollback probado.
- Cliente WoW probado.
- Monitorización activa.
- Firewall configurado.

## 18. Checklist final

- [ ] SRP6 validado contra AzerothCore.
- [ ] Login correcto e incorrecto.
- [ ] Registro duplicado rechazado.
- [ ] Cambio de contraseña probado.
- [ ] JWT HttpOnly.
- [ ] Refresh rotation.
- [ ] CSRF activo.
- [ ] Rate limiting antes de producción.
- [ ] MySQL parametrizado.
- [ ] Usuario MySQL mínimo.
- [ ] Webhooks firmados.
- [ ] SOAP privado.
- [ ] MySQL privado.
- [ ] Logs sin secretos.
- [ ] Backups restaurables.
- [ ] Tests unitarios, integración y E2E.
- [ ] Rollback documentado.
