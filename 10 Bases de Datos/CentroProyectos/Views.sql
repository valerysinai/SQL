USE CentroProyectos2;
GO

--VIEWS

CREATE VIEW vw_ProgresoProyectos AS
SELECT
    p.nombre_proyecto,
    e.nombre_equipo,
    p.estado_proyecto,
    AVG(at.porcentaje_completado) AS promedio_completado
FROM
    Proyecto p
JOIN
    Equipo e ON p.id_equipo_asignado = e.id_equipo
JOIN
    Tarea t ON p.id_proyecto = t.id_proyecto
JOIN
    AsignacionTarea at ON t.id_tarea = at.id_tarea
GROUP BY
    p.nombre_proyecto, e.nombre_equipo, p.estado_proyecto;
GO

--

CREATE VIEW vw_MiembrosYProyectos AS
SELECT
    m.nombre_miembro,
    m.apellido_miembro,
    m.rol_en_equipo,
    e.nombre_equipo,
    p.nombre_proyecto
FROM
    Miembro m
JOIN
    Equipo e ON m.id_equipo = e.id_equipo
JOIN
    Proyecto p ON e.id_equipo = p.id_equipo_asignado;
GO