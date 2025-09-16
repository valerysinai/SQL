USE Ciudad2;
GO

--VIEWS

CREATE VIEW vw_InformacionPropiedadCompleta AS
SELECT
    p.direccion,
    p.area_m2,
    p.tipo_uso,
    p.valor_catastral,
    p.numero_predial,
    c.nombre_ciudad,
    c.pais,
    c.departamento
FROM
    Propiedad p
JOIN
    Ciudad c ON p.id_ciudad = c.id_ciudad;
GO

--

CREATE VIEW vw_EventosPorCiudad AS
SELECT
    e.nombre_evento,
    e.fecha_hora_inicio,
    e.fecha_hora_fin,
    e.lugar,
    e.organizador,
    c.nombre_ciudad
FROM
    Evento e
JOIN
    Ciudad c ON e.id_ciudad = c.id_ciudad;
GO