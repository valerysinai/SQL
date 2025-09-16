USE Pasteleria2;
GO

UPDATE Pedido
SET total_pedido = (
    SELECT SUM(subtotal) FROM DetallePedido WHERE DetallePedido.id_pedido = Pedido.id_pedido
)
WHERE id_pedido IN (1, 2, 3);

UPDATE Producto
SET stock_disponible = stock_disponible - (
    SELECT ISNULL(SUM(DP.cantidad), 0) FROM DetallePedido DP WHERE DP.id_producto = Producto.id_producto
);

SELECT
    P.nombre_producto,
    P.precio_venta,
    CP.nombre_categoria
FROM
    Producto P
JOIN
    CategoriaProducto CP ON P.id_categoria = CP.id_categoria;

SELECT
    P.id_pedido,
    P.fecha_pedido,
    C.nombre_cliente,
    C.apellido_cliente,
    E.nombre_empleado AS empleado_atiende,
    Prod.nombre_producto,
    DP.cantidad,
    DP.precio_unitario_venta,
    DP.subtotal,
    P.total_pedido AS total_pedido_final
FROM
    Pedido P
LEFT JOIN
    Cliente C ON P.id_cliente = C.id_cliente
JOIN
    Empleado E ON P.id_empleado_recibe = E.id_empleado
JOIN
    DetallePedido DP ON P.id_pedido = DP.id_pedido
JOIN
    Producto Prod ON DP.id_producto = Prod.id_producto
WHERE
    P.id_pedido = 1;

SELECT
    I.nombre_ingrediente,
    R.cantidad_necesaria,
    P.nombre_producto
FROM
    Ingrediente I
JOIN
    Receta R ON I.id_ingrediente = R.id_ingrediente
JOIN
    Producto P ON R.id_producto = P.id_producto
ORDER BY
    I.nombre_ingrediente, P.nombre_producto;

SELECT
    CP.nombre_categoria,
    COUNT(P.id_producto) AS numero_productos
FROM
    CategoriaProducto CP
LEFT JOIN
    Producto P ON CP.id_categoria = P.id_categoria
GROUP BY
    CP.nombre_categoria
ORDER BY
    numero_productos DESC;

SELECT DISTINCT
    C.nombre_cliente,
    C.apellido_cliente,
    C.email_cliente
FROM
    Cliente C
JOIN
    Pedido P ON C.id_cliente = P.id_cliente;


    --TRIGGERS

    CREATE TRIGGER trg_ActualizarStock
ON DetallePedido
AFTER INSERT
AS
BEGIN
    UPDATE Producto
    SET stock_disponible = Producto.stock_disponible - i.cantidad
    FROM Producto
    JOIN inserted i ON Producto.id_producto = i.id_producto;
END;
GO

--

CREATE TRIGGER trg_ActualizarTotalPedido
ON DetallePedido
AFTER INSERT
AS
BEGIN
    UPDATE Pedido
    SET total_pedido = (SELECT SUM(subtotal) FROM DetallePedido WHERE id_pedido = inserted.id_pedido)
    FROM Pedido
    JOIN inserted ON Pedido.id_pedido = inserted.id_pedido;
END;
GO

