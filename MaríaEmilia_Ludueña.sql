ALTER PROCEDURE [dbo].[ListarAlumnos]
@Apellido VARCHAR(50)
AS
SELECT * FROM Alumnos
WHERE Apellido = @Apellido
ORDER BY Apellido, Nombre
--Este procedimiento obtiene todos los alumnos con el mismo apellido, y los ordena primero por Apellido y segundo por Nombre


ALTER PROCEDURE [dbo].[InsertarAlumnos]
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@IdDNI INT,
@NroDocumento INT
AS
INSERT INTO Alumnos
(Nombre, Apellido, Id_TipoDNI, NroDocumento)
VALUES
(@Nombre, @Apellido, @IdDNI, @NroDocumento)
--Este procedimiento Introduce Alumnos a la tabla mediante parámetros de Nombre, Apellido, Id_TipoDNI y Nro de Documento


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
@IdDNI INT,
@NroDocumento INT
AS
UPDATE Alumnos
	SET Nombre= @Nombre,
		Apellido= @Apellido,
		Id_TipoDNI= @IdDNI,
		NroDocumento= @NroDocumento
WHERE Id_Alumnos= @Id_Alumno
--Este procedimiento actualiza datos de la tabla Alumnos mediante parámetros de Nombre, Apellido, Id_TipoDNI y Nro de Documento según el Id_Alumnos


CREATE PROCEDURE InsertarTipoDNI
@Id_TipoDNI INT,
@Nombre VARCHAR(50)
AS
INSERT INTO TiposDNI
(Id_TipoDNI, Nombre)
VALUES
(@Id_TipoDNI, @Nombre)
--Este procedimiento introduce Tipos de DNI a la tabla mediante parámetros de Id_TipoDNI, y Nombre.

CREATE PROCEDURE EliminarTipoDNI
@Nombre VARCHAR(50)
AS
DELETE FROM TiposDNI
WHERE Nombre = @Nombre
--Este prodecimiento elimina un Tipo de DNI por medio de un parámetro introducido que refiere al Nombre.

CREATE PROCEDURE ActualizarTipoDNI
@Id_TipoDNI INT,
@Nombre VARCHAR(50)
AS
UPDATE TiposDNI
	SET Nombre= @Nombre
WHERE Id_TipoDNI= @Id_TipoDNI
--Este procedimiento actualiza datos de la tabla TiposDNI mediante el parámetro de Nombre según el Id_TipoDNI.

SELECT Alumnos.Nombre, Alumnos.Apellido, TiposDNI.Nombre, Alumnos.NroDocumento
FROM Alumnos
INNER JOIN TiposDNI
ON Alumnos.Id_TipoDNI = TiposDNI.Id_TipoDNI
--Esta lista permite mostrar en la tabla Alumnos el nombre del Id_TipoDNI que relaciona con la tabla TiposDNI.