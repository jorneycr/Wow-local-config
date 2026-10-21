# Migración de AzerothCore a la nube

Guía para migrar el servidor local de AzerothCore/WotLK 3.3.5a a un servidor cloud Linux.

> Los precios cambian por región, impuestos, tráfico, almacenamiento y promociones. Comprueba el precio final en la calculadora del proveedor antes de contratar.

## 1. Recomendación principal

Para este proyecto, la opción inicial más equilibrada es:

```text
Proveedor: Hetzner Cloud
Sistema: Ubuntu 24.04 LTS
CPU: 4 vCPU
RAM: 8 GB
Disco: 80–160 GB SSD/NVMe
Región: la más cercana a los jugadores
Backups: activados
```

Es una buena configuración para una comunidad pequeña o mediana, siempre que el número de jugadores concurrentes, módulos, consultas y scripts no sea excesivo.

## 2. ¿Para cuántos jugadores sirve?

No existe una cifra universal. La capacidad real depende de:

- Jugadores simultáneos, no cuentas registradas.
- Módulos instalados.
- Scripts personalizados.
- Frecuencia de eventos y criaturas.
- Tamaño y rendimiento de la base de datos.
- Consultas de la web.
- Calidad de los scripts y del contenido.
- Latencia y región.
- Frecuencia de guardado de personajes.
- Uso de MySQL y del worldserver.

Como estimación prudente para AzerothCore 3.3.5a con Docker y configuración normal:

| Configuración | Jugadores simultáneos orientativos | Uso recomendado |
|---|---:|---|
| 4 vCPU / 8 GB / SSD-NVMe | 20–50 | Servidor pequeño o comunidad inicial |
| 4 vCPU / 8 GB / SSD-NVMe bien optimizado | 50–100 | Comunidad mediana con pruebas de carga |
| 8 vCPU / 16 GB / NVMe | 100–200 | Comunidad mayor, con optimización y monitorización |
| Más de 200 | Requiere pruebas reales | Dimensionar según módulos, scripts y base de datos |

La primera cifra segura para planificar es aproximadamente **30–50 jugadores simultáneos**. Es posible superar esa cifra, pero no debe garantizarse sin realizar pruebas con el contenido real.

Las cuentas registradas pueden ser muchas más. Lo importante para el tamaño del servidor es el número de jugadores conectados al mismo tiempo y la carga que generan.

## 3. Cómo medir la capacidad real

Antes de migrar definitivamente, registra durante una prueba:

```text
Uso de CPU del worldserver
Uso de RAM
Load average
Tiempo de respuesta de MySQL
TPS o actualización del mundo
Latencia de los jugadores
Picos durante raids, PvP y eventos
```

En Linux puedes revisar:

```bash
top
htop
free -h
uptime
docker stats
```

Para una primera evaluación:

- Mantén el uso sostenido de CPU por debajo de 70–80%.
- Mantén memoria libre para MySQL y procesos del sistema.
- Investiga cualquier swap sostenido.
- Revisa el tiempo de respuesta de MySQL durante picos.
- Prueba con el doble de la carga esperada antes de abrir el servidor.

## 4. Mejores proveedores

Los precios son rangos orientativos y pueden cambiar.

| Proveedor | Configuración inicial | Precio orientativo | Ventajas | Inconvenientes |
|---|---:|---:|---|---|
| Hetzner Cloud | 4 vCPU, 8–16 GB RAM | 8–20 €/mes | Muy buena relación precio/rendimiento | Menos regiones y soporte más limitado |
| Contabo | 4–8 vCPU, 16 GB RAM | 8–20 €/mes | Mucha RAM y disco por poco dinero | Rendimiento variable según nodo |
| DigitalOcean | 4 vCPU, 8 GB RAM | 48–60 USD/mes | Panel sencillo y documentación clara | Más caro |
| Vultr | 4 vCPU, 8 GB RAM | 40–60 USD/mes | Muchas regiones | Precio medio/alto |
| Linode/Akamai | 4 vCPU, 8 GB RAM | 48–60 USD/mes | Buen soporte y documentación | Más costoso que Hetzner |
| AWS Lightsail | 4 vCPU, 8 GB RAM | 40–60 USD/mes | Panel simple e integración AWS | Límites y costes adicionales |
| AWS EC2 | 4–8 vCPU | 50–150+ USD/mes | Muy flexible y escalable | Facturación compleja |
| Azure VM | 4–8 vCPU | 60–180+ USD/mes | Regiones e integración Microsoft | Más complejidad y coste |
| Google Cloud | 4–8 vCPU | 50–160+ USD/mes | Red y snapshots | Facturación compleja |

### Recomendación por escenario

#### Económico: Hetzner Cloud

Adecuado para:

- Servidor privado pequeño o mediano.
- Administración por SSH.
- Docker Compose.
- Control total de Linux.

#### Sencillo: DigitalOcean

Adecuado si priorizas:

- Panel fácil.
- Snapshots simples.
- Documentación clara.
- Menos trabajo inicial de infraestructura.

#### Mucha RAM por precio: Contabo

Puede ser útil si necesitas mucha memoria, pero conviene comprobar el rendimiento de CPU y disco antes de abrir la comunidad.

#### Empresarial: AWS, Azure o Google Cloud

Recomendados cuando necesitas:

- Regiones específicas.
- Redes privadas avanzadas.
- Integración corporativa.
- Automatización y escalado.

Para un servidor privado pequeño suelen ser más complejos y caros de lo necesario.

## 5. Arquitectura cloud

```text
Servidor Linux cloud
├── Docker Engine
├── Docker Compose
├── AzerothCore authserver
├── AzerothCore worldserver
├── MySQL
├── PHP/Nginx
└── Backups externos
```

Puertos:

```text
3724/tcp  Authserver
8085/tcp  Worldserver
9090/tcp  Web, opcional
3306/tcp  MySQL, NO público
7878/tcp  SOAP, NO público
```

No expongas públicamente `3306` ni `7878`.

## 6. Requisitos del servidor

Configuración inicial:

```text
Ubuntu 24.04 LTS
4 vCPU
8 GB RAM
80 GB SSD mínimo
IPv4 pública
Firewall
Docker Engine
Docker Compose v2
```

Para una comunidad mayor:

```text
8 vCPU
16 GB RAM
160 GB NVMe
Backups automáticos
Monitorización
```

Elige una región cercana a los jugadores para reducir la latencia.

## 7. Contratar el servidor

Selecciona:

- Región cercana a los jugadores.
- Ubuntu 24.04 LTS.
- IPv4 pública.
- 4 vCPU y 8 GB RAM para comenzar.
- SSD o NVMe.
- Backups o snapshots.

No sobredimensiones al principio sin medir. Es preferible empezar con una configuración razonable y escalar después de observar métricas reales.

## 8. Acceso inicial por SSH

Desde PowerShell:

```powershell
ssh root@IP_DEL_SERVIDOR
```

Crear un usuario administrativo:

```bash
adduser deploy
usermod -aG sudo deploy
```

Configura una clave SSH para `deploy`. Evita trabajar permanentemente como `root`.

## 9. Actualizar Ubuntu

```bash
sudo apt update
sudo apt full-upgrade -y
sudo reboot
```

Vuelve a conectarte después del reinicio.

## 10. Instalar Docker

Instala Docker Engine y Docker Compose v2 siguiendo la documentación del proveedor o de Docker.

Verifica:

```bash
docker --version
docker compose version
```

Añade el usuario al grupo Docker:

```bash
sudo usermod -aG docker "$USER"
```

Cierra la sesión SSH y vuelve a entrar para aplicar el cambio.

## 11. Transferir el proyecto

No subas el cliente completo de WoW al servidor cloud. Transfiere solo los archivos necesarios y los datos permitidos por la licencia y las políticas aplicables.

Desde PowerShell puedes transferir la configuración:

```powershell
scp -r "D:\Servidor WOW 3.3.5 Local\docker-compose.yml" `
  "D:\Servidor WOW 3.3.5 Local\.env.example" `
  "D:\Servidor WOW 3.3.5 Local\website" `
  deploy@IP_DEL_SERVIDOR:/opt/azerothcore/
```

Clona AzerothCore directamente en el servidor:

```bash
cd /opt/azerothcore
git clone --depth 1 --branch master https://github.com/azerothcore/azerothcore-wotlk.git azerothcore
```

No transfieras `.env` por canales inseguros. Créalo directamente en el servidor:

```bash
nano /opt/azerothcore/.env
```

## 12. Configurar secretos cloud

Usa contraseñas únicas, no `root/root`:

```dotenv
MYSQL_ROOT_PASSWORD=una_clave_larga_y_unica
MYSQL_PASSWORD=otra_clave_larga_y_unica
MYSQL_PORT=3306
AUTH_PORT=3724
WORLD_PORT=8085
WEBSITE_PORT=9090
```

Protege el archivo:

```bash
chmod 600 /opt/azerothcore/.env
```

## 13. Firewall

Permite solamente:

```text
22/tcp    SSH, preferiblemente limitado a tu IP
3724/tcp  Authserver
8085/tcp  Worldserver
9090/tcp  Web, si se publica directamente
```

No publiques:

```text
3306/tcp
7878/tcp
```

Con UFW:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from TU_IP to any port 22 proto tcp
sudo ufw allow 3724/tcp
sudo ufw allow 8085/tcp
sudo ufw allow 9090/tcp
sudo ufw enable
sudo ufw status verbose
```

Antes de activar UFW, confirma que puedes volver a entrar por SSH.

## 14. Construir y levantar el stack

```bash
cd /opt/azerothcore
docker compose config
docker compose build
docker compose up -d
docker compose ps
```

Logs:

```bash
docker compose logs -f ac-db-import
docker compose logs -f ac-authserver
docker compose logs -f ac-worldserver
docker compose logs -f ac-website
```

## 15. Migrar las bases de datos

En el servidor local genera una copia:

```powershell
docker compose exec -T ac-database mysqldump -uroot -proot `
  --databases acore_auth acore_characters acore_world `
  > backup-azerothcore.sql
```

Copia el archivo al servidor:

```powershell
scp .\backup-azerothcore.sql `
  deploy@IP_DEL_SERVIDOR:/opt/azerothcore/
```

En el servidor cloud inicia MySQL:

```bash
cd /opt/azerothcore
docker compose up -d ac-database
```

Importa la copia:

```bash
docker compose exec -T ac-database mysql -uroot -p \
  < backup-azerothcore.sql
```

Introduce la contraseña configurada en `.env`.

Después reinicia los servicios:

```bash
docker compose restart ac-authserver ac-worldserver
```

Si `ac-db-import` está diseñado para una base vacía, no lo ejecutes sobre una base restaurada sin revisar primero sus logs y el flujo de migraciones.

## 16. Configurar `realmlist` en la nube

En la nube no uses `127.0.0.1` para los jugadores. Usa la IP pública o un dominio:

```sql
UPDATE realmlist
SET address = 'IP_PUBLICA_DEL_SERVIDOR',
    localAddress = 'IP_PUBLICA_DEL_SERVIDOR',
    port = 8085
WHERE id = 1;
```

Con dominio:

```sql
UPDATE realmlist
SET address = 'wow.tudominio.com',
    localAddress = 'wow.tudominio.com',
    port = 8085
WHERE id = 1;
```

Reinicia el authserver:

```bash
docker compose restart ac-authserver
```

## 17. Configurar los clientes

En cada cliente 3.3.5a:

```text
Data\esMX\realmlist.wtf
```

Con IP pública:

```text
set realmlist IP_PUBLICA_DEL_SERVIDOR
```

Con dominio:

```text
set realmlist wow.tudominio.com
```

## 18. Web de registro

Acceso directo inicial:

```text
http://IP_PUBLICA_DEL_SERVIDOR:9090
```

Para producción es preferible:

```text
https://registro.tudominio.com
```

Recomendaciones:

- Usar HTTPS.
- Añadir limitación de intentos.
- Validar entradas.
- No mostrar errores SQL al usuario.
- No exponer MySQL.
- Completar y probar SRP6.
- Usar reverse proxy como Nginx o Caddy.
- Mantener el panel administrativo separado de la web pública.

## 19. Backups cloud

Realiza copias automáticas fuera del servidor.

Backup manual:

```bash
docker compose exec -T ac-database mysqldump \
  -uroot -p \
  --databases acore_auth acore_characters acore_world \
  > "backup-$(date +%F-%H%M).sql"
```

Retención recomendada:

```text
Diario:   7 copias
Semanal:  4 copias
Mensual:  3 copias
```

No guardes la única copia en el mismo disco del servidor.

Opciones:

- Object Storage del proveedor.
- Backblaze B2.
- S3 compatible.
- Otro servidor independiente.
- Snapshots del proveedor como complemento.

## 20. Actualizaciones

Antes de actualizar:

```bash
docker compose exec -T ac-database mysqldump \
  -uroot -p \
  --databases acore_auth acore_characters acore_world \
  > backup-before-update.sql
```

Actualizar AzerothCore:

```bash
cd /opt/azerothcore/azerothcore
git pull
cd ..
```

Reconstruir:

```bash
docker compose build
docker compose up -d
```

Revisar:

```bash
docker compose logs --tail=200 ac-db-import
docker compose logs --tail=200 ac-worldserver
```

No actualices directamente `master` en producción sin probar primero en staging.

## 21. Costes adicionales

Además del servidor, considera:

```text
Backups automáticos
Snapshots
Almacenamiento de objetos
IPv4
Tráfico de salida
Dominio
DNS
Certificado TLS
Monitorización
```

El coste mensual real puede superar el precio base del servidor.

## 22. Plan de crecimiento

### Inicio

```text
4 vCPU
8 GB RAM
80–160 GB SSD/NVMe
20–50 jugadores simultáneos prudentes
```

### Comunidad mediana

```text
4 vCPU
8 GB RAM
80–160 GB NVMe
50–100 jugadores simultáneos si las pruebas son buenas
```

### Comunidad mayor

```text
8 vCPU
16 GB RAM
160 GB NVMe
100–200 jugadores simultáneos orientativos
```

Estos rangos no son garantías. La cifra final debe obtenerse con pruebas de carga y monitorización del contenido real.

## 23. Checklist de migración

Mantén el servidor local disponible hasta verificar:

- Login.
- Selección del reino.
- Creación de personajes.
- Entrada al mundo.
- Movimiento.
- Guardado de personajes.
- Cuenta GM.
- Web de registro.
- Restauración de una copia.
- Conectividad desde una red externa.
- Latencia con jugadores reales.
- Rendimiento durante PvP, raids y eventos.

## 24. Recomendación final

Empieza con:

```text
Proveedor: Hetzner Cloud
Sistema: Ubuntu 24.04 LTS
CPU: 4 vCPU
RAM: 8 GB
Disco: 80–160 GB SSD/NVMe
Región: la más cercana a los jugadores
Backups: activados
```

Planifica inicialmente para **20–50 jugadores simultáneos** y escala cuando las métricas demuestren que el servidor puede soportar más carga. Con optimización y pruebas reales, la misma máquina podría alcanzar aproximadamente 50–100 jugadores simultáneos, pero no debe asumirse sin medir.
