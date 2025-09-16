USE medico2;
GO

SELECT
    C.fecha_hora_cita,
    C.motivo_cita,
    P.nombre_paciente,
    P.apellido_paciente,
    M.nombre_medico,
    M.apellido_medico,
    E.nombre_especialidad
FROM
    Cita C
JOIN
    Paciente P ON C.id_paciente = P.id_paciente
JOIN
    Medico M ON C.id_medico = M.id_medico
JOIN
    Especialidad E ON M.id_especialidad_principal = E.id_especialidad
WHERE
    C.estado_cita = 'Programada'
ORDER BY
    C.fecha_hora_cita;

SELECT
    P.nombre_paciente,
    P.apellido_paciente,
    HM.antecedentes_familiares,
    HM.antecedentes_personales,
    HM.medicamentos_actuales,
    C.fecha_hora_consulta,
    C.motivo_consulta_detalle,
    C.plan_tratamiento,
    M.nombre_medico AS medico_consulta
FROM
    Paciente P
JOIN
    HistorialMedico HM ON P.id_paciente = HM.id_paciente
LEFT JOIN
    ConsultaMedica C ON P.id_paciente = C.id_paciente
LEFT JOIN
    Medico M ON C.id_medico = M.id_medico
WHERE
    P.nombre_paciente = 'María' AND P.apellido_paciente = 'López'
ORDER BY
    C.fecha_hora_consulta DESC;

SELECT
    P.nombre_medicamento,
    P.dosis,
    P.frecuencia,
    P.duracion_dias,
    P.instrucciones_especiales,
    CM.fecha_hora_consulta,
    Med.nombre_medico,
    Pac.nombre_paciente
FROM
    Prescripcion P
JOIN
    ConsultaMedica CM ON P.id_consulta = CM.id_consulta
JOIN
    Medico Med ON CM.id_medico = Med.id_medico
JOIN
    Paciente Pac ON CM.id_paciente = Pac.id_paciente
WHERE
    P.id_consulta = 1;

SELECT
    E.nombre_especialidad,
    COUNT(M.id_medico) AS numero_medicos
FROM
    Especialidad E
LEFT JOIN
    Medico M ON E.id_especialidad = M.id_especialidad_principal
GROUP BY
    E.nombre_especialidad
ORDER BY
    numero_medicos DESC;

SELECT DISTINCT
    P.nombre_paciente,
    P.apellido_paciente,
    P.telefono_contacto
FROM
    Paciente P
JOIN
    Cita C ON P.id_paciente = C.id_paciente
JOIN
    Medico M ON C.id_medico = M.id_medico
WHERE
    M.nombre_medico = 'Juan' AND M.apellido_medico = 'Pérez';
