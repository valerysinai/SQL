USE CentroProyectos2;
GO

--TRIGGER

CREATE TRIGGER trg_ActualizarEstadoTarea
ON AsignacionTarea
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar el estado de la tarea a 'Completada' si el porcentaje es 100%
    UPDATE t
    SET estado_tarea = 'Completada'
    FROM Tarea t
    JOIN inserted i ON t.id_tarea = i.id_tarea
    WHERE i.porcentaje_completado = 100.00;
END;
GO