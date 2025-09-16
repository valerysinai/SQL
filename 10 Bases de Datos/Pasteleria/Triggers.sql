USE Pasteleria2;
GO

--TRIGGERS

-- TRIGGER to update stock
CREATE TRIGGER trg_ActualizarStock
ON DetallePedido
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.stock_disponible = p.stock_disponible - i.cantidad
    FROM Producto AS p
    JOIN inserted AS i ON p.id_producto = i.id_producto;
END;
GO

-- TRIGGER to update order total
CREATE TRIGGER trg_ActualizarTotalPedido
ON DetallePedido
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.total_pedido = (SELECT SUM(subtotal) FROM DetallePedido WHERE id_pedido = i.id_pedido)
    FROM Pedido AS p
    JOIN inserted AS i ON p.id_pedido = i.id_pedido;
END;
GO