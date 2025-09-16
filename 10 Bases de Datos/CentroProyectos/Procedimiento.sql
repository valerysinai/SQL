USE CentroProyectos2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_ConsultarTareasPendientesPorEquipo
    @nombre_equipo VARCHAR(100)
AS
BEGIN
    SELECT
        t.nombre_tarea,
        t.prioridad,
        t.fecha_vencimiento,
        p.nombre_proyecto
    FROM
        Tarea t
    JOIN
        Proyecto p ON t.id_proyecto = p.id_proyecto
    JOIN
        Equipo e ON p.id_equipo_asignado = e.id_equipo
    WHERE
        e.nombre_equipo = @nombre_equipo
        AND t.estado_tarea = 'Pendiente';
END;
GO