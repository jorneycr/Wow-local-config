# Seguridad de AzerothCore: cómo y dónde aplicar cada medida

Guía de endurecimiento para el servidor local y una futura migración cloud de AzerothCore/WotLK 3.3.5a.

## 1. Mapa de controles

| Riesgo | Dónde se corrige | Medida principal |
|---|---|---|
| Fuerza bruta contra authserver | Firewall, proveedor cloud y logs | Limitar origen, monitorizar y bloquear abusos |
| Web de registro vulnerable | `website/` y reverse proxy | Validación, CSRF, rate limiting y HTTPS |
| MySQL expuesto | `docker-compose.yml` y firewall | No publicar `3306` en cloud |
| SOAP expuesto | `docker-compose.yml` y firewall | No publicar `7878` públicamente |
| Contraseñas débiles | `.env` y cuentas | Secretos aleatorios y política de contraseñas |
| Módulos no revisados | `azerothcore/modules/` | Revisar código y fijar versiones |
| Scripts inseguros | `azerothcore/src/` y módulos | Validar entradas y evitar SQL inseguro |
| Actualizaciones sin backup | Procedimiento operativo | Backup, staging y rollback |
| Fuentes no confiables | Equipo de desarrollo y CI | Verificar origen, hashes y firmas |
| Permisos excesivos | Docker y Linux | Usuario sin root y volúmenes mínimos |
| DDoS | Proveedor cloud y red | Mitigación upstream y límites de exposición |
| Falta de visibilidad | Servidor cloud | Logs, métricas y alertas |

## 2. Diferencia entre local y cloud

### Entorno local

Los servicios se ejecutan en Docker Desktop y normalmente quedan protegidos por el firewall de Windows y la red local.

Comprueba los puertos publicados:

```powershell
docker compose ps
```

Comprueba conexiones escuchando en Windows:

```powershell
Get-NetTCPConnection -State Listen
```

Para un entorno local de desarrollo, `root/root` puede mantenerse temporalmente, pero no debe copiarse a cloud.

### Entorno cloud

Antes de aceptar jugadores externos:

- Cambia todas las contraseñas.
- Cierra MySQL y SOAP al exterior.
- Configura firewall del proveedor.
- Configura firewall de Ubuntu.
- Usa SSH con clave.
- Configura backups fuera del servidor.
- Protege la web con HTTPS.
- Revisa los logs.

## 3. Firewall del proveedor cloud

Configúralo en el panel del proveedor antes de iniciar el servidor público.

Permite únicamente:

```text
22/tcp    SSH, solo desde tu IP administrativa
3724/tcp  Authserver
8085/tcp  Worldserver
80/tcp    HTTP, solo para redirección o Let's Encrypt
443/tcp   HTTPS
```

No permitas desde Internet:

```text
3306/tcp  MySQL
7878/tcp  SOAP
9090/tcp  Web temporal
```

Si tu IP administrativa es dinámica, usa una VPN o una red privada de administración en lugar de abrir SSH a todo Internet.

## 4. Firewall dentro de Ubuntu

Instala y configura UFW:

```bash
sudo apt update
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Permite SSH únicamente desde tu IP:

```bash
sudo ufw allow from TU_IP_PUBLICA to any port 22 proto tcp
```

Permite los servicios públicos:

```bash
sudo ufw allow 3724/tcp
sudo ufw allow 8085/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Activa y revisa:

```bash
sudo ufw enable
sudo ufw status verbose
```

Antes de activar UFW, conserva una sesión SSH abierta y prueba una segunda sesión.

## 5. SSH en Ubuntu

### Crear usuario administrativo

```bash
sudo adduser deploy
sudo usermod -aG sudo deploy
```

Copia la clave pública al usuario:

```bash
ssh-copy-id deploy@IP_DEL_SERVIDOR
```

En Windows puedes usar la clave configurada por OpenSSH o importar una clave existente.

### Endurecer SSH

Edita:

```bash
sudo nano /etc/ssh/sshd_config
```

Valores recomendados después de confirmar el acceso por clave:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

Valida y reinicia:

```bash
sudo sshd -t
sudo systemctl restart ssh
```

No desactives contraseñas ni root hasta comprobar que `deploy` funciona en otra terminal.

## 6. Secretos y contraseñas

### En local

El archivo está en:

```text
.env
```

Debe permanecer fuera del repositorio:

```gitignore
.env
```

### En cloud

Usa valores aleatorios:

```dotenv
MYSQL_ROOT_PASSWORD=GENERAR_UN_SECRETO_LARGO
MYSQL_PASSWORD=GENERAR_OTRO_SECRETO_LARGO
```

Protege el archivo:

```bash
chmod 600 /opt/azerothcore/.env
```

No uses en cloud:

```text
root/root
admin/root
```

Generar un secreto desde Linux:

```bash
openssl rand -base64 36
```

Generar un secreto desde PowerShell:

```powershell
[Convert]::ToBase64String((1..36 | ForEach-Object { Get-Random -Maximum 256 }))
```

No guardes secretos en `docker-compose.yml`, scripts públicos, capturas, logs ni tickets.

## 7. MySQL: dónde protegerlo

### Docker Compose

En cloud elimina la publicación del puerto del servicio `ac-database`:

```yaml
ac-database:
  image: mysql:8.4
  # No añadir ports: 3306:3306
```

Los demás contenedores se conectan internamente usando:

```text
ac-database:3306
```

### Firewall

Aunque Docker no publique el puerto, confirma que el firewall cloud y UFW no permiten `3306`.

### Usuario de aplicación

En cloud evita que la web use root. Crea un usuario limitado para el registro:

```sql
CREATE USER 'website'@'%' IDENTIFIED BY 'SECRETO_UNICO';
GRANT SELECT, INSERT, UPDATE ON acore_auth.account TO 'website'@'%';
FLUSH PRIVILEGES;
```

Ajusta los permisos a las columnas y operaciones realmente necesarias. No otorgues `ALL PRIVILEGES` a la web.

## 8. SOAP: dónde protegerlo

SOAP sirve para administración remota y no debe ser público.

En cloud elimina del servicio `ac-worldserver`:

```yaml
ports:
  - "7878:7878"
```

Si necesitas SOAP, expónlo solo mediante una red privada, VPN o túnel SSH restringido.

No abras `7878/tcp` en el firewall del proveedor ni en UFW.

## 9. Authserver y fuerza bruta

El authserver debe publicar solo el puerto necesario:

```text
3724/tcp
```

Medidas recomendadas:

- Monitorizar intentos fallidos.
- Mantener el servidor actualizado.
- Evitar cuentas con contraseñas débiles.
- No reutilizar contraseñas administrativas.
- Bloquear IPs abusivas en el firewall o proveedor.
- Aplicar rate limiting en la capa de red cuando el proveedor lo soporte.
- No publicar servicios de administración junto al authserver.

Revisa logs:

```bash
docker compose logs --since=1h ac-authserver
```

Si necesitas análisis persistente, redirige logs a un sistema de monitorización externo.

## 10. Web de registro

Archivos a revisar:

```text
website/index.php
website/db.php
website/nginx.conf
website/Dockerfile
```

### Reglas mínimas

- Validar longitud y caracteres en el servidor.
- Usar consultas preparadas.
- Escapar toda salida HTML.
- Añadir protección CSRF.
- Aplicar rate limiting por IP y por cuenta.
- No mostrar errores SQL al usuario.
- No aceptar comandos ni nombres de tabla desde la petición.
- No usar root de MySQL desde PHP en cloud.
- Usar HTTPS.
- Registrar eventos sin guardar contraseñas.

### Nginx

El reverse proxy debe publicar solo HTTP/HTTPS. No publiques PHP-FPM fuera del contenedor.

Para producción, coloca Nginx o Caddy delante de la web y configura:

```text
HTTP  -> redirección a HTTPS
HTTPS -> ac-website:80
```

### HTTPS

Usa un dominio y un certificado válido, por ejemplo con Let's Encrypt. Renueva el certificado automáticamente y prueba la renovación antes de depender de ella.

## 11. Rate limiting

El rate limiting debe aplicarse en varias capas:

1. Proveedor cloud.
2. Reverse proxy.
3. Aplicación PHP.
4. Authserver, según sus opciones disponibles.

Ejemplo conceptual de Nginx para la web:

```nginx
limit_req_zone $binary_remote_addr zone=register:10m rate=5r/m;

location /register {
    limit_req zone=register burst=3 nodelay;
    try_files $uri /index.php?$query_string;
}
```

Ajusta el límite a tu tráfico real. No uses una configuración que bloquee a todos los jugadores detrás de la misma NAT.

## 12. DDoS y disponibilidad

Un firewall local no detiene un DDoS volumétrico porque el tráfico ya puede saturar el enlace antes de llegar al servidor.

Para ataques grandes necesitas:

- Protección anti-DDoS del proveedor.
- Filtrado upstream.
- Un proveedor con red protegida para tráfico de juegos.
- Contacto de abuso/NOC preparado.
- Backups y procedimiento de cambio de IP si fuera necesario.

No intentes resolver un DDoS grande únicamente con reglas UFW.

## 13. Módulos y plugins

Ubicación habitual:

```text
azerothcore/modules/
```

Antes de instalar un módulo:

- Revisa su repositorio y mantenedor.
- Fija una revisión o tag.
- Revisa permisos y dependencias.
- Busca consultas SQL dinámicas.
- Revisa llamadas a shell o archivos.
- Comprueba compatibilidad con tu commit de AzerothCore.
- Prueba en una instancia de staging.
- Haz backup antes de activarlo.

No descargues módulos de enlaces desconocidos ni ejecutes scripts sin leerlos.

## 14. Scripts personalizados

Ubicaciones frecuentes:

```text
azerothcore/src/server/scripts/
azerothcore/modules/
```

Revisa especialmente:

- Entrada de chat.
- Comandos GM personalizados.
- Consultas SQL.
- Lectura de archivos.
- Procesos externos.
- URLs y descargas.
- Permisos de cuentas.
- Validación de IDs recibidos del jugador.

Usa consultas preparadas y validación estricta. No construyas SQL concatenando texto procedente del jugador.

## 15. Contenedores y permisos

Recomendaciones:

- Usa imágenes fijadas a una versión conocida.
- Reconstruye desde fuentes revisadas.
- No montes todo el host dentro del contenedor.
- Monta solo los directorios necesarios.
- No uses `privileged: true`.
- No montes `/var/run/docker.sock`.
- Ejecuta servicios con usuario no root cuando la imagen lo permita.
- Mantén separados datos, logs y configuración.
- Revisa los volúmenes antes de eliminarlos.

Comprobar contenedores:

```bash
docker compose ps
docker inspect ac-worldserver
```

Buscar modo privilegiado:

```bash
docker inspect ac-worldserver --format '{{.HostConfig.Privileged}}'
```

El resultado esperado es:

```text
false
```

## 16. Fuentes y binarios

Usa:

- Repositorios oficiales.
- Releases verificables.
- Tags o commits fijados.
- Checksums cuando estén disponibles.
- Cliente legítimo y compatible.

No ejecutes binarios recibidos por chats o sitios desconocidos. Mantén extractores y scripts separados del cliente mientras los inspeccionas.

## 17. Actualizaciones controladas

Nunca actualices producción directamente sin backup.

### Antes de actualizar

```bash
docker compose exec -T ac-database mysqldump \
  -uroot -p \
  --databases acore_auth acore_characters acore_world \
  > backup-before-update.sql
```

### Probar en staging

1. Duplica la base en una instancia temporal.
2. Construye las nuevas imágenes.
3. Ejecuta importadores y migraciones.
4. Inicia authserver y worldserver.
5. Comprueba login, personajes y guardado.
6. Revisa logs.
7. Solo después planifica la ventana de mantenimiento.

### Actualizar

```bash
cd /opt/azerothcore/azerothcore
git fetch --tags
git checkout REVISION_PROBADA
cd ..
docker compose build
docker compose up -d
```

Evita depender de `latest` sin haber probado el cambio.

## 18. Backups y recuperación

Recomendación mínima:

```text
Diario:   7 copias
Semanal:  4 copias
Mensual:  3 copias
```

Generar backup:

```bash
docker compose exec -T ac-database mysqldump \
  -uroot -p \
  --databases acore_auth acore_characters acore_world \
  > "backup-$(date +%F-%H%M).sql"
```

Guarda una copia fuera del servidor. Prueba la restauración periódicamente:

```bash
docker compose exec -T ac-database mysql -uroot -p \
  < backup-YYYY-MM-DD.sql
```

Un backup que nunca se ha restaurado no está verificado.

## 19. Monitorización

### Recursos

```bash
docker stats
free -h
df -h
uptime
```

### Servicios

```bash
docker compose ps
docker compose logs --since=1h ac-authserver
docker compose logs --since=1h ac-worldserver
docker compose logs --since=1h ac-database
```

### Qué alertar

- Contenedor detenido.
- MySQL no saludable.
- Disco por encima de 80%.
- RAM agotada o swap sostenido.
- CPU sostenida por encima de 80–90%.
- Aumento de errores de login.
- Aumento de errores HTTP.
- Fallo de backup.
- Cambios inesperados en archivos.

Opciones de monitorización:

- Uptime Kuma.
- Prometheus y Grafana.
- Netdata.
- Monitorización del proveedor cloud.
- Servicio externo de uptime.

## 20. Respuesta a incidentes

Si detectas actividad sospechosa:

1. Conserva logs.
2. No borres el contenedor inmediatamente.
3. Bloquea el origen en el firewall si es seguro.
4. Cambia credenciales comprometidas.
5. Aísla la web si el problema está en ella.
6. Comprueba integridad de archivos.
7. Revisa cuentas, permisos y tablas modificadas.
8. Restaura desde un backup limpio si es necesario.
9. Documenta hora, síntomas y acciones.
10. Corrige la causa antes de reabrir el servicio.

## 21. Checklist antes de abrir a Internet

- [ ] SSH por clave.
- [ ] Login SSH de root deshabilitado.
- [ ] Password SSH deshabilitado después de probar la clave.
- [ ] Firewall del proveedor configurado.
- [ ] UFW configurado.
- [ ] Solo 3724 y 8085 públicos.
- [ ] 3306 cerrado.
- [ ] 7878 cerrado.
- [ ] `root/root` sustituido.
- [ ] `.env` fuera del repositorio.
- [ ] Web detrás de HTTPS.
- [ ] Rate limiting activo.
- [ ] Web sin errores SQL visibles.
- [ ] Módulos revisados.
- [ ] Backups externos funcionando.
- [ ] Restauración probada.
- [ ] Monitorización activa.
- [ ] Protección anti-DDoS contratada o disponible.
- [ ] Plan de rollback preparado.

## 22. Nivel de seguridad esperado

### Desarrollo local

Riesgo razonable si el firewall de Windows está activo y el servidor no está expuesto a Internet.

### Cloud privado endurecido

Riesgo razonable para una comunidad pequeña si se aplican firewall, SSH por clave, secretos fuertes, backups, HTTPS y monitorización.

### Comunidad pública grande

Se necesita endurecimiento adicional, monitorización continua, protección anti-DDoS, rate limiting, revisión de módulos, actualizaciones controladas, staging y pruebas de seguridad.

Ninguna configuración es completamente segura. El objetivo es reducir la superficie expuesta, detectar incidentes y poder recuperar el servicio sin perder datos.
