USE Pasteleria2;
GO

--VIEWS

CREATE VIEW vw_InformacionCompletaPedidos AS
SELECT
    P.id_pedido,
    P.fecha_pedido,
    ISNULL(C.nombre_cliente + ' ' + C.apellido_cliente, 'Cliente Anónimo') AS nombre_cliente_completo,
    E.nombre_empleado + ' ' + E.apellido_empleado AS nombre_empleado_completo,
    P.estado_pedido,
    P.total_pedido,
    DP.cantidad,
    Prod.nombre_producto,
    DP.subtotal
FROM
    Pedido P
LEFT JOIN
    Cliente C ON P.id_cliente = C.id_cliente
JOIN
    Empleado E ON P.id_empleado_recibe = E.id_empleado
JOIN
    DetallePedido DP ON P.id_pedido = DP.id_pedido
JOIN
    Producto Prod ON DP.id_producto = Prod.id_producto;
GO

--

CREATE VIEW vw_IngredientesPorProducto AS
SELECT
    p.nombre_producto,
    i.nombre_ingrediente,
    r.cantidad_necesaria,
    i.unidad_medida,
    i.stock_actual
FROM
    Producto p
JOIN
    Receta r ON p.id_producto = r.id_producto
JOIN
    Ingrediente i ON r.id_ingrediente = i.id_ingrediente;
GO