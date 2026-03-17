-- M164 Einstieg DML – Kurswesen
-- Lösungen zu Aufgabe 1 bis 8

-- Aufgabe 1 – Datenbank wählen
USE Kurswesen;
GO

-- Aufgabe 2 – Alle Kurse anzeigen
SELECT *
FROM Kurs;
GO

-- Aufgabe 3 – Einen neuen Kurs einfügen
INSERT INTO Kurs (Bez, MaxTeilnehmer, Kosten, StartDatum, Dauer)
VALUES ('Word 365', 10, 320.00, '2022-06-15', 2.0);
GO

-- Aufgabe 4 – Einen zweiten Kurs einfügen
INSERT INTO Kurs (Bez, MaxTeilnehmer, Kosten, StartDatum, Dauer)
VALUES ('Excel 365', 10, 320.00, NULL, 2.0);
GO

-- Aufgabe 5 – Einen Kurs ändern
UPDATE Kurs
SET StartDatum = '2022-05-02',
    MaxTeilnehmer = 15
WHERE Bez = 'Windows 11';
GO

-- Aufgabe 6 – Mehrere Kurse ändern
UPDATE Kurs
SET MaxTeilnehmer = 12
WHERE MaxTeilnehmer < 12;
GO

-- Aufgabe 7 – Einen Kurs löschen
DELETE FROM Kurs
WHERE Bez = 'Word 2019';
GO

-- Aufgabe 8 – Ergebnis sortiert anzeigen
SELECT *
FROM Kurs
ORDER BY StartDatum;
GO
