-- DDL
DROP TABLE IF EXISTS ComentarioTarea;
DROP TABLE IF EXISTS DependenciaTarea;
DROP TABLE IF EXISTS AsignacionTarea;
DROP TABLE IF EXISTS Tarea;
DROP TABLE IF EXISTS Proyecto;
DROP TABLE IF EXISTS Miembro;
DROP TABLE IF EXISTS Equipo;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CentroProyectos2')
BEGIN
    CREATE DATABASE CentroProyectos2;
END;
GO

USE CentroProyectos2;
GO

CREATE TABLE Equipo (
    id_equipo INT PRIMARY KEY IDENTITY,
    nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
    descripcion_equipo TEXT,
    fecha_creacion DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Miembro (
    id_miembro INT PRIMARY KEY IDENTITY,
    nombre_miembro VARCHAR(100) NOT NULL,
    apellido_miembro VARCHAR(100) NOT NULL,
    rol_en_equipo VARCHAR(50),
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Proyecto (
    id_proyecto INT PRIMARY KEY IDENTITY,
    nombre_proyecto VARCHAR(255) NOT NULL,
    descripcion_proyecto TEXT,
    fecha_inicio_proyecto DATE NOT NULL,
    fecha_fin_prevista DATE,
    estado_proyecto VARCHAR(50) NOT NULL DEFAULT 'Activo',
    id_equipo_asignado INT NOT NULL,
    FOREIGN KEY (id_equipo_asignado) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Tarea (
    id_tarea INT PRIMARY KEY IDENTITY,
    nombre_tarea VARCHAR(255) NOT NULL,
    descripcion_tarea TEXT,
    fecha_creacion_tarea DATETIME NOT NULL DEFAULT GETDATE(),
    fecha_vencimiento DATE,
    prioridad VARCHAR(20) NOT NULL DEFAULT 'Media',
    estado_tarea VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    id_proyecto INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

CREATE TABLE AsignacionTarea (
    id_asignacion INT PRIMARY KEY IDENTITY,
    id_tarea INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT GETDATE(),
    porcentaje_completado DECIMAL(5, 2) DEFAULT 0.00,
    comentarios_asignacion TEXT,
    FOREIGN KEY (id_tarea) REFERENCES Tarea(id_tarea),
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro),
    UNIQUE (id_tarea, id_miembro)
);

CREATE TABLE DependenciaTarea (
    id_dependencia INT PRIMARY KEY IDENTITY,
    id_tarea_predecesora INT NOT NULL,
    id_tarea_sucesora INT NOT NULL,
    tipo_dependencia VARCHAR(50) NOT NULL DEFAULT 'Final a Inicio',
    FOREIGN KEY (id_tarea_predecesora) REFERENCES Tarea(id_tarea),
    FOREIGN KEY (id_tarea_sucesora) REFERENCES Tarea(id_tarea),
    UNIQUE (id_tarea_predecesora, id_tarea_sucesora),
    CHECK (id_tarea_predecesora <> id_tarea_sucesora)
);

CREATE TABLE ComentarioTarea (
    id_comentario INT PRIMARY KEY IDENTITY,
    id_tarea INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_comentario DATETIME NOT NULL DEFAULT GETDATE(),
    texto_comentario TEXT NOT NULL,
    FOREIGN KEY (id_tarea) REFERENCES Tarea(id_tarea),
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro)
);

