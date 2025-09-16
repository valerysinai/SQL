USE Ciudad2;
GO

-- DML
INSERT INTO Ciudad (nombre_ciudad, pais, departamento, poblacion_estimada, alcalde_actual, fecha_fundacion) VALUES
('Iquira', 'Colombia', 'Huila', 15000, 'Alcalde Iquira', '1800-01-01'),
('Neiva', 'Colombia', 'Huila', 350000, 'Alcalde Neiva', '1612-05-24'),
('Bogotá', 'Colombia', 'Cundinamarca', 8000000, 'Alcalde Bogotá', '1538-08-06'),
('Medellín', 'Colombia', 'Antioquia', 2600000, 'Alcalde Medellín', '1675-11-02'),
('Cali', 'Colombia', 'Valle del Cauca', 2200000, 'Alcalde Cali', '1536-07-25'),
('Barranquilla', 'Colombia', 'Atlántico', 1300000, 'Alcalde Barranquilla', '1813-04-07'),
('Cartagena', 'Colombia', 'Bolívar', 1000000, 'Alcalde Cartagena', '1533-06-01'),
('Cúcuta', 'Colombia', 'Norte de Santander', 750000, 'Alcalde Cúcuta', '1733-06-17'),
('Bucaramanga', 'Colombia', 'Santander', 600000, 'Alcalde Bucaramanga', '1622-12-22'),
('Pereira', 'Colombia', 'Risaralda', 470000, 'Alcalde Pereira', '1863-08-30');

INSERT INTO Ciudadano (nombre, apellido, fecha_nacimiento, genero, tipo_documento, numero_documento, telefono, email, id_ciudad_residencia) VALUES
('Juan', 'Gómez', '1985-05-20', 'M', 'CC', '1001001001', '3101234567', 'juan.gomez@email.com', 1),
('Maria', 'Rodríguez', '1992-11-10', 'F', 'CC', '1002002002', '3209876543', 'maria.r@email.com', 2),
('Carlos', 'Pérez', '1970-03-01', 'M', 'CC', '1003003003', '3001112233', 'carlos.p@email.com', 3),
('Ana', 'Díaz', '1995-08-25', 'F', 'CC', '1004004004', '3154445566', 'ana.diaz@email.com', 4),
('Luis', 'García', '1988-04-12', 'M', 'CC', '1005005005', '3017778899', 'luis.garcia@email.com', 5),
('Sofía', 'Martínez', '1998-07-30', 'F', 'CC', '1006006006', '3180001122', 'sofia.m@email.com', 6),
('Pedro', 'López', '1975-01-15', 'M', 'CC', '1007007007', '3213334455', 'pedro.l@email.com', 7),
('Laura', 'Hernández', '1990-12-05', 'F', 'CC', '1008008008', '3176667788', 'laura.h@email.com', 8),
('José', 'Torres', '1983-09-18', 'M', 'CC', '1009009009', '3049990011', 'jose.torres@email.com', 9),
('Daniela', 'Ramírez', '1996-02-28', 'F', 'CC', '1010101010', '3132223344', 'daniela.r@email.com', 10);

INSERT INTO Propiedad (direccion, area_m2, tipo_uso, valor_catastral, numero_predial, id_ciudad) VALUES
('Carrera 5 # 10-20', 120.50, 'Residencial', 150000000.00, '001-001', 1),
('Calle 8 # 15-30', 80.00, 'Residencial', 90000000.00, '001-002', 2),
('Avenida Principal # 2-50 Local 1', 200.00, 'Comercial', 300000000.00, '001-003', 3),
('Calle 90 # 10-50', 150.00, 'Residencial', 250000000.00, '001-004', 4),
('Carrera 50 # 15-75', 180.50, 'Comercial', 400000000.00, '001-005', 5),
('Avenida Suba # 100-20', 110.00, 'Residencial', 180000000.00, '001-006', 6),
('Calle 72 # 11-12', 95.00, 'Residencial', 160000000.00, '001-007', 7),
('Carrera 40 # 50-60', 300.00, 'Industrial', 500000000.00, '001-008', 8),
('Calle 26 # 7-80', 70.50, 'Residencial', 85000000.00, '001-009', 9),
('Avenida 80 # 25-50', 250.00, 'Comercial', 350000000.00, '001-010', 10);

INSERT INTO ServicioPublico (id_servicio, nombre_servicio, descripcion, empresa_proveedora, costo_base_mensual, id_ciudad) VALUES
(1, 'Acueducto', 'Suministro de agua potable.', 'Empresa de Aguas Iquira', 25000.00, 1),
(2, 'Energía', 'Suministro de energía eléctrica.', 'ElectroHuila', 40000.00, 2),
(3, 'Aseo', 'Recolección de residuos sólidos.', 'Empresa de Aseo Iquira', 15000.00, 3),
(4, 'Gas Natural', 'Suministro de gas para hogares.', 'Gases de la Región', 30000.00, 4),
(5, 'Internet', 'Servicio de internet de banda ancha.', 'NetCom', 60000.00, 5),
(6, 'Telefonía Fija', 'Servicio de comunicación telefónica.', 'Telco S.A.', 20000.00, 6),
(7, 'Televisión por Cable', 'Servicio de televisión paga.', 'CableMax', 45000.00, 7),
(8, 'Alumbrado Público', 'Mantenimiento de luminarias en calles.', 'LuzBrilla', 10000.00, 8),
(9, 'Alcantarillado', 'Sistema de manejo de aguas residuales.', 'AcuaServicios', 22000.00, 9),
(10, 'Reciclaje', 'Programa de recolección de materiales reciclables.', 'ReciClean', 8000.00, 10);

INSERT INTO ContratoServicio (id_propiedad, id_servicio, fecha_inicio_contrato, estado_contrato) VALUES
(1, 1, '2023-01-01', 'Activo'),
(1, 2, '2023-01-01', 'Activo'),
(2, 1, '2023-02-15', 'Activo'),
(3, 2, '2024-03-10', 'Activo'),
(4, 4, '2023-05-20', 'Activo'),
(5, 5, '2024-01-01', 'Activo'),
(6, 6, '2023-09-10', 'Activo'),
(7, 7, '2024-02-05', 'Activo'),
(8, 8, '2023-11-20', 'Activo'),
(9, 9, '2024-04-15', 'Activo');

INSERT INTO Infraestructura (nombre_infraestructura, tipo_infraestructura, direccion, fecha_construccion, capacidad_personas, id_ciudad) VALUES
('Parque Central', 'Parque', 'Frente a la Alcaldía', '1950-01-01', 500, 1),
('Hospital San Vicente', 'Hospital', 'Carrera 7 # 3-45', '1980-06-20', NULL, 2),
('Colegio La Candelaria', 'Escuela', 'Calle 12 # 8-10', '1965-09-01', 800, 3),
('Biblioteca Distrital', 'Biblioteca', 'Carrera 30 # 10-05', '2005-03-15', 300, 4),
('Estadio Metropolitano', 'Estadio', 'Avenida Circunvalar', '1995-10-25', 45000, 5),
('Centro de Convenciones', 'Centro de Eventos', 'Calle 26 # 15-30', '2010-07-01', 5000, 6),
('Teatro Municipal', 'Teatro', 'Calle 34 # 18-50', '1978-04-12', 1500, 7),
('Universidad Tecnológica', 'Universidad', 'Carrera 27 # 5-10', '1970-08-01', 10000, 8),
('Puente del Centenario', 'Puente', 'Avenida Las Américas', '2015-05-30', NULL, 9),
('Terminal de Transportes', 'Terminal', 'Calle 17 # 23-40', '1985-11-05', 2000, 10);

INSERT INTO Evento (nombre_evento, descripcion, fecha_hora_inicio, fecha_hora_fin, lugar, organizador, id_ciudad) VALUES
('Festival Folclórico Iquireño', 'Celebración anual de la cultura local con música y danza.', '2025-08-10 18:00:00', '2025-08-15 23:00:00', 'Parque Central', 'Alcaldía de Iquira', 1),
('Maratón Iquira 10K', 'Carrera atlética por las calles principales.', '2025-09-20 07:00:00', '2025-09-20 11:00:00', 'Principales Vías de la Ciudad', 'Club Deportivo Iquira', 1),
('Concierto de Verano', 'Evento musical con artistas locales.', '2025-07-25 20:00:00', '2025-07-25 23:00:00', 'Parque Central', 'Casa de la Cultura', 2),
('Feria del Libro de Neiva', 'Feria anual para amantes de la lectura.', '2025-10-15 09:00:00', '2025-10-20 20:00:00', 'Centro de Convenciones', 'Secretaría de Cultura', 2),
('Desfile de Carrozas', 'Desfile con temática cultural.', '2025-11-01 14:00:00', '2025-11-01 18:00:00', 'Calles del Centro', 'Oficina de Turismo', 3),
('Congreso de Tecnología', 'Evento para profesionales de la tecnología.', '2025-04-10 08:00:00', '2025-04-12 17:00:00', 'Plaza Mayor', 'Tech Innova', 4),
('Festival de Cine', 'Proyección de películas independientes.', '2025-06-05 18:00:00', '2025-06-08 22:00:00', 'Cine Colombia', 'Cine Club', 5),
('Semana del Emprendimiento', 'Charlas y talleres para nuevos emprendedores.', '2025-03-20 09:00:00', '2025-03-24 17:00:00', 'Centro de Convenciones', 'Cámara de Comercio', 6),
('Torneo de Ajedrez', 'Competencia de ajedrez municipal.', '2025-02-14 10:00:00', '2025-02-15 18:00:00', 'Biblioteca Pública', 'Club de Ajedrez', 7),
('Exposición de Arte', 'Muestra de obras de artistas locales.', '2025-05-18 11:00:00', '2025-05-25 19:00:00', 'Casa de la Cultura', 'Galería de Arte', 8);
