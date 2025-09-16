-- DDL
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Infraestructura;
DROP TABLE IF EXISTS ContratoServicio;
DROP TABLE IF EXISTS ServicioPublico;
DROP TABLE IF EXISTS Propiedad;
DROP TABLE IF EXISTS Ciudadano;
DROP TABLE IF EXISTS Ciudad;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Ciudad2_db')
BEGIN
    CREATE DATABASE Ciudad2;
END;
GO

USE Ciudad2;
GO

CREATE TABLE Ciudad (
    id_ciudad INT PRIMARY KEY IDENTITY(1,1),
    nombre_ciudad NVARCHAR(100) NOT NULL UNIQUE,
    pais NVARCHAR(100) NOT NULL,
    departamento NVARCHAR(100),
    poblacion_estimada INT,
    alcalde_actual NVARCHAR(100),
    fecha_fundacion DATE
);

CREATE TABLE Ciudadano (
    id_ciudadano INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    genero CHAR(1),
    tipo_documento NVARCHAR(10),
    numero_documento NVARCHAR(20) NOT NULL UNIQUE,
    telefono NVARCHAR(20),
    email NVARCHAR(100) UNIQUE,
    id_ciudad_residencia INT,
    FOREIGN KEY (id_ciudad_residencia) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE Propiedad (
    id_propiedad INT PRIMARY KEY IDENTITY(1,1),
    direccion NVARCHAR(255) NOT NULL,
    area_m2 DECIMAL(10, 2),
    tipo_uso NVARCHAR(50),
    valor_catastral DECIMAL(15, 2),
    numero_predial NVARCHAR(50) UNIQUE NOT NULL,
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE ServicioPublico (
    id_servicio INT PRIMARY KEY IDENTITY(1,1),
    nombre_servicio NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(MAX),
    empresa_proveedora NVARCHAR(100),
    costo_base_mensual DECIMAL(10, 2),
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE ContratoServicio (
    id_contrato INT PRIMARY KEY IDENTITY(1,1),
    id_propiedad INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_inicio_contrato DATE NOT NULL,
    fecha_fin_contrato DATE,
    estado_contrato NVARCHAR(50) NOT NULL,
    FOREIGN KEY (id_propiedad) REFERENCES Propiedad(id_propiedad),
    FOREIGN KEY (id_servicio) REFERENCES ServicioPublico(id_servicio),
    CONSTRAINT UQ_Contrato UNIQUE (id_propiedad, id_servicio, fecha_inicio_contrato)
);

CREATE TABLE Infraestructura (
    id_infraestructura INT PRIMARY KEY IDENTITY(1,1),
    nombre_infraestructura NVARCHAR(150) NOT NULL,
    tipo_infraestructura NVARCHAR(50),
    direccion NVARCHAR(255),
    fecha_construccion DATE,
    capacidad_personas INT,
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY IDENTITY(1,1),
    nombre_evento NVARCHAR(150) NOT NULL,
    descripcion NVARCHAR(MAX),
    fecha_hora_inicio DATETIME NOT NULL,
    fecha_hora_fin DATETIME,
    lugar NVARCHAR(255),
    organizador NVARCHAR(100),
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);
