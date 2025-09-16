--DDL

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'pasteleria2_db')
BEGIN
    CREATE DATABASE pasteleria2;
END;
GO

USE pasteleria2;
GO

CREATE TABLE CategoriaProducto (
    id_categoria INT PRIMARY KEY IDENTITY(1,1),
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
    descripcion_categoria TEXT
);

CREATE TABLE Ingrediente (
    id_ingrediente INT PRIMARY KEY IDENTITY(1,1),
    nombre_ingrediente VARCHAR(100) NOT NULL UNIQUE,
    unidad_medida VARCHAR(50),
    stock_actual DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio_venta DECIMAL(10, 2) NOT NULL,
    tiempo_preparacion_minutos INT,
    stock_disponible INT DEFAULT 0,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CategoriaProducto(id_categoria)
);

CREATE TABLE Receta (
    id_receta INT PRIMARY KEY IDENTITY(1,1),
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad_necesaria DECIMAL(10, 2) NOT NULL,
    CONSTRAINT UQ_Receta UNIQUE (id_producto, id_ingrediente),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre_cliente VARCHAR(100) NOT NULL,
    apellido_cliente VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(20),
    email_cliente VARCHAR(150) UNIQUE,
    direccion_cliente VARCHAR(255)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY IDENTITY(1,1),
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido_empleado VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY(1,1),
    fecha_pedido DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    fecha_entrega_estimada DATETIME2,
    total_pedido DECIMAL(10, 2) DEFAULT 0.00,
    estado_pedido VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    tipo_pago VARCHAR(50),
    id_cliente INT NULL,
    id_empleado_recibe INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado_recibe) REFERENCES Empleado(id_empleado)
);

CREATE TABLE DetallePedido (
    id_detalle_pedido INT PRIMARY KEY IDENTITY(1,1),
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario_venta DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    notas_personalizacion TEXT,
    CONSTRAINT UQ_DetallePedido UNIQUE (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);