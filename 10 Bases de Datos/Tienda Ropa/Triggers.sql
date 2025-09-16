USE TiendaRopa2;
GO

--TRIGGER

CREATE TRIGGER trg_ActualizarStockYTotalPedido
ON DetallePedido
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update stock of the product variant
    UPDATE vp
    SET vp.stock_variante = vp.stock_variante - i.cantidad
    FROM VarianteProducto vp
    JOIN inserted i ON vp.id_variante = i.id_variante;

    -- Update total_pedido in Pedido table
    UPDATE p
    SET p.total_pedido = p.total_pedido + i.subtotal
    FROM Pedido p
    JOIN inserted i ON p.id_pedido = i.id_pedido;
END;
GO