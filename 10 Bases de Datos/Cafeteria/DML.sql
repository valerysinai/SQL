USE CafeteriaDB2;
GO

-- DML
INSERT INTO CategoriaProducto (nombre_categoria, descripcion_categoria) VALUES
('Bebidas Calientes', 'Cafés, tés y otras bebidas que se sirven calientes.'),
('Bebidas Frías', 'Refrescos, jugos y cafés fríos.'),
('Panadería', 'Panes, croissants, muffins y bollería.'),
('Postres', 'Pasteles, tartas y dulces.'),
('Sandwiches', 'Variedad de sandwiches y wraps.'),
('Ensaladas', 'Ensaladas frescas y saludables.'),
('Snacks', 'Galletas, papas y otros aperitivos.'),
('Jugos Naturales', 'Jugos hechos de frutas frescas.'),
('Sopas', 'Sopas del día.'),
('Desayunos', 'Platillos especiales para el desayuno.');

INSERT INTO Producto (nombre_producto, descripcion_producto, precio_unitario, stock_actual, id_categoria) VALUES
('Espresso Doble', 'Café concentrado de 60ml.', 3.00, 100, 1),
('Latte Vainilla', 'Café con leche y sirope de vainilla.', 4.50, 80, 1),
('Croissant de Mantequilla', 'Croissant francés recién horneado.', 2.50, 50, 3),
('Cheesecake de Fresa', 'Porción de tarta de queso con fresas.', 5.00, 20, 4),
('Sandwich de Jamón y Queso', 'Sandwich clásico con pan artesanal.', 6.00, 30, 5),
('Ensalada César', 'Ensalada con lechuga, crutones y aderezo César.', 7.50, 25, 6),
('Galletas de Avena', 'Galletas caseras de avena y pasas.', 1.50, 60, 7),
('Jugo de Naranja', 'Jugo de naranja recién exprimido.', 4.00, 50, 8),
('Sopa de Tomate', 'Sopa cremosa de tomate con albahaca.', 5.50, 15, 9),
('Huevos Revueltos', 'Huevos revueltos con tostadas y tocineta.', 8.00, 20, 10);

INSERT INTO Empleado (nombre_empleado, apellido_empleado, cargo, fecha_contratacion, salario, email, telefono) VALUES
('Sofía', 'García', 'Barista', '2024-01-15', 1200.00, 'sofia.garcia@cafeteria.com', '3101112233'),
('Pedro', 'López', 'Cajero', '2023-07-01', 1100.00, 'pedro.lopez@cafeteria.com', '3204445566'),
('Ana', 'Pérez', 'Gerente', '2022-05-20', 1800.00, 'ana.perez@cafeteria.com', '3112223344'),
('Juan', 'Martínez', 'Barista', '2024-02-10', 1250.00, 'juan.martinez@cafeteria.com', '3123334455'),
('Luisa', 'Castro', 'Cocinera', '2023-09-01', 1300.00, 'luisa.castro@cafeteria.com', '3134445566'),
('Carlos', 'Sánchez', 'Auxiliar', '2024-03-05', 1000.00, 'carlos.sanchez@cafeteria.com', '3145556677'),
('Valeria', 'Díaz', 'Barista', '2024-06-12', 1200.00, 'valeria.diaz@cafeteria.com', '3156667788'),
('Felipe', 'Ruiz', 'Cajero', '2023-11-20', 1150.00, 'felipe.ruiz@cafeteria.com', '3167778899'),
('Gabriela', 'Hernández', 'Limpieza', '2024-04-01', 950.00, 'gabriela.h@cafeteria.com', '3178889900'),
('David', 'Mora', 'Barista', '2024-07-01', 1200.00, 'david.mora@cafeteria.com', '3189990011');

INSERT INTO Cliente (nombre_cliente, apellido_cliente, email, telefono, puntos_fidelidad) VALUES
('Ana', 'Martínez', 'ana.martinez@email.com', '3111111111', 150),
('Juan', 'Rodríguez', 'juan.rodriguez@email.com', '3122222222', 200),
('Sofía', 'López', 'sofia.lopez@email.com', '3133333333', 50),
('Diego', 'Gómez', 'diego.gomez@email.com', '3144444444', 300),
('Valentina', 'Díaz', 'valentina.diaz@email.com', '3155555555', 75),
('Mateo', 'Pérez', 'mateo.perez@email.com', '3166666666', 120),
('Lucía', 'Castro', 'lucia.castro@email.com', '3177777777', 180),
('Andrés', 'Sánchez', 'andres.sanchez@email.com', '3188888888', 250),
('Paula', 'Ramírez', 'paula.ramirez@email.com', '3199999999', 90),
('Jorge', 'Hernández', 'jorge.h@email.com', '3200000000', 40);

INSERT INTO Pedido (id_cliente, id_empleado, fecha_hora_pedido, total_pedido, estado_pedido, tipo_pago) VALUES
(1, 1, '2025-07-13 10:00:00', 0.00, 'Completado', 'Tarjeta'),
(2, 2, '2025-07-13 10:15:00', 0.00, 'Completado', 'Efectivo'),
(NULL, 1, '2025-07-13 10:20:00', 0.00, 'Completado', 'Efectivo'),
(3, 4, '2025-07-13 11:00:00', 0.00, 'Pendiente', 'Tarjeta'),
(4, 5, '2025-07-13 11:30:00', 0.00, 'Completado', 'Efectivo'),
(5, 6, '2025-07-13 12:00:00', 0.00, 'Completado', 'Tarjeta'),
(6, 7, '2025-07-13 12:30:00', 0.00, 'Completado', 'Efectivo'),
(7, 8, '2025-07-13 13:00:00', 0.00, 'Pendiente', 'Tarjeta'),
(8, 9, '2025-07-13 13:30:00', 0.00, 'Completado', 'Efectivo'),
(9, 10, '2025-07-13 14:00:00', 0.00, 'Completado', 'Tarjeta');

INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario_al_momento, subtotal) VALUES
(1, 1, 1, 3.00, 3.00),
(1, 3, 1, 2.50, 2.50),
(2, 2, 1, 4.50, 4.50),
(2, 4, 1, 5.00, 5.00),
(3, 1, 2, 3.00, 6.00),
(4, 5, 1, 6.00, 6.00),
(5, 6, 2, 7.50, 15.00),
(6, 7, 3, 1.50, 4.50),
(7, 8, 1, 4.00, 4.00),
(8, 9, 2, 5.50, 11.00);

UPDATE Pedido
SET total_pedido = (
    SELECT SUM(DP.subtotal)
    FROM DetallePedido DP
    WHERE DP.id_pedido = Pedido.id_pedido
);

INSERT INTO Proveedor (nombre_proveedor, tipo_suministro, telefono_contacto, email_contacto, direccion_proveedor) VALUES
('Café de Colombia S.A.', 'Café', '6011234567', 'ventas@cafecolombia.com', 'Calle 100 # 10-20, Bogotá'),
('Panes Frescos Ltda.', 'Panadería', '6017890123', 'info@panesfrescos.com', 'Carrera 50 # 5-10, Bogotá'),
('Lácteos del Campo', 'Lácteos', '6019876543', 'info@lacteoscampo.com', 'Vía La Calera Km 5, Cundinamarca'),
('Dulces y Más', 'Azúcar y dulces', '6012345678', 'ventas@dulcesymas.com', 'Avenida Caracas # 15-30, Bogotá'),
('Vegetales El Huerto', 'Vegetales', '6018765432', 'contacto@elhuerto.com', 'Finca El Huerto, Guasca'),
('Carnes La Fina', 'Carnes', '6015432109', 'pedidos@carneslafina.com', 'Calle 80 # 25-50, Bogotá'),
('Granos y Especias', 'Granos', '6013210987', 'info@granosyespecias.com', 'Avenida 68 # 45-60, Bogotá'),
('Frutas Frescas SAS', 'Frutas', '6010987654', 'info@frutasfrescas.com', 'Corabastos, Bogotá'),
('Empaques Eco', 'Empaques', '6011239876', 'contacto@empaqueseco.com', 'Zona Industrial, Funza'),
('Huevos El Gallinero', 'Huevos', '6019871234', 'ventas@elgallinero.com', 'Granja El Gallinero, Tabio');

INSERT INTO Suministro (id_producto, id_proveedor, fecha_ultimo_pedido, costo_unidad_compra, tiempo_entrega_dias) VALUES
(1, 1, '2025-07-01', 1.50, 3),
(2, 1, '2025-07-01', 2.00, 3),
(3, 2, '2025-07-05', 1.00, 2),
(4, 4, '2025-07-06', 2.50, 4),
(5, 6, '2025-07-07', 3.00, 2),
(6, 5, '2025-07-08', 4.00, 1),
(7, 7, '2025-07-09', 0.50, 3),
(8, 8, '2025-07-10', 2.00, 1),
(9, 5, '2025-07-11', 2.50, 2),
(10, 10, '2025-07-12', 4.00, 1);