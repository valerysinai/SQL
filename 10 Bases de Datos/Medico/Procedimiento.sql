USE medico2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_AgendarCita
    @id_paciente INT,
    @id_medico INT,
    @fecha_hora DATETIME2,
    @motivo VARCHAR(255),
    @duracion INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Cita
        WHERE id_medico = @id_medico
        AND fecha_hora_cita = @fecha_hora
        AND estado_cita IN ('Programada', 'Confirmada')
    )
    BEGIN
        RAISERROR('El médico no está disponible en la fecha y hora solicitada.', 16, 1);
        RETURN;
    END

    INSERT INTO Cita (id_paciente, id_medico, fecha_hora_cita, motivo_cita, duracion_minutos)
    VALUES (@id_paciente, @id_medico, @fecha_hora, @motivo, @duracion);

    SELECT 'Cita agendada exitosamente.' AS Mensaje;
END;
GO