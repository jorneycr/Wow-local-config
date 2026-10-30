# Servidor online de AzerothCore en Hetzner Cloud

Guía para desplegar este proyecto en un VPS Ubuntu y preparar la migración gradual del portal PHP a Django.

## ¿Hetzner funciona con PHP y Python?

Sí. Hetzner Cloud proporciona una máquina virtual Linux; no te obliga a usar un lenguaje concreto. Docker ejecuta cada servicio en su propio contenedor:

```text
Ubuntu en Hetzner
└── Docker Compose
    ├── AzerothCore (authserver y worldserver)
    ├── MySQL
    ├── Website PHP/Nginx
    └── Backend Django/Python
```

Puedes publicar primero la web PHP y desplegar Django en paralelo. Cuando Django tenga las mismas funciones y supere las pruebas, el proxy web puede enviar las rutas de API a Django. No hace falta cambiar de proveedor ni reinstalar el servidor al migrar de PHP a Python.

En este repositorio, el website PHP está en `website/` y el backend Django paralelo en `backend/`. El frontend continúa usando PHP; Django está publicado por separado en el puerto local `9100` para pruebas. El plan de migración está en [migracion-backend-django.md](migracion-backend-django.md).

## Tamaño inicial recomendado

Para empezar, usa Ubuntu 24.04 LTS, 4 vCPU, 8 GB de RAM y al menos 80 GB SSD/NVMe en una región próxima a los jugadores. Activa backups o snapshots. La capacidad real depende de los jugadores simultáneos, módulos, scripts y carga de base de datos; mide el servidor antes de aumentar la comunidad.

Hetzner es una opción adecuada para un servidor pequeño o mediano administrado por SSH y Docker Compose. También permite ejecutar Django, PHP, Nginx, MySQL y otros servicios Linux en el mismo VPS. El coste final depende de región, IPv4, almacenamiento y backups; comprueba el precio vigente antes de contratar.

## Puertos públicos

Permite en el firewall del proveedor y en el servidor únicamente lo necesario:

| Puerto | Uso | Acceso |
|---|---|---|
| `22/tcp` | SSH | Solo tu IP administrativa, si es posible |
| `3724/tcp` | Login de AzerothCore | Público para jugadores |
| `8085/tcp` | Worldserver | Público para jugadores |
| `80/tcp` | HTTP y validación TLS | Público si publicas un dominio |
| `443/tcp` | Web HTTPS | Público |

No publiques `3306` (MySQL), `7878` (SOAP), `9090` (web interna) ni `9100` (Django). Los dos backends deben comunicarse con MySQL por la red privada de Docker, no mediante un puerto MySQL abierto a Internet.

## Antes de desplegar

El `docker-compose.yml` de la raíz está preparado para desarrollo local. Actualmente publica MySQL, SOAP y Django en el host, por lo que no debes copiarlo a un VPS y abrir esos puertos tal cual. Antes de exponer el servidor online, prepara una configuración de producción que:

- Quite la publicación de puertos de MySQL y SOAP.
- Exponga authserver y worldserver para los jugadores.
- Coloque la web detrás de HTTPS y un reverse proxy.
- Mantenga PHP y Django accesibles solo desde el proxy o desde la red Docker.
- Use contraseñas y secretos exclusivos para el servidor online.
- Aplique el usuario MySQL limitado de `database/website-user.sql`; no uses `root` desde la web.

No reutilices las contraseñas de `.env.example`, ni publiques `.env` en Git. En este proyecto la cuenta MySQL de la web se crea ejecutando el SQL de permisos después de inicializar las bases; configurar variables `WEBSITE_DB_*` no crea por sí solo esa cuenta.

## Preparar el VPS

Conéctate desde PowerShell:

```powershell
ssh root@IP_DEL_SERVIDOR
```

Crea un usuario administrativo y trabaja con él en adelante:

```bash
adduser deploy
usermod -aG sudo deploy
```

Configura y prueba acceso SSH por clave antes de desactivar el acceso por contraseña o el login de root. Actualiza Ubuntu:

```bash
sudo apt update
sudo apt full-upgrade -y
sudo reboot
```

Instala Docker Engine y el plugin Docker Compose v2 siguiendo la documentación oficial de Docker para Ubuntu. Comprueba:

```bash
docker --version
docker compose version
```

En el panel de Hetzner crea un firewall con los puertos de la tabla anterior. Configura también UFW en Ubuntu, permitiendo SSH desde tu IP antes de activarlo para no perder el acceso. El firewall de Hetzner es importante porque los puertos publicados por Docker pueden no comportarse como se espera con reglas UFW.

## Desplegar el proyecto

Clona el repositorio en el servidor usando la URL Git de este proyecto:

```bash
sudo mkdir -p /opt/azerothcore
sudo chown deploy:deploy /opt/azerothcore
cd /opt/azerothcore
git clone URL_DEL_REPOSITORIO .
```

Prepara `.env` en el VPS, no lo copies desde el equipo local:

```bash
cp .env.example .env
chmod 600 .env
nano .env
```

Sustituye todas las contraseñas y secretos de ejemplo por valores aleatorios únicos. `MYSQL_ROOT_PASSWORD`, `WEBSITE_DB_PASSWORD`, `JWT_SECRET` y los secretos de Django deben coincidir con la configuración que consume cada servicio. Conserva `.env` fuera de Git y de los backups compartidos sin cifrar.

Los datos `dbc`, `maps`, `vmaps` y `mmaps` deben generarse desde una copia legítima del cliente 3.3.5a/build 12340, con extractores compatibles con la revisión de AzerothCore. No descargues ni compartas un cliente completo o datafiles de fuentes no autorizadas. Comprueba que los datos estén disponibles en el volumen/ruta que use la configuración de producción antes de iniciar el worldserver.

Una vez preparada y revisada la configuración de producción:

```bash
docker compose config
docker compose build
docker compose up -d
docker compose ps
```

Revisa los logs durante la primera inicialización:

```bash
docker compose logs -f ac-database
docker compose logs -f ac-db-import
docker compose logs -f ac-authserver
docker compose logs -f ac-worldserver
```

No ejecutes `docker compose down -v`: eliminaría volúmenes con bases de datos y otros datos persistentes.

## Web y migración PHP a Django

### Publicación inicial con PHP

Publica el dominio mediante HTTPS con Nginx o Caddy como reverse proxy. El proxy envía el tráfico al contenedor del website PHP; MySQL permanece privado. No abras directamente los puertos internos de la aplicación a Internet.

Antes de habilitar el registro, confirma en la guía de [website](website/README.md) que el flujo de registro SRP6 esté implementado y probado. La contraseña del juego no se guarda con `password_hash()` ni con bcrypt: AzerothCore necesita `salt` y `verifier` SRP6 compatibles.

### Django en paralelo

El servicio `ac-backend-django` ya está definido en el Compose actual. Para probarlo localmente, el proyecto usa `http://127.0.0.1:9100`; en el VPS no lo expongas directamente. Mantén el contenedor en la red privada de Docker y permite que solo el reverse proxy lo alcance.

Durante la transición:

```text
Frontend -> PHP (actual)
           Django (pruebas paralelas, sin tráfico público directo)
```

Valida registro, login SRP6, cookies, CSRF, límites de intentos, panel y personajes con cuentas de prueba. Cuando haya paridad y backups comprobados, cambia el proxy para enviar las rutas de API acordadas a Django. Mantén PHP disponible para volver atrás hasta verificar el cambio con usuarios reales.

```text
Frontend -> Nginx/Caddy -> Django (API migrada)
                         -> PHP (solo rutas aún no migradas, si existen)
```

No migres usuarios modificando sus hashes manualmente. PHP y Django deben generar y verificar el mismo formato SRP6 de AzerothCore. Consulta [migracion-backend-django.md](migracion-backend-django.md) para el orden de las fases y sus contratos de API.

## Configurar el reino y el cliente

En `acore_auth.realmlist`, usa la IP pública o el dominio que los jugadores resolverán. No uses `127.0.0.1`, porque apuntaría al equipo de cada jugador:

```sql
UPDATE realmlist
SET address = 'wow.ejemplo.com',
    localAddress = 'wow.ejemplo.com',
    port = 8085
WHERE id = 1;
```

Verifica el resultado y reinicia authserver si fuera necesario. En el cliente legítimo 3.3.5a, edita el archivo correspondiente, por ejemplo `Data\enUS\realmlist.wtf` o `Data\esES\realmlist.wtf`:

```text
set realmlist wow.ejemplo.com
```

## Operación diaria

```bash
docker compose ps
docker compose logs --tail=100 ac-worldserver
docker stats
```

Haz backups consistentes de `acore_auth`, `acore_characters` y `acore_world` y almacénalos fuera del VPS. Prueba también la restauración. Antes de actualizar AzerothCore o módulos, crea un backup y valida el cambio en un entorno de pruebas.

## Referencias del proyecto

- [Migración cloud detallada](migracion%20cloud.md)
- [Seguridad](seguridad.md)
- [Migración progresiva a Django](migracion-backend-django.md)
- [README local](README.md)