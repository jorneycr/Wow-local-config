# AzerothCore 3.3.5a local con Docker

Entorno local para AzerothCore/WotLK 3.3.5a, build 12340, con MariaDB, authserver, worldserver y una web PHP/Nginx de registro.

> Este proyecto está pensado para desarrollo local. No expongas los puertos del servidor a Internet sin configurar correctamente firewall, autenticación y red.

## Estructura

```text
.
├── .env.example
├── docker-compose.yml
├── data/
│   ├── dbc/
│   ├── maps/
│   ├── mmaps/
│   └── vmaps/
├── logs/
└── website/
    ├── Dockerfile
    ├── db.php
    ├── index.php
    └── nginx.conf
```

## 1. Requisitos

Instala:

- Git
- Docker Desktop o Docker Engine + Docker Compose
- WSL2 con Ubuntu si usas Windows
- Cliente legítimo de WoW 3.3.5a, build 12340
- HeidiSQL, DBeaver o cliente MariaDB/MySQL

Comprueba Docker:

```bash
docker --version
docker compose version
```

En Docker Desktop activa el motor WSL2 y la integración con la distribución Linux que utilizarás.

## 2. Crear la configuración local

Copia el archivo de ejemplo:

```bash
cp .env.example .env
```

En PowerShell:

```powershell
Copy-Item .env.example .env
```

Edita `.env` y cambia al menos:

```dotenv
MYSQL_ROOT_PASSWORD=root
MYSQL_PASSWORD=root
```

No compartas `.env` ni lo subas a un repositorio.

## 3. Datos del cliente

Los directorios `dbc`, `maps`, `vmaps` y `mmaps` deben generarse a partir de tu cliente 3.3.5a usando extractores compatibles con la misma revisión de AzerothCore.

La estructura final esperada es:

```text
data/
├── dbc/
├── maps/
├── mmaps/
└── vmaps/
```

No mezcles datafiles de clientes o revisiones diferentes.

### Extracción con binarios locales

Si dispones de los extractores compilados, ejecuta sus comandos desde una carpeta separada de la carpeta del cliente y consulta primero la ayuda:

```bash
./mapextractor --help
./vmap4assembler --help
./vmap4extractor --help
./mmaps_generator --help
```

El flujo tradicional es:

```bash
./mapextractor
./vmap4assembler
./vmap4extractor
./mmaps_generator
```

Copia los resultados a `./data`. Los nombres exactos de los binarios pueden variar según la revisión.

### Verificación

```bash
du -sh data/dbc data/maps data/vmaps data/mmaps
```

En PowerShell:

```powershell
Get-ChildItem .\data -Recurse | Measure-Object -Property Length -Sum
```

No descargues datafiles o ejecutables desde fuentes no confiables. El cliente debe proceder de una instalación legítima.

## 4. Probar MariaDB antes del stack

Como Docker Desktop ya puede descargar `mysql:8.4`, puedes probar el motor con un contenedor temporal. En PowerShell usa la continuación con backtick:

```powershell
docker run --rm `
  --name ac-database-test `
  -e MYSQL_ROOT_PASSWORD=root `
  -e MYSQL_DATABASE=acore_auth `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=root `
  mysql:8.4 `
  mysqladmin ping -h 127.0.0.1 -uroot -proot
```

Debe mostrar:

```text
mysqld is alive
```

El contenedor de prueba se elimina automáticamente por `--rm`.

## 5. Construir y arrancar AzerothCore

El Compose de este proyecto usa los archivos oficiales del repositorio clonado en `./azerothcore`. No depende de `ghcr.io/azerothcore/azerothcore-wotlk:latest`.

Construye las imágenes locales:

```powershell
docker compose build
```

La primera compilación puede tardar bastante y descargar varios gigabytes. Después inicia el stack:

```powershell
docker compose up -d
```

El servicio `ac-db-import` aplica las bases oficiales de la revisión clonada y `ac-client-data-init` prepara los datos de cliente en un volumen Docker.

Comprueba el estado:

```powershell
docker compose ps
```

Logs iniciales:

```powershell
docker compose logs -f ac-db-import
docker compose logs -f ac-worldserver
```

MariaDB conserva los datos en el volumen Docker `ac-database`.

## 6. Bases de datos y acceso local

El stack oficial utiliza MySQL 8.4 y, por solicitud para este entorno local, usa `root` como usuario y contraseña. Los valores se controlan desde `.env`:

```dotenv
MYSQL_ROOT_PASSWORD=root
```

Acceso desde el contenedor:

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth
```

Acceso desde HeidiSQL o DBeaver:

```text
Host: 127.0.0.1
Puerto: 3306
Usuario: root
Contraseña: root
```

Usar `root/root` solo es apropiado para este entorno local. No expongas el puerto 3306 a Internet ni reutilices esa contraseña en producción.

## 7. Servicios locales

```text
Authserver: 127.0.0.1:3724
Worldserver: 127.0.0.1:8085
Web:        http://127.0.0.1:9090
MySQL:      127.0.0.1:3306
```

## 8. Arrancar, detener y reconstruir

Arrancar o reconstruir:

```powershell
docker compose up -d --build
```

Detener sin borrar datos:

```powershell
docker compose down
```

Reconstruir solo los servidores después de modificar AzerothCore:

```powershell
docker compose build ac-authserver ac-worldserver ac-db-import
docker compose up -d
```

Ver el estado:

```bash
docker compose ps
```

Ver logs:

```bash
docker compose logs -f ac-authserver
docker compose logs -f ac-worldserver
docker compose logs -f ac-website
```

Servicios locales:

```text
Authserver: 127.0.0.1:3724
Worldserver: 127.0.0.1:8085
Web:        http://127.0.0.1:9090
MariaDB:    127.0.0.1:3306
```

## 9. Consola del worldserver

Conecta a la consola interactiva:

```bash
docker attach ac-worldserver
```

Sal sin detener el servidor usando la secuencia:

```text
Ctrl-P y después Ctrl-Q
```

Si la imagen no conserva la consola en primer plano, revisa los logs:

```bash
docker compose logs -f ac-worldserver
```

## 10. Crear la primera cuenta GM

Desde la consola del worldserver:

```text
account create admin CambiaEstaClave123
account set gmlevel admin 3 -1
account list
```

En revisiones que requieren el identificador numérico:

```text
account set gmlevel 1 3 -1
```

Usa una contraseña temporal segura y cámbiala según tus necesidades.

## 11. Configurar `realmlist`

Accede a la base de autenticación:

```bash
docker compose exec ac-database mysql -uroot -proot acore_auth
```

Consulta el reino:

```sql
SELECT id, name, address, localAddress, port FROM realmlist;
```

Para una instalación local:

```sql
UPDATE realmlist
SET address = '127.0.0.1',
    localAddress = '127.0.0.1',
    port = 8085
WHERE id = 1;
```

Verifica:

```sql
SELECT id, name, address, localAddress, port
FROM realmlist
WHERE id = 1;
```

## 12. Configurar el cliente

Edita el archivo correspondiente dentro de la instalación del cliente:

```text
Data\enUS\realmlist.wtf
```

También puede estar en:

```text
Data\esES\realmlist.wtf
Data\esMX\realmlist.wtf
Data\deDE\realmlist.wtf
Data\frFR\realmlist.wtf
```

Contenido mínimo:

```text
set realmlist 127.0.0.1
```

No uses el launcher oficial si restaura el archivo.

## 13. Web de registro

Abre:

```text
http://127.0.0.1:9090
```

La web usa `ac-database` como hostname interno. No cambies ese valor por `127.0.0.1`: dentro del contenedor web, `127.0.0.1` apunta al propio contenedor.

Reconstruye la imagen después de cambiar PHP o Nginx:

```bash
docker compose build ac-website
docker compose up -d ac-website
```

### SRP6

El cliente WoW 3.3.5a no utiliza `password_hash()` de PHP, bcrypt, Argon2 ni una contraseña en texto plano. AzerothCore utiliza los valores SRP6 y, según la revisión, columnas como `sha_pass_hash`, `v` y `s`.

El formulario incluido valida usuario y contraseña, pero deliberadamente no inserta todavía la cuenta. Primero crea una cuenta desde la consola del worldserver y revisa el esquema exacto:

```sql
USE acore_auth;
DESCRIBE account;
SELECT id, username, sha_pass_hash, v, s
FROM account
ORDER BY id DESC
LIMIT 1;
```

La implementación PHP debe producir exactamente los campos esperados por esa revisión de AzerothCore. No copies un `INSERT` antiguo sin comprobar las columnas: podría crear una cuenta que no pueda autenticarse.

Parámetros SRP6 habituales de WoW 3.3.5a:

```text
N = 0x894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

La contraseña se normaliza normalmente como:

```text
USERNAME:PASSWORD
```

en mayúsculas, y se generan el salt y el verifier según SRP6. La implementación debe contrastarse con el código de la versión exacta de AzerothCore que estés ejecutando.

## 14. Comandos de mantenimiento

Reiniciar:

```bash
docker compose restart
```

Detener sin borrar las bases de datos:

```bash
docker compose down
```

Actualizar las imágenes:

```bash
docker compose pull
docker compose up -d
```

Borrar también el volumen de MariaDB —destructivo—:

```bash
docker compose down -v
```

Antes de borrar el volumen realiza una copia de seguridad.

## 15. Copia de seguridad

Exportar `acore_auth`:

```bash
docker compose exec -T ac-database mysqldump -uroot -proot acore_auth > backup-auth.sql
```

Exportar las tres bases:

```bash
docker compose exec -T ac-database mysqldump -uroot -proot --databases acore_auth acore_characters acore_world > backup-azerothcore.sql
```

## 16. Solución rápida de problemas

### El worldserver se detiene

```bash
docker compose logs --tail=200 ac-worldserver
```

Comprueba que:

- MariaDB está saludable.
- Existen `data/maps`, `data/vmaps`, `data/mmaps` y `data/dbc`.
- Los datafiles corresponden a 3.3.5a.
- La configuración de base de datos corresponde a la misma versión del servidor.

### El cliente no conecta

Comprueba:

```bash
docker compose ps
docker compose logs -f ac-authserver
```

Y confirma:

```text
realmlist.wtf -> set realmlist 127.0.0.1
realmlist.address -> 127.0.0.1
Puerto auth -> 3724
```

### La web no conecta con MariaDB

```bash
docker compose logs -f ac-website
docker compose exec ac-website getent hosts ac-database
```

Revisa que `MYSQL_ROOT_PASSWORD` en `.env` coincida con `DB_PASSWORD` del servicio web; en este entorno ambos valores son `root`.

## 17. Parada completa

```bash
docker compose down
```

Los datos permanecen en el volumen `ac-database` hasta que se elimine explícitamente.
