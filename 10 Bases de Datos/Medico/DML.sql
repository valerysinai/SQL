USE medico2;
GO

-- DML
INSERT INTO Especialidad (nombre_especialidad, descripcion_especialidad) VALUES
('Cardiología', 'Diagnóstico y tratamiento de enfermedades del corazón.'),
('Pediatría', 'Atención médica de niños y adolescentes.'),
('Dermatología', 'Tratamiento de enfermedades de la piel, cabello y uñas.'),
('Medicina General', 'Atención primaria de salud.'),
('Ginecología', 'Salud del sistema reproductivo femenino.'),
('Neurología', 'Tratamiento de trastornos del sistema nervioso.'),
('Ortopedia', 'Diagnóstico y tratamiento de lesiones del sistema musculoesquelético.'),
('Oftalmología', 'Tratamiento de enfermedades oculares.'),
('Urología', 'Salud del tracto urinario y sistema reproductor masculino.'),
('Otorrinolaringología', 'Diagnóstico y tratamiento de oídos, nariz y garganta.');

INSERT INTO Medico (nombre_medico, apellido_medico, licencia_medica, telefono_contacto, email, direccion_consultorio, id_especialidad_principal) VALUES
('Juan', 'Pérez', 'MP12345', '3001234567', 'juan.perez@clinica.com', 'Calle 10 # 15-20, Cons. 101', 1),
('Ana', 'Gómez', 'MP67890', '3019876543', 'ana.gomez@clinica.com', 'Calle 10 # 15-20, Cons. 203', 2),
('Luis', 'Fernández', 'MP11223', '3023456789', 'luis.fernandez@clinica.com', 'Avenida Principal 50-05, Cons. 301', 4),
('Laura', 'Díaz', 'MP44556', '3034567890', 'laura.diaz@clinica.com', 'Calle 10 # 15-20, Cons. 301', 3),
('Daniel', 'Sánchez', 'MP77889', '3045678901', 'daniel.sanchez@clinica.com', 'Carrera 8 # 25-10, Cons. 402', 5),
('Sofía', 'Castro', 'MP99001', '3056789012', 'sofia.castro@clinica.com', 'Avenida 60 # 10-50, Cons. 505', 6),
('Andrés', 'García', 'MP22334', '3067890123', 'andres.garcia@clinica.com', 'Calle 10 # 15-20, Cons. 101', 7),
('Valeria', 'López', 'MP55667', '3078901234', 'valeria.lopez@clinica.com', 'Calle 10 # 15-20, Cons. 203', 8),
('Felipe', 'Morales', 'MP88990', '3089012345', 'felipe.morales@clinica.com', 'Avenida Principal 50-05, Cons. 301', 9),
('Camila', 'Torres', 'MP11002', '3090123456', 'camila.torres@clinica.com', 'Carrera 8 # 25-10, Cons. 402', 10);

INSERT INTO Paciente (nombre_paciente, apellido_paciente, fecha_nacimiento, genero, dni, telefono_contacto, email, direccion_residencia, tipo_sangre, alergias) VALUES
('María', 'López', '1985-03-10', 'Femenino', '101010101', '3055551122', 'maria.lopez@email.com', 'Carrera 7 # 2-30', 'O+', 'Penicilina'),
('Carlos', 'Ramírez', '2010-11-25', 'Masculino', '202020202', '3066663344', 'carlos.ramirez@email.com', 'Transversal 3 # 8-15', 'A-', NULL),
('Ana', 'Gómez', '1992-05-18', 'Femenino', '303030303', '3077774455', 'ana.gomez@email.com', 'Avenida 20 # 1-50', 'B+', 'Ninguna'),
('Pedro', 'Sánchez', '1970-08-01', 'Masculino', '404040404', '3088885566', 'pedro.sanchez@email.com', 'Calle 50 # 30-10', 'AB-', 'Aspirina'),
('Sofía', 'Díaz', '2005-09-09', 'Femenino', '505050505', '3099996677', 'sofia.diaz@email.com', 'Carrera 15 # 2-45', 'O-', NULL),
('Luis', 'Castro', '1965-01-20', 'Masculino', '606060606', '3100007788', 'luis.castro@email.com', 'Calle 100 # 5-60', 'A+', NULL),
('Valentina', 'Pérez', '1999-12-12', 'Femenino', '707070707', '3111118899', 'valentina.perez@email.com', 'Transversal 12 # 9-80', 'B-', 'Mariscos'),
('Javier', 'Rodríguez', '1980-04-05', 'Masculino', '808080808', '3122229900', 'javier.rodriguez@email.com', 'Avenida 30 # 40-50', 'O+', NULL),
('Lucía', 'Fernández', '2015-06-30', 'Femenino', '909090909', '3133330011', 'lucia.fernandez@email.com', 'Carrera 5 # 10-10', 'A-', NULL),
('Mauricio', 'Soto', '1990-10-10', 'Masculino', '100100100', '3144441122', 'mauricio.soto@email.com', 'Calle 80 # 2-30', 'AB+', 'Yodo');

INSERT INTO HistorialMedico (id_paciente, antecedentes_familiares, antecedentes_personales, medicamentos_actuales) VALUES
(1, 'Hipertensión, Diabetes', 'Asma infantil', 'Omeprazol (si es necesario)'),
(2, 'Ninguno relevante', 'Varicela a los 5 años', 'Ninguno'),
(3, 'Cáncer de mama', 'Sin historial de enfermedades crónicas', 'Anticonceptivos'),
(4, 'Enfermedad cardíaca', 'Cirugía de apéndice', 'Aspirina'),
(5, 'Migrañas', 'Alergias estacionales', 'Ninguno'),
(6, 'Diabetes tipo 2', 'Fractura de pierna en la infancia', 'Metformina'),
(7, 'Hipertiroidismo', 'Ninguno', 'Levotiroxina'),
(8, 'Enfermedad renal', 'Cálculos renales', 'Ninguno'),
(9, 'Asma', 'Ninguno', 'Inhalador de salbutamol'),
(10, 'Enfermedad tiroidea', 'Alergia a mariscos', 'Ninguno');

INSERT INTO Cita (id_paciente, id_medico, fecha_hora_cita, motivo_cita, estado_cita, duracion_minutos) VALUES
(1, 1, '2025-07-20 09:00:00', 'Chequeo cardiológico', 'Completada', 45),
(2, 2, '2025-07-21 10:30:00', 'Control de crecimiento', 'Completada', 30),
(1, 3, '2025-07-22 11:00:00', 'Consulta por dolor de cabeza', 'Programada', 30),
(3, 4, '2025-07-22 15:00:00', 'Revisión de manchas en la piel', 'Confirmada', 30),
(4, 1, '2025-07-23 09:30:00', 'Control de presión arterial', 'Programada', 30),
(5, 6, '2025-07-23 10:00:00', 'Revisión por migrañas', 'Cancelada', 45),
(6, 7, '2025-07-24 08:00:00', 'Revisión de rodilla', 'Programada', 60),
(7, 5, '2025-07-24 14:00:00', 'Chequeo ginecológico anual', 'Confirmada', 45),
(8, 9, '2025-07-25 16:00:00', 'Dolor abdominal', 'Programada', 40),
(9, 2, '2025-07-26 10:00:00', 'Chequeo de rutina', 'Confirmada', 30);

INSERT INTO ConsultaMedica (id_consulta, id_cita, id_medico, id_paciente, fecha_hora_consulta, motivo_consulta_detalle, examen_fisico, observaciones, procedimientos_realizados, plan_tratamiento) VALUES
(1, 1, 1, 1, '2025-07-20 09:00:00', 'Paciente refiere palpitaciones ocasionales.', 'PA 130/80, FC 75, Ruidos cardíacos normales.', 'Se recomienda EKG y holter.', 'Electrocardiograma (EKG)', 'Programar Holter. Revisión en 1 semana.'),
(2, 2, 2, 2, '2025-07-21 10:30:00', 'Control rutinario pediátrico.', 'Peso y talla en percentil 50. Auscultación pulmonar normal.', 'Desarrollo adecuado para la edad.', 'Ninguno', 'Seguir con controles anuales. Dieta balanceada.'),
(3, 3, 3, 1, '2025-07-22 11:00:00', 'Paciente con dolor de cabeza persistente.', 'Examen neurológico básico sin hallazgos.', 'Se descartan signos de alarma. Posible cefalea tensional.', 'Ninguno', 'Prescribir analgésicos. Cita de control si persiste.'),
(4, 4, 4, 3, '2025-07-22 15:00:00', 'Paciente presenta lesiones sospechosas en la piel.', 'Se observa lesión de 5mm, bordes irregulares.', 'Se realizará biopsia para descartar malignidad.', 'Biopsia', 'Agendar procedimiento. Cita de seguimiento en 2 semanas.'),
(5, 5, 1, 4, '2025-07-23 09:30:00', 'Control de hipertensión.', 'PA 145/95. FC 80.', 'La presión arterial sigue alta. Es necesario ajustar la dosis.', 'Ninguno', 'Ajustar dosis de Amlodipino. Control en 1 mes.'),
(6, 7, 7, 6, '2025-07-24 08:00:00', 'Dolor en la rodilla izquierda.', 'Inflamación y dolor en el movimiento.', 'Posible lesión de menisco. Se requiere resonancia magnética.', 'Ninguno', 'Programar RM de rodilla. Evitar actividad física.'),
(7, 8, 5, 7, '2025-07-24 14:00:00', 'Revisión ginecológica.', 'Examen normal.', 'Chequeo de rutina. Todo en orden.', 'Papanicolaou', 'Continuar con revisiones anuales.'),
(8, 9, 2, 9, '2025-07-26 10:00:00', 'Control rutinario pediátrico.', 'Peso y talla en percentil 75. Auscultación normal.', 'Desarrollo adecuado. Talla acorde a su edad.', 'Ninguno', 'Continuar con controles anuales. Dieta y ejercicio.'),
(9, 6, 6, 5, '2025-07-23 10:00:00', 'Migrañas frecuentes.', 'Examen neurológico básico sin hallazgos.', 'Se sospecha de migraña con aura. Se requiere una evaluación más detallada.', 'Ninguno', 'Remitir a neurología. Prescribir analgésicos específicos.'),
(10, 10, 10, 9, '2025-07-25 10:30:00', 'Revisión por dolor de garganta.', 'Amígdalas inflamadas, presencia de pus.', 'Diagnóstico de amigdalitis bacteriana.', 'Ninguno', 'Prescribir antibióticos. Reposo y líquidos.');

INSERT INTO Diagnostico (codigo_cie, nombre_diagnostico, descripcion_diagnostico) VALUES
('I10', 'Hipertensión esencial (primaria)', 'Presión arterial alta sin causa secundaria identificable.'),
('R51', 'Cefalea', 'Dolor de cabeza no especificado.'),
('Z00.0', 'Examen médico general de salud', 'Chequeo de rutina.'),
('L40.0', 'Psoriasis vulgar', 'Enfermedad cutánea autoinmune.'),
('M17', 'Gonartrosis', 'Artrosis de rodilla.'),
('N30', 'Cistitis', 'Inflamación de la vejiga urinaria.'),
('G43.9', 'Migraña sin aura', 'Dolor de cabeza severo recurrente.'),
('J02.9', 'Faringitis aguda', 'Inflamación de la faringe.'),
('H52.1', 'Miopía', 'Defecto visual donde se ve bien de cerca y mal de lejos.'),
('K21', 'Enfermedad por reflujo gastroesofágico', 'Trastorno digestivo crónico.');

INSERT INTO Prescripcion (id_consulta, nombre_medicamento, dosis, frecuencia, duracion_dias, instrucciones_especiales) VALUES
(1, 'Amlodipino', '5 mg', 'Una vez al día', 30, 'Tomar con alimentos.'),
(1, 'Losartan', '50 mg', 'Una vez al día', 30, 'Tomar por la mañana.'),
(2, 'Vitamina D', '400 UI', 'Una vez al día', 90, 'Suplemento nutricional.'),
(3, 'Ibuprofeno', '400 mg', 'Cada 8 horas', 5, 'Tomar con alimentos para evitar irritación gástrica.'),
(4, 'Clotrimazol tópico', '1%', 'Dos veces al día', 15, 'Aplicar en el área afectada.'),
(5, 'Amlodipino', '10 mg', 'Una vez al día', 30, 'Ajuste de dosis.'),
(6, 'Naproxeno', '500 mg', 'Cada 12 horas', 7, 'Antiinflamatorio.'),
(7, 'Multivitamínico', 'Una tableta', 'Una vez al día', 60, 'Complemento vitamínico.'),
(8, 'Acetaminofén', '250 mg', 'Cada 6 horas', 3, 'Para el dolor y la fiebre.'),
(9, 'Sumatriptán', '50 mg', 'Dosis única', 1, 'Tomar al inicio del dolor de cabeza.');

INSERT INTO MedicoEspecialidad (id_medico, id_especialidad, fecha_certificacion) VALUES
(1, 4, '2015-06-01'),
(1, 1, '2018-03-10'),
(2, 4, '2016-09-01'),
(2, 2, '2019-11-20'),
(3, 4, '2017-01-15'),
(4, 3, '2020-05-05'),
(5, 5, '2019-02-28'),
(6, 6, '2021-04-12'),
(7, 7, '2018-08-08'),
(8, 8, '2022-01-25');