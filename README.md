# Proyecto: Análisis de Ventas de Heladería

## Descripción
Este proyecto consiste en la creación y análisis de una base de datos para una heladería, con el objetivo de extraer información clave sobre las ventas de productos, su distribución por sede y el comportamiento de consumo por edades. La base de datos se llama `heladeria` y contiene una tabla principal `producto`, donde se registran los productos vendidos con sus respectivos atributos.

## Estructura de la Base de Datos

### Creación de la Base de Datos y Uso
```sql
CREATE DATABASE `heladeria`;
USE `heladeria`;
```

### Tabla `producto`
Esta tabla almacena la información de los productos vendidos, incluyendo:
- `id`: Identificador único de cada venta.
- `nombre`: Nombre del producto.
- `valor`: Precio del producto.
- `edad`: Edad del cliente que realizó la compra.
- `sede`: Sede donde se realizó la compra.

```sql
CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    valor INT NOT NULL,
    edad INT NOT NULL,
    sede VARCHAR(50) NOT NULL
);
```

### Inserción de Datos
Se insertan registros con diferentes productos, valores, edades y sedes.
```sql
INSERT INTO producto (nombre, valor, edad, sede) VALUES
('Paleta de Vainilla', 2500, 63, 'Girardot'),
('Botella de agua con gas', 2000, 35, 'Bogotá Norte'),
('Paleta de Vainilla', 2500, 37, 'Bogotá Sur'),
('ChocolaPotter', 8000, 24, 'Bogotá Sur'),
('Mora Explosión', 6000, 41, 'Barranquilla'),
...
```

## Consultas SQL

### 1. Ver todos los productos registrados
```sql
SELECT * FROM producto;
```

### 2. Producto más vendido
Se obtiene el producto con mayor cantidad de ventas:
```sql
SELECT nombre, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY nombre
ORDER BY cantidad_vendida DESC
LIMIT 20;
```

### 3. Producto menos vendido
Se obtiene el producto con menor cantidad de ventas:
```sql
SELECT nombre, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY nombre
ORDER BY cantidad_vendida ASC
LIMIT 20;
```

### 4. Análisis de consumo por rango de edad
Se agrupan las ventas en distintos rangos de edad para identificar patrones de consumo:
```sql
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
```

### 5. Ventas por sede
Se obtiene el número de productos vendidos en cada sede:
```sql
SELECT sede, COUNT(*) AS cantidad_vendida
FROM producto
GROUP BY sede
ORDER BY cantidad_vendida DESC
LIMIT 20;
```

## Interpretación de Resultados

- **Producto más vendido**: Permite identificar cuál es el sabor de helado preferido por los clientes.
- **Producto menos vendido**: Indica cuáles productos podrían necesitar estrategias de promoción o mejora.
- **Ventas por rango de edad**: Ayuda a entender qué grupos etarios son los principales consumidores y en cuáles se deben enfocar estrategias de mercadeo.
- **Ventas por sede**: Proporciona información sobre las sedes más y menos exitosas, permitiendo generar estrategias de mejora.

## Conclusiones

Este análisis basado en datos permite tomar decisiones informadas sobre estrategias de marketing, desarrollo de nuevos productos y optimización de la oferta en cada sede. Se recomienda utilizar estas consultas periódicamente para evaluar tendencias de consumo y mejorar la rentabilidad del negocio.

