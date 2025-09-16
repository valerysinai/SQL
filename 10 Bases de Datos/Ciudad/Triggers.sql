USE Ciudad2;
GO

--TRIGGER

CREATE TRIGGER trg_ValidarContrato
ON ContratoServicio
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE fecha_fin_contrato IS NOT NULL AND fecha_fin_contrato < fecha_inicio_contrato)
    BEGIN
        -- Revertir la transacción para evitar que se almacenen datos no válidos
        ROLLBACK TRANSACTION;
        -- Genera un error para notificar al usuario del problema.
        RAISERROR('Error: La fecha de fin del contrato no puede ser anterior a la fecha de inicio.', 16, 1);
    END;
END;
GO