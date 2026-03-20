# M164 Einstieg DML – Fahrzeugpark mit 2 Tabellen

## Ziel

In dieser Aufgabe übst du:

- `SELECT`
- `UPDATE`
- `INSERT`
- `DELETE`
- einen sehr einfachen `INNER JOIN`

Du arbeitest mit **2 Tabellen**:

- `Mitarbeiter` = Personen
- `Fahrzeug` = Autos

Die Spalte `fk_MitarbeiterId` zeigt, wem ein Fahrzeug zugeteilt ist.

## Was ist schon vorbereitet?

Die Lehrperson hat die Datenbank *FahrzeugPark* und die beiden Tabellen *Mitarbeiter* und *Fahrzeug* bereits erstellt.

## Startdaten

### Tabelle `Mitarbeiter`

| MitarbeiterId | Nachname    | Vorname |
| ------------: | ----------- | ------- |
|             1 | Cuche       | Didier  |
|             2 | Feuz        | Beat    |
|             3 | Gut-Behrami | Lara    |
|             4 | Zurbriggen  | Pirmin  |

### Tabelle `Fahrzeug`

| FahrzeugId | Marke      | Typ                        | NeuPreis | Jahrgang | Occasion | fk_MitarbeiterId |
| ---------: | ---------- | -------------------------- | -------: | -------: | -------: | ---------------- |
|          1 | Ford       | Model T                    |   825.00 |     1908 |        0 | NULL             |
|          2 | Volkswagen | Käfer                     |  5000.00 |     1938 |        1 | NULL             |
|          3 | Mini       | Mini Cooper                |   497.00 |     1959 |        1 | NULL             |
|          4 | Porsche    | 911                        | 14500.00 |     1964 |        1 | NULL             |
|          5 | Ford       | Mustang                    |  2368.00 |     1964 |        0 | NULL             |
|          6 | Toyota     | Corolla (erste Generation) |  1100.00 |     1966 |        1 | NULL             |

**Wichtig:**

- `Occasion = 1` bedeutet **ja**
- `Occasion = 0` bedeutet **nein**

## So arbeitest du

1. Öffne ein neues SQL-Fenster.
2. Wähle zuerst die richtige Datenbank.
3. Schreibe **alle Lösungen in eine einzige SQL-Datei**.
4. Schreibe vor jede Teilaufgabe einen Kommentar, zum Beispiel:

```sql
-- Aufgabe 1
USE FahrzeugPark;
```

5. Führe deine Befehle nach jeder Aufgabe aus.
6. Prüfe nach jeder Änderung mit `SELECT * FROM Fahrzeug;`, ob dein Resultat stimmt.
7. Speichere die Datei vor dem Hochladen.

## Auftrag

### Aufgabe 1 – Datenbank wählen

Wähle die Datenbank **FahrzeugPark** aus.

### Aufgabe 2 – Alle Mitarbeiter anzeigen

Zeige alle Daten aus der Tabelle **Mitarbeiter** an.

### Aufgabe 3 – Alle Fahrzeuge anzeigen

Zeige alle Daten aus der Tabelle **Fahrzeug** an.

### Aufgabe 4 – Ein Fahrzeug zuweisen

Beat Feuz erhält den **Käfer**.

**Tipp:**

- Beat Feuz hat `MitarbeiterId = 2`
- der Käfer hat `FahrzeugId = 2`

Ändere die passende Zeile in der Tabelle **Fahrzeug**.

### Aufgabe 5 – Mehrere Fahrzeuge zuweisen

Didier Cuche erhält **alle Fahrzeuge von Ford**.

**Tipp:**

- Didier Cuche hat `MitarbeiterId = 1`
- es soll **ein SQL-Befehl** genügen

### Aufgabe 6 – Nur zugeteilte Fahrzeuge anzeigen

Zeige nur die Fahrzeuge an, die bereits einer Person zugeteilt sind.

### Aufgabe 7 – Ein neues Fahrzeug einfügen

Füge dieses Fahrzeug ein:

- Marke: **Lamborghini**
- Typ: **Diablo**
- NeuPreis: **285000.00**
- Jahrgang: **1990**
- Occasion: **1**
- `fk_MitarbeiterId`: **noch nicht bekannt**

Tipp: Wenn ein Wert noch nicht bekannt ist, kannst du `NULL` verwenden.

### Aufgabe 8 – Ein Fahrzeug löschen

Alle **Toyota**-Fahrzeuge wurden verkauft.

Lösche alle passenden Zeilen mit **einem SQL-Befehl**.

### Aufgabe 9 – Zuteilungen mit einem JOIN anzeigen

Zeige mit einem **INNER JOIN**, welche Person welches Fahrzeug hat.

Die Ausgabe soll diese Spalten zeigen:

- `Nachname`
- `Vorname`
- `Marke`
- `Typ`

Sortiere die Ausgabe nach:

1. `Nachname`
2. `Typ`

## Bonus – freiwillig

Beat Feuz gibt den **Käfer** zurück.
Er bekommt neu den **Mini Cooper**.

Passe die Zuteilung mit **zwei UPDATE-Befehlen** an.

## Abgabe

Gib **eine** SQL-Datei ab.

**Dateiname:**

`M164_DML_Fahrzeugpark_Nachname_Vorname.sql`

## Wichtig

- Nur **eine** SQL-Datei hochladen.
- Keine Screenshots.
- Kein Word-Dokument.
- Jede Aufgabe mit einem Kommentar markieren.
- Speichere die Datei vor dem Hochladen.

## Mini-Hilfe

Diese Formen helfen dir:

```sql
SELECT * FROM Tabellenname;
```

```sql
UPDATE Tabellenname
SET Spalte = Wert
WHERE Bedingung;
```

```sql
INSERT INTO Tabellenname (Spalte1, Spalte2)
VALUES (Wert1, Wert2);
```

```sql
DELETE FROM Tabellenname
WHERE Bedingung;
```

```sql
SELECT Mitarbeiter.Nachname, Mitarbeiter.Vorname, Fahrzeug.Marke, Fahrzeug.Typ
FROM Mitarbeiter
INNER JOIN Fahrzeug
  ON Mitarbeiter.MitarbeiterId = Fahrzeug.fk_MitarbeiterId;
```
