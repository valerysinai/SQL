USE SistemaVideojuegos2;
GO

--TRIGGER

CREATE TRIGGER trg_ValidarHorasJugadas
ON ColeccionJuegos
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE horas_jugadas < 0.00)
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Error: Las horas jugadas no pueden ser un valor negativo.', 16, 1);
        RETURN;
    END
END;
GO