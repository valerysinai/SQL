USE FeriaInternacional;
GO

-- Elimina los triggers si ya existen
DROP TRIGGER IF EXISTS trg_Persona_Insert;
DROP TRIGGER IF EXISTS trg_Persona_Update;
DROP TRIGGER IF EXISTS trg_Persona_Delete;
GO

-- Este trigger audita los INSERT en la tabla Persona
CREATE TRIGGER trg_Persona_Insert
ON Persona
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (nombre, accion)
    VALUES ('Persona', 'INSERT');
END;
GO

-- Este trigger audita los UPDATE en la tabla Persona
CREATE TRIGGER trg_Persona_Update
ON Persona
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (nombre, accion)
    VALUES ('Persona', 'UPDATE');
END;
GO

-- Este trigger audita los DELETE en la tabla Persona
CREATE TRIGGER trg_Persona_Delete
ON Persona
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (nombre, accion)
    VALUES ('Persona', 'DELETE');
END;
GO

-- A continuación se muestran ejemplos de uso para probar los triggers
-- (Se ha corregido la sintaxis de las sentencias)

-- Ejemplo de INSERT que activará el trigger trg_Persona_Insert
INSERT INTO Persona (id_persona, nombre, apellido, dni, email, telefono)
VALUES (1, 'Juan', 'Pérez', '12345678A', 'juan.perez@example.com', '600123456');
GO

-- Ejemplo de UPDATE que activará el trigger trg_Persona_Update
UPDATE Persona
SET nombre = 'Julia'
WHERE id_persona = 1;
GO

-- Ejemplo de DELETE que activará el trigger trg_Persona_Delete
DELETE FROM Persona
WHERE id_persona = 1;
GO

-- Ver el contenido de la tabla Log para verificar que los triggers funcionaron
SELECT * FROM Log;
GO
