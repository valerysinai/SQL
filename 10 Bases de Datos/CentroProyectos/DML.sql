USE CentroProyectos2;
GO

-- DML
INSERT INTO Equipo (nombre_equipo, descripcion_equipo, fecha_creacion) VALUES
('Equipo Alpha', 'Equipo principal de desarrollo de software.', '2024-01-01'),
('Equipo Beta', 'Equipo de dise�o y pruebas.', '2024-03-10'),
('Equipo Gamma', 'Equipo de soporte t�cnico.', '2024-05-20'),
('Equipo Delta', 'Equipo de marketing y comunicaci�n.', '2024-06-05'),
('Equipo �psilon', 'Equipo de investigaci�n y desarrollo.', '2024-08-15'),
('Equipo Zeta', 'Equipo de an�lisis de datos.', '2024-09-01'),
('Equipo Eta', 'Equipo de operaciones.', '2024-10-10'),
('Equipo Theta', 'Equipo de infraestructura.', '2024-11-25'),
('Equipo Iota', 'Equipo de seguridad inform�tica.', '2025-01-01'),
('Equipo Kappa', 'Equipo de calidad de software.', '2025-02-15');

INSERT INTO Miembro (nombre_miembro, apellido_miembro, rol_en_equipo, email, telefono, id_equipo) VALUES
('Ana', 'Soto', 'L�der', 'ana.soto@empresa.com', '3101234567', 1),
('Luis', 'Contreras', 'Desarrollador', 'luis.contreras@empresa.com', '3209876543', 1),
('Marta', 'Herrera', 'Dise�ador', 'marta.herrera@empresa.com', '3157778899', 2),
('Juan', 'G�mez', 'Analista QA', 'juan.gomez@empresa.com', '3189990011', 2),
('Carlos', 'D�az', 'Soporte', 'carlos.diaz@empresa.com', '3192223344', 3),
('Sof�a', 'P�rez', 'Marketing', 'sofia.perez@empresa.com', '3216667788', 4),
('Laura', 'Ram�rez', 'Investigador', 'laura.ramirez@empresa.com', '3005556677', 5),
('Pedro', 'Hern�ndez', 'Analista', 'pedro.hernandez@empresa.com', '3012223344', 6),
('Diego', 'Morales', 'Ingeniero Ops', 'diego.morales@empresa.com', '3023334455', 7),
('Elena', 'Torres', 'Desarrolladora', 'elena.torres@empresa.com', '3034445566', 1);

INSERT INTO Proyecto (nombre_proyecto, descripcion_proyecto, fecha_inicio_proyecto, fecha_fin_prevista, estado_proyecto, id_equipo_asignado) VALUES
('Desarrollo App M�vil', 'Creaci�n de una aplicaci�n de gesti�n de tareas.', '2025-07-01', '2025-12-31', 'Activo', 1),
('Redise�o Web Corporativa', 'Actualizaci�n completa del sitio web de la empresa.', '2025-06-15', '2025-10-31', 'Activo', 2),
('Plataforma de E-commerce', 'Desarrollo de una plataforma de comercio electr�nico.', '2025-05-10', '2026-03-31', 'Activo', 1),
('Migraci�n de Servidores', 'Migraci�n de servidores a la nube.', '2025-08-01', '2025-11-30', 'Activo', 3),
('Campa�a de Marketing Digital', 'Lanzamiento de una campa�a publicitaria en redes sociales.', '2025-09-01', '2025-12-31', 'Activo', 4),
('An�lisis de Mercado', 'Estudio de tendencias y an�lisis de la competencia.', '2025-07-20', '2025-09-20', 'Activo', 5),
('Implementaci�n de CRM', 'Implementaci�n de un sistema de gesti�n de relaciones con el cliente.', '2025-06-01', '2026-01-31', 'Activo', 6),
('Auditor�a de Seguridad', 'Auditor�a de seguridad de los sistemas actuales.', '2025-08-10', '2025-09-10', 'Activo', 7),
('Actualizaci�n de Base de Datos', 'Actualizaci�n del esquema de la base de datos.', '2025-09-15', '2025-10-15', 'Activo', 8),
('Lanzamiento Nuevo Producto', 'Lanzamiento de un nuevo producto al mercado.', '2025-10-01', '2026-02-28', 'Activo', 9);

INSERT INTO Tarea (nombre_tarea, descripcion_tarea, fecha_vencimiento, prioridad, id_proyecto) VALUES
('Definir Requisitos Funcionales', 'Levantamiento de todos los requisitos de la app.', '2025-07-15', 'Alta', 1),
('Dise�ar Interfaz de Usuario', 'Creaci�n de wireframes y mockups.', '2025-07-25', 'Alta', 1),
('Implementar M�dulo de Usuarios', 'Codificaci�n del sistema de registro y login.', '2025-08-10', 'Alta', 1),
('Revisar Contenido Actual', 'Auditor�a del contenido existente en la web.', '2025-06-20', 'Media', 2),
('Desarrollo Frontend', 'Codificaci�n de la interfaz de usuario del sitio web.', '2025-08-30', 'Alta', 2),
('Configurar Servidores Cloud', 'Configuraci�n de servidores en AWS.', '2025-08-15', 'Alta', 3),
('Creaci�n de Contenido para Redes', 'Dise�o de publicaciones para redes sociales.', '2025-09-15', 'Media', 5),
('An�lisis de Datos del Proyecto', 'An�lisis de los datos recolectados en el proyecto.', '2025-08-25', 'Baja', 6),
('Actualizar Esquema de la DB', 'Actualizaci�n de la base de datos a la �ltima versi�n.', '2025-09-20', 'Alta', 9),
('Pruebas de Funcionalidad', 'Ejecutar pruebas de control de calidad.', '2025-08-01', 'Alta', 1);

INSERT INTO AsignacionTarea (id_tarea, id_miembro, porcentaje_completado) VALUES
(1, 1, 80.00),
(1, 2, 80.00),
(2, 3, 50.00),
(4, 3, 100.00),
(5, 2, 20.00),
(6, 9, 75.00),
(7, 6, 90.00),
(8, 8, 40.00),
(9, 10, 0.00),
(10, 4, 15.00);

INSERT INTO DependenciaTarea (id_tarea_predecesora, id_tarea_sucesora, tipo_dependencia) VALUES
(1, 2, 'Final a Inicio'),
(2, 3, 'Final a Inicio'),
(4, 5, 'Final a Inicio'),
(6, 9, 'Final a Final'),
(7, 8, 'Inicio a Inicio'),
(9, 10, 'Final a Inicio'),
(3, 10, 'Final a Final'),
(1, 3, 'Final a Final'),
(2, 10, 'Inicio a Inicio'),
(5, 7, 'Final a Inicio');

INSERT INTO ComentarioTarea (id_tarea, id_miembro, texto_comentario) VALUES
(1, 1, 'Necesitamos clarificaci�n sobre el m�dulo de pagos.'),
(2, 3, 'Se enviaron los primeros mockups para revisi�n.'),
(3, 2, 'Iniciando la implementaci�n. Esperando feedback del dise�o.'),
(4, 3, 'Contenido revisado y listo para ser subido.'),
(5, 2, 'El framework elegido no es el ideal para esta tarea.'),
(6, 9, 'La configuraci�n de la seguridad del servidor est� completa.'),
(7, 6, 'Las primeras publicaciones est�n programadas para ma�ana.'),
(8, 8, 'Los datos de la encuesta se est�n procesando.'),
(9, 10, 'Revisando la nueva versi�n del esquema.'),
(10, 4, 'Empezando las pruebas de humo.');