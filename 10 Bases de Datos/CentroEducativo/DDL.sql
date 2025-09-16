-- DDL
DROP TABLE IF EXISTS Calificacion;
DROP TABLE IF EXISTS Matricula;
DROP TABLE IF EXISTS Clase;
DROP TABLE IF EXISTS Estudiante;
DROP TABLE IF EXISTS Curso;
DROP TABLE IF EXISTS Asignatura;
DROP TABLE IF EXISTS Profesor;

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CentroEducativo2')
BEGIN
    CREATE DATABASE CentroEducativo2;
END;
GO

USE CentroEducativo2;
GO

CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY IDENTITY,
    nombre_profesor VARCHAR(100) NOT NULL,
    apellido_profesor VARCHAR(100) NOT NULL,
    fecha_contratacion DATE,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20)
);
GO

CREATE TABLE Asignatura (
    id_asignatura INT PRIMARY KEY IDENTITY,
    nombre_asignatura VARCHAR(100) NOT NULL UNIQUE,
    creditos INT NOT NULL,
    descripcion_asignatura TEXT
);
GO

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY IDENTITY,
    nombre_curso VARCHAR(100) NOT NULL UNIQUE,
    nivel_educativo VARCHAR(50),
    duracion_meses INT,
    id_profesor_tutor INT,
    FOREIGN KEY (id_profesor_tutor) REFERENCES Profesor(id_profesor)
);
GO

CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY IDENTITY,
    nombre_estudiante VARCHAR(100) NOT NULL,
    apellido_estudiante VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    genero CHAR(1),
    email VARCHAR(150) UNIQUE,
    telefono_contacto VARCHAR(20),
    id_curso_actual INT,
    FOREIGN KEY (id_curso_actual) REFERENCES Curso(id_curso)
);
GO

CREATE TABLE Clase (
    id_clase INT PRIMARY KEY IDENTITY,
    id_asignatura INT NOT NULL,
    id_profesor INT NOT NULL,
    codigo_clase VARCHAR(50) NOT NULL UNIQUE,
    año_academico INT NOT NULL,
    semestre VARCHAR(20),
    cupo_maximo INT NOT NULL,
    aula_asignada VARCHAR(50),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor)
);
GO

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY IDENTITY,
    id_estudiante INT NOT NULL,
    id_clase INT NOT NULL,
    fecha_matricula DATETIME NOT NULL DEFAULT GETDATE(),
    estado_matricula VARCHAR(50) NOT NULL DEFAULT 'Activa',
    calificacion_final DECIMAL(4, 2),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_clase) REFERENCES Clase(id_clase),
    UNIQUE (id_estudiante, id_clase)
);
GO

CREATE TABLE Calificacion (
    id_calificacion INT PRIMARY KEY IDENTITY,
    id_matricula INT NOT NULL,
    tipo_evaluacion VARCHAR(50) NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    nota_obtenida DECIMAL(4, 2) NOT NULL,
    peso_en_promedio DECIMAL(3, 2) NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula)
);
GO