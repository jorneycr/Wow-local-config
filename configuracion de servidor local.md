# Configuración de servidor local AzerothCore 3.3.5a

Guía del entorno local de AzerothCore/WotLK 3.3.5a configurado con Docker Desktop en Windows.

## 1. Componentes utilizados

- Sistema operativo: Windows
- Docker Desktop con motor Linux y contexto `desktop-linux`
- Docker Compose v2
- AzerothCore para WoW 3.3.5a
- Cliente WoW 3.3.5a, build 12340
- MySQL 8.4
- PHP 8.2 + Nginx para la web local

## 2. Carpeta del proyecto

```text
D:\Servidor WOW 3.3.5 Local\
├── .env
├── .env.example
├── docker-compose.yml
├── README.md
├── configuracion de servidor local.md
├── azerothcore\
├── data\
│   ├── dbc\
│   ├── maps\
│   ├── mmaps\
│   └── vmaps\
├── logs\
└── website\
    ├── Dockerfile
    ├── db.php
    ├── index.php
    └── nginx.conf
```

El repositorio oficial de AzerothCore se clonó así:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
git clone --depth 1 --branch master https://github.com/azerothcore/azerothcore-wotlk.git azerothcore
```

## 3. Comandos completos: descargar, construir y levantar todo

Ejecutar en PowerShell desde una carpeta de trabajo:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
```

### 3.1 Descargar o actualizar AzerothCore

Solo si la carpeta `azerothcore` todavía no existe:

```powershell
git clone --depth 1 --branch master https://github.com/azerothcore/azerothcore-wotlk.git azerothcore
```

Si ya está clonada, actualizarla:

```powershell
cd .\azerothcore
git pull
cd ..
```

### 3.2 Descargar las imágenes base

```powershell
docker pull mysql:8.4
```

La imagen web se construye localmente junto con AzerothCore; no es necesario descargar una imagen GHCR de AzerothCore.

### 3.3 Validar el Compose

```powershell
docker compose config
```

### 3.4 Construir las imágenes de AzerothCore y la web

```powershell
docker compose build
```

La primera compilación puede tardar bastante.

### 3.5 Levantar todo

```powershell
docker compose up -d
```

O construir y levantar en un único comando:

```powershell
docker compose up -d --build
```

### 3.6 Verificar los servicios

```powershell
docker compose ps
```

### 3.7 Ver los logs de inicialización

```powershell
docker compose logs -f ac-db-import
```

Cuando termine el importador, comprobar el worldserver:

```powershell
docker compose logs -f ac-worldserver
```

### 3.8 Descargar/preparar los datos de cliente

El servicio oficial de inicialización se ejecuta con:

```powershell
docker compose run --rm ac-client-data-init
```

Después reiniciar los servidores que dependen de esos datos:

```powershell
docker compose up -d ac-authserver ac-worldserver
```

Si ya se ejecutó correctamente durante `docker compose up -d`, no es necesario repetirlo.

Los datos extraídos o preparados quedan en el volumen Docker:

```text
azerothcore-local_ac-client-data
```

Para utilizar extractores con una copia local del cliente, el repositorio oficial define el servicio `ac-tools` en su Compose. Ese servicio no forma parte del Compose principal de este proyecto; debe ejecutarse siguiendo el flujo oficial de extractores y con una copia legítima de WoW 3.3.5a.

### 3.9 Todo en una secuencia

Después de clonar el repositorio, la secuencia normal es:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose config
docker compose build
docker compose up -d
docker compose ps
docker compose logs --tail=200 ac-db-import
docker compose logs --tail=200 ac-worldserver
```

### 3.10 Parar y volver a levantar

```powershell
docker compose down
docker compose up -d
```

No uses `-v` si quieres conservar la base de datos.

## 4. Comprobar Docker Desktop

Abrir Docker Desktop y esperar a que indique que está ejecutándose.

Comprobar desde PowerShell:

```powershell
docker version
```

La salida debe mostrar las secciones `Client` y `Server`, y el contexto:

```text
Context: desktop-linux
```

Si el daemon no está disponible:

```powershell
wsl --status
wsl -l -v
wsl --update
wsl --shutdown
```

Después hay que volver a abrir Docker Desktop.

En Docker Desktop se debe comprobar:

- Settings → General → `Use the WSL 2 based engine`
- Settings → Resources → WSL Integration

## 4. Variables de entorno

El archivo `.env` local contiene la configuración principal:

```dotenv
COMPOSE_PROJECT_NAME=azerothcore-local

MYSQL_ROOT_PASSWORD=root
MYSQL_PASSWORD=root

MYSQL_PORT=3306
AUTH_PORT=3724
WORLD_PORT=8085
WEBSITE_PORT=9090

AUTH_DB=acore_auth
CHARACTERS_DB=acore_characters
WORLD_DB=acore_world
```

Para este entorno local se utilizaron las credenciales:

```text
Usuario MySQL: root
Contraseña:    root
```

`root/root` solo debe utilizarse en una instalación local y aislada. No debe reutilizarse en producción ni exponerse a Internet.

## 5. Imagen de AzerothCore

La imagen que se probó inicialmente no estaba disponible:

```text
ghcr.io/azerothcore/azerothcore-wotlk:latest
```

El error devuelto fue:

```text
error from registry: denied
```

Por ese motivo se utilizó el Docker Compose oficial del repositorio clonado, construyendo las imágenes localmente con:

```text
azerothcore/apps/docker/Dockerfile
```

El Compose local utiliza estos targets:

- `db-import`
- `client-data`
- `authserver`
- `worldserver`

## 6. Servicios Docker

El archivo `docker-compose.yml` levanta:

```text
ac-database
ac-db-import
ac-client-data-init
ac-authserver
ac-worldserver
ac-website
```

### Base de datos

```text
Imagen: mysql:8.4
Contenedor: ac-database
Puerto local: 3306
```

### Authserver

```text
Contenedor: ac-authserver
Puerto local: 3724
```

### Worldserver

```text
Contenedor: ac-worldserver
Puerto local: 8085
SOAP: 7878
```

### Web

```text
Contenedor: ac-website
Puerto interno: 80
Puerto local: 9090
URL: http://127.0.0.1:9090
```

## 7. Validar el Compose

Desde la raíz del proyecto:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose config
```

Si no hay errores, la configuración YAML es válida.

## 8. Prueba temporal de MySQL

Antes de iniciar todo el servidor se puede probar MySQL con un contenedor temporal:

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

Resultado esperado:

```text
mysqld is alive
```

El contenedor se elimina automáticamente gracias a `--rm`.

## 9. Construir las imágenes

La primera compilación de AzerothCore puede tardar bastante y descargar varios gigabytes:

```powershell
docker compose build
```

También se puede construir e iniciar en un único paso:

```powershell
docker compose up -d --build
```

## 10. Iniciar el servidor

```powershell
docker compose up -d
```

Comprobar el estado:

```powershell
docker compose ps
```

Estado esperado:

```text
ac-database      Up (healthy)
ac-db-import     Exited
ac-client-data-init Exited
ac-authserver    Up
ac-worldserver   Up
ac-website       Up
```

`ac-db-import` y `ac-client-data-init` pueden aparecer como `Exited` porque son contenedores de inicialización. Lo importante es que hayan terminado correctamente y que los servidores estén activos.

## 11. Logs

Logs de todos los servicios:

```powershell
docker compose logs -f
```

Logs individuales:

```powershell
docker compose logs -f ac-database
docker compose logs -f ac-db-import
docker compose logs -f ac-authserver
docker compose logs -f ac-worldserver
docker compose logs -f ac-website
```

Para ver las últimas líneas:

```powershell
docker compose logs --tail=200 ac-worldserver
```

## 12. Puertos activos

El estado operativo final es:

```text
MySQL:       127.0.0.1:3306
Authserver:  127.0.0.1:3724
Worldserver: 127.0.0.1:8085
SOAP:        127.0.0.1:7878
Web:         http://127.0.0.1:9090
```

El puerto 8080 estaba ocupado en Windows, por lo que la web se cambió a 9090 en `.env`.

Si se modifica un puerto después de crear un contenedor, hay que recrear el servicio:

```powershell
docker compose up -d --force-recreate ac-website
```

No es necesario borrar todo el proyecto ni los volúmenes.

## 13. Primera cuenta de administrador

Conectar a la consola del worldserver:

```powershell
docker compose attach ac-worldserver
```

En la consola `AC>` se ejecutaron estos comandos:

```text
account create admin root
account set gmlevel admin 3 -1
```

Resultado esperado:

```text
Account created: admin
You change security level of account ADMIN to 3.
```

Credenciales actuales:

```text
Usuario:    admin
Contraseña: root
Nivel GM:   3
```

Para comprobar cuentas disponibles, el comando puede variar según la revisión. Si `account list` muestra la ayuda, utiliza:

```text
account info admin
```

Para salir de `docker attach` sin detener el servidor:

```text
Ctrl-P
Ctrl-Q
```

No utilices `Ctrl-C` si no quieres detener el proceso.

## 14. Configurar el cliente WoW

En la instalación del cliente 3.3.5a, localizar el archivo correspondiente:

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

Contenido:

```text
set realmlist 127.0.0.1
```

No iniciar el cliente mediante un launcher que sobrescriba `realmlist.wtf`.

## 15. Configurar el reino

Entrar en la base de autenticación:

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth
```

Consultar el reino:

```sql
SELECT id, name, address, localAddress, port
FROM realmlist;
```

Para una instalación local:

```sql
UPDATE realmlist
SET address = '127.0.0.1',
    localAddress = '127.0.0.1',
    port = 8085
WHERE id = 1;
```

Verificar:

```sql
SELECT id, name, address, localAddress, port
FROM realmlist
WHERE id = 1;
```

## 16. Web local

Abrir en el navegador:

```text
http://127.0.0.1:9090
```

La web se conecta a la base de datos usando el hostname Docker:

```text
DB_HOST=ac-database
```

Dentro de un contenedor, `127.0.0.1` apunta al propio contenedor, por eso no se debe utilizar como hostname para conectar desde PHP a MySQL.

Reconstruir la web después de modificar archivos PHP o Nginx:

```powershell
docker compose build ac-website
docker compose up -d --force-recreate ac-website
```

## 17. Registro y SRP6

El cliente WoW 3.3.5a no utiliza `password_hash()` de PHP, bcrypt o Argon2 para autenticar cuentas. AzerothCore utiliza el protocolo SRP6.

La tabla de cuentas debe comprobarse en la base de datos:

```sql
USE acore_auth;
DESCRIBE account;
```

Una cuenta creada por AzerothCore puede revisarse con:

```sql
SELECT id, username, sha_pass_hash, v, s
FROM account
ORDER BY id DESC
LIMIT 1;
```

El formulario incluido en `website/index.php` valida el usuario y la contraseña, pero la inserción SRP6 debe coincidir exactamente con el esquema y el código de la revisión instalada. No se debe insertar una contraseña PHP normal ni copiar un `INSERT` antiguo sin comprobar las columnas.

Parámetros habituales del protocolo WoW 3.3.5a:

```text
N = 0x894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
g = 7
```

La primera cuenta se creó correctamente desde la consola del worldserver, que es el método recomendado para esta instalación inicial.

## 18. Acceder a MySQL desde herramientas gráficas

Configuración para HeidiSQL o DBeaver:

```text
Host:       127.0.0.1
Puerto:     3306
Usuario:    root
Contraseña: root
```

Bases de datos esperadas:

```text
acore_auth
acore_characters
acore_world
```

## 19. Copias de seguridad

Exportar la base de autenticación:

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot acore_auth > backup-auth.sql
```

Exportar todas las bases:

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot --databases acore_auth acore_characters acore_world > backup-azerothcore.sql
```

## 20. Reiniciar y detener

Reiniciar servicios:

```powershell
docker compose restart
```

Detener sin eliminar datos:

```powershell
docker compose down
```

Volver a iniciar:

```powershell
docker compose up -d
```

## 21. Actualizar o reconstruir

Actualizar el repositorio de AzerothCore:

```powershell
cd "D:\Servidor WOW 3.3.5 Local\azerothcore"
git pull
cd ..
```

Reconstruir servidores:

```powershell
docker compose build ac-authserver ac-worldserver ac-db-import
```

Iniciar nuevamente:

```powershell
docker compose up -d
```

## 22. Comando destructivo

Este comando elimina los contenedores, redes y volúmenes del proyecto:

```powershell
docker compose down -v
```

No utilizarlo durante el mantenimiento normal. Puede borrar la base de datos almacenada en el volumen `ac-database`.

## 23. Problemas conocidos y soluciones

### Error `dockerDesktopLinuxEngine`

Docker Desktop no estaba iniciado o el motor Linux no estaba disponible.

Solución:

```powershell
wsl --shutdown
```

Abrir nuevamente Docker Desktop y comprobar:

```powershell
docker version
```

### Error `denied` al descargar AzerothCore

La ruta siguiente no estaba disponible:

```text
ghcr.io/azerothcore/azerothcore-wotlk:latest
```

Solución: construir desde el repositorio local `./azerothcore` usando el Dockerfile oficial.

### Error de puerto 8080 ocupado

Error:

```text
bind: Only one usage of each socket address
```

Solución aplicada:

```dotenv
WEBSITE_PORT=9090
```

Recrear solo la web:

```powershell
docker compose up -d --force-recreate ac-website
```

### Verificar el estado final

```powershell
docker compose ps
```

El estado esperado es:

```text
ac-database      Up (healthy)
ac-authserver    Up
ac-worldserver   Up
ac-website       Up
```
