USE Eventos2;
GO

--VIEWS

CREATE VIEW vw_ResumenEventos AS
SELECT
    e.nombre_evento,
    e.descripcion,
    e.fecha_hora_inicio,
    e.estado_evento,
    l.nombre_lugar,
    l.direccion,
    l.capacidad_maxima
FROM
    Evento e
JOIN
    Lugar l ON e.id_lugar = l.id_lugar;
GO

--

CREATE VIEW vw_IngresosPorEvento AS
SELECT
    e.nombre_evento,
    SUM(t.precio_pagado) AS ingresos_totales,
    COUNT(t.id_ticket) AS total_tickets_vendidos
FROM
    Evento e
JOIN
    Ticket t ON e.id_evento = t.id_evento
GROUP BY
    e.nombre_evento;
GO