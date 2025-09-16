-- DDL
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS ParticipacionArtista;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Artista;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS TipoEntrada;
DROP TABLE IF EXISTS Lugar;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Eventos2')
BEGIN
    CREATE DATABASE Eventos2;
END;
GO

USE Eventos2;
GO

CREATE TABLE Lugar (
    id_lugar INT PRIMARY KEY IDENTITY,
    nombre_lugar VARCHAR(150) NOT NULL UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    capacidad_maxima INT NOT NULL,
    tipo_lugar VARCHAR(50),
    telefono_contacto VARCHAR(20),
    email_contacto VARCHAR(100)
);

CREATE TABLE TipoEntrada (
    id_tipo_entrada INT PRIMARY KEY IDENTITY,
    nombre_tipo VARCHAR(50) NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    limite_por_compra INT
);

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY IDENTITY,
    nombre_evento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_hora_inicio DATETIME NOT NULL,
    fecha_hora_fin DATETIME,
    id_lugar INT NOT NULL,
    estado_evento VARCHAR(50) NOT NULL DEFAULT 'Programado',
    FOREIGN KEY (id_lugar) REFERENCES Lugar(id_lugar)
);

CREATE TABLE Artista (
    id_artista INT PRIMARY KEY IDENTITY,
    nombre_artista VARCHAR(150) NOT NULL,
    genero_musical_o_actuacion VARCHAR(100),
    nacionalidad VARCHAR(50),
    sitio_web VARCHAR(255)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY IDENTITY,
    nombre_usuario VARCHAR(100) NOT NULL,
    apellido_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE ParticipacionArtista (
    id_participacion INT PRIMARY KEY IDENTITY,
    id_evento INT NOT NULL,
    id_artista INT NOT NULL,
    rol_en_evento VARCHAR(50),
    hora_actuacion TIME,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista),
    CONSTRAINT uq_participacion UNIQUE (id_evento, id_artista)
);

CREATE TABLE Ticket (
    id_ticket INT PRIMARY KEY IDENTITY,
    id_usuario INT NOT NULL,
    id_tipo_entrada INT NOT NULL,
    id_evento INT NOT NULL,
    fecha_compra DATETIME NOT NULL DEFAULT GETDATE(),
    precio_pagado DECIMAL(10, 2) NOT NULL,
    estado_ticket VARCHAR(50) NOT NULL DEFAULT 'Válido',
    codigo_qr VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_tipo_entrada) REFERENCES TipoEntrada(id_tipo_entrada),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);