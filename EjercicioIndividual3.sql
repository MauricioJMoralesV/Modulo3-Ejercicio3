CREATE DATABASE Ejercicio2;

CREATE USER 'usuario'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON nombre_de_la_base_de_datos.* TO 'usuario'@'localhost';

USE Ejercicio2;

CREATE TABLE OPERADORES (
  RUN VARCHAR(20) PRIMARY KEY,
  NOMBRE VARCHAR(50),
  APELLIDO VARCHAR(50),
  DIRECCION VARCHAR(100),
  CORREO_ELECTRONICO VARCHAR(100),
  FECHA_CREACION_CUENTA DATE
);

CREATE TABLE USUARIOS (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  NOMBRE VARCHAR(50),
  APELLIDO VARCHAR(50),
  CORREO_ELECTRONICO VARCHAR(100),
  TELEFONO VARCHAR(20),
  FECHA_CREACION_CUENTA DATE
);

CREATE TABLE CAPACITACION (
  CODIGO_CURSO VARCHAR(20) PRIMARY KEY,
  NOMBRE VARCHAR(100),
  HORARIO VARCHAR(50),
  COSTO REAL,
  FECHA_REALIZACION DATE
);
-- Insertar datos en la tabla de operadores
INSERT INTO operadores (run, nombre, apellido, direccion, correo_electronico, fecha_creacion_cuenta)
VALUES
  ('123456789', 'Juan', 'Pérez', 'Av. Siempre Viva 123', 'juan.perez@gmail.com', '2023-04-01'),
  ('234567890', 'María', 'García', 'Calle Falsa 123', 'maria.garcia@gmail.com', '2023-04-02'),
  ('345678901', 'Pedro', 'López', 'Av. Libertador 456', 'pedro.lopez@gmail.com', '2023-04-03'),
  ('456789012', 'Ana', 'Martínez', 'Calle Real 456', 'ana.martinez@gmail.com', '2023-04-04'),
  ('567890123', 'Carlos', 'González', 'Av. Principal 789', 'carlos.gonzalez@gmail.com', '2023-04-05'),
  ('678901234', 'Laura', 'Hernández', 'Calle Peatonal 12', 'laura.hernandez@gmail.com', '2023-04-06'),
  ('789012345', 'Miguel', 'Díaz', 'Av. Central 456', 'miguel.diaz@gmail.com', '2023-04-07'),
  ('890123456', 'Luisa', 'Rojas', 'Calle del Sol 789', 'luisa.rojas@gmail.com', '2023-04-08'),
  ('901234567', 'Mario', 'Sánchez', 'Av. del Río 123', 'mario.sanchez@gmail.com', '2023-04-09'),
  ('012345678', 'Sofía', 'Gómez', 'Calle del Mar 456', 'sofia.gomez@gmail.com', '2023-04-10');

drop table usuarios;
-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre, apellido, correo_electronico, telefono, fecha_creacion_cuenta)
VALUES
  ('Jorge', 'Fernández', 'jorge.fernandez@gmail.com', '12345678', '2023-04-01'),
  ('Carla', 'López', 'carla.lopez@gmail.com', '23456789', '2023-04-02'),
  ('Jose', 'Fernández', 'jose.fernandez@gmail.com', '34567890', '2023-04-03'),
  ('Mauricio', 'López', 'mauricio.lopez@gmail.com', '09876543', '2023-04-04'),
  ('Ricardo', 'Fernández', 'ricardo.fernandez@gmail.com', '98765433', '2023-04-05'),
  ('Camilo', 'López', 'camilo.lopez@gmail.com', '87654321', '2023-04-06'),
  ('Camila', 'Fernández', 'camila.fernandez@gmail.com', '43224322', '2023-04-07'),
  ('Ignacio', 'López', 'ignacio.lopez@gmail.com', '54323456', '2023-04-08'),
  ('Ignacia', 'Fernández', 'ignacia.fernandez@gmail.com', '76543456', '2023-04-09'),
  ('Karla', 'López', 'karla.lopez@gmail.com', '76543234', '2023-04-10');
  
-- Inserta datos en la tabla capacitacione

INSERT INTO CAPACITACION (codigo_curso, nombre, horario, costo, fecha_realizacion)
VALUES
(1, 'Introducción a la programación', '9:00 - 13:00', 100, '2023-05-10'),
(2, 'Programación orientada a objetos', '14:00 - 18:00', 120, '2023-05-12'),
(3, 'Desarrollo web con HTML y CSS', '9:00 - 13:00', 80, '2023-05-15'),
(4, 'Desarrollo web con JavaScript', '14:00 - 18:00', 150, '2023-05-17'),
(5, 'Bases de datos con MySQL', '9:00 - 13:00', 90, '2023-05-20'),
(6, 'Desarrollo de aplicaciones móviles', '14:00 - 18:00', 200, '2023-05-22'),
(7, 'Programación en Python', '9:00 - 13:00', 120, '2023-05-25'),
(8, 'Inteligencia artificial y machine learning', '14:00 - 18:00', 250, '2023-05-27'),
(9, 'Desarrollo de videojuegos', '9:00 - 13:00', 180, '2023-05-30'),
(10, 'Ciberseguridad', '14:00 - 18:00', 150, '2023-06-01');

-- Muestre los 5 operadores más recientemente registrados.
SELECT *
FROM OPERADORES
ORDER BY fecha_creacion_cuenta DESC
LIMIT 5;

-- Muestre los 5 usuarios más recientemente registrados.
SELECT *
FROM USUARIOS
ORDER BY fecha_creacion_cuenta DESC
LIMIT 5;

-- - Calcule cuántos días han transcurrido desde que se registró a operadores y clientes. Indague en la función DATEDIFF() de MySQL.
SELECT RUN, nombre, apellido, DATEDIFF(NOW(), fecha_creacion_cuenta) AS dias_transcurridos
FROM OPERADORES;
SELECT id, nombre, apellido, DATEDIFF(NOW(), fecha_creacion_cuenta) AS dias_transcurridos
FROM USUARIOS;

-- - Calcule cuántos días transcurrieron desde que se realizó el último curso de capacitación.
SELECT DATEDIFF(NOW(), MAX(fecha_realizacion)) AS dias_transcurridos_desde_ultimo_curso
FROM CAPACITACION;
-- Por último, indique cuál fue el curso de capacitación más costoso y el menos costoso.
SELECT MAX(costo_realizacion) AS costo_curso_mas_costoso,
       MIN(costo_realizacion) AS costo_curso_menos_costoso
FROM CAPACITACION;


-- EJERCICIO 3

-- Agregar el campo "salario" a la tabla "OPERADORES"
ALTER TABLE OPERADORES ADD salario DECIMAL(10, 2);

-- Registrar salarios a los operadores ya registrados
UPDATE OPERADORES SET salario = 1000.00 WHERE RUN = '123456789';
UPDATE OPERADORES SET salario = 1200.00 WHERE RUN = '234567890';
UPDATE OPERADORES SET salario = 1300.00 WHERE RUN = '345678901';
UPDATE OPERADORES SET salario = 1100.00 WHERE RUN = '456789012';
UPDATE OPERADORES SET salario = 1500.00 WHERE RUN = '567890123';
UPDATE OPERADORES SET salario = 1600.00 WHERE RUN = '678901234';
UPDATE OPERADORES SET salario = 1400.00 WHERE RUN = '789012345';
UPDATE OPERADORES SET salario = 1700.00 WHERE RUN = '890123456';
UPDATE OPERADORES SET salario = 1800.00 WHERE RUN = '901234567';
UPDATE OPERADORES SET salario = 1900.00 WHERE RUN = '012345678';

-- Inserte 3 capacitaciones nuevas.
INSERT INTO CAPACITACION (codigo_curso, nombre, horario, costo, fecha_realizacion) VALUES 
('11', 'Curso de Marketing Digital', '19:00 - 21:00', 150, '2023-06-05'),
('12', 'Curso de Redes Neuronales', '17:00 - 19:00', 200, '2023-06-10'),
('13', 'Curso de Programación Avanzada', '9:00 - 12:00', 100, '2023-06-17');

-- Inserte 3 operadores nuevos
INSERT INTO OPERADORES (RUN, nombre, apellido, direccion, correo_electronico, fecha_creacion_cuenta, salario) VALUES 
('181234567', 'Natalia', 'Gonzalez', 'Av. Providencia 123', 'natalia.gonzalez@gmail.com', '2023-05-02', 800000),
('192345678', 'Rodrigo', 'Castillo', 'Calle Merced 456', 'rodrigo.castillo@gmail.com', '2023-05-03', 750000),
('203456789', 'Valentina', 'Gomez', 'Av. Las Condes 789', 'valentina.gomez@gmail.com', '2023-05-04', 850000);

-- ¿Cuál es la capacitación más costosa? Selecciónelo.
SELECT nombre, costo_realizacion 
FROM capacitacion 
ORDER BY costo_realizacion DESC 
LIMIT 1;

-- ¿Cuál es el operador con menor salario? Selecciónelo.
SELECT nombre, apellido, salario 
FROM operador 
ORDER BY salario ASC 
LIMIT 1;

-- Seleccione las capacitaciones más costosas que el promedio.
SELECT nombre, costo_realizacion 
FROM capacitacion 
WHERE costo_realizacion > (SELECT AVG(costo_realizacion) FROM capacitacion) 
ORDER BY costo_realizacion DESC;

-- Cree una tabla con las capacitaciones menos costosas que el promedio. La tabla debe tener por nombre Capacitaciones Económicos.
CREATE TABLE Capacitaciones_Economicos AS
SELECT *
FROM Capacitacion
WHERE costo_realizacion < (
  SELECT AVG(costo_realizacion)
  FROM Capacitacion
)
/* A la tabla Capacitaciones Económicos, agrégale dos campos. ‘Cantidad mínima estudiantes’ y
‘Aportes públicos’. La cantidad mínima de estudiantes se refiere al número mínimo de estudiantes
necesarios para su realización. Los aportes públicos refieren a los aportes entregados por
instituciones públicas para la realización del curso (tiene que ser un valor menor al costo 
curso). */

ALTER TABLE Capacitaciones_Económicos
ADD COLUMN cantidad_minima_estudiantes INT,
ADD COLUMN aportes_publicos DECIMAL(10, 2);

UPDATE Capacitaciones_Economicos
SET cantidad_minima_estudiantes = 15, aportes_publicos = 3500.00
WHERE codigo_curso = '1';

/* Renombre la columna “Costo realización” en la tabla Capacitaciones económicas. El nombre
nuevo debe ser: Costo efectivo. En dicha columna, a cada valor se le debe restar el valor de
‘Aportes públicos’. */

ALTER TABLE Capacitaciones_Económicos 
CHANGE COLUMN `Costo realización` `Costo efectivo` DECIMAL(10,2) NOT NULL,
ADD COLUMN `Aportes públicos` DECIMAL(10,2) NOT NULL DEFAULT 0 AFTER `Cantidad mínima estudiantes`;

UPDATE Capacitaciones_Económicos SET `Costo efectivo` = `Costo efectivo` - `Aportes públicos`;

-- Por último, actualice 5 cursos y 3 operadores.






















