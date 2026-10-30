# Monetización sostenible de un servidor privado WoW 3.3.5a

Plan para generar ingresos que cubran hosting, mantenimiento y desarrollo sin convertir el servidor en una experiencia agresiva de Pay-to-Win.

> Antes de aceptar pagos, revisa la legislación aplicable, las condiciones de los proveedores de pago y los derechos de propiedad intelectual relacionados con el uso de marcas, cliente y contenido de World of Warcraft.

## 1. Objetivo

La monetización debe financiar:

- Hosting cloud.
- Backups.
- Dominio y correo.
- Protección anti-DDoS.
- Desarrollo del servidor.
- Mantenimiento de AzerothCore.
- Soporte a la comunidad.
- Moderación.

El objetivo no debe ser vender una ventaja imposible de obtener jugando.

## 2. Modelo recomendado

Combinar cuatro fuentes:

```text
Tienda web
Sistema de votos
Membresías comunitarias
Servicios de personaje
```

Prioridad recomendada:

1. Cosméticos.
2. Servicios de conveniencia.
3. Recompensas por voto.
4. Membresías.
5. Beneficios para hermandades.
6. Elementos competitivos solo si no generan ventaja injusta.

## 3. Tienda web

La tienda utiliza una moneda virtual independiente:

```text
Coins
Puntos
Créditos
Tokens
```

El nombre debe ser propio del servidor. La compra real entrega saldo y el jugador lo utiliza en el catálogo.

### Flujo recomendado

```text
Jugador
  │
  ▼
Web React
  │
  ▼
Backend Django
  │
  ├── Proveedor de pagos
  ├── Tabla de pagos
  ├── Tabla de saldo
  ├── Registro de transacciones
  └── Cola de entregas
          │
          ▼
   Cuenta/personaje AzerothCore
```

Nunca entregues objetos solamente porque el navegador envíe un `item_id`. El backend debe comprobar:

- Producto existente.
- Precio actual.
- Pago confirmado por webhook.
- Usuario autenticado.
- Personaje perteneciente a la cuenta.
- Producto disponible.
- No haber entregado antes la misma transacción.

## 4. Catálogo cosmético

Los cosméticos tienen el menor impacto competitivo.

### Monturas y mascotas

Posibles productos:

- Monturas exclusivas del servidor.
- Mascotas visuales.
- Recompensas de temporadas anteriores.
- Variantes de color.
- Colecciones temáticas.

Evita retirar contenido jugable importante solo para venderlo. Es mejor que sean elementos exclusivos de apariencia o recompensas de eventos especiales.

### Títulos

- Títulos visuales.
- Títulos de fundador.
- Títulos de temporada.
- Títulos de apoyo comunitario.

No otorgues títulos que confundan con rangos administrativos reales.

### Tabardos

- Tabardos del servidor.
- Tabardos de hermandad.
- Tabardos de eventos.

### Transfiguración

- Apariencias de armas.
- Apariencias de armaduras.
- Colecciones temáticas.

La transfiguración debe cambiar únicamente el aspecto visual y no las estadísticas.

## 5. Servicios de personaje

Los servicios pueden ahorrar tiempo sin vender poder competitivo directo.

### Servicios recomendados

- Cambio de nombre.
- Cambio de raza.
- Cambio de sexo.
- Cambio de facción.
- Personalización estética.
- Transferencia de personaje, con límites.
- Desbloqueo de apariencia.
- Recuperación de un personaje eliminado, dentro de un periodo limitado.

Cada servicio debe:

- Costar una cantidad clara.
- Mostrar condiciones antes de pagar.
- Crear una transacción auditable.
- Ser reversible cuando sea técnicamente posible.
- Tener un historial visible para el jugador.

## 6. Conveniencia

La conveniencia debe ahorrar tiempo, no sustituir completamente el progreso.

Posibles servicios:

- Multiplicador de experiencia temporal.
- Pases de experiencia x2 o x5.
- Licencias de equitación si no afectan al equilibrio PvP.
- Desbloqueo de rutas de vuelo.
- Bolsas cosméticas o de capacidad moderada.
- Slots adicionales de personajes.
- Acceso a funciones sociales.

### Level boost

Un boost al nivel 80 es atractivo, pero tiene riesgos:

- Reduce la progresión natural.
- Puede llenar el servidor de personajes sin experiencia.
- Puede afectar el contenido inicial.
- Puede aumentar bots o cuentas desechables.

Si se ofrece:

- Limítalo a una vez por cuenta o temporada.
- Entrega equipo inicial razonable, no BiS.
- Obliga a completar una introducción.
- No lo habilites para determinadas colas competitivas inmediatamente.
- No vendas mejoras de equipo equivalentes a contenido final.

## 7. Membresías

Las membresías funcionan mejor cuando ofrecen identidad y comunidad.

### Nivel básico

- Rol de Discord.
- Insignia en el panel.
- Cosmético mensual.
- Acceso a encuestas.

### Nivel intermedio

- Cosméticos adicionales.
- Acceso anticipado a eventos de prueba.
- Canal privado de sugerencias.
- Bonus pequeño de moneda de donación.

### Nivel fundador

- Título cosmético.
- Reconocimiento histórico.
- Invitación a reuniones comunitarias.
- Acceso a pruebas beta.

No combines la membresía con:

- BiS.
- Ventaja PvP decisiva.
- Acceso exclusivo a contenido obligatorio.
- Inmunidad a sanciones.
- Permisos GM.

## 8. Sistema de votos

Un sistema de votos puede atraer jugadores sin coste publicitario directo.

### Flujo

```text
Jugador pulsa votar
      │
      ▼
Proveedor/lista confirma el voto
      │
      ▼
Backend valida el callback
      │
      ▼
Se entrega una recompensa una sola vez
```

Puntos de voto recomendados:

- Bolsas pequeñas.
- Consumibles básicos.
- Cosméticos menores.
- Monturas terrenales no competitivas.
- Títulos de votante.

Evita entregar objetos que sustituyan el progreso de raids o PvP.

### Protección contra abuso

- Una recompensa por voto válido.
- No confiar en parámetros enviados por el cliente.
- Validar firma o callback del proveedor.
- Registrar IP y timestamp con cuidado de privacidad.
- Limitar votos por cuenta y periodo.
- Impedir duplicados por identificador externo.

## 9. Hermandades y comunidad

Productos comunitarios:

- Tabardo personalizado.
- Página de hermandad.
- Canal privado de Discord.
- Insignia en el ranking.
- Espacio de presentación.
- Nombre reservado para eventos.

No vendas ventajas de combate exclusivas a una hermandad.

## 10. Subastas de nombres

Si se implementa:

- No liberes nombres de cuentas activas.
- Define claramente qué significa inactividad.
- Notifica antes de liberar un nombre.
- Conserva un historial.
- Evita comprar nombres con datos personales.
- No vendas nombres de personajes sancionados.

## 11. Reglas anti-P2W

### No vender

- Armas BiS.
- Armaduras BiS.
- Objetos de Icecrown Citadel Heroico.
- Objetos que den ventaja directa en arenas.
- Rating PvP.
- Logros falsos.
- Títulos de rangos competitivos legítimos.
- Inmunidad a baneos.
- Permisos GM.
- Información privada de otros jugadores.

### Se puede vender con cuidado

- Cosméticos.
- Apariencias.
- Mascotas.
- Títulos no competitivos.
- Servicios de nombre/raza/facción.
- Conveniencia limitada.
- Membresías sociales.
- Recompensas de comunidad.

## 12. Transparencia

Publica en la web:

```text
Meta de hosting:     40 EUR
Recaudado:           27 EUR
Próximo vencimiento: 15/11/2026
```

También explica:

- En qué se usa el dinero.
- Qué productos no se venderán.
- Cómo funcionan los reembolsos.
- Qué pasa si el servidor cierra.
- Cómo se protegen los datos de pagos.

No almacenes datos completos de tarjetas. Usa páginas alojadas o tokens de proveedores de pago.

## 13. Pagos

Proveedores posibles:

- Stripe.
- PayPal.
- Mercado Pago, si está disponible en tu región.
- Paddle u otro merchant of record, según jurisdicción.

El backend nunca debe confiar únicamente en la redirección de éxito del navegador.

### Flujo seguro

```text
1. Usuario inicia checkout.
2. Backend crea una orden pendiente.
3. Proveedor procesa el pago.
4. Proveedor llama al webhook.
5. Backend verifica firma del webhook.
6. Backend marca la orden como pagada.
7. Backend acredita saldo.
8. Backend registra ledger.
9. Backend entrega el producto.
```

## 14. Modelo de datos recomendado

### `store_products`

```text
id
name
slug
description
price
currency
coins_cost
category
payload_json
is_active
created_at
updated_at
```

### `store_orders`

```text
id
account_id
provider
provider_order_id
amount
currency
status
created_at
paid_at
```

### `account_wallets`

```text
account_id
balance
updated_at
```

### `wallet_ledger`

```text
id
account_id
amount
reason
reference_id
balance_after
created_at
```

### `store_deliveries`

```text
id
order_id
account_id
character_guid
product_id
status
attempts
last_error
created_at
delivered_at
```

El ledger debe ser append-only en la medida de lo posible. No edites transacciones históricas; crea ajustes compensatorios.

## 15. Entrega de productos

Nunca entregues desde React.

El backend debe:

1. Comprobar JWT.
2. Comprobar saldo o pago.
3. Comprobar que el personaje pertenece a la cuenta.
4. Crear una entrega pendiente.
5. Ejecutar la entrega de forma idempotente.
6. Registrar resultado.
7. Mostrar estado al usuario.

Para objetos de juego, considera una cola de entrega y un proceso worker.

## 16. Automatización con AzerothCore

Opciones:

- Insertar únicamente en tablas autorizadas, con transacciones.
- Usar comandos SOAP solo por red privada.
- Usar un worker interno conectado a una cola.
- Entregar por correo dentro del juego.

No expongas SOAP a Internet.

Nunca ejecutes comandos GM recibidos directamente desde el navegador.

## 17. Seguridad de la tienda

### Backend

- Validar precios en servidor.
- Validar producto activo.
- Verificar firma de webhooks.
- Usar idempotency keys.
- Usar transacciones.
- Registrar auditoría.
- Rate limit en checkout y canje.
- No permitir cantidades negativas.
- No aceptar SQL ni IDs arbitrarios.

### Frontend

- Mostrar precios recibidos del backend.
- No calcular el saldo como autoridad.
- No guardar secretos.
- No guardar JWT en `localStorage`.
- Mostrar el estado real de la orden.

### MySQL

La web no debe usar root. Separa usuarios:

```text
website_read
website_account_write
store_worker
migration_admin
```

Cada uno debe recibir solo los permisos necesarios.

## 18. Roadmap

### Fase 1: base

- Definir moneda.
- Definir reglas anti-P2W.
- Crear categorías.
- Crear página de transparencia.
- Crear términos y reembolsos.

### Fase 2: catálogo sin pagos

- Crear productos en backend.
- Crear página de tienda.
- Crear carrito visual.
- Crear wallet de prueba.
- Crear ledger.
- Probar entregas simuladas.

### Fase 3: votos

- Integrar proveedor de votos.
- Validar callbacks.
- Entregar recompensas pequeñas.
- Añadir límites antiabuso.

### Fase 4: pagos

- Integrar checkout.
- Implementar webhooks.
- Implementar idempotencia.
- Probar pagos en sandbox.
- Probar reembolsos.

### Fase 5: entregas reales

- Añadir worker.
- Integrar entrega por correo del juego.
- Auditar todas las operaciones.
- Habilitar primero cosméticos.

### Fase 6: comunidad

- Membresías.
- Beneficios de Discord.
- Tabardos.
- Eventos de apoyo.

## 19. Métricas

Mide:

- Ingresos mensuales.
- Coste de hosting.
- Jugadores activos.
- Conversión de usuarios registrados.
- Donación media.
- Reembolsos.
- Productos más vendidos.
- Entregas fallidas.
- Tiempo de entrega.
- Retención de jugadores.

Una monetización saludable debe mejorar la sostenibilidad sin reducir la retención.

## 20. Recomendación inicial

Para comenzar:

```text
1. Tienda cosmética.
2. Sistema de votos.
3. Membresía social.
4. Servicios de nombre/raza/facción.
5. Barra pública de objetivo de hosting.
6. Sin BiS ni ventajas PvP vendidas.
7. Pagos en sandbox.
8. Backups antes de activar entregas.
```

La confianza de la comunidad es el activo principal. Un catálogo más pequeño y justo suele ser mejor que una tienda agresiva que perjudique el equilibrio del servidor.
