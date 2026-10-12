INSERT INTO categorias (nombre) VALUES
('Bebidas'), ('Snacks'), ('Lácteos');

INSERT INTO productos (nombre, categoria_id, precio, stock) VALUES
('Coca Cola 500ml',     1,  5.50, 40),
('Pepsi 500ml',         1,  5.00, 35),
('Agua Mineral 1L',     1,  3.00,  3),
('Jugo de Naranja 1L',  1,  8.50,  4),
('Papas Fritas 200g',   2,  7.00, 25),
('Chocolate Barra',     2,  6.50, 30),
('Galletas Surtidas',   2,  4.00,  2),
('Maní Salado 150g',    2,  5.50, 18),
('Leche Entera 1L',     3,  7.50, 22),
('Yogurt Natural 1L',   3,  9.00, 15),
('Queso Fresco 500g',   3, 15.00,  4),
('Mantequilla 250g',    3, 12.00, 10);

INSERT INTO clientes (nombre, telefono, email) VALUES
('Ana Torres',     '70011111', 'ana.torres@mail.com'),
('Luis Rojas',     '70022222', 'luis.rojas@mail.com'),
('Carla Méndez',   '70033333', 'carla.mendez@mail.com'),
('Pedro Vargas',   '70044444', 'pedro.vargas@mail.com'),
('María Quispe',   '70055555', 'maria.quispe@mail.com'),
('Jorge Salazar',  '70066666', 'jorge.salazar@mail.com');

INSERT INTO pedidos (cliente_id, fecha, estado) VALUES
(1, '2026-09-01', 'entregado'),
(1, '2026-09-10', 'entregado'),
(1, '2026-09-20', 'pendiente'),
(2, '2026-09-05', 'entregado'),
(3, '2026-09-08', 'pendiente'),
(3, '2026-09-15', 'entregado'),
(4, '2026-09-12', 'cancelado'),
(5, '2026-09-18', 'entregado'),
(6, '2026-09-22', 'pendiente'),
(6, '2026-09-25', 'entregado');

INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1,1,2,5.50),(1,5,1,7.00),(1,9,3,7.50),
(2,2,1,5.00),(2,6,2,6.50),
(3,3,4,3.00),(3,7,2,4.00),(3,10,1,9.00),
(4,4,2,8.50),(4,8,3,5.50),(4,11,1,15.00),
(5,1,1,5.50),(5,2,1,5.00),(5,5,2,7.00),
(6,9,2,7.50),(6,12,1,12.00),
(7,6,3,6.50),(7,7,2,4.00),
(8,3,5,3.00),(8,4,2,8.50),(8,10,2,9.00),
(9,11,1,15.00),(9,12,2,12.00),
(10,1,3,5.50),(10,5,2,7.00);