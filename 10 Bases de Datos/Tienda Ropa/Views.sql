USE TiendaRopa2;
GO

--VIEWS

CREATE VIEW vw_ResumenPedidosClientes AS
SELECT
    c.nombre_cliente,
    c.apellido_cliente,
    c.email,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.total_pedido) AS total_gasto
FROM
    Cliente c
JOIN
    Pedido p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente, c.nombre_cliente, c.apellido_cliente, c.email;
GO

--

CREATE VIEW vw_StockPorVariante AS
SELECT
    p.nombre_producto,
    vp.talla,
    vp.color,
    vp.stock_variante,
    vp.sku_variante
FROM
    VarianteProducto vp
JOIN
    Producto p ON vp.id_producto = p.id_producto;
GO