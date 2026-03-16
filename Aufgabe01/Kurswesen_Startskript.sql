USE master;
GO
DROP DATABASE IF EXISTS Kurswesen;
GO
CREATE DATABASE Kurswesen;
GO
USE Kurswesen;
GO

CREATE TABLE Kurs (
  KursId INTEGER IDENTITY(1,1) NOT NULL,
  Bez VARCHAR(30) NOT NULL,
  MaxTeilnehmer INTEGER NULL,
  Kosten NUMERIC(9,2) NULL,
  StartDatum DATE NULL,
  Dauer FLOAT NULL,
  CONSTRAINT PK_Kurs PRIMARY KEY (KursId)
);
GO

INSERT INTO Kurs (Bez, MaxTeilnehmer, Kosten, StartDatum, Dauer)
VALUES ('Windows 11', 10, 450.00, '2022-06-03', 2.5);

INSERT INTO Kurs (Bez, MaxTeilnehmer, Kosten, StartDatum, Dauer)
VALUES ('Word 2019', 5, 250.00, '2022-04-20', 1.0);

INSERT INTO Kurs (Bez, MaxTeilnehmer, Kosten, StartDatum, Dauer)
VALUES ('Windows 11 Neuerungen', 15, 150.00, '2022-05-17', 0.5);
GO
