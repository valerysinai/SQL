USE Eventos2;
GO

--TRIGGER

CREATE TRIGGER trg_ValidarFechaFinEvento
ON Evento
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE fecha_hora_fin IS NOT NULL AND fecha_hora_fin < fecha_hora_inicio)
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Error: La fecha y hora de fin del evento no puede ser anterior a la fecha y hora de inicio.', 16, 1);
    END;
END;
GO

