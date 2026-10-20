# Comandos de base de datos y usuarios

Guía de consultas y mantenimiento para el entorno local AzerothCore ejecutado con Docker Desktop en Windows.

## 1. Preparación

Abrir PowerShell y entrar en la carpeta del proyecto:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
```

Comprobar que MySQL está activo:

```powershell
docker compose ps ac-database
```

Debe aparecer como:

```text
Up (healthy)
```

Credenciales locales configuradas:

```text
Host:       127.0.0.1
Puerto:     3306
Usuario:    root
Contraseña: root
```

> `root/root` solo debe utilizarse en este entorno local. No expongas MySQL a Internet ni uses estas credenciales en producción.

## 2. Conectarse a MySQL mediante Docker

Abrir una consola interactiva en `acore_auth`:

```powershell
docker compose exec -it ac-database mysql -uroot -proot acore_auth
```

Abrir una consola en otra base de datos:

```powershell
docker compose exec -it ac-database mysql -uroot -proot acore_characters
```

```powershell
docker compose exec -it ac-database mysql -uroot -proot acore_world
```

Salir de MySQL:

```sql
EXIT;
```

## 3. Consultas rápidas desde PowerShell

### Ver bases de datos

```powershell
docker compose exec ac-database mysql -uroot -proot -e "SHOW DATABASES;"
```

### Ver usuarios internos de MySQL

```powershell
docker compose exec ac-database mysql -uroot -proot -e "SELECT User, Host, plugin FROM mysql.user;"
```

### Ver permisos del usuario root

```powershell
docker compose exec ac-database mysql -uroot -proot -e "SHOW GRANTS FOR 'root'@'%';"
```

### Ver versión de MySQL

```powershell
docker compose exec ac-database mysql -uroot -proot -e "SELECT VERSION();"
```

## 4. Cuentas de AzerothCore

Las cuentas del juego se almacenan en:

```text
acore_auth.account
```

### Listar cuentas

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, email, joindate, last_login, locked, online FROM account ORDER BY id;"
```

### Buscar una cuenta

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, email, joindate, last_login, locked, online FROM account WHERE username='ADMIN';"
```

Los nombres de cuenta normalmente se almacenan en mayúsculas. Para buscar sin depender de mayúsculas:

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, email, joindate, locked, online FROM account WHERE UPPER(username)=UPPER('admin');"
```

### Contar cuentas

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT COUNT(*) AS total_cuentas FROM account;"
```

### Ver la estructura de `account`

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "DESCRIBE account;"
```

### Ver los últimos registros creados

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, joindate, last_login FROM account ORDER BY id DESC LIMIT 20;"
```

## 5. Niveles GM y permisos

Los permisos de las cuentas se almacenan normalmente en:

```text
acore_auth.account_access
```

### Ver cuentas con nivel GM

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT aa.id, a.username, aa.gmlevel, aa.RealmID FROM account_access aa JOIN account a ON a.id=aa.id ORDER BY aa.gmlevel DESC;"
```

### Buscar el nivel GM de `admin`

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT aa.id, a.username, aa.gmlevel, aa.RealmID FROM account_access aa JOIN account a ON a.id=aa.id WHERE UPPER(a.username)='ADMIN';"
```

### Consultar la estructura de permisos

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "DESCRIBE account_access;"
```

Para cambiar permisos, se recomienda usar la consola del worldserver:

```text
account set gmlevel admin 3 -1
```

Evita modificar `account_access` manualmente salvo que conozcas la estructura exacta de la revisión instalada.

## 6. Bloqueo y estado de cuentas

### Ver cuentas bloqueadas

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, locked, online FROM account WHERE locked <> 0;"
```

### Ver cuentas actualmente conectadas

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username, online, last_login, last_ip FROM account WHERE online <> 0;"
```

El bloqueo o desbloqueo debe hacerse preferentemente desde los comandos del servidor. Antes de editar una columna directamente, revisa su tipo con `DESCRIBE account`.

## 7. Reinos configurados

### Ver reinos

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, name, address, localAddress, port, icon, flag, timezone FROM realmlist;"
```

### Configuración local recomendada

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "UPDATE realmlist SET address='127.0.0.1', localAddress='127.0.0.1', port=8085 WHERE id=1;"
```

### Comprobar el reino local

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, name, address, localAddress, port FROM realmlist WHERE id=1;"
```

## 8. Personajes

Los personajes se almacenan en:

```text
acore_characters.characters
```

### Listar personajes y sus cuentas

```powershell
docker compose exec ac-database mysql -uroot -proot acore_characters -e "SELECT guid, name, account, race, class, level, online FROM characters ORDER BY guid DESC LIMIT 50;"
```

### Buscar personajes de una cuenta

Primero consulta el ID de la cuenta:

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SELECT id, username FROM account WHERE UPPER(username)=UPPER('admin');"
```

Después sustituye `1` por el ID obtenido:

```powershell
docker compose exec ac-database mysql -uroot -proot acore_characters -e "SELECT guid, name, race, class, level, online FROM characters WHERE account=1 ORDER BY name;"
```

### Buscar un personaje por nombre

```powershell
docker compose exec ac-database mysql -uroot -proot acore_characters -e "SELECT guid, name, account, race, class, level, online FROM characters WHERE name='NOMBRE';"
```

### Contar personajes

```powershell
docker compose exec ac-database mysql -uroot -proot acore_characters -e "SELECT COUNT(*) AS total_personajes FROM characters;"
```

No edites directamente nivel, inventario, posición o dinero de un personaje si el servidor está activo. Usa comandos del worldserver o una copia de seguridad, porque las modificaciones directas pueden romper relaciones internas.

## 9. Tablas útiles

### Tablas de autenticación

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "SHOW TABLES;"
```

### Tablas de personajes

```powershell
docker compose exec ac-database mysql -uroot -proot acore_characters -e "SHOW TABLES;"
```

### Tablas del mundo

```powershell
docker compose exec ac-database mysql -uroot -proot acore_world -e "SHOW TABLES;"
```

### Revisar columnas de una tabla

```powershell
docker compose exec ac-database mysql -uroot -proot acore_auth -e "DESCRIBE account;"
```

Cambiar `account` por la tabla que quieras inspeccionar.

## 10. Copias de seguridad

### Copia de `acore_auth`

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot acore_auth > backup-auth.sql
```

### Copia de personajes

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot acore_characters > backup-characters.sql
```

### Copia de mundo

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot acore_world > backup-world.sql
```

### Copia completa

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot --databases acore_auth acore_characters acore_world > backup-azerothcore.sql
```

### Restaurar una base

```powershell
Get-Content .\backup-auth.sql | docker compose exec -T ac-database mysql -uroot -proot acore_auth
```

### Restaurar la copia completa

```powershell
Get-Content .\backup-azerothcore.sql | docker compose exec -T ac-database mysql -uroot -proot
```

Haz una copia antes de ejecutar `UPDATE`, `DELETE`, migraciones o modificaciones manuales.

## 11. Mantenimiento del contenedor MySQL

### Estado del servicio

```powershell
docker compose ps ac-database
```

### Logs

```powershell
docker compose logs --tail=200 ac-database
```

### Reiniciar MySQL

```powershell
docker compose restart ac-database
```

### Ver el volumen de datos

```powershell
docker volume ls | Select-String "ac-database"
```

Inspeccionar el volumen:

```powershell
docker volume inspect azerothcore-local_ac-database
```

## 12. Consultas desde una consola interactiva

Entrar:

```powershell
docker compose exec -it ac-database mysql -uroot -proot acore_auth
```

Consultas útiles:

```sql
SHOW DATABASES;
SHOW TABLES;
DESCRIBE account;
SELECT id, username, joindate, last_login FROM account;
SELECT id, username FROM account WHERE UPPER(username) = 'ADMIN';
SELECT * FROM realmlist;
EXIT;
```

## 13. Comandos de Docker relacionados

Ver todos los servicios:

```powershell
docker compose ps
```

Ver todos los contenedores:

```powershell
docker ps -a
```

Entrar a un shell del contenedor de base de datos:

```powershell
docker compose exec ac-database bash
```

Salir del shell:

```text
exit
```

## 14. Advertencias importantes

- No ejecutes `docker compose down -v` salvo que quieras borrar los volúmenes.
- No borres el volumen `azerothcore-local_ac-database` sin una copia de seguridad.
- No cambies contraseñas o hashes de cuentas con SQL genérico: WoW 3.3.5a usa SRP6.
- No uses `password_hash()` de PHP para las cuentas del cliente WoW.
- No modifiques personajes mientras el worldserver está activo.
- No expongas el puerto 3306 a Internet.
- No utilices `root/root` fuera del entorno local.
- Comprueba la estructura con `DESCRIBE` antes de escribir consultas para otra versión de AzerothCore.
- Después de actualizaciones de AzerothCore, vuelve a revisar nombres de columnas y tablas.
