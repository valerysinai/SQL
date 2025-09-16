USE CafeteriaDB2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_ConsultarProductosPorCategoria
    @nombreCategoria VARCHAR(100)
AS
BEGIN
    SELECT
        p.nombre_producto,
        p.descripcion_producto,
        p.precio_unitario,
        p.stock_actual
    FROM
        Producto p
    JOIN
        CategoriaProducto cp ON p.id_categoria = cp.id_categoria
    WHERE
        cp.nombre_categoria = @nombreCategoria;
END;
GO