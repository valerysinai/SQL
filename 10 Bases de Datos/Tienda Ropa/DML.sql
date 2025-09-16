USE TiendaRopa2;
GO

-- DML
INSERT INTO Categoria (nombre_categoria, descripcion_categoria) VALUES
('Camisetas', 'Prendas superiores para hombre y mujer.'),
('Pantalones', 'Prendas inferiores para hombre y mujer.'),
('Accesorios', 'Complementos como gorras, bufandas, etc.'),
('Calzado', 'Todo tipo de zapatos y zapatillas.'),
('Abrigos', 'Chaquetas, suéteres y otras prendas de abrigo.'),
('Vestidos', 'Vestidos de diferentes estilos y para ocasiones variadas.'),
('Ropa Interior', 'Ropa interior para hombre y mujer.'),
('Ropa Deportiva', 'Prendas y accesorios para actividades físicas.'),
('Bolsos', 'Bolsos y carteras de diferentes tamaños y materiales.'),
('Trajes de baño', 'Prendas para usar en la playa o piscina.');

INSERT INTO Producto (nombre_producto, descripcion_producto, precio_unitario, stock_disponible, url_imagen, id_categoria) VALUES
('Camiseta Algodón Orgánico', 'Camiseta básica de algodón 100% orgánico.', 25.00, 100, NULL, 1),
('Jean Slim Fit', 'Jean moderno con corte ajustado.', 50.00, 70, NULL, 2),
('Gorra Clásica', 'Gorra ajustable con logo bordado.', 15.00, 50, NULL, 3),
('Zapatillas de Cuero', 'Zapatillas casuales de cuero genuino.', 80.00, 45, NULL, 4),
('Chaqueta de Invierno', 'Chaqueta abrigada con forro interior.', 120.00, 30, NULL, 5),
('Vestido de Verano', 'Vestido ligero y fresco para el verano.', 60.00, 55, NULL, 6),
('Boxers de Algodón', 'Boxers cómodos de algodón.', 10.00, 200, NULL, 7),
('Leggings de Entrenamiento', 'Leggings elásticos para deporte.', 35.00, 80, NULL, 8),
('Bolso de Cuero Negro', 'Bolso elegante y espacioso.', 90.00, 25, NULL, 9),
('Bikini Floral', 'Bikini con estampado floral.', 45.00, 65, NULL, 10);

INSERT INTO Cliente (nombre_cliente, apellido_cliente, email, telefono, direccion_envio) VALUES
('Ana', 'Ruiz', 'ana.ruiz@example.com', '3101234567', 'Calle 1 # 10-20, Iquira'),
('Pedro', 'Gómez', 'pedro.gomez@example.com', '3209876543', 'Carrera 5 # 3-15, Iquira'),
('Luis', 'Torres', 'luis.torres@example.com', '3001112233', 'Avenida 10 # 8-50, Neiva'),
('Sofía', 'García', 'sofia.garcia@example.com', '3157778899', 'Calle 25 # 12-30, Ibagué'),
('Carlos', 'Díaz', 'carlos.diaz@example.com', '3189990011', 'Carrera 30 # 2-45, Bogotá'),
('Laura', 'Pérez', 'laura.perez@example.com', '3216667788', 'Avenida 80 # 50-60, Medellín'),
('José', 'Martínez', 'jose.martinez@example.com', '3045556677', 'Calle 72 # 11-12, Barranquilla'),
('Daniela', 'Rodríguez', 'daniela.rodriguez@example.com', '3178889900', 'Carrera 40 # 50-60, Cali'),
('Andrés', 'Hernández', 'andres.hernandez@example.com', '3114445566', 'Calle 26 # 7-80, Bucaramanga'),
('María', 'López', 'maria.lopez@example.com', '3132223344', 'Avenida 80 # 25-50, Pereira');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, total_pedido) VALUES
(1, '2025-09-10', 'Entregado', 75.00),
(2, '2025-09-11', 'Enviado', 30.00),
(3, '2025-09-12', 'Pendiente', 0.00),
(4, '2025-09-13', 'Entregado', 150.00),
(5, '2025-09-14', 'Enviado', 90.00),
(6, '2025-09-14', 'Pendiente', 0.00),
(7, '2025-09-13', 'Entregado', 180.00),
(8, '2025-09-12', 'Enviado', 60.00),
(9, '2025-09-11', 'Pendiente', 0.00),
(10, '2025-09-10', 'Entregado', 90.00);

INSERT INTO VarianteProducto (id_producto, talla, color, stock_variante, sku_variante) VALUES
(1, 'S', 'Blanco', 35, 'CAM-ALG-S-BLA'),
(1, 'M', 'Blanco', 30, 'CAM-ALG-M-BLA'),
(1, 'L', 'Negro', 20, 'CAM-ALG-L-NEG'),
(1, 'XL', 'Gris', 15, 'CAM-ALG-XL-GRI'),
(2, '30', 'Azul Oscuro', 18, 'JEAN-SLIM-30-AZO'),
(2, '32', 'Azul', 25, 'JEAN-SLIM-32-AZU'),
(2, '34', 'Negro', 15, 'JEAN-SLIM-34-NEG'),
(3, 'Única', 'Rojo', 10, 'GOR-CLA-UNI-ROJ'),
(3, 'Única', 'Azul', 15, 'GOR-CLA-UNI-AZU'),
(4, '40', 'Blanco', 12, 'ZAP-CUE-40-BLA');

INSERT INTO DetallePedido (id_pedido, id_variante, cantidad, precio_unitario_al_momento, subtotal) VALUES
(1, 2, 1, 25.00, 25.00),
(1, 6, 1, 50.00, 50.00),
(2, 8, 2, 15.00, 30.00),
(3, 10, 1, 80.00, 80.00),
(4, 9, 3, 15.00, 45.00),
(5, 7, 1, 50.00, 50.00),
(6, 4, 2, 25.00, 50.00),
(7, 3, 1, 25.00, 25.00),
(8, 1, 1, 25.00, 25.00),
(9, 5, 1, 50.00, 50.00);

INSERT INTO HistorialStock (id_variante, tipo_cambio, cantidad_cambiada, stock_resultante) VALUES
(2, 'Salida', 1, 29),
(6, 'Salida', 1, 24),
(8, 'Salida', 2, 8),
(10, 'Salida', 1, 11),
(9, 'Salida', 3, 12),
(7, 'Salida', 1, 14),
(4, 'Salida', 2, 13),
(3, 'Salida', 1, 19),
(1, 'Salida', 1, 34),
(5, 'Salida', 1, 17);