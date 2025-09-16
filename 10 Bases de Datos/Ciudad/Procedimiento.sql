USE Ciudad2;
GO

--PROCEDIMIENTOS ALMACENADOS

CREATE PROCEDURE sp_BuscarPropiedadesPorUso
    @tipo_uso NVARCHAR(50)
AS
BEGIN
    SELECT
        p.direccion,
        p.area_m2,
        p.valor_catastral,
        p.numero_predial,
        c.nombre_ciudad
    FROM
        Propiedad p
    JOIN
        Ciudad c ON p.id_ciudad = c.id_ciudad
    WHERE
        p.tipo_uso = @tipo_uso;
END;
GO