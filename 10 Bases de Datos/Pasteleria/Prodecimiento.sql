USE Pasteleria2;
GO

--PROCEDIMIENTOS ALMACENADOS

CREATE PROCEDURE sp_CrearNuevoPedido
    @id_cliente INT,
    @id_empleado_recibe INT,
    @fecha_entrega_estimada DATETIME2,
    @tipo_pago VARCHAR(50),
    @productos VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_pedido INT;

    -- Añadir productos a DetallePedido
    INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario_venta, subtotal)
    SELECT
        @id_pedido,
        datos.id_producto,
        datos.cantidad,
        p.precio_venta,
        p.precio_venta * datos.cantidad
    FROM
        STRING_SPLIT(@productos, ',') s
        JOIN (
            SELECT
                id_producto = CAST(LEFT(value, CHARINDEX('-', value) - 1) AS INT),
                cantidad = CAST(SUBSTRING(value, CHARINDEX('-', value) + 1, LEN(value)) AS INT)
            FROM
                STRING_SPLIT(@productos, ',')
        ) AS datos ON datos.id_producto = CAST(LEFT(s.value, CHARINDEX('-', s.value) - 1) AS INT)
        JOIN Producto p ON p.id_producto = datos.id_producto;

--

CREATE PROCEDURE sp_BuscarProductosPorCategoria
    @nombre_categoria VARCHAR(100)
AS
BEGIN
    SELECT
        p.nombre_producto,
        p.descripcion,
        p.precio_venta,
        p.stock_disponible
    FROM
        Producto p
    JOIN
        CategoriaProducto cp ON p.id_categoria = cp.id_categoria
    WHERE
        cp.nombre_categoria = @nombre_categoria;
END;
GO