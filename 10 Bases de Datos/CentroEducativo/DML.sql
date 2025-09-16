USE CentroEducativo2;
GO

-- DML
INSERT INTO Profesor (nombre_profesor, apellido_profesor, fecha_contratacion, email, telefono) VALUES
('Carlos', 'Ramírez', '2020-08-15', 'carlos.ramirez@educativo.com', '3101112233'),
('Laura', 'Martínez', '2021-02-01', 'laura.martinez@educativo.com', '3204445566'),
('Ana', 'Gómez', '2019-01-10', 'ana.gomez@educativo.com', '3112223344'),
('Pedro', 'Sánchez', '2022-07-05', 'pedro.sanchez@educativo.com', '3125556677'),
('Sofía', 'López', '2018-03-20', 'sofia.lopez@educativo.com', '3138889900'),
('Juan', 'Díaz', '2023-01-10', 'juan.diaz@educativo.com', '3141110022'),
('María', 'Pérez', '2020-05-18', 'maria.perez@educativo.com', '3157778899'),
('José', 'Hernández', '2022-11-25', 'jose.hernandez@educativo.com', '3164445566'),
('Valentina', 'Ruiz', '2019-09-01', 'valentina.ruiz@educativo.com', '3179998877'),
('Daniel', 'Castro', '2023-03-12', 'daniel.castro@educativo.com', '3186665544');

INSERT INTO Asignatura (nombre_asignatura, creditos, descripcion_asignatura) VALUES
('Matemáticas VII', 4, 'Álgebra y Geometría avanzada para séptimo grado.'),
('Historia de Colombia', 3, 'Estudio de los eventos históricos clave de Colombia.'),
('Física I', 5, 'Introducción a la mecánica clásica.'),
('Literatura Española', 3, 'Análisis de obras literarias españolas.'),
('Química Orgánica', 4, 'Estudio de compuestos basados en carbono.'),
('Programación Avanzada', 5, 'Desarrollo de software con estructuras de datos.'),
('Biología Celular', 4, 'Estudio de la célula y sus componentes.'),
('Educación Física', 2, 'Desarrollo de habilidades motrices y deportivas.'),
('Inglés Intermedio', 3, 'Gramática y conversación para nivel intermedio.'),
('Dibujo Técnico', 3, 'Principios de dibujo y diseño técnico.');

INSERT INTO Curso (nombre_curso, nivel_educativo, duracion_meses, id_profesor_tutor) VALUES
('Séptimo Grado A', 'Secundaria', 10, 1),
('Primer Semestre Ing. Sistemas', 'Universitario', 6, 2),
('Octavo Grado B', 'Secundaria', 10, 3),
('Segundo Semestre Adm. Empresas', 'Universitario', 6, 4),
('Noveno Grado C', 'Secundaria', 10, 5),
('Tercer Semestre Arquitectura', 'Universitario', 6, 6),
('Décimo Grado D', 'Secundaria', 10, 7),
('Cuarto Semestre Contabilidad', 'Universitario', 6, 8),
('Quinto Grado E', 'Primaria', 10, 9),
('Primer Semestre Medicina', 'Universitario', 6, 10);

INSERT INTO Estudiante (nombre_estudiante, apellido_estudiante, fecha_nacimiento, genero, email, telefono_contacto, id_curso_actual) VALUES
('Sofía', 'López', '2010-03-20', 'F', 'sofia.lopez@estudiante.com', '3157778899', 1),
('Diego', 'Sánchez', '2005-07-10', 'M', 'diego.sanchez@estudiante.com', '3189990011', 2),
('Valentina', 'Díaz', '2010-01-05', 'F', 'valentina.diaz@estudiante.com', '3123334455', 1),
('Carlos', 'Pérez', '2009-05-15', 'M', 'carlos.perez@estudiante.com', '3191112233', 3),
('Ana', 'Gómez', '2004-11-22', 'F', 'ana.gomez@estudiante.com', '3205556677', 4),
('Daniel', 'Ruiz', '2008-02-28', 'M', 'daniel.ruiz@estudiante.com', '3007778899', 5),
('Luisa', 'Castro', '2003-09-01', 'F', 'luisa.castro@estudiante.com', '3012223344', 6),
('Felipe', 'Morales', '2007-06-18', 'M', 'felipe.morales@estudiante.com', '3024445566', 7),
('Elena', 'Vargas', '2012-10-03', 'F', 'elena.vargas@estudiante.com', '3036667788', 8),
('Jorge', 'Mora', '2002-04-25', 'M', 'jorge.mora@estudiante.com', '3048889900', 9);

INSERT INTO Clase (id_asignatura, id_profesor, codigo_clase, año_academico, semestre, cupo_maximo, aula_asignada) VALUES
(1, 1, 'MAT7A-2025', 2025, '1er Semestre', 30, 'Aula 201'),
(2, 1, 'HCOL7B-2025', 2025, '1er Semestre', 25, 'Aula 202'),
(3, 2, 'FISI1-2025', 2025, '1er Semestre', 40, 'Laboratorio 305'),
(4, 3, 'LIT8C-2025', 2025, '1er Semestre', 28, 'Aula 203'),
(5, 4, 'QUIM9D-2025', 2025, '1er Semestre', 35, 'Laboratorio 306'),
(6, 5, 'PROG10E-2025', 2025, '1er Semestre', 30, 'Aula 301'),
(7, 6, 'BIO11F-2025', 2025, '1er Semestre', 20, 'Laboratorio 307'),
(8, 7, 'EDF12G-2025', 2025, '1er Semestre', 50, 'Gimnasio'),
(9, 8, 'ING13H-2025', 2025, '1er Semestre', 30, 'Aula 204'),
(10, 9, 'DIB14I-2025', 2025, '1er Semestre', 22, 'Taller 401');

INSERT INTO Matricula (id_estudiante, id_clase, calificacion_final) VALUES
(1, 1, NULL),
(1, 2, NULL),
(2, 3, NULL),
(3, 1, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL);

INSERT INTO Calificacion (id_matricula, tipo_evaluacion, fecha_evaluacion, nota_obtenida, peso_en_promedio) VALUES
(1, 'Quiz', '2025-07-20', 4.0, 0.2),
(1, 'Examen', '2025-08-10', 4.5, 0.4),
(2, 'Proyecto', '2025-09-01', 3.8, 0.3),
(3, 'Quiz', '2025-07-25', 3.5, 0.2),
(4, 'Examen', '2025-08-15', 4.2, 0.4),
(5, 'Laboratorio', '2025-09-05', 4.1, 0.5),
(6, 'Examen Parcial', '2025-09-10', 4.8, 0.4),
(7, 'Informe', '2025-08-20', 3.9, 0.3),
(8, 'Actividad en Clase', '2025-09-12', 4.7, 0.1),
(9, 'Tarea', '2025-09-08', 4.3, 0.2);
