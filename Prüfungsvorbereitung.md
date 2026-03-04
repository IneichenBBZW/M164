# Arbeitsblatt: SQL DDL (T‑SQL) – Datenbanken und Tabellen bauen

## Zielgruppe

Du bist im 1. Lehrjahr.
Du bist Anfängerin / Anfänger.

## Lernziele

Am Ende kannst du:

* erklären, was **DDL** ist
* eine **Datenbank** erstellen und auswählen
* eine **Tabelle** erstellen
* eine Tabelle **ändern** (Spalte dazu / weg)
* Regeln setzen: **PK, FK, CHECK, DEFAULT**

## 1) Was ist DDL?

**DDL** bedeutet:  *Data Definition Language*.
Damit baust du die Struktur einer Datenbank.
Du arbeitest hier mit Microsoft SQL Server / T‑SQL.

**Typische DDL-Befehle:**

* `CREATE` (erstellen)
* `ALTER` (ändern)
* `DROP` (löschen)
* `USE` (Datenbank auswählen)

## 2) Wichtige Prüfungs-Regeln (aus Moodle-Hinweisen)

Lies immer die Hinweise unter der Aufgabe.

* In Lücken-Aufgaben: Wenn nichts fehlt, schreibe `-`.
* Manche Aufgaben wollen: kein `;` und kein `GO`.
* Andere Aufgaben wollen am Ende ein **`;`** (GO ist nicht nötig).
* Oft gilt: Kein Schema angeben (also nicht `dbo.`).
* Namen anpassen:  Leerzeichen **→ `_`** ,  ä/ö/ü → ae/oe/ue.
* Constraints werden oft genau benannt (z.B. `PK_...`, `FK_...`).

## 3) Mini-Spickzettel DDL (T‑SQL)

> **Merke:** Schreib `;` nur dann, wenn es die Aufgabe verlangt.

```sql
-- Datenbank
CREATE DATABASE Name
USE Name
DROP DATABASE IF EXISTS Name

-- Tabelle
CREATE TABLE Tabelle ( Spalte DATENTYP NULL/NOT NULL, ... )
DROP TABLE IF EXISTS Tabelle

-- Tabelle ändern
ALTER TABLE Tabelle ADD NeueSpalte DATENTYP NULL/NOT NULL
ALTER TABLE Tabelle DROP COLUMN Spalte

-- Regeln (Constraints)
ALTER TABLE Tabelle ADD CONSTRAINT PK_Tabelle PRIMARY KEY (Spalte)
ALTER TABLE Tabelle ADD CONSTRAINT FK_Tabelle_Andere FOREIGN KEY (FkSpalte) REFERENCES Andere(PkSpalte)
ALTER TABLE Tabelle ADD CONSTRAINT CK_Tabelle_Regel CHECK (Spalte > 0)
ALTER TABLE Tabelle ADD CONSTRAINT DF_Tabelle_Spalte DEFAULT (GETDATE()) FOR Spalte

-- Auto-Zahl
Spalte INT IDENTITY(1,1) NOT NULL
```

## 4) Datentypen ganz kurz

Einige geläufige Datentypen.

* `INT` = ganze Zahl (z.B. 12)
* `BIGINT` = sehr grosse ganze Zahl
* `NUMERIC(8,2)` = Zahl mit Komma (z.B. 12.50)
* `BIT` = 0/1 (Nein/Ja)
* `DATE` = Datum (ohne Uhrzeit)
* `TIME` = Uhrzeit
* `DATETIME2` = Datum + Uhrzeit
* `NCHAR(2)` = genau 2 Zeichen (z.B. „LU“)
* `NVARCHAR(50)` = Text bis 50 Zeichen

### Mini-Übung: Welcher Datentyp passt?

Schreibe den passenden Datentyp hin.

1. Werte: `0`, `1` → `__________`
2. Werte: `2026-03-04`, `2025-12-24` → `__________`
3. Werte: `LU`, `ZH`, `BE` → `__________`
4. Werte: `19.95`, `0.50`, `120.00` → `__________`
5. Werte: `Mia`, `Noah`, `Anna-Lena` → `__________`

# 5) Übungsprojekt: „Schüler AG“ (neue Beispiele)

Du baust eine kleine Datenbank für Schul-AGs.

## Tabellen (Beschreibung)

**Schueler**

* `Schueler_ID` (PK), automatisch hochzählen
* `Vorname`
* `Nachname`
* `Eintrittsdatum` (Standard: heute)

**AG**

* `AG_ID` (PK), automatisch hochzählen
* `Name`
* `MaxPlaetze` (muss > 0 sein)

**Teilnahme**

* `FK_Schueler_ID` (zeigt auf Schüler)
* `FK_AG_ID` (zeigt auf AG)
* `StartDatum`
* Primärschlüssel: beide FK zusammen (zusammengesetzt)

> Tipp: Primärschlüssel werden oft automatisch hochgezählt.

## Aufgabe A: DDL oder nicht?

Kreuze an: Gehört das zu DDL?

* [ ] `SELECT`
* [ ] `CREATE TABLE`
* [ ] `ALTER TABLE`
* [ ] `DROP DATABASE`
* [ ] `INSERT`
* [ ] `UPDATE`

## Aufgabe B: Datenbank erstellen (mit Namens-Regel)

Die Datenbank heisst im Text: **„**Schüler AG**“**
In SQL sollst du schreiben: Schueler_AG (ä → ae, Leerzeichen → `_`).

Schreibe den Befehl:

```sql
CREATE DATABASE __________________
```

## Aufgabe C: Datenbank auswählen

Schreibe den Befehl:

```sql
USE __________________
```

## Aufgabe D: IDENTITY (nur den fehlenden Teil)

Ergänze so, dass die Nummer bei 200 startet und immer um 2 steigt.

```sql
... Mitgliedsnummer INT ________ NOT NULL, ...
```

Schreibe nur den fehlenden Teil: `________`

## Aufgabe E: Tabelle `Schueler` erstellen

Erstelle die Tabelle Schueler.

* `Schueler_ID` ist `INT`, `IDENTITY(1,1)`, `NOT NULL`
* `Vorname` ist `NVARCHAR(50)`, `NOT NULL`
* `Nachname` ist `NVARCHAR(50)`, `NOT NULL`
* `Eintrittsdatum` ist `DATE`, `NOT NULL`

```sql
CREATE TABLE Schueler (
  Schueler_ID INT IDENTITY(1,1) NOT NULL,
  Vorname NVARCHAR(50) NOT NULL,
  Nachname NVARCHAR(50) NOT NULL,
  Eintrittsdatum DATE NOT NULL
)
```

## Aufgabe F: Primärschlüssel hinzufügen

Der Primärschlüssel heisst: `PK_Schueler`.

```sql
ALTER TABLE Schueler
ADD CONSTRAINT __________________
PRIMARY KEY (__________________)
```

## Aufgabe G: DEFAULT-Regel hinzufügen

In `Eintrittsdatum` soll standardmässig heute stehen (wenn man nichts angibt).
Nutze `GETDATE()`.

Regelname: `DF_Schueler_Eintrittsdatum`

```sql
ALTER TABLE Schueler
ADD CONSTRAINT __________________ DEFAULT (________________) FOR __________________
```

## Aufgabe H: Tabelle `AG` erstellen

Spalten:

* `AG_ID` INT IDENTITY(1,1) NOT NULL
* `Name` NVARCHAR(50) NOT NULL
* `MaxPlaetze` INT NOT NULL

Schreibe dein `CREATE TABLE AG (...)`.

## Aufgabe I: CHECK-Regel (MaxPlaetze > 0)

Regelname: `CK_AG_MaxPlaetze_Positiv`

```sql
ALTER TABLE AG
ADD CONSTRAINT __________________
CHECK (________________ > 0)
```

## Aufgabe J: Tabelle `Teilnahme` erstellen (ohne PK)

Spalten:

* `FK_Schueler_ID` INT NOT NULL
* `FK_AG_ID` INT NOT NULL
* `StartDatum` DATE NOT NULL

Schreibe `CREATE TABLE Teilnahme (...)`.

## Aufgabe K: Zusammengesetzten Primärschlüssel hinzufügen

Regelname: `PK_Teilnahme`

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT __________________
PRIMARY KEY (________________, ________________)
```

## Aufgabe L: Fremdschlüssel hinzufügen

1. FK von `Teilnahme` zu `Schueler`
   Regelname: `FK_Teilnahme_Schueler`

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT __________________
FOREIGN KEY (________________) REFERENCES Schueler(________________)
```

2. FK von `Teilnahme` zu `AG`
   Regelname: `FK_Teilnahme_AG`

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT __________________
FOREIGN KEY (________________) REFERENCES AG(________________)
```

## Aufgabe M: Spalte hinzufügen

Füge `Email` hinzu: `NVARCHAR(200) NULL`

```sql
ALTER TABLE Schueler
ADD __________________ NVARCHAR(200) NULL
```

## Aufgabe N: Spalte löschen (DROP COLUMN)

Lösche `Email` wieder.

```sql
ALTER TABLE Schueler
DROP COLUMN __________________
```

## Aufgabe O: Tabelle löschen, nur wenn sie existiert

Die Tabelle `Teilnahme` soll gelöscht werden.
Es soll geprüft werden, ob sie existiert.
Nur **ein** Befehl.

```sql
DROP TABLE IF EXISTS __________________
```

## Aufgabe P: Datenbank löschen, nur wenn sie existiert

```sql
DROP DATABASE IF EXISTS __________________
```

# Lösungen

## Datentypen

1. `BIT`
2. `DATE`
3. `NCHAR(2)`
4. z.B. `NUMERIC(6,2)`
5. `NVARCHAR(50)` (oder kleiner)

## Aufgabe A (DDL)

DDL ist: `CREATE TABLE`, `ALTER TABLE`, `DROP DATABASE`.
Nicht DDL ist: `SELECT`, `INSERT`, `UPDATE`.

## Aufgabe B

```sql
CREATE DATABASE Schueler_AG
```

## Aufgabe C

```sql
USE Schueler_AG
```

## Aufgabe D

```sql
IDENTITY(200,2)
```

## Aufgabe F

```sql
ALTER TABLE Schueler
ADD CONSTRAINT PK_Schueler
PRIMARY KEY (Schueler_ID)
```

## Aufgabe G

```sql
ALTER TABLE Schueler
ADD CONSTRAINT DF_Schueler_Eintrittsdatum DEFAULT (GETDATE()) FOR Eintrittsdatum
```

## Aufgabe H (Beispiel)

```sql
CREATE TABLE AG (
  AG_ID INT IDENTITY(1,1) NOT NULL,
  Name NVARCHAR(50) NOT NULL,
  MaxPlaetze INT NOT NULL
)
```

## Aufgabe I

```sql
ALTER TABLE AG
ADD CONSTRAINT CK_AG_MaxPlaetze_Positiv
CHECK (MaxPlaetze > 0)
```

## Aufgabe J (Beispiel)

```sql
CREATE TABLE Teilnahme (
  FK_Schueler_ID INT NOT NULL,
  FK_AG_ID INT NOT NULL,
  StartDatum DATE NOT NULL
)
```

## Aufgabe K

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT PK_Teilnahme
PRIMARY KEY (FK_Schueler_ID, FK_AG_ID)
```

## Aufgabe L

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT FK_Teilnahme_Schueler
FOREIGN KEY (FK_Schueler_ID) REFERENCES Schueler(Schueler_ID)
```

```sql
ALTER TABLE Teilnahme
ADD CONSTRAINT FK_Teilnahme_AG
FOREIGN KEY (FK_AG_ID) REFERENCES AG(AG_ID)
```

## Aufgabe M

```sql
ALTER TABLE Schueler
ADD Email NVARCHAR(200) NULL
```

## Aufgabe N

```sql
ALTER TABLE Schueler
DROP COLUMN Email
```

## Aufgabe O

```sql
DROP TABLE IF EXISTS Teilnahme
```

## Aufgabe P

```sql
DROP DATABASE IF EXISTS Schueler_AG
```
