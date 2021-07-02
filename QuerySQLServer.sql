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
    Promocio MONEY,
    CursoId INT
)

ALTER TABLE Precio
ADD CONSTRAINT FK_PRECIO_CURSO
    FOREIGN KEY (CursoId)
    REFERENCES Curso(CursoId)


-- Recordar que Fechas tambien llevan comillas
INSERT INTO Curso (Titulo, Descripcion, FechaPublicacion)
VALUES ('React Hooks Firebase y Material Design', 'Curso de Programacion', '2020-02-05')

INSERT INTO Curso (Titulo, Descripcion, FechaPublicacion)
VALUES ('ASP .NET Core y React Hooks', 'Curso de .NET y JS', '2020-11-10')

UPDATE Curso
SET FechaPublicacion = '2020-02-05'
WHERE CursoId = 1

UPDATE Curso
SET FechaPublicacion = '2020-11-10'
WHERE CursoId = 2

SELECT * FROM Curso
