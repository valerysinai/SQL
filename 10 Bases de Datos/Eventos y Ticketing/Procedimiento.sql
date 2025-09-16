USE Eventos2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_BuscarEventosPorLugar
    @nombre_lugar VARCHAR(150)
AS
BEGIN
    SELECT
        e.nombre_evento,
        e.fecha_hora_inicio,
        e.estado_evento
    FROM
        Evento e
    JOIN
        Lugar l ON e.id_lugar = l.id_lugar
    WHERE
        l.nombre_lugar = @nombre_lugar;
END;
GO