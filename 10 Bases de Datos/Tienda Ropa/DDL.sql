-- DDL
DROP TABLE IF EXISTS HistorialStock;
DROP TABLE IF EXISTS DetallePedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS VarianteProducto;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Categoria;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TiendaRopa2')
BEGIN
    CREATE DATABASE TiendaRopa2;
END;
GO

USE TiendaRopa2;
GO

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY IDENTITY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
    descripcion_categoria TEXT
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion_producto TEXT,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    stock_disponible INT NOT NULL DEFAULT 0,
    url_imagen VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY,
    nombre_cliente VARCHAR(100) NOT NULL,
    apellido_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion_envio VARCHAR(255) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT GETDATE(),
    estado_pedido VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    total_pedido DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE VarianteProducto (
    id_variante INT PRIMARY KEY IDENTITY,
    id_producto INT NOT NULL,
    talla VARCHAR(20) NOT NULL,
    color VARCHAR(50) NOT NULL,
    stock_variante INT NOT NULL DEFAULT 0,
    sku_variante VARCHAR(100) UNIQUE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    UNIQUE (id_producto, talla, color)
);

CREATE TABLE DetallePedido (
    id_detalle_pedido INT PRIMARY KEY IDENTITY,
    id_pedido INT NOT NULL,
    id_variante INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario_al_momento DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_variante) REFERENCES VarianteProducto(id_variante),
    UNIQUE (id_pedido, id_variante)
);

CREATE TABLE HistorialStock (
    id_historial INT PRIMARY KEY IDENTITY,
    id_variante INT NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT GETDATE(),
    tipo_cambio VARCHAR(50) NOT NULL,
    cantidad_cambiada INT NOT NULL,
    stock_resultante INT NOT NULL,
    FOREIGN KEY (id_variante) REFERENCES VarianteProducto(id_variante)
);