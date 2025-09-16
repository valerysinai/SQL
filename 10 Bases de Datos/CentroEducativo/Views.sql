USE CentroEducativo2;
GO

--VIEWS

CREATE VIEW vw_HistorialAcademicoEstudiante AS
SELECT
    e.nombre_estudiante,
    e.apellido_estudiante,
    a.nombre_asignatura,
    c.codigo_clase,
    p.nombre_profesor,
    m.calificacion_final
FROM
    Matricula m
JOIN
    Estudiante e ON m.id_estudiante = e.id_estudiante
JOIN
    Clase c ON m.id_clase = c.id_clase
JOIN
    Asignatura a ON c.id_asignatura = a.id_asignatura
JOIN
    Profesor p ON c.id_profesor = p.id_profesor;
GO

--

CREATE VIEW vw_ClasesPorProfesor AS
SELECT
    p.nombre_profesor,
    p.apellido_profesor,
    a.nombre_asignatura,
    c.codigo_clase,
    c.aula_asignada,
    c.año_academico,
    c.semestre
FROM
    Clase c
JOIN
    Profesor p ON c.id_profesor = p.id_profesor
JOIN
    Asignatura a ON c.id_asignatura = a.id_asignatura;
GO