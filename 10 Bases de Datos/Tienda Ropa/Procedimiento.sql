USE TiendaRopa2;
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
        p.stock_disponible,
        vp.talla,
        vp.color
    FROM
        Producto p
    JOIN
        Categoria c ON p.id_categoria = c.id_categoria
    LEFT JOIN 
        VarianteProducto vp ON p.id_producto = vp.id_producto
    WHERE
        c.nombre_categoria = @nombreCategoria;
END;
GO