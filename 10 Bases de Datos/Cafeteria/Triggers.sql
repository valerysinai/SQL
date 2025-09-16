USE CafeteriaDB2;
GO

--TRIGGER

CREATE TRIGGER trg_ActualizarPuntosFidelidad
ON Pedido
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @idCliente INT;
    DECLARE @totalPedido DECIMAL(10, 2);
    DECLARE @puntosGanados INT;

    -- Only proceed if the order status is changing to 'Completado'
    IF UPDATE(estado_pedido) AND (SELECT estado_pedido FROM inserted) = 'Completado'
    BEGIN
        SELECT @idCliente = id_cliente, @totalPedido = total_pedido FROM inserted;

        -- Check if the customer ID is not null
        IF @idCliente IS NOT NULL
        BEGIN
            SET @puntosGanados = FLOOR(@totalPedido / 10.00);
            UPDATE Cliente
            SET puntos_fidelidad = puntos_fidelidad + @puntosGanados
            WHERE id_cliente = @idCliente;
        END
    END
END;
GO