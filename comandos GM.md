# Comandos GM de AzerothCore

Guía rápida de comandos de Game Master para AzerothCore/WotLK 3.3.5a.

## 1. Requisitos

La cuenta debe tener permisos GM. En este entorno se configuró:

```text
Usuario:    admin
Contraseña: root
Nivel GM:   3
```

Para asignar el nivel GM desde la consola del worldserver:

```text
account set gmlevel admin 3 -1
```

El último parámetro `-1` aplica el nivel a todos los reinos.

## 2. Dónde ejecutar los comandos

Los comandos pueden ejecutarse de dos formas:

### Consola del worldserver

Desde PowerShell:

```powershell
docker compose attach ac-worldserver
```

La consola muestra:

```text
AC>
```

Escribe el comando sin la barra `/`.

Ejemplo:

```text
server info
```

Para salir sin detener el servidor:

```text
Ctrl-P
Ctrl-Q
```

### Dentro del juego

Pulsa `Enter` para abrir el chat y escribe el comando con `/`:

```text
/server info
```

Algunos comandos requieren tener un personaje seleccionado. Otros pueden ejecutarse sin selección.

> La disponibilidad exacta y los argumentos pueden variar ligeramente según la revisión de AzerothCore. Si un comando muestra ayuda, usa esa sintaxis como referencia para la instalación actual.

## 3. Ayuda de comandos

### Ayuda general

Dentro del juego:

```text
/help
```

En la consola:

```text
help
```

### Ayuda de un comando concreto

```text
/help account
/help tele
/help modify
```

En consola:

```text
help account
help tele
help modify
```

### Listar comandos disponibles

```text
/help
```

La lista depende del nivel GM y de los módulos instalados.

## 4. Cuenta y permisos

Estos comandos se ejecutan normalmente en la consola del worldserver.

### Crear una cuenta

```text
account create NOMBRE CONTRASEÑA
```

Ejemplo:

```text
account create jugador123 ClaveSegura123
```

### Cambiar el nivel GM

```text
account set gmlevel NOMBRE NIVEL REINO
```

Ejemplo para todos los reinos:

```text
account set gmlevel admin 3 -1
```

Niveles habituales:

```text
0 = jugador normal
1 = moderador
2 = GM
3 = administrador
```

### Ver información de una cuenta

```text
account info NOMBRE
```

Ejemplo:

```text
account info admin
```

### Bloquear una cuenta

```text
account lock NOMBRE on
```

### Desbloquear una cuenta

```text
account lock NOMBRE off
```

### Listar cuentas conectadas

```text
account online
```

### Eliminar una cuenta

```text
account delete NOMBRE
```

Usa este comando con cuidado. La eliminación puede afectar personajes asociados.

## 5. Información del servidor

### Información general

Dentro del juego:

```text
/server info
```

En consola:

```text
server info
```

### Estado del servidor

```text
/server info
```

### Reiniciar el servidor

No se recomienda reiniciar desde comandos GM durante una sesión de desarrollo si puedes utilizar Docker:

```powershell
docker compose restart ac-worldserver ac-authserver
```

### Anunciar un mensaje global

```text
/announce Mensaje para todos los jugadores
```

En consola:

```text
announce Mensaje para todos los jugadores
```

### Enviar un mensaje de sistema

```text
/server message Mensaje del servidor
```

Si esta sintaxis no existe en la revisión instalada, consulta:

```text
/help server
```

## 6. Movimiento y teletransporte

### Teletransportarse a unas coordenadas

```text
/tele NombreTeleporte
```

Ejemplo:

```text
/tele Dalaran
```

Los nombres dependen de los teletransportes disponibles en la base de datos.

### Ver teletransportes

```text
/help tele
```

### Teletransportar a un jugador

```text
/tele nombre_jugador
```

La sintaxis concreta puede depender de la revisión. Consulta:

```text
/help tele
```

### Ir al jugador seleccionado

```text
/gps
```

Muestra mapa, zona, área y coordenadas de la posición actual.

### Mostrar coordenadas

```text
/gps
```

Útil para crear o comprobar posiciones.

### Volver al último punto de teletransporte

```text
/recall
```

## 7. Modificar atributos del personaje

Estos comandos normalmente requieren seleccionar un personaje.

### Cambiar nivel

```text
/modify level 80
```

Ejemplo:

```text
/modify level 80
```

### Cambiar dinero

```text
/modify money CANTIDAD
```

La cantidad suele expresarse en cobres.

Ejemplo para añadir una cantidad:

```text
/modify money 1000000
```

Consulta la ayuda local antes de usarlo:

```text
/help modify money
```

### Cambiar velocidad

```text
/modify speed 2
```

Restaurar una velocidad normal:

```text
/modify speed 1
```

### Cambiar escala

```text
/modify scale 2
```

Restaurar la escala normal:

```text
/modify scale 1
```

### Cambiar energía o salud

La sintaxis puede variar según la revisión. Consultar:

```text
/help modify
```

## 8. Objetos y equipo

### Añadir un objeto

```text
/additem ID_CANTIDAD
```

Ejemplo:

```text
/additem item_id 1
```

Sustituye `item_id` por el ID real del objeto.

Forma habitual con nombre o ID:

```text
.additem item_id cantidad
```

Si el comando no acepta la sintaxis, utiliza:

```text
/help additem
```

### Eliminar un objeto

```text
/delitem ID_CANTIDAD
```

### Buscar objetos

```text
/lookup item nombre
```

Ejemplo:

```text
/lookup item Frostmourne
```

### Buscar criaturas

```text
/lookup creature nombre
```

### Buscar hechizos

```text
/lookup spell nombre
```

### Buscar misiones

```text
/lookup quest nombre
```

## 9. Criaturas y entidades

### Seleccionar una criatura cercana

Haz clic sobre la criatura dentro del juego y usa los comandos de selección disponibles.

### Ver información de la criatura

```text
/ npc info
```

Según la revisión puede ser:

```text
/npc info
```

Consulta:

```text
/help npc
```

### Crear una criatura

```text
/npc add ENTRY
```

Ejemplo:

```text
/npc add 12345
```

### Eliminar una criatura

Selecciona la criatura y usa:

```text
/npc delete
```

### Cambiar el movimiento de una criatura

```text
/npc set movement id 1
```

Consulta la ayuda de la revisión antes de aplicar cambios:

```text
/help npc
```

## 10. Objetos del mundo

### Crear un objeto del mundo

```text
/gobject add ENTRY
```

### Eliminar un objeto seleccionado

```text
/gobject delete
```

### Ver información de un objeto

```text
/gobject info
```

Consulta:

```text
/help gobject
```

## 11. Jugadores

### Ver información del jugador seleccionado

```text
/pinfo
```

### Inspeccionar a un jugador

Selecciona el personaje y usa:

```text
/pinfo
```

### Expulsar a un jugador

```text
/kick NombreJugador Motivo
```

Ejemplo:

```text
/kick jugador123 Prueba de administración
```

### Enviar mensaje privado

```text
/whisper NombreJugador Mensaje
```

### Silenciar a un jugador

La sintaxis puede depender de los módulos y de la versión:

```text
/mute NombreJugador minutos Motivo
```

Consulta:

```text
/help mute
```

### Banear una cuenta

```text
/ban account NombreCuenta duración Motivo
```

### Banear un personaje

```text
/ban character NombrePersonaje duración Motivo
```

### Banear una dirección IP

```text
/ban ip DirecciónIP duración Motivo
```

La duración puede expresarse según la sintaxis de la instalación. Para no equivocarte:

```text
/help ban
```

### Quitar un baneo

```text
/unban account NombreCuenta
/unban character NombrePersonaje
/unban ip DirecciónIP
```

## 12. Misiones y progreso

### Reiniciar una misión

Selecciona el jugador y consulta:

```text
/help quest
```

Comandos habituales:

```text
/quest add ID
/quest remove ID
/quest complete ID
```

La disponibilidad exacta depende de la revisión.

### Completar una misión

```text
/quest complete ID_MISION
```

### Añadir una misión

```text
/quest add ID_MISION
```

### Eliminar una misión

```text
/quest remove ID_MISION
```

## 13. Hechizos y habilidades

### Aprender un hechizo

```text
/learn ID_HECHIZO
```

### Olvidar un hechizo

```text
/unlearn ID_HECHIZO
```

### Buscar un hechizo

```text
/lookup spell Nombre
```

Ejemplo:

```text
/lookup spell Frostbolt
```

## 14. Modo GM y visibilidad

### Activar modo GM

```text
/gm on
```

### Desactivar modo GM

```text
/gm off
```

### Activar etiqueta GM

```text
/gm visible on
```

### Ocultar etiqueta GM

```text
/gm visible off
```

### Activar modo invisible

```text
/invincible on
```

La sintaxis puede variar. Consulta:

```text
/help gm
/help invisible
```

## 15. Depuración y desarrollo

### Ver posición

```text
/gps
```

### Ver selección actual

```text
/target
```

### Ver información de una criatura u objeto

```text
/lookup creature Nombre
/lookup item Nombre
/lookup spell Nombre
```

### Recargar configuraciones

No recargues tablas arbitrariamente en un servidor con jugadores conectados. Para comandos disponibles:

```text
/help reload
```

Algunas recargas habituales pueden ser:

```text
/reload config
/reload creature_template
/reload quest_template
```

Confirma siempre la tabla y sintaxis con la revisión instalada.

## 16. Comandos útiles para pruebas locales

Secuencia de prueba recomendada dentro del juego:

```text
/gm on
/modify level 80
/gps
/server info
```

Para probar objetos:

```text
/lookup item nombre
/additem ID cantidad
```

Para probar teletransporte:

```text
/help tele
/tele NombreTeleporte
```

Para anunciar una prueba:

```text
/announce Servidor local funcionando correctamente
```

## 17. Comandos desde PowerShell

### Ver el estado

```powershell
docker compose ps
```

### Ver logs

```powershell
docker compose logs -f ac-worldserver
```

### Entrar en la consola del servidor

```powershell
docker compose attach ac-worldserver
```

### Reiniciar el worldserver

```powershell
docker compose restart ac-worldserver
```

### Reiniciar authserver

```powershell
docker compose restart ac-authserver
```

## 18. Diferencia entre consola y chat

En la consola Docker:

```text
account info admin
server info
announce Mensaje
```

Dentro del juego:

```text
/account info admin
/server info
/announce Mensaje
```

La consola normalmente no utiliza `/`. El chat del juego sí.

## 19. Seguridad y precauciones

- Prueba comandos destructivos con un personaje de prueba.
- Haz una copia de seguridad antes de editar personajes o cuentas.
- No ejecutes `DELETE` directamente sobre las bases mientras el servidor está activo.
- No compartas la cuenta GM.
- Cambia la contraseña `root` si el servidor deja de ser exclusivamente local.
- No otorgues nivel GM 3 a cuentas normales.
- No uses comandos de ban sin verificar el objetivo.
- Comprueba la ayuda local cuando la sintaxis no coincida.
- Los comandos de la revisión instalada tienen prioridad sobre los ejemplos de esta guía.

## 20. Ayuda recomendada cuando un comando falla

Si un comando devuelve `USAGE` o muestra la ayuda, ejecuta:

```text
/help nombre_del_comando
```

Ejemplos:

```text
/help account
/help modify
/help npc
/help tele
/help ban
/help quest
```
