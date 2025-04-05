# Database Dictionary

---

### 1. **Subscription**
**Descripción**: Representa un plan o paquete de suscripción que un dueño puede contratar para acceder a servicios del sistema.

- `id`: Identificador único de la suscripción.  
- `name`: Nombre del plan.  
- `description`: Beneficios y descripción del plan.  
- `price`: Costo de la suscripción.  
- `state`: Estado actual del plan (activo, inactivo, etc.).

---

### 2. **Owner**
**Descripción**: Usuario con rol de dueño, quien administra hoteles y puede gestionar ingresos, egresos, contratos, y suministros.

- `id`: Identificador único del dueño.  
- `username`: Nombre de usuario para iniciar sesión.  
- `name`: Nombre del dueño.  
- `surname`: Apellido del dueño.  
- `phone`: Número telefónico.  
- `email`: Dirección de correo electrónico.  
- `state`: Estado de la cuenta (activo, suspendido, etc.).  
- `roles_id`: Referencia al rol asignado.

---

### 3. **ContractOwner**
**Descripción**: Representa un contrato entre un dueño y un plan de suscripción.

- `id`: Identificador único del contrato.  
- `subscriptions_id`: ID del plan de suscripción asociado.  
- `owners_id`: ID del dueño que firma el contrato.  
- `start_date`: Fecha de inicio del contrato.  
- `final_date`: Fecha de finalización del contrato.  
- `state`: Estado actual del contrato.

---

### 4. **Hotel**
**Descripción**: Establecimiento gestionado por un dueño, el cual contiene habitaciones.

- `id`: Identificador del hotel.  
- `owners_id`: ID del dueño del hotel.  
- `name`: Nombre del hotel.  
- `description`: Breve descripción del hotel.  
- `address`: Dirección física del hotel.  
- `phone`: Número telefónico.  
- `email`: Correo de contacto del hotel.

---

### 5. **Room**
**Descripción**: Habitación individual dentro de un hotel, clasificada por tipo.

- `id`: Identificador único de la habitación.  
- `types_rooms_id`: Tipo de habitación (suite, doble, etc.).  
- `hotels_id`: ID del hotel al que pertenece.  
- `state`: Estado de la habitación (ocupada, disponible, mantenimiento).

---

### 6. **TypeRoom**
**Descripción**: Categoría de habitación que define su precio y características.

- `id`: Identificador único del tipo.  
- `description`: Descripción del tipo de habitación.  
- `price`: Precio base asociado al tipo de habitación.

---

### 7. **Customer**
**Descripción**: Usuario final que reserva habitaciones.

- `id`: Identificador único del cliente.  
- `username`: Nombre de usuario para autenticación.  
- `name`: Nombre del cliente.  
- `surname`: Apellido del cliente.  
- `email`: Correo electrónico.  
- `phone`: Número de contacto.  
- `state`: Estado de la cuenta del cliente.

---

### 8. **Booking**
**Descripción**: Representa una reserva hecha por un cliente para una habitación específica.

- `id`: Identificador único de la reserva.  
- `payments_customer`: ID del pago relacionado.  
- `rooms_id`: ID de la habitación reservada.  
- `description`: Descripción de la reserva.  
- `start_date`: Fecha de inicio de la estadía.  
- `final_date`: Fecha de término.  
- `price_room`: Precio por noche.  
- `night_count`: Número de noches reservadas.  
- `amount`: Monto total.  
- `state`: Estado de la reserva (confirmada, cancelada, finalizada).
- `preferences_id`: Id de las preferencias del cliente. 

---

### 9. **PaymentCustomer**
**Descripción**: Registro de pagos realizados por clientes.

- `id`: Identificador del pago.  
- `customers_id`: ID del cliente que realiza el pago.  
- `final_amount`: Monto total pagado.

---

### 10. **PaymentOwner**
**Descripción**: Registro de pagos hechos por los dueños (por ejemplo, para servicios o suministros).

- `id`: Identificador del pago.  
- `owners_id`: ID del dueño que realiza el pago.  
- `description`: Descripción del pago.  
- `final_amount`: Monto pagado.

---

### 11. **Supply**
**Descripción**: Insumos disponibles para los hoteles (comida, productos de limpieza, etc.).

- `id`: Identificador único del insumo.  
- `providers_id`: ID del proveedor que lo distribuye.  
- `name`: Nombre del insumo.  
- `price`: Precio.  
- `stock`: Cantidad disponible.  
- `state`: Estado del insumo (activo, agotado, etc.).

---

### 12. **Provider**
**Descripción**: Empresa que provee insumos a los hoteles.

- `id`: Identificador único del proveedor.  
- `name`: Nombre del proveedor.  
- `address`: Dirección de la empresa.  
- `email`: Correo electrónico.  
- `phone`: Teléfono de contacto.  
- `state`: Estado del proveedor (activo, bloqueado, etc.).

---

### 13. **SupplyRequest**
**Descripción**: Pedido de insumos.

- `id`: Identificador único del pedido.  
- `payments_owners_id`: ID del pago asociado.  
- `supplies_id`: ID del insumo solicitado.  
- `count`: Cantidad solicitada.  
- `amount`: Monto total del pedido.

---

### 14. **Admins Credentials**
**Descripción**: Almacena las credenciales o códigos de acceso exclusivos para los administradores del sistema.

- `admins_id`: ID del administrador.  
- `code`: Código de acceso o verificación.

---

### 15. **Admins**
**Descripción**: Representa a los administradores del sistema, quienes supervisan trabajadores y gestionan notificaciones y asignaciones.

- `id`: Identificador único del administrador.  
- `roles_id`: ID del rol asignado al administrador.  
- `username`: Nombre de usuario para iniciar sesión.  
- `name`: Nombre del administrador.  
- `surname`: Apellido del administrador.  
- `phone`: Número telefónico del administrador.  
- `email`: Correo electrónico de contacto.  
- `state`: Estado actual de la cuenta del administrador.

---

### 16. **Roles**
**Descripción**: Define los distintos roles que pueden tener los usuarios del sistema (e.g., administrador, cliente).

- `id`: Identificador único del rol.  
- `name`: Nombre del rol (ejemplo: admin, owner).

---

### 17. **Notificaciones**
**Descripción**: Representa los mensajes o alertas generadas dentro del sistema, dirigidas a distintos tipos de usuarios (dueños, administradores, etc.).

- `id`: Identificador único de la notificación.  
- `sender_id`: ID del usuario que envia la notificación.  
- `reciever_id`: ID del usuario que recibe la notificación.  
- `title`: Título de la notificación.
- `sender_type`: Tipo del usuario que envia la notificación.
- `content`: Contenido de la notificación.

---

### 18. **Owner Credentials**
**Descripción**: Contiene códigos especiales asociados a los dueños como parte de su sistema de autenticación o validación.

- `owners_id`: ID del dueño.  
- `code`: Código único asociado.

---

### 19. **Customer Preferences**
**Descripción**: Contiene las preferencias que el cliente determina para su reserva. 

- `id`: Identificador único de las preferencias del cliente.  
- `customers_id`: ID del cliente.  
- `temperature`: Código único asociado.
