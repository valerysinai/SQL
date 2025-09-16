USE Eventos2;
GO

-- DML
INSERT INTO Lugar (nombre_lugar, direccion, capacidad_maxima, tipo_lugar, telefono_contacto, email_contacto) VALUES
('Coliseo Iquira', 'Carrera 10 # 5-10, Iquira', 5000, 'Estadio', '3101112233', 'contacto@coliseoiquira.com'),
('Teatro Municipal', 'Calle 15 # 3-50, Iquira', 800, 'Teatro', '3204445566', 'info@teatroiquira.com'),
('Auditorio Central', 'Av. Principal 1-20', 1200, 'Auditorio', '3001234567', 'auditorio@email.com'),
('Parque de la Cultura', 'Carrera 5 10-15', 3000, 'Parque', '3119876543', 'cultura@email.com'),
('Centro de Convenciones', 'Calle 20 8-30', 2500, 'Salón', '3126543210', 'convenciones@email.com'),
('Salón de Eventos', 'Cra. 12 5-60', 400, 'Salón', '3138765432', 'salon@email.com'),
('Plaza de Toros', 'Vía al Sur, Km 2', 8000, 'Arena', '3145678901', 'plaza@email.com'),
('Estadio Iquira', 'Cl. 10 2-45', 10000, 'Estadio', '3153456789', 'estadio@email.com'),
('Gimnasio Deportivo', 'Carrera 20 15-20', 700, 'Gimnasio', '3162345678', 'gimnasio@email.com'),
('Club Social', 'Calle 18 12-50', 500, 'Club', '3171234567', 'club@email.com');

INSERT INTO TipoEntrada (nombre_tipo, precio_base, descripcion, limite_por_compra) VALUES
('General', 50000.00, 'Acceso general al evento.', 5),
('VIP', 120000.00, 'Acceso preferencial y zona exclusiva.', 2),
('Platino', 200000.00, 'Acceso exclusivo, bebidas y asientos premium.', 1),
('Estudiante', 25000.00, 'Descuento para estudiantes con carnet.', 3),
('Niño', 15000.00, 'Entrada para menores de 12 años.', 4),
('Familiar', 150000.00, 'Paquete para 4 personas.', 1),
('Tercera Edad', 30000.00, 'Descuento para mayores de 60 años.', 2),
('Preventa', 40000.00, 'Precio especial por compra anticipada.', 5),
('Backstage', 300000.00, 'Acceso a la zona de artistas.', 1),
('VIP Premium', 250000.00, 'VIP con acceso a barra libre.', 2);

INSERT INTO Evento (nombre_evento, descripcion, fecha_hora_inicio, fecha_hora_fin, id_lugar, estado_evento) VALUES
('Concierto Rock Iquira', 'Festival de rock con bandas nacionales.', '2025-08-20 19:00:00', '2025-08-20 23:00:00', 1, 'Programado'),
('Obra de Teatro Clásica', 'Representación de una obra dramática famosa.', '2025-09-05 20:00:00', '2025-09-05 22:00:00', 2, 'Programado'),
('Conferencia de Negocios', 'Conferencia sobre tendencias de mercado.', '2025-10-10 09:00:00', '2025-10-10 17:00:00', 3, 'Programado'),
('Festival Folclórico', 'Música y danzas tradicionales.', '2025-11-15 14:00:00', '2025-11-16 22:00:00', 4, 'Programado'),
('Exposición de Arte', 'Muestra de obras de artistas locales.', '2025-12-01 10:00:00', '2025-12-31 18:00:00', 5, 'Programado'),
('Graduación Universitaria', 'Ceremonia de graduación.', '2026-01-20 18:00:00', '2026-01-20 21:00:00', 6, 'Programado'),
('Show de Comedia', 'Espectáculo de comedia con humoristas.', '2026-02-14 21:00:00', '2026-02-14 23:00:00', 7, 'Programado'),
('Torneo de Ajedrez', 'Competencia de ajedrez municipal.', '2026-03-05 09:00:00', '2026-03-05 18:00:00', 8, 'Programado'),
('Partido de Baloncesto', 'Partido de exhibición.', '2026-04-01 19:00:00', '2026-04-01 21:00:00', 9, 'Programado'),
('Cena Benéfica', 'Evento para recaudar fondos.', '2026-05-10 20:00:00', '2026-05-10 23:00:00', 10, 'Programado');

INSERT INTO Artista (nombre_artista, genero_musical_o_actuacion, nacionalidad, sitio_web) VALUES
('Banda Los Rockeros', 'Rock Alternativo', 'Colombiana', 'www.losrockeros.com'),
('Teatro Vivo', 'Drama Clásico', 'Colombiana', 'www.teatrovivo.org'),
('Solista Pop', 'Pop Latino', 'Colombiana', NULL),
('Los Clásicos del Vallenato', 'Vallenato', 'Colombiana', 'www.losclasicos.com'),
('Jazz Quartet', 'Jazz', 'Estadounidense', 'www.jazzquartet.com'),
('Comediante Lucho', 'Comedia', 'Venezolana', 'www.luchohumor.com'),
('Orquesta Filarmónica', 'Música Clásica', 'Multinacional', 'www.orquestafilarmonica.org'),
('DJ Beat Master', 'Electrónica', 'Brasileña', 'www.djbeatmaster.com'),
('Grupo de Danza Tradicional', 'Danza Folclórica', 'Colombiana', 'www.danzatradicional.com'),
('Escultor Fernando', 'Escultura', 'Colombiana', NULL);

INSERT INTO Usuario (nombre_usuario, apellido_usuario, email, telefono) VALUES
('Maria', 'Pérez', 'maria.perez@example.com', '3101234567'),
('Juan', 'Restrepo', 'juan.restrepo@example.com', '3209876543'),
('Laura', 'Gómez', 'laura.gomez@example.com', '3157778899'),
('Pedro', 'Castro', 'pedro.castro@example.com', '3001112233'),
('Ana', 'Sánchez', 'ana.sanchez@example.com', '3123334455'),
('Luis', 'Torres', 'luis.torres@example.com', '3189990011'),
('Sofía', 'Ramírez', 'sofia.ramirez@example.com', '3216667788'),
('Carlos', 'Díaz', 'carlos.diaz@example.com', '3045556677'),
('Lucía', 'García', 'lucia.garcia@example.com', '3178889900'),
('Felipe', 'Morales', 'felipe.morales@example.com', '3114445566');

INSERT INTO ParticipacionArtista (id_evento, id_artista, rol_en_evento, hora_actuacion) VALUES
(1, 1, 'Principal', '20:30:00'),
(1, 3, 'Invitado', '19:30:00'),
(2, 2, 'Principal', '20:00:00'),
(3, 4, 'Ponente', '10:00:00'),
(4, 9, 'Grupo Principal', '15:00:00'),
(5, 10, 'Curador', NULL),
(6, 7, 'Actuación en vivo', '19:00:00'),
(7, 6, 'Humorista', '21:30:00'),
(8, 5, 'Músico', NULL),
(9, 8, 'DJ', '20:00:00');

INSERT INTO Ticket (id_usuario, id_tipo_entrada, id_evento, precio_pagado, codigo_qr) VALUES
(1, 1, 1, 50000.00, 'QR-ROCK-001-ABC'),
(1, 2, 1, 120000.00, 'QR-ROCK-002-DEF'),
(2, 1, 2, 50000.00, 'QR-TEATRO-001-GHI'),
(3, 3, 3, 200000.00, 'QR-CONF-001-JKL'),
(4, 4, 4, 25000.00, 'QR-FEST-001-MNO'),
(5, 5, 5, 15000.00, 'QR-ART-001-PQR'),
(6, 6, 6, 150000.00, 'QR-GRAD-001-STU'),
(7, 7, 7, 30000.00, 'QR-COM-001-VWX'),
(8, 8, 8, 40000.00, 'QR-AJED-001-YZA'),
(9, 9, 9, 300000.00, 'QR-BAL-001-BCD');