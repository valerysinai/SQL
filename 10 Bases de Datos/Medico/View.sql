USE medico2;
GO
CREATE VIEW vw_AgendaDiariaMedicos AS
SELECT
    m.nombre_medico,
    m.apellido_medico,
    c.fecha_hora_cita,
    c.estado_cita,
    p.nombre_paciente,
    p.apellido_paciente,
    c.motivo_cita
FROM
    Cita c
JOIN
    Medico m ON c.id_medico = m.id_medico
JOIN
    Paciente p ON c.id_paciente = p.id_paciente;
GO