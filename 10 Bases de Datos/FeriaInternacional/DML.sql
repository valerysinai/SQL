-- DML (Data Manipulation Language) - Inserción de datos
USE FeriaInternacional;
GO

INSERT INTO Feria VALUES 
(1,'Feria Internacional de Tecnología ','2025-10-10','2025-10-15');

INSERT INTO Persona VALUES
(1, 'Valery', 'Trujillo', '12345678', 'valery@gmail.com', '320551234'), 
(2, 'Mauricio', 'Penagos', '87654321', 'mauricio@gmail.com', '3212346'), 
(3, 'Tomas', 'Perez', '55667788', 'tomas@gmail.com', '3166924313'), 
(4, 'Maria', 'Torres', '12112121', 'maria@gmail.com', '3124567890'),
(5, 'Carlos', 'Gómez', '99887766', 'carlos.g@gmail.com', '315112233'), 
(6, 'Sofia', 'Hernández', '10123456', 'sofia.h@gmail.com', '318987654'),
(7, 'Juan', 'Ramírez', '20234567', 'juan.r@gmail.com', '310555666'), 
(8, 'Ana', 'Díaz', '30345678', 'ana.d@gmail.com', '313777888'), 
(9, 'Pedro', 'Sánchez', '40456789', 'pedro.s@gmail.com', '317111222'),
(10, 'Lucía', 'García', '50567890', 'lucia.g@gmail.com', '320999000'), 
(11, 'Ricardo', 'Lopez', '60678901', 'ricardo.l@gmail.com', '314223344'), 
(12, 'Elena', 'Vargas', '70789012', 'elena.v@gmail.com', '319334455'), 
(13, 'Alejandro', 'Castro', '80890123', 'alejandro.c@gmail.com', '311445566'), 
(14, 'Isabel', 'Morales', '90901234', 'isabel.m@gmail.com', '312556677'),
(15, 'Andrés', 'Silva', '11012345', 'andres.s@gmail.com', '316667788'), 
(16, 'Laura', 'Mendoza', '22123456', 'laura.m@gmail.com', '317778899'), 
(17, 'Felipe', 'Ruiz', '33234567', 'felipe.r@gmail.com', '318889900'), 
(18, 'Diana', 'Gutierrez', '44345678', 'diana.g@gmail.com', '310990011'),
(19, 'Gabriel', 'Ortega', '55456789', 'gabriel.o@gmail.com', '313001122'),
(20, 'Natalia', 'Pardo', '66567890', 'natalia.p@gmail.com', '314112233'), 
(21, 'Jorge', 'Rojas', '77678901', 'jorge.r@gmail.com', '315223344'), 
(22, 'Paola', 'Guevara', '88789012', 'paola.g@gmail.com', '316334455'),
(23, 'Camilo', 'Vega', '99890123', 'camilo.v@gmail.com', '317445566'),
(24, 'Silvia', 'Luna', '12356789', 'silvia.l@gmail.com', '318556677'), 
(25, 'Marco', 'Fuentes', '23467890', 'marco.f@gmail.com', '319667788'),
(26, 'Viviana', 'Jaramillo', '34578901', 'viviana.j@gmail.com', '310778899'), 
(27, 'Esteban', 'Quintero', '45689012', 'esteban.q@gmail.com', '311889900'), 
(28, 'Beatriz', 'Perez', '56790123', 'beatriz.p@gmail.com', '312990011'), 
(29, 'Francisco', 'Ochoa', '67801234', 'francisco.o@gmail.com', '313001122'), 
(30, 'Carmen', 'Paz', '78912345', 'carmen.p@gmail.com', '314112233');

INSERT INTO TipoVisitante VALUES
(1, 'VIP'), 
(2, 'General'),
(3, 'Estudiante'), 
(4, 'Prensa'), 
(5, 'Expositor'),
(6, 'Patrocinador'), 
(7, 'Inversor'), 
(8, 'Analista'), 
(9, 'Consultor'), 
(10, 'Partner');

INSERT INTO Tematica VALUES
(1, 'Análisis y desarrollo de software'), 
(2, 'Multimedia'), (3, 'Inteligencia Artificial'), 
(4, 'Ciberseguridad'), (5, 'Robótica'), 
(6, 'Realidad Virtual y Aumentada'), 
(7, 'Internet de las Cosas (IoT)'), 
(8, 'Blockchain'), (9, 'Big Data'), 
(10, 'Computación Cuántica');

INSERT INTO Empresa VALUES
(1, 'EduWorld'),
(2, 'SoftCode'), 
(3, 'UB Solucion'), 
(4, 'CyberGuard Inc.'), 
(5, 'RoboTech Solutions'), 
(6, 'ARVR Innovate'), 
(7, 'IoT Connect'), 
(8, 'DataWise'), 
(9, 'GameDev Masters'), 
(10, 'Blockchain Trust');

INSERT INTO Demostracion VALUES
(1, 'Demo de IA en la nube'), 
(2, 'Seguridad de redes 5G'), 
(3, 'Realidad Virtual para educación'),
(4, 'Robot de asistencia médica'), 
(5, 'Sistema de riego inteligente IoT'), 
(6, 'Trazabilidad con Blockchain'), 
(7, 'Análisis de datos en tiempo real'), 
(8, 'Creación de videojuegos 3D'), 
(9, 'Aplicaciones de Realidad Aumentada'), 
(10, 'Demostración de un chatbot avanzado');

INSERT INTO Charla VALUES
(1, 'El futuro del software en la industria'), 
(2, 'Principios de la ciberseguridad corporativa'), 
(3, 'Robots colaborativos: un nuevo paradigma'), 
(4, 'La IA como motor de crecimiento'), 
(5, 'Introducción a Blockchain y sus usos'), 
(6, 'Big Data para la toma de decisiones'), 
(7, 'Impacto de IoT en la vida diaria'), 
(8, 'Realidad Aumentada: más allá del entretenimiento'),
(9, 'Desarrollo de video juegos para móviles'), 
(10, 'Computación cuántica: lo que viene');

INSERT INTO Responsable VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO Ponente VALUES
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15), 
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20);

INSERT INTO Visitante VALUES
(1, 21, 2), (2, 22, 1), (3, 23, 3), (4, 24, 4), (5, 25, 5), 
(6, 26, 2), (7, 27, 6), (8, 28, 7), (9, 29, 8), (10, 30, 9);

INSERT INTO Pabellon VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 2), (5, 5, 3),
(6, 6, 3), (7, 7, 1), (8, 8, 2), (9, 9, 3), (10, 10, 1);

INSERT INTO Stand VALUES
(1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), 
(6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10);

INSERT INTO Producto VALUES
(1, 'Software de gestión empresarial', 'Software integral para la gestión de pymes.', 1, 1),
(2, 'Sistema de seguridad perimetral', 'Hardware y software para protección de redes.', 2, 2),
(3, 'Plataforma educativa', 'Aplicación interactiva para el aprendizaje con RA/RV.', 3, 3), 
(4, 'Robot de limpieza inteligente', 'Robot autónomo para la limpieza de espacios grandes.', 4, 4), 
(5, 'Sensor de humedad IoT', 'Sensor para monitoreo de cultivos a distancia.', 5, 5), 
(6, 'Plataforma de contratos inteligentes', 'Solución basada en blockchain para automatizar acuerdos.', 6, 6), 
(7, 'Herramienta de visualización de datos', 'Software para crear dashboards interactivos.', 7, 7),
(8, 'Motor de videojuegos 2D', 'Kit de desarrollo para crear videojuegos tipo arcade.', 8, 8), 
(9, 'Dispositivo de realidad aumentada', 'Gafas de realidad aumentada para uso profesional.', 9, 9), 
(10, 'Asistente de voz basado en IA', 'Asistente virtual con capacidades de aprendizaje.', 10, 10);

INSERT INTO Registro VALUES
(1, 1, 1, 1, 1, 1), (2, 1, 2, 2, 2, 2), (3, 2, 3, 3, 3, 3), (4, 2, 4, 4, 4, 4), (5, 3, 5, 5, 5, 5), 
(6, 3, 6, 6, 6, 6), (7, 1, 7, 7, 7, 7), (8, 2, 8, 8, 8, 8), (9, 3, 9, 9, 9, 9), (10, 1, 10, 10, 10, 10);
GO