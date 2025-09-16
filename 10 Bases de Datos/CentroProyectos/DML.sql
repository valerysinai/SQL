USE CentroProyectos2;
GO

-- DML
INSERT INTO Equipo (nombre_equipo, descripcion_equipo, fecha_creacion) VALUES
('Equipo Alpha', 'Equipo principal de desarrollo de software.', '2024-01-01'),
('Equipo Beta', 'Equipo de diseño y pruebas.', '2024-03-10'),
('Equipo Gamma', 'Equipo de soporte técnico.', '2024-05-20'),
('Equipo Delta', 'Equipo de marketing y comunicación.', '2024-06-05'),
('Equipo Épsilon', 'Equipo de investigación y desarrollo.', '2024-08-15'),
('Equipo Zeta', 'Equipo de análisis de datos.', '2024-09-01'),
('Equipo Eta', 'Equipo de operaciones.', '2024-10-10'),
('Equipo Theta', 'Equipo de infraestructura.', '2024-11-25'),
('Equipo Iota', 'Equipo de seguridad informática.', '2025-01-01'),
('Equipo Kappa', 'Equipo de calidad de software.', '2025-02-15');

INSERT INTO Miembro (nombre_miembro, apellido_miembro, rol_en_equipo, email, telefono, id_equipo) VALUES
('Ana', 'Soto', 'Líder', 'ana.soto@empresa.com', '3101234567', 1),
('Luis', 'Contreras', 'Desarrollador', 'luis.contreras@empresa.com', '3209876543', 1),
('Marta', 'Herrera', 'Diseñador', 'marta.herrera@empresa.com', '3157778899', 2),
('Juan', 'Gómez', 'Analista QA', 'juan.gomez@empresa.com', '3189990011', 2),
('Carlos', 'Díaz', 'Soporte', 'carlos.diaz@empresa.com', '3192223344', 3),
('Sofía', 'Pérez', 'Marketing', 'sofia.perez@empresa.com', '3216667788', 4),
('Laura', 'Ramírez', 'Investigador', 'laura.ramirez@empresa.com', '3005556677', 5),
('Pedro', 'Hernández', 'Analista', 'pedro.hernandez@empresa.com', '3012223344', 6),
('Diego', 'Morales', 'Ingeniero Ops', 'diego.morales@empresa.com', '3023334455', 7),
('Elena', 'Torres', 'Desarrolladora', 'elena.torres@empresa.com', '3034445566', 1);

INSERT INTO Proyecto (nombre_proyecto, descripcion_proyecto, fecha_inicio_proyecto, fecha_fin_prevista, estado_proyecto, id_equipo_asignado) VALUES
('Desarrollo App Móvil', 'Creación de una aplicación de gestión de tareas.', '2025-07-01', '2025-12-31', 'Activo', 1),
('Rediseño Web Corporativa', 'Actualización completa del sitio web de la empresa.', '2025-06-15', '2025-10-31', 'Activo', 2),
('Plataforma de E-commerce', 'Desarrollo de una plataforma de comercio electrónico.', '2025-05-10', '2026-03-31', 'Activo', 1),
('Migración de Servidores', 'Migración de servidores a la nube.', '2025-08-01', '2025-11-30', 'Activo', 3),
('Campaña de Marketing Digital', 'Lanzamiento de una campaña publicitaria en redes sociales.', '2025-09-01', '2025-12-31', 'Activo', 4),
('Análisis de Mercado', 'Estudio de tendencias y análisis de la competencia.', '2025-07-20', '2025-09-20', 'Activo', 5),
('Implementación de CRM', 'Implementación de un sistema de gestión de relaciones con el cliente.', '2025-06-01', '2026-01-31', 'Activo', 6),
('Auditoría de Seguridad', 'Auditoría de seguridad de los sistemas actuales.', '2025-08-10', '2025-09-10', 'Activo', 7),
('Actualización de Base de Datos', 'Actualización del esquema de la base de datos.', '2025-09-15', '2025-10-15', 'Activo', 8),
('Lanzamiento Nuevo Producto', 'Lanzamiento de un nuevo producto al mercado.', '2025-10-01', '2026-02-28', 'Activo', 9);

INSERT INTO Tarea (nombre_tarea, descripcion_tarea, fecha_vencimiento, prioridad, id_proyecto) VALUES
('Definir Requisitos Funcionales', 'Levantamiento de todos los requisitos de la app.', '2025-07-15', 'Alta', 1),
('Diseñar Interfaz de Usuario', 'Creación de wireframes y mockups.', '2025-07-25', 'Alta', 1),
('Implementar Módulo de Usuarios', 'Codificación del sistema de registro y login.', '2025-08-10', 'Alta', 1),
('Revisar Contenido Actual', 'Auditoría del contenido existente en la web.', '2025-06-20', 'Media', 2),
('Desarrollo Frontend', 'Codificación de la interfaz de usuario del sitio web.', '2025-08-30', 'Alta', 2),
('Configurar Servidores Cloud', 'Configuración de servidores en AWS.', '2025-08-15', 'Alta', 3),
('Creación de Contenido para Redes', 'Diseño de publicaciones para redes sociales.', '2025-09-15', 'Media', 5),
('Análisis de Datos del Proyecto', 'Análisis de los datos recolectados en el proyecto.', '2025-08-25', 'Baja', 6),
('Actualizar Esquema de la DB', 'Actualización de la base de datos a la última versión.', '2025-09-20', 'Alta', 9),
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
(1, 1, 'Necesitamos clarificación sobre el módulo de pagos.'),
(2, 3, 'Se enviaron los primeros mockups para revisión.'),
(3, 2, 'Iniciando la implementación. Esperando feedback del diseño.'),
(4, 3, 'Contenido revisado y listo para ser subido.'),
(5, 2, 'El framework elegido no es el ideal para esta tarea.'),
(6, 9, 'La configuración de la seguridad del servidor está completa.'),
(7, 6, 'Las primeras publicaciones están programadas para mañana.'),
(8, 8, 'Los datos de la encuesta se están procesando.'),
(9, 10, 'Revisando la nueva versión del esquema.'),
(10, 4, 'Empezando las pruebas de humo.');