USE CentroEducativo2;
GO

--PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE sp_ConsultarHorarioProfesor
    @email_profesor VARCHAR(150)
AS
BEGIN
    SELECT
        c.codigo_clase,
        a.nombre_asignatura,
        c.aula_asignada,
        c.semestre
    FROM
        Clase c
    JOIN
        Profesor p ON c.id_profesor = p.id_profesor
    JOIN
        Asignatura a ON c.id_asignatura = a.id_asignatura
    WHERE
        p.email = @email_profesor;
END;
GO