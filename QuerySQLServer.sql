-- Creando la Base de Datos
USE master;

CREATE DATABASE CursosOnline

USE CursosOnline


CREATE TABLE Curso (
    CursoId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(500),
    Descripcion NVARCHAR(1000),
    FechaPublicacion DATETIME,
    FotoPortada VARBINARY(MAX)
)

CREATE TABLE Precio (
    PrecioId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PrecioActual MONEY,
    Promocion MONEY,
    CursoId INT
)

CREATE TABLE Comentario (
    ComentarioId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Alumno NVARCHAR(500),
    Puntaje INT,
    ComentarioTexto NVARCHAR(MAX),
    CursoId INT NOT NULL
)

CREATE TABLE Instructor (
    InstructorId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(500),
    Apellidos NVARCHAR(500),
    Grado NVARCHAR(500),
    FotoPerfil VARBINARY(MAX)
)

CREATE TABLE CursoInstructor(
    CursoId INT NOT NULL,
    InstructorId INT NOT NULL,
)

EXEC sp_rename 'Precio.Promocio', 'Promocion', 'COLUMN';

ALTER TABLE Precio
ADD CONSTRAINT FK_PRECIO_CURSO
    FOREIGN KEY (CursoId)
    REFERENCES Curso(CursoId)

ALTER TABLE Comentario
ADD CONSTRAINT FK_COMENTARIO_CURSO
    FOREIGN KEY (CursoId)
    REFERENCES Curso(CursoId)

ALTER TABLE CursoInstructor
ADD CONSTRAINT FK_CURSO_INSTRUCTOR_CURSOID
    FOREIGN KEY (CursoId)
    REFERENCES Curso(CursoId)

ALTER TABLE CursoInstructor
ADD CONSTRAINT FK_CURSO_INSTRUCTOR_INSTRUCTORID
    FOREIGN KEY (InstructorId)
    REFERENCES Instructor(InstructorId)

-- Recordar que Fechas tambien llevan comillas
INSERT INTO Curso (Titulo, Descripcion, FechaPublicacion)
VALUES ('React Hooks Firebase y Material Design', 'Curso de Programacion', '2020-02-05')

INSERT INTO Curso (Titulo, Descripcion, FechaPublicacion)
VALUES ('ASP .NET Core y React Hooks', 'Curso de .NET y JS', '2020-11-10')

INSERT INTO Precio VALUES (900.00, 9.99, 1)
INSERT INTO Precio VALUES (650.00, 15.00, 2)

INSERT INTO Comentario VALUES ('Abraham Molleda', 5, 'Es el mejor curso de React', 1)
INSERT INTO Comentario VALUES ('Azael Rivera', 5, 'Curso Excelente', 1)
INSERT INTO Comentario VALUES ('Alejandro Leyva', 4, 'Laboratorias muy Practicos', 1)
INSERT INTO Comentario VALUES ('El Delta', 5, 'Buen Curso de ASP .Net Core', 2)
INSERT INTO Comentario VALUES ('MymTumTum', 5, 'SQL Server al maximo', 2)

INSERT INTO Instructor (Nombre, Apellidos, Grado)
VALUES ('Vaxi', 'Drez', 'Master')

INSERT INTO Instructor (Nombre, Apellidos, Grado)
VALUES ('Fernando', 'Herrera', 'Ingeniero')

INSERT INTO Instructor (Nombre, Apellidos, Grado)
VALUES ('Oscar', 'Barajas', 'Front End Developer')

INSERT INTO Instructor (Nombre, Apellidos, Grado)
VALUES ('Freddy', 'Vega', 'Master')

INSERT INTO CursoInstructor VALUES (1, 1)
INSERT INTO CursoInstructor VALUES (1, 2)
INSERT INTO CursoInstructor VALUES (2, 3)
INSERT INTO CursoInstructor VALUES (2, 4)
INSERT INTO CursoInstructor VALUES (2, 1)





UPDATE Curso
SET FechaPublicacion = '2020-02-05'
WHERE CursoId = 1

UPDATE Curso
SET FechaPublicacion = '2020-11-10'
WHERE CursoId = 2

SELECT * FROM Curso
SELECT * FROM Precio
SELECT * FROM Comentario
SELECT * FROM Instructor
SELECT * FROM CursoInstructor
