-- Aufgabe 1
USE FahrzeugPark;
GO

-- Aufgabe 2
SELECT * FROM Mitarbeiter;

-- Aufgabe 3
SELECT * FROM Fahrzeug;

-- Aufgabe 4
UPDATE Fahrzeug
SET fk_MitarbeiterId = 2
WHERE FahrzeugId = 2;

-- Aufgabe 5
UPDATE Fahrzeug
SET fk_MitarbeiterId = 1
WHERE Marke = N'Ford';

-- Aufgabe 6
SELECT *
FROM Fahrzeug
WHERE fk_MitarbeiterId IS NOT NULL;

-- Aufgabe 7
INSERT INTO Fahrzeug (Marke, Typ, NeuPreis, Jahrgang, Occasion, fk_MitarbeiterId)
VALUES (N'Lamborghini', N'Diablo', 285000.00, 1990, 1, NULL);

-- Aufgabe 8
DELETE FROM Fahrzeug
WHERE Marke = N'Toyota';

-- Aufgabe 9
SELECT
  Mitarbeiter.Nachname,
  Mitarbeiter.Vorname,
  Fahrzeug.Marke,
  Fahrzeug.Typ
FROM Mitarbeiter
INNER JOIN Fahrzeug
  ON Mitarbeiter.MitarbeiterId = Fahrzeug.fk_MitarbeiterId
ORDER BY Mitarbeiter.Nachname, Fahrzeug.Typ;

-- Bonus
UPDATE Fahrzeug
SET fk_MitarbeiterId = NULL
WHERE FahrzeugId = 2;

UPDATE Fahrzeug
SET fk_MitarbeiterId = 2
WHERE FahrzeugId = 3;

SELECT
  Mitarbeiter.Nachname,
  Mitarbeiter.Vorname,
  Fahrzeug.Marke,
  Fahrzeug.Typ
FROM Mitarbeiter
INNER JOIN Fahrzeug
  ON Mitarbeiter.MitarbeiterId = Fahrzeug.fk_MitarbeiterId
ORDER BY Mitarbeiter.Nachname, Fahrzeug.Typ;
