USE SistemaVideojuegos2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_BuscarJuegosPorGenero
    @nombre_genero VARCHAR(100)
AS
BEGIN
    SELECT
        v.titulo,
        g.nombre_genero,
        d.nombre_desarrollador,
        v.precio
    FROM
        Videojuego v
    JOIN
        Genero g ON v.id_genero_principal = g.id_genero
    JOIN
        Desarrollador d ON v.id_desarrollador = d.id_desarrollador
    WHERE
        g.nombre_genero = @nombre_genero;
END;
GO