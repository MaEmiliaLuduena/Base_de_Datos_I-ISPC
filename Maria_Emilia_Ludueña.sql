--Creación Base de datos
CREATE DATABASE MariaEmilia_Ludueña

USE MariaEmilia_Ludueña

--Creación de Tablas
CREATE TABLE Provincias(
Id_Provincia INT PRIMARY KEY,
Nombre VARCHAR(50)
);

CREATE TABLE Localidades(
Id_Localidad INT PRIMARY KEY,
Nombre VARCHAR(50),
Id_Provincia INT,
CONSTRAINT fk_Provincias FOREIGN KEY (Id_Provincia) REFERENCES Provincias (Id_Provincia)
);

CREATE TABLE Alumnos(
Id_Alumnos INT PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Id_Localidad INT,
CONSTRAINT fk_Localidades FOREIGN KEY (Id_Localidad) REFERENCES Localidades (Id_Localidad)
);


--PROCEDIMIENTOS ALMACENADOS--

--PROCEDIMIENTOS ALMACENADOS DE LA TABLA ALUMNOS
CREATE PROCEDURE ListarAlumnos
@Apellido VARCHAR(50)
AS
SELECT * FROM Alumnos
WHERE Apellido = @Apellido
ORDER BY Apellido, Nombre
--Este procedimiento obtiene todos los alumnos con el mismo apellido, y los ordena primero por Apellido y segundo por Nombre

CREATE PROCEDURE InsertarAlumnos
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@Id_Localidad INT
AS
INSERT INTO Alumnos
(Nombre, Apellido, Id_Localidad)
VALUES
(@Nombre, @Apellido, @Id_Localidad)
--Este procedimiento Introduce Alumnos a la tabla mediante parámetros de Nombre, Apellido, Id_Localidad

CREATE PROCEDURE EliminarAlumno
@Id INT
AS
DELETE FROM Alumnos
WHERE Id_Alumnos = @Id
--Este prodecimiento elimina un alumno por medio de un parámetro introducido que refiere al id

CREATE PROCEDURE ActualizarAlumno
@Id_Alumno INT,
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@Id_Localidad INT
AS
UPDATE Alumnos
	SET Nombre= @Nombre,
		Apellido= @Apellido,
		Id_Localidad= @Id_Localidad
WHERE Id_Alumnos= @Id_Alumno
--Este procedimiento actualiza datos de la tabla Alumnos mediante parámetros de Nombre, Apellido, y Id_Localidad según el Id_Alumnos


--PROCEDIMIENTOS ALMACENADOS DE LA TABLA LOCALIDADES
CREATE PROCEDURE ListarLocalidades
@Nombre VARCHAR(50)
AS
SELECT * FROM Localidades
WHERE Nombre = @Nombre
ORDER BY Id_Localidad, Nombre
--Este procedimiento obtiene todos las localidades con el mismo nombre, y los ordena primero por Id_Localidad y segundo por Nombre.
--Esto servirá para verificar si hay provincias repetidas.

CREATE PROCEDURE InsertarLocalidades
@Nombre VARCHAR(50),
@Id_Provincia INT
AS
INSERT INTO Localidades
(Nombre, Id_Provincia)
VALUES
(@Nombre, @Id_Provincia)
--Este procedimiento Introduce Localidades a la tabla mediante parámetros de Nombre, y Id_Provincia

CREATE PROCEDURE EliminarLocalidad
@Id INT
AS
DELETE FROM Localidades
WHERE Id_Localidad = @Id
--Este prodecimiento elimina una Localidad por medio de un parámetro introducido que refiere al id

CREATE PROCEDURE ActualizarLocalidad
@Id_Localidad INT,
@Nombre VARCHAR(50),
@Id_Provincia INT
AS
UPDATE Localidades
	SET Nombre= @Nombre,
		Id_Provincia= @Id_Provincia
WHERE Id_Localidad= @Id_Localidad
--Este procedimiento actualiza datos de la tabla Localidades mediante parámetros de Nombre y Id_Provincia según el Id_Alumnos.


--PROCEDIMIENTOS ALMACENADOS DE LA TABLA PROVINCIAS
CREATE PROCEDURE ListarProvincias
@Nombre VARCHAR(50)
AS
SELECT * FROM Provincias
WHERE Nombre = @Nombre
ORDER BY Id_Provincia, Nombre
--Este procedimiento obtiene todos las provincias con el mismo nombre, y los ordena primero por Id_Provincia y segundo por Nombre. Esto servirá para 
--verificar si hay provincias repetidas.

CREATE PROCEDURE InsertarProvincias
@Nombre VARCHAR(50)
AS
INSERT INTO Provincias
(Nombre)
VALUES
(@Nombre)
--Este procedimiento introduce Provincias a la tabla mediante el parámetro de Nombre.

CREATE PROCEDURE EliminarProvincia
@Nombre VARCHAR(50)
AS
DELETE FROM Provincias
WHERE Nombre = @Nombre
--Este prodecimiento elimina una Provincia por medio de un parámetro introducido que refiere al Nombre.

CREATE PROCEDURE ActualizarProvincia
@Id_Provincia INT,
@Nombre VARCHAR(50)
AS
UPDATE Provincias
	SET Nombre= @Nombre
WHERE Id_Provincia= @Id_Provincia
--Este procedimiento actualiza datos de la tabla Provincias mediante el parámetro de Nombre según el Id_Provincia.


SELECT Alumnos.Nombre, Alumnos.Apellido, Localidades.Nombre
FROM Alumnos
INNER JOIN Localidades
ON Alumnos.Id_Localidad = Localidades.Id_Localidad
--Esta lista permite mostrar en la tabla Alumnos el nombre del Id_Localidad que relaciona con la tabla Localidades.
