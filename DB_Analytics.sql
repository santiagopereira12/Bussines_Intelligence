CREATE DATABASE `heladeria`;

USE `heladeria`;

CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    valor INT NOT NULL,
    edad INT NOT NULL,
    sede VARCHAR(50) NOT NULL
);

INSERT INTO producto (nombre, valor, edad, sede) VALUES
('Paleta de Vainilla', 2500, 63, 'Girardot'),
('Botella de agua con gas', 2000, 35, 'Bogotá Norte'),
('Paleta de Vainilla', 2500, 37, 'Bogotá Sur'),
('ChocolaPotter', 8000, 24, 'Bogotá Sur'),
('Mora Explosión', 6000, 41, 'Barranquilla'),
('Menta Fresca', 3200, 63, 'Bogotá Norte'),
('Mora Explosión', 6000, 20, 'Bogotá Norte'),
('Paleta de mora', 2500, 70, 'Barranquilla'),
('Yoyo Galleta', 7800, 79, 'Bogotá Norte'),
('Yoyo Galleta', 7800, 38, 'Girardot'),
('Mora Explosión', 6000, 49, 'Pasto'),
('Yoyo Galleta', 7800, 34, 'Barranquilla'),
('Paleta de chicle', 2500, 19, 'Bogotá Sur'),
('ChocolaPotter', 8000, 80, 'Barranquilla'),
('Mora Explosión', 6000, 77, 'Girardot'),
('Paleta de chicle', 2500, 40, 'Pasto'),
('Paleta de agua mandarina', 2500, 40, 'Girardot'),
('Paleta de mora', 2500, 71, 'Bogotá Norte'),
('Paleta de chicle', 2500, 34, 'Pasto'),
('Paleta de chicle', 2500, 71, 'Bogotá Sur'),
('Paleta de mora', 2500, 14, 'Pasto'),
('Paleta de mora', 2500, 33, 'Girardot'),
('Botella de agua con gas', 2000, 8, 'Barranquilla'),
('Yoyo Galleta', 7800, 13, 'Barranquilla'),
('Paleta de chicle', 2500, 43, 'Bogotá Sur'),
('Paleta de chicle', 2500, 29, 'Bogotá Norte'),
('ChocolaPotter', 8000, 32, 'Bogotá Sur'),
('Mora Explosión', 6000, 73, 'Girardot'),
('Paleta de chicle', 2500, 63, 'Bogotá Sur'),
('Yoyo Galleta', 7800, 13, 'Barranquilla'),
('Vainilla Tentación', 5500, 30, 'Barranquilla'),
('Botella de agua', 2000, 58, 'Bogotá Sur'),
('ChocolaPotter', 8000, 58, 'Bogotá Sur'),
('Paleta de mora', 2500, 47, 'Barranquilla'),
('ChocolaPotter', 8000, 14, 'Girardot'),
('Vainilla Tentación', 5500, 69, 'Girardot'),
('ChocolaPotter', 8000, 57, 'Pasto'),
('Mora Explosión', 6000, 26, 'Girardot'),
('Vainilla Tentación', 5500, 56, 'Barranquilla'),
('Mora Explosión', 6000, 42, 'Barranquilla'),
('ChocolaPotter', 8000, 37, 'Bogotá Norte'),
('Mora Explosión', 6000, 69, 'Pasto'),
('Vainilla Tentación', 5500, 65, 'Pasto'),
('Mora Explosión', 6000, 68, 'Pasto'),
('Paleta de chicle', 2500, 37, 'Barranquilla'),
('Botella de agua con gas', 2000, 11, 'Girardot'),
('Paleta de mora', 2500, 14, 'Girardot'),
('Paleta de chicle', 2500, 58, 'Girardot'),
('ChocolaPotter', 8000, 63, 'Bogotá Norte');

SELECT * FROM producto;

-- HELADO MÁS VENDIDO
SELECT nombre, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY nombre
ORDER BY cantidad_vendida DESC
LIMIT 20;

-- HELADO MENOS VENDIDO
SELECT nombre, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY nombre
ORDER BY cantidad_vendida ASC
LIMIT 20;

-- Rango de edad
SELECT 
    CASE 
        WHEN edad BETWEEN 0 AND 20 THEN '0-20'
        WHEN edad BETWEEN 21 AND 40 THEN '21-40'
        WHEN edad BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+' 
    END AS rango_edad,
    COUNT(*) AS cantidad_consumida
FROM producto
GROUP BY rango_edad
ORDER BY cantidad_consumida DESC;

-- POR PRODUCTO
SELECT nombre, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY nombre
ORDER BY cantidad_vendida DESC
LIMIT 20;

-- VENTAS POR SEDE
SELECT sede, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY sede
ORDER BY cantidad_vendida DESC
LIMIT 20;
