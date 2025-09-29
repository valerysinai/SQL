-- ====================================================
-- CREACIÓN DE BASE DE DATOS
-- ====================================================
DROP DATABASE IF EXISTS feria_internacional;
CREATE DATABASE feria_internacional;
\c feria_internacional;

-- ====================================================
-- TABLAS PRINCIPALES
-- ====================================================

DROP TABLE IF EXISTS registro CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS stand CASCADE;
DROP TABLE IF EXISTS pabellon CASCADE;
DROP TABLE IF EXISTS visitante CASCADE;
DROP TABLE IF EXISTS ponente CASCADE;
DROP TABLE IF EXISTS responsable CASCADE;
DROP TABLE IF EXISTS charla CASCADE;
DROP TABLE IF EXISTS demostracion CASCADE;
DROP TABLE IF EXISTS empresa CASCADE;
DROP TABLE IF EXISTS tematica CASCADE;
DROP TABLE IF EXISTS tipovisitante CASCADE;
DROP TABLE IF EXISTS persona CASCADE;
DROP TABLE IF EXISTS feria CASCADE;
DROP TABLE IF EXISTS log CASCADE;

-- Tabla feria
CREATE TABLE feria(
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla persona
CREATE TABLE persona(
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(50)
);

-- Tabla tipo visitante
CREATE TABLE tipovisitante(
    id_tipo_visitante INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla tematica
CREATE TABLE tematica(
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla empresa
CREATE TABLE empresa(
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla demostracion
CREATE TABLE demostracion(
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla charla
CREATE TABLE charla(
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla responsable
CREATE TABLE responsable(
    id_responsable INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);

-- Tabla ponente
CREATE TABLE ponente(
    id_ponente INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);

-- Tabla visitante
CREATE TABLE visitante(
    id_visitante INT PRIMARY KEY,
    id_persona INT,
    id_tipo_visitante INT,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
    FOREIGN KEY (id_tipo_visitante) REFERENCES tipovisitante(id_tipo_visitante)
);

-- Tabla pabellon
CREATE TABLE pabellon(
    id_pabellon INT PRIMARY KEY,
    id_tematica INT,
    id_feria INT,
    FOREIGN KEY (id_tematica) REFERENCES tematica(id_tematica),
    FOREIGN KEY (id_feria) REFERENCES feria(id_feria)
);

-- Tabla stand
CREATE TABLE stand(
    id_stand INT PRIMARY KEY,
    id_empresa INT,
    id_pabellon INT,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
    FOREIGN KEY (id_pabellon) REFERENCES pabellon(id_pabellon)
);

-- Tabla producto
CREATE TABLE producto(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_stand INT,
    id_responsable INT,
    FOREIGN KEY (id_stand) REFERENCES stand(id_stand),
    FOREIGN KEY (id_responsable) REFERENCES responsable(id_responsable)
);

-- Tabla registro
CREATE TABLE registro(
    id_registro INT PRIMARY KEY,
    id_feria INT,
    id_charla INT,
    id_visitante INT,
    id_ponente INT,
    id_empresa INT,
    FOREIGN KEY (id_feria) REFERENCES feria(id_feria),
    FOREIGN KEY (id_charla) REFERENCES charla(id_charla),
    FOREIGN KEY (id_visitante) REFERENCES visitante(id_visitante),
    FOREIGN KEY (id_ponente) REFERENCES ponente(id_ponente),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

-- Tabla log
CREATE TABLE log(
    id_log SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    accion VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================
-- CREACIÓN DE SCHEMAS
-- ====================================================

CREATE SCHEMA exposicion;
CREATE SCHEMA organizacion;
CREATE SCHEMA participante;

-- ============================================
-- 3) CREAR TABLAS
-- ============================================

-- ----- ESQUEMA EXPOSICION -----
CREATE TABLE exposicion.evento (
    id_feria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE exposicion.clasificacion (
    id_tematica SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE exposicion.actividad (
    id_actividad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_feria INT REFERENCES exposicion.evento(id_feria)
);

-- ----- ESQUEMA ORGANIZACION -----
CREATE TABLE organizacion.entidad (
    id_empresa SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    sector VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE organizacion.area (
    id_stand SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_empresa INT REFERENCES organizacion.entidad(id_empresa)
);

CREATE TABLE organizacion.articulo (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2),
    id_stand INT REFERENCES organizacion.area(id_stand)
);

-- ESQUEMA PARTICIPANTE 
CREATE TABLE participante.sujeto (
    id_persona SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE participante.tipovisitante (
    id_tipovisitante SERIAL PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE participante.inscrito (
    id_visitante SERIAL PRIMARY KEY,
    id_persona INT REFERENCES participante.sujeto(id_persona),
    id_tipovisitante INT REFERENCES participante.tipovisitante(id_tipovisitante)
);


-- INSERTAR DATOS DE EJEMPLO

--Exposicion
INSERT INTO exposicion.evento (nombre, fecha_inicio, fecha_fin, ciudad) VALUES
  ('Feria Internacional 2025', '2025-10-01', '2025-10-10', 'Bogotá');

INSERT INTO exposicion.clasificacion (nombre) VALUES
  ('Tecnología'),
  ('Agroindustria'),
  ('Salud');

INSERT INTO exposicion.actividad (nombre, descripcion, id_feria) VALUES
  ('Conferencia IA', 'Charlas sobre inteligencia artificial', 1),
  ('Exposición AgroTech', 'Nuevas tecnologías agrícolas', 1);

--Organizacion

INSERT INTO organizacion.entidad (nombre, sector, pais) VALUES
  ('TechCorp', 'Tecnología', 'Colombia'),
  ('AgroLife', 'Agroindustria', 'México'),
  ('MediSalud', 'Salud', 'Chile'),
  ('InnovateX', 'Tecnología', 'Colombia'),
  ('GreenFarm', 'Agro', 'Argentina'),
  ('HealthNet', 'Salud', 'España');

INSERT INTO organizacion.area (nombre, id_empresa) VALUES
  ('Stand A - TechCorp', 1),
  ('Stand B - AgroLife', 2),
  ('Stand C - MediSalud', 3),
  ('Stand D - InnovateX', 4),
  ('Stand E - GreenFarm', 5),
  ('Stand F - HealthNet', 6);

INSERT INTO organizacion.articulo (nombre, precio, id_stand) VALUES
  ('Robot de limpieza', 1200.00, 1),
  ('Semilla híbrida', 15.50, 2),
  ('Kit médico', 89.90, 3),
  ('App Mobile', 299.99, 4),
  ('Kit de Cultivo', 79.50, 5),
  ('Monitor Salud', 249.00, 6);

--Participante

INSERT INTO participante.tipovisitante (descripcion) VALUES
  ('Estudiante'),
  ('Profesional'),
  ('VIP');

-- 3 usuarios iniciales
INSERT INTO participante.sujeto (nombre, apellido, email, telefono) VALUES
  ('Juan', 'Pérez', 'juan.perez@example.com', '300111222'),
  ('Ana',  'Martínez', 'ana.martinez@example.com', '300333444'),
  ('Luis', 'Ramírez', 'luis.ramirez@example.com', '300555666');

INSERT INTO participante.inscrito (id_persona, id_tipovisitante) VALUES
  (1, 1), 
  (2, 2), 
  (3, 3); 


INSERT INTO participante.sujeto (nombre, apellido, email, telefono) VALUES
  ('Carlos', 'González', 'carlos.gonzalez@example.com', '600111222'),
  ('María',  'Fernández', 'maria.fernandez@example.com', '600333444'),
  ('Pedro',  'López',     'pedro.lopez@example.com', '600555666');

INSERT INTO participante.inscrito (id_persona, id_tipovisitante) VALUES
  (4, 2), 
  (5, 1), 
  (6, 3); 


--CREAR ROLES / USUARIOS DE BASE DE DATOS

CREATE ROLE usuario_app1 LOGIN PASSWORD 'app123';
CREATE ROLE usuario_app2 LOGIN PASSWORD 'app234';
CREATE ROLE usuario_app3 LOGIN PASSWORD 'app345';

-- Dar los permisos a todos (permiso de lectura)
GRANT USAGE ON SCHEMA exposicion, organizacion, participante TO usuario_app1, usuario_app2, usuario_app3;

GRANT SELECT ON ALL TABLES IN SCHEMA exposicion TO usuario_app1, usuario_app2, usuario_app3;
GRANT SELECT ON ALL TABLES IN SCHEMA organizacion TO usuario_app1, usuario_app2, usuario_app3;
GRANT SELECT ON ALL TABLES IN SCHEMA participante TO usuario_app1, usuario_app2, usuario_app3;

-- Dar permisos de escritura SOLO en participante a usuario_app2
GRANT INSERT, UPDATE ON ALL TABLES IN SCHEMA participante TO usuario_app2;

-- Asegurar que los permisos apliquen a tablas futuras
ALTER DEFAULT PRIVILEGES IN SCHEMA participante GRANT SELECT, INSERT, UPDATE ON TABLES TO usuario_app2;
ALTER DEFAULT PRIVILEGES IN SCHEMA organizacion GRANT SELECT ON TABLES TO usuario_app1, usuario_app3;

--CONSULTAS DE VERIFICACIÓN

--ver los esquemas
SELECT schema_name FROM information_schema.schemata
WHERE schema_name IN ('exposicion','organizacion','participante');

-- Ver tablas de cada esquema
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema IN ('exposicion','organizacion','participante');

-- Ver sujetos e inscritos
SELECT * FROM participante.sujeto;
SELECT * FROM participante.inscrito;

-- permisos en tablas
SELECT grantee, privilege_type, table_schema, table_name
FROM information_schema.table_privileges
WHERE table_schema IN ('exposicion','organizacion','participante')
ORDER BY grantee, table_schema;

--detalle los privilegios asignados

SELECT nspname AS esquema,
       r.rolname AS usuario,
       p.perm AS permiso
FROM pg_namespace n
JOIN (
    SELECT oid, unnest(nspacl) AS acl
    FROM pg_namespace
) na ON n.oid = na.oid
JOIN pg_roles r ON acl::text LIKE r.rolname || '=%' 
JOIN LATERAL (
    SELECT regexp_replace(acl::text, '.*=(.*)/.*', '\1') AS perm
) p ON true
WHERE nspname IN ('exposicion','organizacion','participante')
ORDER BY esquema, usuario;
