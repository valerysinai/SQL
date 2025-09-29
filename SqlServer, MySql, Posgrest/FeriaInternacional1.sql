-- 1. CONFIGURACIÓN INICIAL Y ELIMINACIÓN DE ESTRUCTURAS ANTIGUAS
------------------------------------------------------------------

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS FeriaInternacional;

-- Crear la base de datos
CREATE DATABASE FeriaInternacional;

-- Usar la base de datos
USE FeriaInternacional;

-- Eliminar tablas antiguas (si se ejecutara de nuevo)
DROP TABLE IF EXISTS Registro;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Stand;
DROP TABLE IF EXISTS Pabellon;
DROP TABLE IF EXISTS Visitante;
DROP TABLE IF EXISTS Ponente;
DROP TABLE IF EXISTS Responsable;
DROP TABLE IF EXISTS Charla;
DROP TABLE IF EXISTS Demostracion;
DROP TABLE IF EXISTS Empresa;
DROP TABLE IF EXISTS Tematica;
DROP TABLE IF EXISTS TipoVisitante;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Feria;
DROP TABLE IF EXISTS log;

-- 2. DDL DE LAS TABLAS ORIGINALES
------------------------------------

CREATE TABLE Feria(
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE Persona(
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(50)
);

CREATE TABLE TipoVisitante(
    id_tipo_visitante INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Tematica(
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Empresa(
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Demostracion(
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Charla(
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Responsable(
    id_responsable INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Ponente(
    id_ponente INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Visitante(
    id_visitante INT PRIMARY KEY,
    id_persona INT,
    id_tipo_visitante INT,
    FOREIGN KEY(id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY(id_tipo_visitante) REFERENCES TipoVisitante (id_tipo_visitante)
);

CREATE TABLE Pabellon(
    id_pabellon INT PRIMARY KEY,
    id_tematica INT,
    id_feria INT,
    FOREIGN KEY(id_tematica) REFERENCES Tematica (id_tematica),
    FOREIGN KEY (id_feria) REFERENCES Feria (id_feria)
);

CREATE TABLE Stand(
    id_stand INT PRIMARY KEY,
    id_empresa INT,
    id_pabellon INT,
    FOREIGN KEY(id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_pabellon) REFERENCES Pabellon (id_pabellon)
);

CREATE TABLE Producto(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_stand INT,
    id_responsable INT,
    FOREIGN KEY(id_stand) REFERENCES Stand (id_stand),
    FOREIGN KEY(id_responsable) REFERENCES Responsable (id_responsable)
);

CREATE TABLE Registro(
    id_registro INT PRIMARY KEY,
    id_feria INT,
    id_charla INT,
    id_visitante INT,
    id_ponente INT,
    id_empresa INT,
    FOREIGN KEY(id_feria) REFERENCES Feria (id_feria),
    FOREIGN KEY (id_charla) REFERENCES Charla (id_charla),
    FOREIGN KEY (id_visitante) REFERENCES Visitante (id_visitante),
    FOREIGN KEY(id_ponente) REFERENCES Ponente (id_ponente),
    FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa)
);

CREATE TABLE log ( 
    id_log INT AUTO_INCREMENT PRIMARY KEY, -- MySQL: AUTO_INCREMENT en lugar de IDENTITY(1,1)
    nombre VARCHAR (50),
    accion VARCHAR (50),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP -- MySQL: CURRENT_TIMESTAMP en lugar de GETDATE()
);


-- 3. DML (Data Manipulation Language) - Inserción de datos originales
----------------------------------------------------------------------

INSERT INTO Feria VALUES 
(1,'Feria Internacional de Tecnología ','2025-10-10','2025-10-15');

INSERT INTO Persona VALUES
(1, 'Valery', 'Trujillo', '12345678', 'valery@gmail.com', '320551234'), 
(2, 'Mauricio', 'Penagos', '87654321', 'mauricio@gmail.com', '3212346'), 
(3, 'Tomas', 'Perez', '55667788', 'tomas@gmail.com', '3166924313'), 
(4, 'Maria', 'Torres', '12112121', 'maria@gmail.com', '3124567890'),
(5, 'Carlos', 'Gómez', '99887766', 'carlos.g@gmail.com', '315112233'), 
(6, 'Sofia', 'Hernández', '10123456', 'sofia.h@gmail.com', '318987654'),
(7, 'Juan', 'Ramírez', '20234567', 'juan.r@gmail.com', '310555666'), 
(8, 'Ana', 'Díaz', '30345678', 'ana.d@gmail.com', '313777888'), 
(9, 'Pedro', 'Sánchez', '40456789', 'pedro.s@gmail.com', '317111222'),
(10, 'Lucía', 'García', '50567890', 'lucia.g@gmail.com', '320999000'), 
(11, 'Ricardo', 'Lopez', '60678901', 'ricardo.l@gmail.com', '314223344'), 
(12, 'Elena', 'Vargas', '70789012', 'elena.v@gmail.com', '319334455'), 
(13, 'Alejandro', 'Castro', '80890123', 'alejandro.c@gmail.com', '311445566'), 
(14, 'Isabel', 'Morales', '90901234', 'isabel.m@gmail.com', '312556677'),
(15, 'Andrés', 'Silva', '11012345', 'andres.s@gmail.com', '316667788'), 
(16, 'Laura', 'Mendoza', '22123456', 'laura.m@gmail.com', '317778899'), 
(17, 'Felipe', 'Ruiz', '33234567', 'felipe.r@gmail.com', '318889900'), 
(18, 'Diana', 'Gutierrez', '44345678', 'diana.g@gmail.com', '310990011'),
(19, 'Gabriel', 'Ortega', '55456789', 'gabriel.o@gmail.com', '313001122'),
(20, 'Natalia', 'Pardo', '66567890', 'natalia.p@gmail.com', '314112233'), 
(21, 'Jorge', 'Rojas', '77678901', 'jorge.r@gmail.com', '315223344'), 
(22, 'Paola', 'Guevara', '88789012', 'paola.g@gmail.com', '316334455'),
(23, 'Camilo', 'Vega', '99890123', 'camilo.v@gmail.com', '317445566'),
(24, 'Silvia', 'Luna', '12356789', 'silvia.l@gmail.com', '318556677'), 
(25, 'Marco', 'Fuentes', '23467890', 'marco.f@gmail.com', '319667788'),
(26, 'Viviana', 'Jaramillo', '34578901', 'viviana.j@gmail.com', '310778899'), 
(27, 'Esteban', 'Quintero', '45689012', 'esteban.q@gmail.com', '311889900'), 
(28, 'Beatriz', 'Perez', '56790123', 'beatriz.p@gmail.com', '312990011'), 
(29, 'Francisco', 'Ochoa', '67801234', 'francisco.o@gmail.com', '313001122'), 
(30, 'Carmen', 'Paz', '78912345', 'carmen.p@gmail.com', '314112233');

INSERT INTO TipoVisitante VALUES
(1, 'VIP'), 
(2, 'General'),
(3, 'Estudiante'), 
(4, 'Prensa'), 
(5, 'Expositor'),
(6, 'Patrocinador'), 
(7, 'Inversor'), 
(8, 'Analista'), 
(9, 'Consultor'), 
(10, 'Partner');

INSERT INTO Tematica VALUES
(1, 'Análisis y desarrollo de software'), 
(2, 'Multimedia'), (3, 'Inteligencia Artificial'), 
(4, 'Ciberseguridad'), (5, 'Robótica'), 
(6, 'Realidad Virtual y Aumentada'), 
(7, 'Internet de las Cosas (IoT)'), 
(8, 'Blockchain'), (9, 'Big Data'), 
(10, 'Computación Cuántica');

INSERT INTO Empresa VALUES
(1, 'EduWorld'),
(2, 'SoftCode'), 
(3, 'UB Solucion'), 
(4, 'CyberGuard Inc.'), 
(5, 'RoboTech Solutions'), 
(6, 'ARVR Innovate'), 
(7, 'IoT Connect'), 
(8, 'DataWise'), 
(9, 'GameDev Masters'), 
(10, 'Blockchain Trust');

INSERT INTO Demostracion VALUES
(1, 'Demo de IA en la nube'), 
(2, 'Seguridad de redes 5G'), 
(3, 'Realidad Virtual para educación'),
(4, 'Robot de asistencia médica'), 
(5, 'Sistema de riego inteligente IoT'), 
(6, 'Trazabilidad con Blockchain'), 
(7, 'Análisis de datos en tiempo real'), 
(8, 'Creación de videojuegos 3D'), 
(9, 'Aplicaciones de Realidad Aumentada'), 
(10, 'Demostración de un chatbot avanzado');

INSERT INTO Charla VALUES
(1, 'El futuro del software en la industria'), 
(2, 'Principios de la ciberseguridad corporativa'), 
(3, 'Robots colaborativos: un nuevo paradigma'), 
(4, 'La IA como motor de crecimiento'), 
(5, 'Introducción a Blockchain y sus usos'), 
(6, 'Big Data para la toma de decisiones'), 
(7, 'Impacto de IoT en la vida diaria'), 
(8, 'Realidad Aumentada: más allá del entretenimiento'),
(9, 'Desarrollo de video juegos para móviles'), 
(10, 'Computación cuántica: lo que viene');

INSERT INTO Responsable VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO Ponente VALUES
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15), 
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20);

INSERT INTO Visitante VALUES
(1, 21, 2), (2, 22, 1), (3, 23, 3), (4, 24, 4), (5, 25, 5), 
(6, 26, 2), (7, 27, 6), (8, 28, 7), (9, 29, 8), (10, 30, 9);

INSERT INTO Pabellon VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 2), (5, 5, 3),
(6, 6, 3), (7, 7, 1), (8, 8, 2), (9, 9, 3), (10, 10, 1);

INSERT INTO Stand VALUES
(1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), 
(6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10);

INSERT INTO Producto VALUES
(1, 'Software de gestión empresarial', 'Software integral para la gestión de pymes.', 1, 1),
(2, 'Sistema de seguridad perimetral', 'Hardware y software para protección de redes.', 2, 2),
(3, 'Plataforma educativa', 'Aplicación interactiva para el aprendizaje con RA/RV.', 3, 3), 
(4, 'Robot de limpieza inteligente', 'Robot autónomo para la limpieza de espacios grandes.', 4, 4), 
(5, 'Sensor de humedad IoT', 'Sensor para monitoreo de cultivos a distancia.', 5, 5), 
(6, 'Plataforma de contratos inteligentes', 'Solución basada en blockchain para automatizar acuerdos.', 6, 6), 
(7, 'Herramienta de visualización de datos', 'Software para crear dashboards interactivos.', 7, 7),
(8, 'Motor de videojuegos 2D', 'Kit de desarrollo para crear videojuegos tipo arcade.', 8, 8), 
(9, 'Dispositivo de realidad aumentada', 'Gafas de realidad aumentada para uso profesional.', 9, 9), 
(10, 'Asistente de voz basado en IA', 'Asistente virtual con capacidades de aprendizaje.', 10, 10);

INSERT INTO Registro VALUES
(1, 1, 1, 1, 1, 1), (2, 1, 2, 2, 2, 2), (3, 2, 3, 3, 3, 3), (4, 2, 4, 4, 4, 4), (5, 3, 5, 5, 5, 5), 
(6, 3, 6, 6, 6, 6), (7, 1, 7, 7, 7, 7), (8, 2, 8, 8, 8, 8), (9, 3, 9, 9, 9, 9), (10, 1, 10, 10, 10, 10);


-- 4. SIMULACIÓN DE ESQUEMAS (Exposicion, Organizacion, Participante)
----------------------------------------------------------------------
-- En MySQL, los esquemas se implementan comúnmente usando prefijos en los nombres de las tablas
-- o creando bases de datos separadas. Aquí usaremos prefijos para mantener la estructura lógica.

-- DDL para las tablas con prefijo "Exposicion_"
DROP TABLE IF EXISTS Exposicion_EventoPrincipal;
DROP TABLE IF EXISTS Exposicion_Clasificacion;
DROP TABLE IF EXISTS Exposicion_Zona;

CREATE TABLE Exposicion_EventoPrincipal (
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE Exposicion_Clasificacion ( 
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Exposicion_Zona ( 
    id_pabellon INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_feria INT NOT NULL,
    id_tematica INT NOT NULL,
    FOREIGN KEY (id_feria) REFERENCES Exposicion_EventoPrincipal(id_feria),
    FOREIGN KEY (id_tematica) REFERENCES Exposicion_Clasificacion(id_tematica)
);

-- DDL para las tablas con prefijo "Organizacion_"
DROP TABLE IF EXISTS Organizacion_Entidad;
DROP TABLE IF EXISTS Organizacion_Area;
DROP TABLE IF EXISTS Organizacion_Articulo;

CREATE TABLE Organizacion_Entidad (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    sector VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE Organizacion_Area ( -- Antes stand
    id_stand INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES Organizacion_Entidad(id_empresa)
);

CREATE TABLE Organizacion_Articulo ( -- Antes producto
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2),
    id_stand INT NOT NULL,
    FOREIGN KEY (id_stand) REFERENCES Organizacion_Area(id_stand)
);

-- DDL para las tablas con prefijo "Participante_"
DROP TABLE IF EXISTS Participante_Sujeto;
DROP TABLE IF EXISTS Participante_Rol;
DROP TABLE IF EXISTS Participante_Inscrito;

CREATE TABLE Participante_Sujeto ( -- Antes persona
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Participante_Rol ( -- Antes tipovisitante
    id_tipovisitante INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Participante_Inscrito ( -- Antes visitante
    id_visitante INT PRIMARY KEY,
    id_persona INT NOT NULL,
    id_tipovisitante INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Participante_Sujeto(id_persona),
    FOREIGN KEY (id_tipovisitante) REFERENCES Participante_Rol(id_tipovisitante)
);


-- 5. INSERCIÓN DE DATOS DE EJEMPLO (DML) - Adaptados a los prefijos
----------------------------------------------------------------------

-- Datos de Exposicion
INSERT INTO Exposicion_EventoPrincipal (id_feria, nombre, fecha_inicio, fecha_fin, ciudad)
VALUES (1, 'Feria Internacional de Tecnología', '2025-05-01', '2025-05-07', 'Madrid'), 
 (2, 'Feria de la Innovación y Emprendimiento', '2025-06-15', '2025-06-20', 'Barcelona'), 
 (3, 'Feria Agroalimentaria', '2025-07-10', '2025-07-15', 'Valencia'); 

INSERT INTO Exposicion_Clasificacion (id_tematica, nombre)
VALUES (1, 'Tecnología'),
 (2, 'Emprendimiento'),
(3, 'Agroalimentación');

INSERT INTO Exposicion_Zona (id_pabellon, nombre, id_feria, id_tematica)
VALUES (1, 'Pabellón A - Innovación Digital', 1, 1 ), 
 (2, 'Pabellón B - Startups', 2, 2), 
(3, 'Pabellón C - Productos Orgánicos', 3, 3); 

-- Datos de Organizacion
INSERT INTO Organizacion_Entidad (id_empresa, nombre, sector, pais)
VALUES (1, 'TechSolutions', 'Tecnología', 'España'),
 (2, 'AgroGlobal', 'Agroalimentación', 'México'),
 (3, 'StartUpHub', 'Emprendimiento', 'Chile'); 

INSERT INTO Organizacion_Area (id_stand, nombre, id_empresa)
VALUES (1, 'Stand A - Tech', 1),
 (2, 'Stand B - Agro', 2),
(3, 'Stand C - Innovación', 3); 

INSERT INTO Organizacion_Articulo (id_producto, nombre, precio, id_stand)
VALUES (101, 'Laptop Pro X', 1200.00, 1),
 (102, 'Semillas Orgánicas', 50.00, 2),
 (103, 'Plataforma SaaS', 500.00, 3); 

-- Datos de Participante
INSERT INTO Participante_Sujeto (id_persona, nombre, apellido, email, telefono)
VALUES (1, 'Laura', 'García', 'laura.garcia@email.com', '600123456'),
 (2, 'Miguel', 'Torres', 'miguel.torres@email.com', '600654321'),
 (3, 'Ana', 'Martínez', 'ana.martinez@email.com', '600987654');

INSERT INTO Participante_Rol (id_tipovisitante, nombre)
VALUES (1, 'Estudiante'),
 (2, 'Profesional'),
(3, 'VIP');

INSERT INTO Participante_Inscrito (id_visitante, id_persona, id_tipovisitante)
VALUES (1, 1, 1),
(2, 2, 2),
 (3, 3, 3);


-- 6. CONFIGURACIÓN DE SEGURIDAD (DCL)
---------------------------------------
-- En MySQL, la gestión de usuarios y permisos es diferente. 
-- No hay "Logins" o "Users" con el mismo concepto que SQL Server.
-- Se crean usuarios y se les otorgan permisos directamente a nivel de base de datos o tabla.

-- Crear usuarios (identificados localmente)
CREATE USER 'SuperGestor'@'localhost' IDENTIFIED BY 'Valery071';
CREATE USER 'GestorEvento'@'localhost' IDENTIFIED BY 'feria123';
-- Si usas MySQL Workbench o una herramienta similar, considera usar '%' en lugar de 'localhost' 
-- si quieres conectarte desde cualquier host. Ejemplo: 'SuperGestor'@'%'

-- Asignación de Permisos de Control (simulando GRANT CONTROL)
-- Otorgar todos los permisos sobre las tablas "esquematizadas" al SuperGestor.
GRANT ALL PRIVILEGES ON FeriaInternacional.Exposicion_EventoPrincipal TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Exposicion_Clasificacion TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Exposicion_Zona TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Organizacion_Entidad TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Organizacion_Area TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Organizacion_Articulo TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Participante_Sujeto TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Participante_Rol TO 'SuperGestor'@'localhost';
GRANT ALL PRIVILEGES ON FeriaInternacional.Participante_Inscrito TO 'SuperGestor'@'localhost';
-- Otorgar los permisos DML (SELECT, INSERT, UPDATE, DELETE) al GestorEvento en un ejemplo.
GRANT SELECT, INSERT, UPDATE, DELETE ON FeriaInternacional.Exposicion_EventoPrincipal TO 'GestorEvento'@'localhost';

-- Aplicar los cambios de permisos
FLUSH PRIVILEGES;

-- Fin del script.