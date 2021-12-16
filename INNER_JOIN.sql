SELECT Alumnos.Nombre, Alumnos.Apellido, TiposDNI.Nombre, Alumnos.NroDocumento
FROM Alumnos
INNER JOIN TiposDNI
ON Alumnos.Id_TipoDNI = TiposDNI.Id_TipoDNI