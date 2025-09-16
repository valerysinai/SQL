-- DDL para los procedimientos almacenados
USE FeriaInternacional;
GO

-- Elimina el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_InsertarFeria;
GO

-- Este procedimiento sirve para poder insertar una Feria
CREATE PROCEDURE sp_InsertarFeria
    @id_feria INT,
    @nombre VARCHAR(100),
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN
    INSERT INTO Feria (id_feria, nombre, fecha_inicio, fecha_fin)
    VALUES (@id_feria, @nombre, @fecha_inicio, @fecha_fin);
END;
GO

-- Elimina el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_ActualizarNombrePersona;
GO

-- Este procedimiento sirve para poder actualizar el nombre de una Persona
CREATE PROCEDURE sp_ActualizarNombrePersona
    @id_persona INT,
    @nuevo_nombre VARCHAR(100)
AS
BEGIN
    UPDATE Persona
    SET nombre = @nuevo_nombre
    WHERE id_persona = @id_persona;
END;
GO

-- Elimina el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_EliminarProducto;
GO

-- Este procedimiento sirve para poder eliminar un Producto por su identificación
CREATE PROCEDURE sp_EliminarProducto
    @id_producto INT
AS
BEGIN
    DELETE FROM Producto
    WHERE id_producto = @id_producto;
END;
GO

-- Elimina el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_ObtenerProductosPorStand;
GO

-- Este procedimiento sirve para poder obtener todos los Productos de un Stand específico
CREATE PROCEDURE sp_ObtenerProductosPorStand
    @id_stand INT
AS
BEGIN
    SELECT id_producto, nombre, descripcion, id_responsable
    FROM Producto
    WHERE id_stand = @id_stand;
END;
GO

-- Elimina el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_InsertarRegistro;
GO

-- Este procedimiento sirve para poder insertar un Registro
CREATE PROCEDURE sp_InsertarRegistro
    @id_registro INT,
    @id_feria INT,
    @id_charla INT,
    @id_visitante INT,
    @id_ponente INT,
    @id_empresa INT
AS
BEGIN
    INSERT INTO Registro (id_registro, id_feria, id_charla, id_visitante, id_ponente, id_empresa)
    VALUES (@id_registro, @id_feria, @id_charla, @id_visitante, @id_ponente, @id_empresa);
END;
GO