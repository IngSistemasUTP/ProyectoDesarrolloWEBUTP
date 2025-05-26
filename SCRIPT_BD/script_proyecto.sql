CREATE TABLE empresa (
    id_empresa SERIAL PRIMARY KEY,
	ruc VARCHAR(100) NOT NULL UNIQUE,
    razon_social VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);
-- sistema
CREATE TABLE sistema (
    id_sistema SERIAL PRIMARY KEY,
    nombre_sistema VARCHAR(100)
);

-- Tabla para clientes que usan el software
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    ruc VARCHAR(50) NOT NULL UNIQUE,
	nombre_empresa_cliente VARCHAR(250) NOT NULL,
	tipo_cliente VARCHAR(50) NOT NULL,
    id_empresa INT NOT NULL,  -- Referencia a la empresa desarrolladora
	id_sistema INT NOT NULL,  -- Referencia a la tabla de sistema
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE CASCADE,
	 FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema) ON DELETE CASCADE
);

-- Tabla para empleados de la empresa de desarrollo (técnicos, soporte, etc.)
CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    correo_empleado VARCHAR(100) UNIQUE NOT NULL,
    telefono_empleado VARCHAR(20),
    puesto VARCHAR(150),  -- Analista, Soporte, Desarrollador, etc.
    id_empresa INT NOT NULL,  -- La empresa a la que pertenece el empleado
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE CASCADE
);

-- Tabla para los usuarios (clientes y empleados)
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    id_cliente INT,  -- Si es cliente, este campo es obligatorio
    id_empleado INT,  -- Si es empleado, este campo es obligatorio
    correo_usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena_usuario VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50) CHECK (tipo_usuario IN ('Cliente', 'Empleado','Admin')) NOT NULL,  -- Define si es Cliente, Admin, Empleado
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE
);

-- Tabla para las categorías de tickets
CREATE TABLE categoria_ticket (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla para los tickets de helpdesk
CREATE TABLE ticket (
    id_ticket SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,  -- Cliente que genera el ticket
    id_categoria INT NOT NULL,  -- Categoría del ticket (Bug, Soporte, etc.)
    id_empleado_responsable INT,  -- Empleado asignado para resolver el ticket
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_resolucion TIMESTAMP,
    estado VARCHAR(50) CHECK (estado IN ('Nuevo', 'En Proceso', 'Resuelto', 'Cerrado')) DEFAULT 'Nuevo' NOT NULL,
    prioridad VARCHAR(50) CHECK (prioridad IN ('Alta', 'Media', 'Baja')) DEFAULT 'Media',
    descripcion TEXT NOT NULL,  -- Descripción del problema o solicitud
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria_ticket(id_categoria) ON DELETE CASCADE,
    FOREIGN KEY (id_empleado_responsable) REFERENCES empleado(id_empleado) ON DELETE SET NULL
);

-- Tabla para el historial de interacciones en un ticket
CREATE TABLE historial_ticket (
    id_historial SERIAL PRIMARY KEY,
    id_ticket INT NOT NULL,
    id_usuario INT NOT NULL,  -- El usuario que interactúa (cliente o empleado)
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    comentario TEXT NOT NULL,  -- Comentario o acción realizada sobre el ticket
    FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

-- Índices para mejorar el rendimiento de consultas frecuentes
CREATE INDEX idx_ticket_cliente ON ticket(id_cliente);
CREATE INDEX idx_ticket_empleado_responsable ON ticket(id_empleado_responsable);
CREATE INDEX idx_historial_ticket ON historial_ticket(id_ticket);
CREATE INDEX idx_usuario_correo ON usuario(correo_usuario);
CREATE INDEX idx_ticket_estado ON ticket(estado);
CREATE INDEX idx_ticket_prioridad ON ticket(prioridad);
