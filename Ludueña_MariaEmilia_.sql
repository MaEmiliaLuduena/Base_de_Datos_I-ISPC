ALTER PROCEDURE [dbo].[ListarAlumnos]
AS
SELECT * FROM Alumnos
WHERE Id_TipoDNI IS NULL
ORDER BY Apellido, Nombre
--Este procedimiento obtiene todos los alumnos con Id_TipoDNI nulo, y los ordena primero por Apellido y segundo por Nombre


ALTER PROCEDURE [dbo].[InsertarAlumnos]
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@IdDNI INT
AS
INSERT INTO Alumnos
(Nombre, Apellido, Id_TipoDNI)
VALUES
(@Nombre, @Apellido, @IdDNI)
--Este procedimiento Introduce Alumnos a la tabla mediante parámetros de Nombre, Apellido, e Id_TipoDNI


ALTER PROCEDURE [dbo].[EliminarAlumno]
@Id INT
AS
DELETE FROM Alumnos
WHERE Id_Alumnos = @Id
--Este prodecimiento elimina un alumno por medio de un parámetro introducido que refiere al id


ALTER PROCEDURE [dbo].[ActualizarAlumno]
@Id_Alumno INT,
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@IdDNI INT
AS
UPDATE Alumnos
	SET Nombre= @Nombre,
		Apellido= @Apellido,
		Id_TipoDNI= @IdDNI
WHERE Id_Alumnos= @Id_Alumno
--Este procedimiento actualiza datos de la tabla Alumnos mediante parámetros de Nombre, Apellido, e Id_TipoDNI según el Id_Alumnos