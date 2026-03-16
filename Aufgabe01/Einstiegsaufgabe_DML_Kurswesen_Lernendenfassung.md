# M164 Einstieg DML – Kurswesen

## Ziel

In dieser Aufgabe übst du die vier wichtigsten DML-Befehle:

- `SELECT`
- `INSERT`
- `UPDATE`
- `DELETE`

Du arbeitest nur mit einer Tabelle. Das ist extra so gewählt, damit du ruhig und Schritt für Schritt lernen kannst.

## Was ist schon vorbereitet?

Die Lehrperson hat die Datenbank *Kurswesen* und die Tabelle *Kurs* bereits erstellt.

Die Tabelle **Kurs** hat diese Spalten:

- `KursId` = Nummer des Kurses
- `Bez` = Bezeichnung des Kurses
- `MaxTeilnehmer` = maximale Teilnehmerzahl
- `Kosten` = Preis in Franken
- `StartDatum` = Startdatum des Kurses
- `Dauer` = Dauer in Tagen

## Startdaten

Am Anfang sind diese drei Kurse in der Tabelle:

| Bez                   | MaxTeilnehmer | Kosten | StartDatum | Dauer |
| --------------------- | ------------: | -----: | ---------- | ----: |
| Windows 11            |            10 | 450.00 | 2022-06-03 |   2.5 |
| Word 2019             |             5 | 250.00 | 2022-04-20 |   1.0 |
| Windows 11 Neuerungen |            15 | 150.00 | 2022-05-17 |   0.5 |

## So arbeitest du

1. Öffne ein neues SQL-Fenster.
2. Wähle zuerst die richtige Datenbank.
3. Schreibe *alle Lösungen in eine einzige SQL-Datei*.
4. Schreibe vor jede Teilaufgabe einen Kommentar, zum Beispiel:

```sql
-- Aufgabe 1
SELECT * FROM Kurs;
```

5. Führe deine Befehle nach jeder Aufgabe aus.
6. Prüfe nach jeder Änderung mit `SELECT * FROM Kurs;`, ob dein Resultat stimmt.

## Auftrag

### Aufgabe 1 – Datenbank wählen

Wähle die Datenbank *Kurswesen* aus.

### Aufgabe 2 – Alle Kurse anzeigen

Zeige alle Daten aus der Tabelle *Kurs* an.

### Aufgabe 3 – Einen neuen Kurs einfügen

Füge diesen Kurs ein:

- Kurs: **Word 365**
- maximale Teilnehmerzahl: **10**
- Kosten: **320 Fr.**
- Startdatum: **2022-06-15**
- Dauer: **2.0 Tage**

### Aufgabe 4 – Einen zweiten Kurs einfügen

Füge diesen Kurs ein:

- Kurs: **Excel 365**
- maximale Teilnehmerzahl: **10**
- Kosten: **320 Fr.**
- Startdatum: **noch nicht bekannt**
- Dauer: **2.0 Tage**

Tipp: Wenn ein Wert noch nicht bekannt ist, kannst du `NULL` verwenden.

### Aufgabe 5 – Einen Kurs ändern

Der Kurs *Windows 11* wird geändert:

- neues Startdatum: **2022-05-02**
- neue maximale Teilnehmerzahl: **15**

Ändere genau diesen Kurs.

### Aufgabe 6 – Mehrere Kurse ändern

Alle Kurse mit *weniger als 12* maximalen Teilnehmern sollen neu *12* Teilnehmer haben.

Ändere alle passenden Kurse mit *einem SQL-Befehl*.

### Aufgabe 7 – Einen Kurs löschen

Der Kurs *Word 2019* findet nicht statt.

Lösche genau diesen Kurs.

### Aufgabe 8 – Ergebnis sortiert anzeigen

Zeige am Schluss alle Kurse an.
Sortiere die Ausgabe nach `StartDatum`.

### Bonus – freiwillig

Ein kurzer Kurs vom *2022-05-17* muss verschoben werden.

Ändere das Startdatum auf *2022-05-24*, aber *nur* bei Kursen,

- die am **2022-05-17** starten und
- eine Dauer von **höchstens 1 Tag** haben.

## Abgabe

Gib *eine* SQL-Datei ab.

**Dateiname:**

`M164_DML_Kurswesen_Nachname_Vorname.sql`

## Wichtig

- Nur *eine* SQL-Datei hochladen.
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
INSERT INTO Tabellenname (Spalte1, Spalte2)
VALUES (Wert1, Wert2);
```

```sql
UPDATE Tabellenname
SET Spalte1 = Wert1
WHERE Bedingung;
```

```sql
DELETE FROM Tabellenname
WHERE Bedingung;
```
