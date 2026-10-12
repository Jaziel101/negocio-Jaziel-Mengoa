-- 1. Productos con el nombre de su categoría, ordenados por nombre
SELECT p.nombre AS producto, c.nombre AS categoria, p.precio
FROM productos p
JOIN categorias c ON p.categoria_id = c.id
ORDER BY p.nombre;

-- 2. Productos con menos de 5 unidades en stock
SELECT nombre, stock
FROM productos
WHERE stock < 5;

-- 3. Precio promedio por categoría
SELECT c.nombre AS categoria, ROUND(AVG(p.precio), 2) AS precio_promedio
FROM productos p
JOIN categorias c ON p.categoria_id = c.id
GROUP BY c.nombre
ORDER BY precio_promedio DESC;

-- 4. Pedidos de un cliente con su fecha y estado (cliente_id = 1)
SELECT pe.id AS pedido, cl.nombre AS cliente, pe.fecha, pe.estado
FROM pedidos pe
JOIN clientes cl ON pe.cliente_id = cl.id
WHERE cl.id = 1
ORDER BY pe.fecha;

-- 5. Total en dinero de cada pedido
SELECT pe.id AS pedido,
       SUM(d.cantidad * d.precio_unitario) AS total
FROM pedidos pe
JOIN detalle_pedido d ON d.pedido_id = pe.id
GROUP BY pe.id
ORDER BY pe.id;

-- 6. Clientes con más de 2 pedidos
SELECT cl.nombre, COUNT(pe.id) AS total_pedidos
FROM clientes cl
JOIN pedidos pe ON pe.cliente_id = cl.id
GROUP BY cl.nombre
HAVING COUNT(pe.id) > 2;

-- 7. Eliminar un cliente sin pedidos
DELETE FROM clientes
WHERE id NOT IN (SELECT DISTINCT cliente_id FROM pedidos);