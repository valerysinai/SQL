-- DDL
DROP TABLE IF EXISTS Prescripcion;
DROP TABLE IF EXISTS Diagnostico;
DROP TABLE IF EXISTS ConsultaMedica;
DROP TABLE IF EXISTS Cita;
DROP TABLE IF EXISTS HistorialMedico;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS MedicoEspecialidad;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Especialidad;


USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'medico2')
BEGIN
    CREATE DATABASE medico2;
END;
GO

USE medico2;
GO

CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY IDENTITY(1,1),
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    descripcion_especialidad TEXT
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY IDENTITY(1,1),
    nombre_medico VARCHAR(100) NOT NULL,
    apellido_medico VARCHAR(100) NOT NULL,
    licencia_medica VARCHAR(50) NOT NULL UNIQUE,
    telefono_contacto VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    direccion_consultorio VARCHAR(255),
    id_especialidad_principal INT NOT NULL,
    FOREIGN KEY (id_especialidad_principal) REFERENCES Especialidad(id_especialidad)
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY IDENTITY(1,1),
    nombre_paciente VARCHAR(100) NOT NULL,
    apellido_paciente VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero VARCHAR(10) CHECK (genero IN ('Masculino', 'Femenino', 'Otro')) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    telefono_contacto VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    direccion_residencia VARCHAR(255),
    tipo_sangre VARCHAR(5),
    alergias TEXT
);

CREATE TABLE HistorialMedico (
    id_historial INT PRIMARY KEY IDENTITY(1,1),
    id_paciente INT NOT NULL UNIQUE,
    fecha_creacion DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    antecedentes_familiares TEXT,
    antecedentes_personales TEXT,
    medicamentos_actuales TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Cita (
    id_cita INT PRIMARY KEY IDENTITY(1,1),
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_hora_cita DATETIME2 NOT NULL,
    motivo_cita VARCHAR(255),
    estado_cita VARCHAR(20) CHECK (estado_cita IN ('Programada', 'Confirmada', 'Cancelada', 'Completada', 'Reagendada')) NOT NULL DEFAULT 'Programada',
    duracion_minutos INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    CONSTRAINT UQ_Cita UNIQUE (id_medico, fecha_hora_cita)
);

CREATE TABLE ConsultaMedica (
    id_consulta INT PRIMARY KEY IDENTITY(1,1),
    id_cita INT NOT NULL UNIQUE,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    fecha_hora_consulta DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    motivo_consulta_detalle TEXT,
    examen_fisico TEXT,
    observaciones TEXT,
    procedimientos_realizados TEXT,
    plan_tratamiento TEXT,
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Diagnostico (
    id_diagnostico INT PRIMARY KEY IDENTITY(1,1),
    codigo_cie VARCHAR(20) UNIQUE,
    nombre_diagnostico VARCHAR(255) NOT NULL,
    descripcion_diagnostico TEXT
);

CREATE TABLE Prescripcion (
    id_prescripcion INT PRIMARY KEY IDENTITY(1,1),
    id_consulta INT NOT NULL,
    nombre_medicamento VARCHAR(255) NOT NULL,
    dosis VARCHAR(100),
    frecuencia VARCHAR(100),
    duracion_dias INT,
    instrucciones_especiales TEXT,
    FOREIGN KEY (id_consulta) REFERENCES ConsultaMedica(id_consulta)
);

CREATE TABLE MedicoEspecialidad (
    id_medico_especialidad INT PRIMARY KEY IDENTITY(1,1),
    id_medico INT NOT NULL,
    id_especialidad INT NOT NULL,
    fecha_certificacion DATE,
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad),
    CONSTRAINT UQ_MedicoEspecialidad UNIQUE (id_medico, id_especialidad)
);
