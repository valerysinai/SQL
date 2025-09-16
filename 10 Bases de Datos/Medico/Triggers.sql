USE medico2;
GO

--TRIGGER

CREATE TRIGGER trg_ActualizarEstadoCita
ON ConsultaMedica
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @id_cita INT;

    SELECT @id_cita = id_cita FROM inserted;

    UPDATE Cita
    SET estado_cita = 'Completada'
    WHERE id_cita = @id_cita;
END;
GO