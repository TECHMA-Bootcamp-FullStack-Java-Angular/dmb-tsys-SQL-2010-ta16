
/********************************
        TA16 - EJERCICIO 1 
*********************************/

USE actividades;

# 1.1 Obtener los nombres de los productos de la tienda.
SELECT nombre FROM articulos;

# 1.2 Obtener los nombres y los precios de los productos de la tienda.
SELECT nombre, precio FROM articulos;

# 1.3 Obtener el nombre de los productos cuyo precio sea menor o igual a 200 €.
SELECT nombre FROM articulos WHERE precio <= 200;

# 1.4 Obtener todos los datos de los artículos cuyo precio esté entre los 60 € y los 120 € (ambas cantidades incluidas).
SELECT * FROM articulos WHERE precio BETWEEN 60 AND 120;

# 1.5 Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166'386)
SELECT nombre, precio*166.386 AS "Ptas." FROM articulos;

# 1.6. Seleccionar el precio medio de todos los productos.
SELECT AVG(precio) FROM articulos;

# 1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
SELECT AVG(precio) FROM articulos WHERE fabricante = 2;

# 1.8. Obtener el numero de artículos cuyo precio sea mayor o igual a 180 €.
SELECT COUNT(codigo) FROM articulos WHERE precio >= 180;

# 1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 € y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT nombre, precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

# 1.10. Obtener un listado completo de artículos, incluyendo por cada articulo los datos del articulo y de su fabricante.
SELECT articulos.*, fabricantes.* FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo;

# 1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo;

# 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
SELECT AVG(articulos.precio), fabricantes.codigo AS "Codigo de Fabricante" FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo GROUP BY articulos.fabricante;

# 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT AVG(articulos.precio), fabricantes.nombre AS "Nombre del Fabricante" FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo GROUP BY articulos.fabricante;

# 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor 0 igual a 150 €.
SELECT fabricantes.nombre AS "Nombre del fabricante" FROM fabricantes INNER JOIN articulos ON articulos.fabricante = fabricantes.codigo GROUP BY articulos.fabricante HAVING AVG (articulos.precio) >= 150;

# 1.15. Obtener el nombre y precio del artículo más barato.
SELECT nombre, precio FROM articulos ORDER BY precio ASC LIMIT 1;

# 1.16. Obtener una lista con el nombre y precio de los artículos más caros de cada pro-veedor (incluyendo el nombre del proveedor).
SELECT fabricantes.nombre, articulos.nombre, articulos.precio FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigom WHERE articulos.precio = (SELECT MAX(precio) FROM articulos WHERE articulos.fabricante = fabricantes.codigo) GROUP BY fabricantes.nombre, articulos.precio, articulos.nombre;

# 1.17. Añadir un nuevo producto: Altavoces de 70 € (del fabricante 2)
INSERT INTO articulos (codigo, nombre, precio, fabricante) VALUES (11, "Altavoces", 70, 2);

# 1.18. Cambiar el nombre del producto 8 a "Impresora Laser”
UPDATE articulos
SET nombre = "Impresora Laser" WHERE codigo = 8;

# 1.19. Aplicar un descuento del 10% (multiplicar el precio por 0'9) a todos los productos.
UPDATE articulos SET precio = precio * 0.9 WHERE codigo > 0;

# 1.20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual 212€.
UPDATE articulos SET precio = precio - 10 WHERE precio >= 120;