USE CafeteriaDB2;
GO

--VIEWS

CREATE VIEW vw_VentasDiarias AS
SELECT
    CAST(fecha_hora_pedido AS DATE) AS fecha_venta,
    SUM(total_pedido) AS total_ingresos,
    COUNT(id_pedido) AS total_pedidos
FROM
    Pedido
WHERE
    estado_pedido = 'Completado'
GROUP BY
    CAST(fecha_hora_pedido AS DATE);
GO

--

CREATE VIEW vw_InventarioDetallado AS
SELECT
    p.nombre_producto,
    p.descripcion_producto,
    p.stock_actual,
    cp.nombre_categoria
FROM
    Producto p
JOIN
    CategoriaProducto cp ON p.id_categoria = cp.id_categoria;
GO