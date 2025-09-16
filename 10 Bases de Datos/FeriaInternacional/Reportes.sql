USE FeriaInternacional;
GO
--TRUNCATE

TRUNCATE TABLE Feria;
TRUNCATE TABLE Persona;
TRUNCATE TABLE TipoVisitante;
TRUNCATE TABLE Tematica;
TRUNCATE TABLE Empresa;
TRUNCATE TABLE Demostracion;
TRUNCATE TABLE Charla;
TRUNCATE TABLE Responsable;
TRUNCATE TABLE Ponente;
TRUNCATE TABLE Visitante;
TRUNCATE TABLE Pabellon;
TRUNCATE TABLE Stand;
TRUNCATE TABLE Producto;
TRUNCATE TABLE Registro;

--SELECT
-- Podemos Listar el nombre y apellido de todas las personas registradas
SELECT nombre, apellido FROM Persona;
GO

-- Podemos Buscar un producto específico 
SELECT * FROM Producto WHERE nombre = 'Pantalla Portatil';
GO

--SELECT CON JOINS
SELECT 
    p.nombre AS NombreVisitante,
    p.apellido AS ApellidoVisitante,
    tv.nombre AS TipoDeVisitante
FROM 
    Visitante v
JOIN 
    Persona p ON v.id_persona = p.id_persona
JOIN 
    TipoVisitante tv ON v.id_tipo_visitante = tv.id_tipo_visitante;
GO

--
SELECT 
    s.id_stand AS StandID,
    e.nombre AS NombreEmpresa,
    p.id_pabellon AS PabellonID
FROM 
    Stand s
JOIN 
    Empresa e ON s.id_empresa = e.id_empresa
JOIN 
    Pabellon p ON s.id_pabellon = p.id_pabellon;
GO

--
SELECT 
    prod.nombre AS NombreProducto,
    s.id_stand AS StandID,
    CONCAT(per.nombre, ' ', per.apellido) AS NombreResponsable
FROM 
    Producto prod
JOIN 
    Stand s ON prod.id_stand = s.id_stand
JOIN 
    Responsable r ON prod.id_responsable = r.id_responsable
JOIN 
    Persona per ON r.id_persona = per.id_persona;
GO

-- 
SELECT 
    c.nombre AS NombreCharla,
    CONCAT(p.nombre, ' ', p.apellido) AS NombrePonente
FROM 
    Registro r
JOIN 
    Charla c ON r.id_charla = c.id_charla
JOIN 
    Ponente po ON r.id_ponente = po.id_ponente
JOIN 
    Persona p ON po.id_persona = p.id_persona;
GO

--UPDATE
UPDATE Persona
SET email = 'tomas.perez.nuevo@gmail.com'
WHERE id_persona = 3;
GO

UPDATE Producto
SET nombre = 'Robot de limpieza avanzada'
WHERE id_producto = 4;
GO

--DELETE

-- Eliminar el registro con ID 3.
-- Esta acción se registrará en la tabla Log si se tiene un trigger para ello.
DELETE FROM Registro WHERE id_registro = 3;
GO

-- Eliminar el producto con ID 5.
-- En esta se activará el trigger trg_log_delete_producto,
-- registrando la eliminación en la tabla Log.
DELETE FROM Producto WHERE id_producto = 5;
GO


DELETE FROM Registro WHERE id_registro = 3;


DELETE FROM Producto WHERE id_producto = 5;


