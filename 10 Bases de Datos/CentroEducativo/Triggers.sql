USE CentroEducativo2;
GO

--TRIGGER

CREATE TRIGGER trg_ValidarCupoClase
ON Matricula
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @id_clase INT;
    DECLARE @cupo_actual INT;
    DECLARE @cupo_maximo INT;

    SELECT @id_clase = id_clase FROM inserted;

    SELECT @cupo_actual = COUNT(id_estudiante) FROM Matricula WHERE id_clase = @id_clase;
    SELECT @cupo_maximo = cupo_maximo FROM Clase WHERE id_clase = @id_clase;

    IF @cupo_actual > @cupo_maximo
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Error: No se puede matricular al estudiante. El cupo máximo para esta clase ha sido superado.', 16, 1);
    END;
END;
GO