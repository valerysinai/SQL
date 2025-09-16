USE SistemaVideojuegos2;
GO

-- DML
INSERT INTO Desarrollador (nombre_desarrollador, pais_origen, fecha_fundacion, web_oficial) VALUES
('CD Projekt Red', 'Polonia', '2002-05-01', 'https://en.cdprojektred.com/'),
('Ubisoft', 'Francia', '1986-03-28', 'https://www.ubisoft.com/'),
('Nintendo', 'Japón', '1889-09-23', 'https://www.nintendo.com/'),
('Valve', 'Estados Unidos', '1996-08-24', 'https://www.valvesoftware.com/'),
('Square Enix', 'Japón', '1975-09-22', 'https://www.square-enix.com/'),
('BioWare', 'Canadá', '1995-02-01', 'https://www.bioware.com/'),
('Rockstar Games', 'Estados Unidos', '1998-12-01', 'https://www.rockstargames.com/'),
('Activision Blizzard', 'Estados Unidos', '2008-07-09', 'https://www.activision.com/'),
('Sony Interactive Entertainment', 'Japón', '1993-11-16', 'https://www.playstation.com/'),
('Electronic Arts', 'Estados Unidos', '1982-05-28', 'https://www.ea.com/');
GO

INSERT INTO Plataforma (nombre_plataforma, fabricante, fecha_lanzamiento, generacion) VALUES
('PC', 'Microsoft', '1981-08-12', 'Varias'),
('PlayStation 5', 'Sony', '2020-11-12', '9na Generación'),
('Nintendo Switch', 'Nintendo', '2017-03-03', '8va Generación'),
('Xbox Series X', 'Microsoft', '2020-11-10', '9na Generación'),
('PlayStation 4', 'Sony', '2013-11-15', '8va Generación'),
('Xbox One', 'Microsoft', '2013-11-22', '8va Generación'),
('Nintendo 3DS', 'Nintendo', '2011-02-26', '8va Generación'),
('PC VR', 'Varios', '2016-04-05', 'VR'),
('Android', 'Google', '2008-09-23', 'Móvil'),
('iOS', 'Apple', '2007-06-29', 'Móvil');
GO

INSERT INTO Genero (nombre_genero, descripcion_genero) VALUES
('RPG', 'Juegos de rol con progresión de personaje y narrativa profunda.'),
('Acción', 'Juegos que se centran en el combate y la respuesta rápida.'),
('Aventura', 'Juegos con exploración, resolución de puzles y narrativa.'),
('Estrategia', 'Juegos centrados en la planificación y la táctica.'),
('Simulación', 'Juegos que imitan actividades del mundo real.'),
('Deportes', 'Juegos que simulan deportes.'),
('Lucha', 'Juegos de combate uno contra uno.'),
('Terror', 'Juegos diseñados para provocar miedo.'),
('Indie', 'Juegos desarrollados por estudios pequeños o individuales.'),
('Casual', 'Juegos sencillos y fáciles de jugar para un público amplio.');
GO

INSERT INTO Videojuego (titulo, fecha_lanzamiento, clasificacion_esrb, precio, descripcion_corta, id_desarrollador, id_genero_principal) VALUES
('Cyberpunk 2077', '2020-12-10', 'M', 59.99, 'Un RPG de acción y aventura de mundo abierto ambientado en Night City.', 1, 1),
('Assassin''s Creed Valhalla', '2020-11-10', 'M', 49.99, 'Un juego de rol de acción donde juegas como un asaltante vikingo.', 2, 2),
('The Legend of Zelda: Breath of the Wild', '2017-03-03', 'E10+', 59.99, 'Un juego de acción y aventura de mundo abierto en el reino de Hyrule.', 3, 3),
('Portal 2', '2011-04-19', 'E10+', 9.99, 'Un juego de puzles en primera persona con una trama intrigante.', 4, 3),
('Final Fantasy VII Remake', '2020-04-10', 'T', 69.99, 'Una reinvención del clásico RPG de 1997.', 5, 1),
('Mass Effect', '2007-11-20', 'M', 19.99, 'Un RPG de ciencia ficción.', 6, 1),
('Grand Theft Auto V', '2013-09-17', 'M', 29.99, 'Un juego de acción y aventura en mundo abierto ambientado en Los Santos.', 7, 2),
('Overwatch 2', '2022-10-04', 'T', 0.00, 'Un hero shooter en equipo.', 8, 2),
('God of War Ragnarök', '2022-11-09', 'M', 69.99, 'Kratos y Atreus se enfrentan al Ragnarök.', 9, 2),
('FIFA 23', '2022-09-30', 'E', 49.99, 'El juego de fútbol más reciente de EA.', 10, 6);
GO

INSERT INTO JuegoPlataforma (id_videojuego, id_plataforma, fecha_lanzamiento_plataforma, edicion_especial) VALUES
(1, 1, '2020-12-10', 'Standard'),
(1, 2, '2020-12-10', 'Standard'),
(2, 1, '2020-11-10', 'Standard'),
(2, 2, '2020-11-10', 'Standard'),
(3, 3, '2017-03-03', 'Standard'),
(4, 1, '2011-04-19', 'Standard'),
(5, 2, '2020-04-10', 'Deluxe'),
(6, 4, '2007-11-20', 'Standard'),
(7, 5, '2013-09-17', 'Premium Edition'),
(8, 1, '2022-10-04', 'Standard');
GO

INSERT INTO Jugador (nombre_usuario, email, fecha_nacimiento, pais_residencia) VALUES
('GamerPro123', 'gamerpro123@email.com', '1995-01-20', 'Colombia'),
('LinkFanatic', 'linkfanatic@email.com', '2000-07-15', 'Colombia'),
('MasterChief7', 'chief7@email.com', '1990-03-10', 'Estados Unidos'),
('LaraCroftFan', 'laracroft@email.com', '1998-09-25', 'Brasil'),
('KirbyLover', 'kirby_lover@email.com', '2005-02-12', 'Japón'),
('SonicSpeed', 'sonicspeed@email.com', '1993-08-01', 'México'),
('PeachPrincess', 'peach@email.com', '2001-04-30', 'España'),
('GeraltOfRivia', 'geralt@email.com', '1985-11-11', 'Polonia'),
('LeonS.Kennedy', 'leon_s@email.com', '1997-06-20', 'Argentina'),
('SolidSnake', 'solidsnake@email.com', '1988-12-15', 'Chile');
GO

INSERT INTO ColeccionJuegos (id_jugador, id_juego_plataforma, fecha_adquisicion, metodo_adquisicion, horas_jugadas, estado_juego) VALUES
(1, 1, '2025-07-10 12:00:00', 'Comprado', 150.50, 'Completado'),
(1, 3, '2025-07-12 10:30:00', 'Suscripción', 30.00, 'Jugando'),
(2, 5, '2025-07-05 18:00:00', 'Comprado', 200.00, 'Completado'),
(3, 8, '2025-07-15 09:00:00', 'Comprado', 5.00, 'Pendiente'),
(4, 6, '2025-07-11 14:00:00', 'Suscripción', 10.00, 'Jugando'),
(5, 5, '2025-07-06 19:30:00', 'Comprado', 85.00, 'Completado'),
(6, 7, '2025-07-13 16:00:00', 'Comprado', 12.00, 'Jugando'),
(7, 3, '2025-07-14 11:00:00', 'Suscripción', 2.00, 'Pendiente'),
(8, 1, '2025-07-10 12:30:00', 'Comprado', 250.75, 'Completado'),
(9, 2, '2025-07-08 20:00:00', 'Comprado', 75.00, 'Jugando');
GO