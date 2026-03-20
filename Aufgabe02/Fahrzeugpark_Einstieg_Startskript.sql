USE master;
GO
DROP DATABASE IF EXISTS FahrzeugPark;
GO
CREATE DATABASE FahrzeugPark;
GO
USE FahrzeugPark;
GO

CREATE TABLE Mitarbeiter (
  MitarbeiterId INTEGER IDENTITY(1,1) NOT NULL,
  Nachname NVARCHAR(30) NOT NULL,
  Vorname NVARCHAR(30) NOT NULL,
  CONSTRAINT PK_Mitarbeiter PRIMARY KEY (MitarbeiterId)
);
GO

CREATE TABLE Fahrzeug (
  FahrzeugId INTEGER IDENTITY(1,1) NOT NULL,
  Marke NVARCHAR(50) NOT NULL,
  Typ NVARCHAR(80) NOT NULL,
  NeuPreis DECIMAL(9,2) NULL,
  Jahrgang INTEGER NULL,
  Occasion BIT NULL,
  fk_MitarbeiterId INTEGER NULL,
  CONSTRAINT PK_Fahrzeug PRIMARY KEY (FahrzeugId),
  CONSTRAINT FK_Fahrzeug_Mitarbeiter FOREIGN KEY (fk_MitarbeiterId)
    REFERENCES Mitarbeiter (MitarbeiterId)
);
GO

INSERT INTO Mitarbeiter (Nachname, Vorname)
VALUES (N'Cuche', N'Didier');

INSERT INTO Mitarbeiter (Nachname, Vorname)
VALUES (N'Feuz', N'Beat');

INSERT INTO Mitarbeiter (Nachname, Vorname)
VALUES (N'Gut-Behrami', N'Lara');

INSERT INTO Mitarbeiter (Nachname, Vorname)
VALUES (N'Zurbriggen', N'Pirmin');
GO

INSERT INTO Fahrzeug (Marke, Typ, NeuPreis, Jahrgang, Occasion, fk_MitarbeiterId)
VALUES
  (N'Ford', N'Model T', 825.00, 1908, 0, NULL),
  (N'Volkswagen', N'Käfer', 5000.00, 1938, 1, NULL),
  (N'Mini', N'Mini Cooper', 497.00, 1959, 1, NULL),
  (N'Porsche', N'911', 14500.00, 1964, 1, NULL),
  (N'Ford', N'Mustang', 2368.00, 1964, 0, NULL),
  (N'Toyota', N'Corolla (erste Generation)', 1100.00, 1966, 1, NULL);
GO
