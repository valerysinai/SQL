USE Pasteleria2;
GO

INSERT INTO CategoriaProducto (nombre_categoria, descripcion_categoria) VALUES
('Pasteles de Boda', 'Pasteles elegantes y personalizados para bodas.'),
('Cupcakes', 'Pequeños pasteles decorados, perfectos para cualquier ocasión.'),
('Tartas Frías', 'Postres sin horno, ideales para climas cálidos.'),
('Muffins', 'Variedad de muffins dulces y salados.'),
('Bizcochos', 'Bizcochos esponjosos para el desayuno o la merienda.'),
('Bocadillos Salados', 'Empanadas, quiches y otros productos salados.'),
('Pan de Dulce', 'Panes suaves con azucar, pasas o mermelada.'),
('Donas', 'Clásicas y creativas donas glaseadas.'),
('Panaderia Regional', 'Especialidades de panaderia de diferentes regiones.'),
('Bebidas', 'Bebidas calientes y frías para acompañar los postres.');

INSERT INTO Ingrediente (nombre_ingrediente, unidad_medida, stock_actual) VALUES
('Polvo para Hornear', 'gramos', 2500),
('Vainilla', 'mililitros', 5000),
('Canela', 'gramos', 1500),
('Sal', 'gramos', 10000),
('Cacao en Polvo', 'gramos', 4000),
('Fresas', 'gramos', 2000),
('Nueces', 'gramos', 3000),
('Azúcar Glass', 'gramos', 5000),
('Queso Crema', 'gramos', 3000),
('Manzanas', 'unidades', 150);

INSERT INTO Producto (nombre_producto, descripcion, precio_venta, tiempo_preparacion_minutos, stock_disponible, id_categoria) VALUES
('Pastel de Vainilla y Frutas', 'Pastel ligero con crema de vainilla y frutas frescas.', 50.00, 150, 8, 5),
('Cupcake de Red Velvet', 'Cupcake de terciopelo rojo con glaseado de queso crema.', 3.50, 45, 50, 6),
('Tarta de Limón', 'Delicada tarta con relleno de limón y merengue.', 35.00, 60, 12, 7),
('Muffin de Arándanos', 'Muffin esponjoso relleno de arándanos frescos.', 2.80, 25, 40, 8),
('Bizcocho de Naranja', 'Bizcocho casero con un toque cítrico de naranja.', 9.00, 70, 20, 9),
('Empanada de Carne', 'Empanada de hojaldre rellena de carne molida.', 4.00, 30, 30, 10),
('Pan de Coco', 'Pan dulce suave con ralladura de coco.', 6.50, 90, 18, 11),
('Dona Glaseada', 'La dona clásica con un dulce glaseado de azúcar.', 1.50, 15, 60, 12),
('Pan de Banano', 'Pan húmedo con el sabor natural del banano.', 8.50, 80, 15, 13),
('Café Americano', 'Café recién molido, servido caliente.', 2.00, 5, 100, 14);

INSERT INTO Receta (id_producto, id_ingrediente, cantidad_necesaria) VALUES
(1, 1, 300), (1, 2, 400), (1, 3, 4), (1, 4, 200), (1, 5, 500), 
(2, 1, 150), (2, 2, 100), (2, 3, 1), (2, 4, 50), (2, 5, 150);

INSERT INTO Cliente (nombre_cliente, apellido_cliente, telefono_cliente, email_cliente, direccion_cliente) VALUES
('Carlos', 'Ramírez', '3123334455', 'carlos.ramirez@email.com', 'Carrera 7 # 15-20, Norte'),
('Marta', 'Vásquez', '3136667788', 'marta.vasquez@email.com', 'Calle 50 # 8-30, Sur'),
('Jorge', 'López', '3149990011', 'jorge.lopez@email.com', 'Avenida 80 # 25-50, Occidente'),
('Diana', 'Torres', '3151112233', 'diana.torres@email.com', 'Calle 100 # 3-45, Chapinero'),
('Felipe', 'Díaz', '3164445566', 'felipe.diaz@email.com', 'Carrera 15 # 60-70, Teusaquillo'),
('Paula', 'Castro', '3177778899', 'paula.castro@email.com', 'Calle 72 # 11-12, Rosales'),
('Andrés', 'Gómez', '3180001122', 'andres.gomez@email.com', 'Avenida Suba # 100-20, Suba'),
('Camila', 'Rojas', '3193334455', 'camila.rojas@email.com', 'Carrera 5 # 30-10, La Candelaria'),
('David', 'Muñoz', '3206667788', 'david.munoz@email.com', 'Calle 26 # 7-80, Centro Internacional'),
('Natalia', 'Castaño', '3219990011', 'natalia.castano@email.com', 'Carrera 40 # 50-60, Kennedy');

INSERT INTO Empleado (nombre_empleado, apellido_empleado, cargo, fecha_contratacion, salario) VALUES
('Luisa', 'Herrera', 'Panadero', '2021-08-20', 1600000.00),
('Javier', 'Sánchez', 'Cajero', '2023-03-10', 1250000.00),
('Laura', 'Gómez', 'Decorador', '2022-11-05', 1400000.00),
('Miguel', 'Castro', 'Gerente', '2020-02-14', 2500000.00),
('Carolina', 'Ríos', 'Pastelero', '2021-06-25', 1800000.00),
('Daniel', 'Morales', 'Repartidor', '2024-01-30', 1100000.00),
('Valeria', 'Páez', 'Cocinero', '2023-09-12', 1700000.00),
('Ricardo', 'Vargas', 'Ayudante General', '2022-04-18', 1000000.00),
('Juliana', 'Ochoa', 'Gerente', '2023-07-22', 2600000.00),
('Fernando', 'Cáceres', 'Cajero', '2024-02-01', 1200000.00);


INSERT INTO Pedido (id_cliente, id_empleado_recibe, fecha_entrega_estimada, estado_pedido, tipo_pago) VALUES
(4, 2, '2025-07-17 12:00:00', 'En preparación', 'Tarjeta'),
(5, 3, '2025-07-18 10:30:00', 'Pendiente', 'Efectivo'),
(6, 4, '2025-07-19 16:00:00', 'Listo', 'Tarjeta'),
(7, 5, '2025-07-20 11:00:00', 'Entregado', 'Efectivo'),
(8, 6, '2025-07-21 14:00:00', 'Pendiente', 'Tarjeta'),
(9, 7, '2025-07-22 09:00:00', 'En preparación', 'Efectivo'),
(10, 8, '2025-07-23 15:00:00', 'Listo', 'Tarjeta'),
(NULL, 9, '2025-07-24 17:00:00', 'Pendiente', 'Efectivo'),
(1, 10, '2025-07-25 10:00:00', 'En preparación', 'Tarjeta'),
(2, 1, '2025-07-26 12:30:00', 'Listo', 'Efectivo');

INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario_venta, subtotal) VALUES
(4, 5, 1, 50.00, 50.00),
(4, 6, 5, 3.50, 17.50),
(5, 7, 2, 35.00, 70.00),
(6, 8, 4, 2.80, 11.20),
(7, 9, 1, 9.00, 9.00),
(8, 10, 3, 4.00, 12.00),
(9, 11, 2, 6.50, 13.00),
(10, 12, 10, 1.50, 15.00),
(11, 13, 2, 8.50, 17.00),
(12, 14, 5, 2.00, 10.00);

UPDATE Pedido
SET total_pedido = (
    SELECT SUM(subtotal) FROM DetallePedido WHERE DetallePedido.id_pedido = Pedido.id_pedido
)
WHERE id_pedido IN (4, 5, 6, 7, 8, 9, 10, 11, 12, 13);