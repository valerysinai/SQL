-- DDL

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SistemaVideojuegos2')
BEGIN
    CREATE DATABASE SistemaVideojuegos2;
END
GO

USE SistemaVideojuegos2;
GO

CREATE TABLE Desarrollador (
    id_desarrollador INT PRIMARY KEY IDENTITY(1,1),
    nombre_desarrollador VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(100),
    fecha_fundacion DATE,
    web_oficial VARCHAR(255) UNIQUE
);
GO

CREATE TABLE Plataforma (
    id_plataforma INT PRIMARY KEY IDENTITY(1,1),
    nombre_plataforma VARCHAR(100) NOT NULL UNIQUE,
    fabricante VARCHAR(100),
    fecha_lanzamiento DATE,
    generacion VARCHAR(50)
);
GO

CREATE TABLE Genero (
    id_genero INT PRIMARY KEY IDENTITY(1,1),
    nombre_genero VARCHAR(100) NOT NULL UNIQUE,
    descripcion_genero TEXT
);
GO

CREATE TABLE Videojuego (
    id_videojuego INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(255) NOT NULL,
    fecha_lanzamiento DATE,
    clasificacion_esrb VARCHAR(10),
    precio DECIMAL(10, 2),
    descripcion_corta TEXT,
    id_desarrollador INT NOT NULL,
    id_genero_principal INT NOT NULL,
    FOREIGN KEY (id_desarrollador) REFERENCES Desarrollador(id_desarrollador),
    FOREIGN KEY (id_genero_principal) REFERENCES Genero(id_genero)
);
GO

CREATE TABLE JuegoPlataforma (
    id_juego_plataforma INT PRIMARY KEY IDENTITY(1,1),
    id_videojuego INT NOT NULL,
    id_plataforma INT NOT NULL,
    fecha_lanzamiento_plataforma DATE,
    edicion_especial VARCHAR(100),
    FOREIGN KEY (id_videojuego) REFERENCES Videojuego(id_videojuego),
    FOREIGN KEY (id_plataforma) REFERENCES Plataforma(id_plataforma),
    CONSTRAINT unq_juego_plataforma UNIQUE (id_videojuego, id_plataforma)
);
GO

CREATE TABLE Jugador (
    id_jugador INT PRIMARY KEY IDENTITY(1,1),
    nombre_usuario VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    fecha_registro DATETIME NOT NULL DEFAULT GETDATE(),
    fecha_nacimiento DATE,
    pais_residencia VARCHAR(100)
);
GO

CREATE TABLE ColeccionJuegos (
    id_coleccion INT PRIMARY KEY IDENTITY(1,1),
    id_jugador INT NOT NULL,
    id_juego_plataforma INT NOT NULL,
    fecha_adquisicion DATETIME NOT NULL DEFAULT GETDATE(),
    metodo_adquisicion VARCHAR(50),
    horas_jugadas DECIMAL(10, 2) DEFAULT 0.00,
    estado_juego VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (id_juego_plataforma) REFERENCES JuegoPlataforma(id_juego_plataforma),
    CONSTRAINT unq_coleccion UNIQUE (id_jugador, id_juego_plataforma)
);
GO