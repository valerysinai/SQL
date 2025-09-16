USE SistemaVideojuegos2;
GO

--VIEWS

CREATE VIEW vw_ColeccionCompletaJugador AS
SELECT
    j.nombre_usuario,
    v.titulo AS nombre_juego,
    p.nombre_plataforma,
    cj.fecha_adquisicion,
    cj.metodo_adquisicion,
    cj.horas_jugadas,
    cj.estado_juego
FROM
    ColeccionJuegos cj
JOIN
    Jugador j ON cj.id_jugador = j.id_jugador
JOIN
    JuegoPlataforma jp ON cj.id_juego_plataforma = jp.id_juego_plataforma
JOIN
    Videojuego v ON jp.id_videojuego = v.id_videojuego
JOIN
    Plataforma p ON jp.id_plataforma = p.id_plataforma;
GO

--

CREATE VIEW vw_JuegosMasVendidos AS
SELECT
    v.titulo,
    d.nombre_desarrollador,
    COUNT(cj.id_coleccion) AS total_adquisiciones
FROM
    ColeccionJuegos cj
JOIN
    JuegoPlataforma jp ON cj.id_juego_plataforma = jp.id_juego_plataforma
JOIN
    Videojuego v ON jp.id_videojuego = v.id_videojuego
JOIN
    Desarrollador d ON v.id_desarrollador = d.id_desarrollador
GROUP BY
    v.titulo, d.nombre_desarrollador;
GO