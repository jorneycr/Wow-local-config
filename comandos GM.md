# Comandos GM de AzerothCore por categorías

Guía práctica para AzerothCore/WotLK 3.3.5a. Está ordenada como un flujo de trabajo para preparar y administrar un personaje nuevo.

> La ayuda que muestra tu servidor tiene prioridad. Si un comando devuelve `USAGE`, ejecuta `.help comando`.

## 1. Flujo rápido para un jugador nuevo

Sustituye `Jorney` por el nombre exacto del personaje.

### 1. Activar GM

```text
.gm on
```

### 2. Comprobar la posición y el servidor

```text
.gps
.server info
```

### 3. Subir el personaje al nivel 80

Este comando fue probado y funciona en este servidor:

```text
.character level Jorney 80
```

### 4. Dar dinero

```text
.modify money 1000000
```

Para quitar dinero:

```text
.modify money -1000000
```

### 5. Buscar un set u objeto

```text
.lookup item Colérico
```

### 6. Añadir una pieza

```text
.additem 51468
```

### 7. Añadir un set completo

```text
.additem set NUMERO
```

Sustituye `NUMERO` por el ID del set que corresponda a la búsqueda del servidor.

### 8. Comprobar el personaje

```text
.character info Jorney
```

### 9. Usar el mapa o teletransportarse

```text
.gps
.help tele
```

### 10. Anunciar una prueba

```text
.announce Servidor local funcionando correctamente
```

## 2. Conceptos importantes

El nivel GM y el nivel del personaje son diferentes:

```text
.gm on
```

Activa el modo Game Master.

```text
.character level Jorney 80
```

Cambia el nivel del personaje.

En este entorno:

```text
Cuenta GM:       admin
Contraseña:      root
Nivel de cuenta: 3
Personaje:       Jorney
```

## 3. Dónde ejecutar comandos

### Dentro del juego

Pulsa `Enter` y escribe el comando con punto:

```text
.gm on
.gps
.character level Jorney 80
```

### Consola del worldserver

Desde PowerShell:

```powershell
cd "D:\Servidor WOW 3.3.5 Local"
docker compose attach ac-worldserver
```

En la consola `AC>` se escribe sin el punto:

```text
gm on
gps
character level Jorney 80
```

Para salir sin detener el servidor:

```text
Ctrl-P
Ctrl-Q
```

## 4. Ayuda y descubrimiento de comandos

### Ayuda general

Dentro del juego:

```text
.help
```

En consola:

```text
help
```

### Ayuda por categoría

```text
.help account
.help character
.help modify
.help additem
.help npc
.help gobject
.help quest
.help tele
.help ban
```

### Comandos disponibles para tu nivel

```text
.commands
```

Si la sintaxis de un comando no coincide con esta guía, usa la ayuda local del servidor.

## 5. Jugadores y personajes

### Información del personaje

```text
.character info Jorney
```

### Cambiar el nivel

```text
.character level Jorney 80
```

### Cambiar el nombre

```text
.character rename Jorney
```

### Cambiar de cuenta

```text
.character changeaccount Jorney NOMBRE_CUENTA
```

### Cambiar raza

```text
.character changerace Jorney
```

### Cambiar facción

```text
.character changefaction Jorney
```

### Personalizar el personaje

```text
.character customize Jorney
```

### Ver información del jugador seleccionado

```text
.pinfo
```

### Expulsar un jugador

```text
.kick NOMBRE_JUGADOR Motivo
```

Ejemplo:

```text
.kick Jorney Prueba local
```

### Enviar un mensaje privado

```text
.whisper NOMBRE_JUGADOR Mensaje
```

## 6. Modo GM y visibilidad

### Activar GM

```text
.gm on
```

### Desactivar GM

```text
.gm off
```

### Consultar estado GM

```text
.gm
```

### Mostrar etiqueta GM

```text
.gm visible on
```

### Ocultar etiqueta GM

```text
.gm visible off
```

### Activar vuelo GM

```text
.gm fly on
```

### Desactivar vuelo GM

```text
.gm fly off
```

La disponibilidad depende de la configuración y del nivel GM.

## 7. Dinero, estadísticas y atributos

Estos comandos modifican al jugador seleccionado. Si no hay ningún jugador seleccionado, se aplican a tu propio personaje.

### Salud / vida

```text
.modify hp #newhp
```

Ejemplo:

```text
.modify hp 100000
```

Establece la salud máxima indicada.

### Maná

```text
.modify mana #newmana
```

Ejemplo:

```text
.modify mana 100000
```

Establece el maná máximo indicado.

### Dinero / oro

```text
.modify money #money
```

Ejemplo para añadir dinero:

```text
.modify money 1000000
```

Ejemplo para quitar dinero:

```text
.modify money -1000000
```

El valor se expresa en cobres. El número puede ser negativo para quitar dinero.

### Ira

```text
.modify rage 100
```

### Energía

```text
.modify energy 100
```

### Velocidad

```text
.modify speed 2
```

Restaurar velocidad normal:

```text
.modify speed 1
```

### Escala

```text
.modify scale 2
```

Restaurar escala normal:

```text
.modify scale 1
```

### Montura

```text
.modify mount ID_MONTURA
```

Consulta primero el ID correcto:

```text
.lookup item nombre
```

## 8. Objetos, sets y equipo

### Buscar un objeto

Comando confirmado en este servidor:

```text
.lookup item Colérico
```

También puedes buscar por nombre:

```text
.lookup item nombre_del_objeto
```

### Añadir una pieza

```text
.additem ID
```

Ejemplo confirmado:

```text
.additem 51468
```

### Añadir una cantidad

```text
.additem ID CANTIDAD
```

Ejemplo:

```text
.additem 51468 1
```

### Buscar sets

```text
.lookup itemset NOMBRE
```

Si tu revisión utiliza la búsqueda general:

```text
.lookup item Colérico
```

### Añadir un set completo

```text
.additem set NUMERO
```

Ejemplo de sintaxis:

```text
.additem set 123
```

`NUMERO` debe ser el ID de set que acepta tu servidor, no necesariamente el identificador mostrado por una página web.

### Eliminar un objeto

```text
.deleteitem ID CANTIDAD
```

Consulta la sintaxis local si aparece `USAGE`:

```text
.help deleteitem
```

## 9. Búsquedas

### Objetos

```text
.lookup item NOMBRE
```

### Sets

```text
.lookup itemset NOMBRE
```

### Criaturas

```text
.lookup creature NOMBRE
```

### Hechizos

```text
.lookup spell NOMBRE
```

### Misiones

```text
.lookup quest NOMBRE
```

## 10. Teletransporte y posición

### Ver posición

```text
.gps
```

Muestra mapa, zona, área y coordenadas.

### Ver ayuda de teletransporte

```text
.help tele
```

### Teletransportarse

```text
.tele NOMBRE_TELETRANSPORTE
```

Ejemplo:

```text
.tele Dalaran
```

### Ir hacia otro jugador

```text
.appear NOMBRE_JUGADOR
```

### Traer otro jugador hacia ti

```text
.summon NOMBRE_JUGADOR
```

### Regresar a la posición anterior

```text
.recall
```

## 11. NPCs

Selecciona un NPC haciendo clic sobre él antes de ejecutar los comandos.

### Ver ayuda de NPC

```text
.help npc
```

### Añadir un NPC

```text
.npc add ENTRY
```

### Eliminar el NPC seleccionado

```text
.npc delete
```

### Ver información del NPC

```text
.npc info
```

### Mover un NPC

```text
.npc move
```

### Cambiar modelo

```text
.npc set model ID_MODELO
```

### Cambiar nivel

```text
.npc set level NIVEL
```

### Seguir a un jugador

```text
.npc follow
```

### Dejar de seguir

```text
.npc unfollow
```

La sintaxis exacta se puede comprobar con:

```text
.help npc
```

## 12. Objetos del mundo

Selecciona el objeto del mundo antes de modificarlo.

### Añadir un objeto

```text
.gobject add ENTRY
```

### Eliminar el objeto seleccionado

```text
.gobject delete
```

### Moverlo

```text
.gobject move
```

### Girarlo

```text
.gobject turn
```

### Ver información

```text
.gobject info
```

## 13. Misiones

### Buscar una misión

```text
.lookup quest NOMBRE
```

### Añadir una misión

```text
.quest add ID_MISION
```

### Completar una misión

```text
.quest complete ID_MISION
```

### Eliminar una misión

```text
.quest remove ID_MISION
```

### Entregar/recompensar una misión

```text
.quest reward ID_MISION
```

Comprueba la ayuda si alguno no está disponible:

```text
.help quest
```

## 14. Hechizos y habilidades

### Buscar un hechizo

```text
.lookup spell NOMBRE
```

### Aprender un hechizo

```text
.learn ID_HECHIZO
```

### Olvidar un hechizo

```text
.unlearn ID_HECHIZO
```

### Aprender hechizos de clase

```text
.learn all_myclass
```

### Aprender todos los hechizos GM

```text
.learn all gm
```

### Maximizar habilidades

```text
.maxskill
```

Establece todas las habilidades del jugador seleccionado en sus valores máximos para el nivel actual. Si no hay un jugador seleccionado, se aplica a tu propio personaje.

### Quitar el grillete GM

Si el personaje queda inmovilizado por el efecto GM, quita el hechizo confirmado en este servidor:

```text
.unlearn 36356 all
```

### Aprender hechizos disponibles

```text
.learn all_myspells
```

Usa estos comandos con cuidado, especialmente en personajes de prueba.

## 15. Administración de cuentas

Estos comandos se ejecutan normalmente en la consola del worldserver.

### Crear una cuenta

```text
account create NOMBRE CONTRASEÑA
```

### Ver información

```text
account info NOMBRE
```

### Cambiar nivel GM

```text
account set gmlevel NOMBRE NIVEL -1
```

Ejemplo:

```text
account set gmlevel admin 3 -1
```

### Bloquear una cuenta

```text
account lock NOMBRE on
```

### Desbloquear una cuenta

```text
account lock NOMBRE off
```

### Ver cuentas conectadas

```text
account online
```

### Eliminar una cuenta

```text
account delete NOMBRE
```

## 16. Moderación

### Anuncio global

```text
.announce Mensaje para todos
```

### Mensaje de sistema

```text
.notify Mensaje para el jugador
```

### Silenciar

```text
.mute NOMBRE_JUGADOR DURACION Motivo
```

### Quitar silencio

```text
.unmute NOMBRE_JUGADOR
```

### Banear una cuenta

```text
.ban account NOMBRE_CUENTA DURACION Motivo
```

### Banear un personaje

```text
.ban character NOMBRE_PERSONAJE DURACION Motivo
```

### Banear una IP

```text
.ban ip DIRECCION_IP DURACION Motivo
```

### Quitar un baneo

```text
.unban account NOMBRE_CUENTA
.unban character NOMBRE_PERSONAJE
.unban ip DIRECCION_IP
```

Consulta siempre la sintaxis:

```text
.help ban
```

## 17. Servidor y depuración

### Información del servidor

```text
.server info
```

### Mensaje del día

```text
.server motd
```

### Recargar una tabla

```text
.reload NOMBRE_TABLA
```

Ejemplos, solo si la ayuda de tu revisión los confirma:

```text
.reload config
.reload creature_template
.reload quest_template
```

### Apagar o reiniciar

Para mantenimiento local es más seguro usar Docker desde PowerShell:

```powershell
docker compose restart ac-worldserver
```

```powershell
docker compose restart ac-authserver
```

## 18. Seguridad

- Haz una copia de seguridad antes de modificar cuentas o personajes.
- Prueba cambios destructivos con un personaje de prueba.
- No modifiques directamente las tablas de personajes mientras el worldserver está activo.
- No compartas la cuenta GM.
- No otorgues GM nivel 3 a cuentas normales.
- Comprueba el objetivo antes de usar `kick`, `ban`, `delete` o `remove`.
- La ayuda del servidor instalado tiene prioridad sobre ejemplos de Internet.

## 19. Comandos confirmados en esta instalación

Estos comandos fueron probados y funcionaron:

```text
.gm on
.character level Jorney 80
.lookup item Colérico
.additem 51468
.additem set NUMERO
```
