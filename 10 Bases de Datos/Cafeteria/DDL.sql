-- DDL
DROP TABLE IF EXISTS Suministro;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS DetallePedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS CategoriaProducto;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CafeteriaDB2')
BEGIN
    CREATE DATABASE CafeteriaDB2;
END;
GO

USE CafeteriaDB2;
GO

CREATE TABLE CategoriaProducto (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
    descripcion_categoria TEXT
);

CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion_producto TEXT,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0,
    url_imagen VARCHAR(255),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CategoriaProducto(id_categoria)
);

CREATE TABLE Empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido_empleado VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10, 2),
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    apellido_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    puntos_fidelidad INT DEFAULT 0,
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Pedido (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    id_empleado INT NOT NULL,
    fecha_hora_pedido DATETIME NOT NULL DEFAULT GETDATE(),
    total_pedido DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    estado_pedido VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    tipo_pago VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE DetallePedido (
    id_detalle_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario_al_momento DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    notas_item TEXT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    CONSTRAINT UQ_Pedido_Producto UNIQUE (id_pedido, id_producto)
);

CREATE TABLE Proveedor (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL UNIQUE,
    tipo_suministro VARCHAR(100),
    telefono_contacto VARCHAR(20),
    email_contacto VARCHAR(150),
    direccion_proveedor VARCHAR(255)
);

CREATE TABLE Suministro (
    id_suministro INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    fecha_ultimo_pedido DATE,
    costo_unidad_compra DECIMAL(10, 2),
    tiempo_entrega_dias INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
    CONSTRAINT UQ_Producto_Proveedor UNIQUE (id_producto, id_proveedor)
);
