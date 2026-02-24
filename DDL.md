# Selbstlern‑Fragerunde – M164 B1.2 DDL **ComputerShop**

> So nutzt du dieses Selbstlernprogramm**:**
>
> 1. Lies eine Frage.
> 2. Denk kurz nach und beantworte sie selbst.
> 3. Vergleiche mit der  Antwort.

## Level 0: Warm‑up – Was ist DDL überhaupt?

### Frage 0.1: Wofür steht  **DDL** ?

**Antwort:** DDL bedeutet Data Definition Language. Das sind SQL‑Befehle, mit denen man Datenbanken und Tabellen baut/ändert/löscht (also die  Struktur, nicht die Inhalte).

**Merke:** DDL = Bauplan der Datenbank.

### Frage 0.2: Nenne 3 typische DDL‑Befehle.

**Antwort:**

* `CREATE` (etwas erstellen)
* `ALTER` (etwas ändern)
* `DROP` (etwas löschen)

### Frage 0.3: Was ist der Unterschied zwischen **Tabelle** und  **Datensatz** ?

**Antwort:**

* Tabelle = wie eine Excel‑Tabelle (mit Spalten).
* Datensatz/Zeile = eine konkrete Zeile (z. B. ein Kunde).

### Frage 0.4: Was ist eine  **Spalte** ?

**Antwort:** Eine Spalte ist ein Merkmal (z. B. `Vorname`, `Preis`, `Bestelldatum`).

## Level 1: Die Aufgabe verstehen – Was soll im ComputerShop gebaut werden?

Im Aufgabenblatt soll eine Datenbank ComputerShop erstellt werden, zuerst mit den Tabellen Kunde, Artikel, Bestellung.

### Frage 1.1: Wie heisst die Datenbank in der Aufgabe?

**Antwort:** `ComputerShop`

### Frage 1.2: Welche 3 Tabellen sollen am Anfang existieren?

**Antwort:** `Kunde`, `Artikel`, `Bestellung`

### Frage 1.3: Wozu ist die Tabelle **Kunde** da?

**Antwort:** Sie speichert die Daten der Kundinnen und Kunden (z. B. Name, Vorname).

### Frage 1.4: Wozu ist die Tabelle **Artikel** da?

**Antwort:** Sie speichert die Produkte/Artikel (Bezeichnung, Preis).

### Frage 1.5: Wozu ist die Tabelle **Bestellung** da?

**Antwort:** Sie speichert Bestellungen (z. B. Bestelldatum, Komplettlieferung und Verknüpfungen).

## Level 2: Spalten & Datentypen – Was steht in jeder Tabelle?

Im Schema (Seite 3) sind Spalten und Datentypen vorgegeben.

### Frage 2.1: Welche Spalten hat  **Kunde** ?

**Antwort:**

* `Kunde_ID` (int, Primärschlüssel)
* `Nachname` (nvarchar(100))
* `Vorname` (nvarchar(100))

### Frage 2.2: Welche Spalten hat  **Artikel** ?

**Antwort:**

* `Artikel_ID` (int, Primärschlüssel)
* `Bezeichnung` (nvarchar(200))
* `Preis` (numeric(9,2))

### Frage 2.3: Welche Spalten hat **Bestellung** am Anfang im Schema?

**Antwort:**

* `Bestellung_ID` (int, Primärschlüssel)
* `Datum` (date)
* `Komplettlieferung` (bit)
* `fk_Artikel_ID` (int)
* `fk_Kunde_ID` (int)

> Später wird das geändert: `Datum` wird umbenannt und `fk_Artikel_ID` wird entfernt (weil eine Bestellung mehrere Artikel haben soll).

### Frage 2.4: Was bedeutet `int`?

**Antwort:** Eine ganze Zahl (z. B. 1, 2, 3).

### Frage 2.5: Was bedeutet `nvarchar(100)`?

**Antwort:** Ein Text (Buchstaben), maximal 100 Zeichen. (`n` = Unicode, also auch Sonderzeichen).

### Frage 2.6: Was bedeutet `numeric(9,2)` beim Preis?

**Antwort:** Eine Zahl mit Komma: insgesamt bis 9 Stellen, davon 2 Nachkommastellen (z. B. 9999999.99).

### Frage 2.7: Was bedeutet `date`?

**Antwort:** Ein Datum (z. B. 2026‑02‑23).

### Frage 2.8: Was bedeutet `bit`?

**Antwort:** Ein  Ja/Nein ‑Wert (meist 0 = false, 1 = true).

### Frage 2.9: Was bedeutet `NOT NULL`?

**Antwort:** Diese Spalte darf nicht leer sein. (Also muss immer einen Wert haben.)

## Level 3: Primärschlüssel – Wie bekommt jede Zeile eine eindeutige ID?

Im Aufgabenblatt steht: Primärschlüssel so definieren, dass Werte automatisch hochgezählt werden.

### Frage 3.1: Was ist ein  **Primärschlüssel (Primary Key)** ?

**Antwort:** Eine Spalte (oder mehrere), die jede Zeile eindeutig macht – wie eine ID‑Nummer.

### Frage 3.2: Welche Spalten sind Primärschlüssel in den 3 Tabellen?

**Antwort:**

* Kunde: `Kunde_ID`
* Artikel: `Artikel_ID`
* Bestellung: `Bestellung_ID`

### Frage 3.3: Was bedeutet „automatisch hochgezählt“ in SQL Server?

**Antwort:** Man nutzt `IDENTITY(1,1)` – dann zählt SQL Server die ID selbst: 1, 2, 3, 4, …

### Frage 3.4: Beispiel: Wie sieht eine ID‑Spalte mit Auto‑Nummer aus?

**Antwort (Beispiel):**

```sql
Kunde_ID int IDENTITY(1,1) NOT NULL
```

## Level 4: Aufgabe 1 – Datenbank & Tabellen erstellen (CREATE)

Das Aufgabenblatt verlangt: Datenbank ComputerShop + Tabellen + Spalten + Primärschlüssel.

### Frage 4.1: Welcher Befehl erstellt eine Datenbank?

**Antwort:** `CREATE DATABASE`

Beispiel:

```sql
CREATE DATABASE ComputerShop
```

### Frage 4.2: Welcher Befehl erstellt eine Tabelle?

**Antwort:** `CREATE TABLE`

### Frage 4.3: Schreibe (als Muster) die Tabelle **Kunde** mit Primärschlüssel.

**Antwort (Muster, SQL Server):**

```sql
CREATE TABLE Kunde (
  Kunde_ID int IDENTITY(1,1) NOT NULL,
  Nachname nvarchar(100) NOT NULL,
  Vorname nvarchar(100) NOT NULL,
  CONSTRAINT PK_Kunde PRIMARY KEY (Kunde_ID)
)
```

(Die Spalten stehen so im Schema der Aufgabe.)

### Frage 4.4: Schreibe (als Muster) die Tabelle **Artikel** mit Primärschlüssel.

**Antwort (Muster):**

```sql
CREATE TABLE Artikel (
  Artikel_ID int IDENTITY(1,1) NOT NULL,
  Bezeichnung nvarchar(200) NOT NULL,
  Preis numeric(9,2) NOT NULL,
  CONSTRAINT PK_Artikel PRIMARY KEY (Artikel_ID)
)
```

(Schema Seite 3.)

### Frage 4.5: Schreibe (als Muster) die Tabelle **Bestellung** (Start‑Version aus Schema).

**Antwort (Muster – Startzustand):**

```sql
CREATE TABLE Bestellung (
  Bestellung_ID int IDENTITY(1,1) NOT NULL,
  Datum date NOT NULL,
  Komplettlieferung bit NOT NULL,
  fk_Artikel_ID int NOT NULL,
  fk_Kunde_ID int NOT NULL,
  CONSTRAINT PK_Bestellung PRIMARY KEY (Bestellung_ID)
)
```

(Diese Spalten sind so im Schema abgebildet.)

> **Achtung:** In den nächsten Levels wird das verbessert (n:n und Spalte umbenennen).

## Level 5: Beziehung verstehen – Warum reicht `fk_Artikel_ID` nicht?

Im Aufgabenblatt steht: Momentan ist zwischen Artikel und Bestellung eine  1:n ‑Beziehung, dadurch kann eine Bestellung nur einen Artikel enthalten – das muss korrigiert werden.

### Frage 5.1: Was bedeutet eine  **1:n‑Beziehung** ?

**Antwort:**

* 1 Datensatz auf der linken Seite passt zu vielen auf der rechten.
  Beispiel: 1 Kunde → viele Bestellungen.

### Frage 5.2: Was bedeutet eine  **n:n‑Beziehung** ?

**Antwort:**

* Viele Datensätze passen zu vielen.
  Beispiel: Eine Bestellung enthält viele Artikel und ein Artikel kann in vielen Bestellungen vorkommen.

### Frage 5.3: Warum ist `fk_Artikel_ID` in **Bestellung** ein Problem?

**Antwort:** Weil in einer Bestellung‑Zeile nur ein Wert in `fk_Artikel_ID` stehen kann. Dann könnte eine Bestellung nur einen Artikel enthalten. Das will die Aufgabe ändern.

### Frage 5.4: Wie löst man eine n:n‑Beziehung in einer Datenbank?

**Antwort:** Mit einer Zwischentabelle (auch „Verknüpfungstabelle“ genannt).

## Level 6: Aufgabe 2 – Zwischentabelle erstellen + Spalte entfernen (ALTER)

Die Aufgabe sagt: Erstelle eine Zwischentabelle „Besteht_Aus“ (oder „Artikel_Bestellung“) mit

* `fk_Bestellung_ID` (PK + FK)
* `fk_Artikel_ID` (PK + FK)
  Und lösche danach `fk_Artikel_ID` aus `Bestellung`.

### Frage 6.1: Wie heisst die Zwischentabelle laut Aufgabe (mindestens eine Variante)?

**Antwort:** `Besteht_Aus` (oder `Artikel_Bestellung`).

### Frage 6.2: Warum sind in der Zwischentabelle **zwei** IDs drin?

**Antwort:** Damit man speichern kann:
„Diese Bestellung enthält diesen Artikel.“

### Frage 6.3: Warum sind beide Spalten zusammen der Primärschlüssel?

**Antwort:** Weil die Kombination eindeutig ist:
`(Bestellung 5, Artikel 2)` soll nicht doppelt vorkommen.

### Frage 6.4: Muster: Wie sieht `CREATE TABLE Besteht_Aus` (ohne FKs) aus?

**Antwort (Muster):**

```sql
CREATE TABLE Besteht_Aus (
  fk_Bestellung_ID int NOT NULL,
  fk_Artikel_ID int NOT NULL,
  CONSTRAINT PK_Besteht_Aus PRIMARY KEY (fk_Bestellung_ID, fk_Artikel_ID)
)
```

(Spalten sind so gefordert.)

### Frage 6.5: Wie löscht man eine Spalte aus einer Tabelle?

**Antwort:** Mit `ALTER TABLE ... DROP COLUMN ...`

Beispiel (aus Aufgabe: `fk_Artikel_ID` soll aus `Bestellung` weg):

```sql
ALTER TABLE Bestellung
DROP COLUMN fk_Artikel_ID
```

## Level 7: Aufgabe 3 – Zwischentabelle ergänzen (Anzahl)

Die Aufgabe verlangt: Ergänze in **Besteht_Aus** die Spalte `Anzahl`, weil pro Artikel in einer Bestellung die Stückzahl gespeichert werden soll (nur ganze Einheiten).

### Frage 7.1: Wie heisst die neue Spalte?

**Antwort:** `Anzahl`

### Frage 7.2: Welcher Datentyp passt zu `Anzahl`, wenn nur ganze Stücke verkauft werden?

**Antwort:** `int` (ganze Zahl).

### Frage 7.3: Wie fügt man eine neue Spalte hinzu?

**Antwort:** Mit `ALTER TABLE ... ADD ...`

Beispiel:

```sql
ALTER TABLE Besteht_Aus
ADD Anzahl int NOT NULL
```

## Level 8: Aufgabe 4 – Beziehungen erstellen (FOREIGN KEY)

Die Aufgabe verlangt: Erstelle alle notwendigen Beziehungen zwischen Fremdschlüssel und Primärschlüssel.

### Frage 8.1: Was ist ein  **Fremdschlüssel (Foreign Key)** ?

**Antwort:** Eine Spalte, die auf eine andere Tabelle zeigt. So weiss die DB: „Diese Bestellung gehört zu genau diesem Kunden.“

### Frage 8.2: Welche Beziehung ist sicher nötig zwischen Kunde und Bestellung?

**Antwort:** `Bestellung.fk_Kunde_ID` zeigt auf `Kunde.Kunde_ID`.

### Frage 8.3: Welche Beziehungen braucht die Zwischentabelle Besteht_Aus?

**Antwort:**

* `Besteht_Aus.fk_Bestellung_ID` → `Bestellung.Bestellung_ID`
* `Besteht_Aus.fk_Artikel_ID` → `Artikel.Artikel_ID`

### Frage 8.4: Muster: Wie fügt man einen Fremdschlüssel hinzu?

**Antwort (Muster):**

```sql
ALTER TABLE Bestellung
ADD CONSTRAINT FK_Bestellung_Kunde
FOREIGN KEY (fk_Kunde_ID) REFERENCES Kunde(Kunde_ID)
```

### Frage 8.5: Muster: Fremdschlüssel in Besteht_Aus (2 Stück)

**Antwort (Muster):**

```sql
ALTER TABLE Besteht_Aus
ADD CONSTRAINT FK_Besteht_Aus_Bestellung
FOREIGN KEY (fk_Bestellung_ID) REFERENCES Bestellung(Bestellung_ID)

ALTER TABLE Besteht_Aus
ADD CONSTRAINT FK_Besteht_Aus_Artikel
FOREIGN KEY (fk_Artikel_ID) REFERENCES Artikel(Artikel_ID)
```

## Level 9: Aufgabe 5 – Spalte umbenennen (SQL Server)

Im Blatt steht: Spalte `Datum` in `Bestellung` soll in `Bestelldatum` umbenannt werden. Dafür braucht es in SQL Server eine passende Alternative.

### Frage 9.1: Warum soll `Datum` umbenannt werden?

**Antwort:** Weil `Datum` zu allgemein ist. `Bestelldatum` ist klarer: Es ist das Datum, wann bestellt wurde.

### Frage 9.2: Wie heisst der neue Spaltenname?

**Antwort:** `Bestelldatum`

### Frage 9.3: Wie benennt man in SQL Server eine Spalte um?

**Antwort:** Mit `sp_rename`.

Muster:

```sql
EXEC sp_rename 'Bestellung.Datum', 'Bestelldatum', 'COLUMN'
```

(So funktioniert es in SQL Server.) ([Microsoft Learn](https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-rename-transact-sql?view=sql-server-ver17&utm_source=chatgpt.com "sp_rename (Transact-SQL) - SQL Server"))

## Level 10: Aufgabe 6 – Regeln definieren (Constraints)

Im Aufgabenblatt sollen Regeln (Standardwerte und Einschränkungen) die Datenqualität erhöhen, z. B. Preisbereich, Mindestanzahl, Standardwerte, Datum nicht in Zukunft.

### Frage 10.1: Wie heisst eine Regel in SQL meistens?

**Antwort:** Constraint (Einschränkung/Regel).

### Frage 10.2: Wie kann ich in SQL eine Regel festlegen, damit ein Wert nur in einem bestimmten Bereich liegen darf?

*(Beispiel: Preis muss > 0 und ≤ 10 sein.)*

**Antwort:** `CHECK`

### Frage 10.3: Regel 1: Wie muss der Preis eines Artikels sein?

**Antwort:**  **Grösser als 0 und kleiner oder gleich 10** .

Muster (CHECK):

```sql
CONSTRAINT CK_Artikel_Preis_Bereich
CHECK (Preis > 0 AND Preis <= 10)
```

### Frage 10.4: Regel 2:Wie gross muss die Anzahl mindestens sein, damit man einen Artikel bestellen kann?

**Antwort:** Mindestens  1.

Muster:

```sql
CONSTRAINT CK_Besteht_Aus_Anzahl_Positive
CHECK (Anzahl >= 1)
```

### Frage 10.5: **Wie kann man festlegen, welcher Wert automatisch eingetragen wird, wenn man beim Einfügen keinen Wert angibt?**

**Antwort:** `DEFAULT`

### Frage 10.6: Regel 3: Was ist der Standardwert für `Komplettlieferung`, wenn nichts angegeben wird?

**Antwort:** `0` (false).

Muster:

```sql
CONSTRAINT DF_Bestellung_Komplettlieferung DEFAULT (0)
```

### Frage 10.7: Regel 4: Welcher Wert soll automatisch beim Bestelldatum eingetragen werden, wenn man kein Datum angibt?

**Antwort:** Heute (aktuelles Datum). Im Blatt steht: Mit `GETDATE()` erhält man das aktuelle Datum.

Muster (für `date` passend gemacht):

```sql
CONSTRAINT DF_Bestellung_Bestelldatum DEFAULT (CAST(GETDATE() AS date))
```

### Frage 10.8 **Welche falsche Eingabe muss beim Bestelldatum verhindert werden?**

**Antwort:** Das `Bestelldatum` darf nicht in der Zukunft liegen.

Muster (CHECK):

```sql
CONSTRAINT CK_Bestellung_Bestelldatum
CHECK (Bestelldatum <= CAST(GETDATE() AS date))
```

Hinweis: Solche CHE **INSERT/UPDATE** geprüft. ([Stack Overflow](https://stackoverflow.com/questions/5938523/check-constraint-for-date "sql server - check constraint for date - Stack Overflow"))

## Level 11: Aufgabe 7 – Ein SQL‑Skript für alles (ohne ALTER TABLE)

Im Blatt steht: Erstelle ein einziges Skript, das alles baut (Datenbank, Tabellen, Regeln), **ohne** `ALTER TABLE`. PK/FK sollen mit `CONSTRAINT` eigene Namen bekommen. Reihenfolge beachten.

### Frage 11.1: Was heisst „ohne ALTER TABLE“?

**Antwort:** Du sollst möglichst alles direkt in **`CREATE TABLE`** definieren (Spalten, PK, FK, CHECK, DEFAULT).

### Frage 11.2: Warum ist die Reihenfolgtig?

**Antwort:** Eine Tabelle kann nur einen Fremdschlüssel auf eine Tabelle setzen, die schon existiert.
Darum: Erst „Eltern“, dann „Kinder“.

### Frage 11.3: Welche Tabellen sollten zuerst erstellt werden, damit die FKs funktionieren?

**Antwort (logisch):**

1. `Kunde` (wird von Bestellung gebraucht)
2. `Artikel` (wird von Besteht_Aus gebrng` (braucht Kunde)
3. `Besteht_Aus` (braucht Bestellung + Artikel)

### Frage 11.4: Muster‑Gesamtskript (alles in CREATE TABLE)

**Antwort (Muster, mit passenden Constraint‑Namen wie im Kontrollbild):**

```sql
-------------------------------------------------------------------------------
-- T-SQL ComputerShop: Aufgabe 7
-------------------------------------------------------------------------------

USE master;
GO

DROP DATABASE IF EXISTS ComputerShop;
GO

CREATE DATABASE ComputerShop;
GO

USE ComputerShop;
GO

-------------------------------------------------------------------------------
-- Tabelle Kunde
-------------------------------------------------------------------------------

CREATE TABLE Kunde (
    Kunde_ID INTEGER IDENTITY(1,1) NOT NULL,
    Nachname NVARCHAR(100) NOT NULL,
    Vorname NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Kunde
        PRIMARY KEY (Kunde_ID)
);
GO

-------------------------------------------------------------------------------
-- Tabelle Artikel
-------------------------------------------------------------------------------

CREATE TABLE Artikel (
    Artikel_ID INTEGER IDENTITY(1,1) NOT NULL,
    Bezeichnung NVARCHAR(200) NOT NULL,
    Preis NUMERIC(9,2) NOT NULL,
    CONSTRAINT PK_Artikel
        PRIMARY KEY (Artikel_ID),
    CONSTRAINT CK_Artikel_Preis_Bereich
        CHECK (Preis > 0 AND Preis <= 10)
);
GO

-------------------------------------------------------------------------------
-- Tabelle Bestellung
-------------------------------------------------------------------------------

CREATE TABLE Bestellung (
    Bestellung_ID INTEGER IDENTITY(1,1) NOT NULL,
    Bestelldatum DATE NOT NULL
        CONSTRAINT DF_Bestellung_Bestelldatum
            DEFAULT (GETDATE()),
    Komplettlieferung BIT NOT NULL
        CONSTRAINT DF_Bestellung_Komplettlieferung
            DEFAULT (0),
    fk_Kunde_ID INTEGER NOT NULL,
    CONSTRAINT PK_Bestellung
        PRIMARY KEY (Bestellung_ID),
    CONSTRAINT FK_Bestellung_Kunde
        FOREIGN KEY (fk_Kunde_ID)
            REFERENCES Kunde (Kunde_ID),
    CONSTRAINT CK_Bestellung_Bestelldatum
        CHECK (Bestelldatum <= GETDATE())
);
GO

-------------------------------------------------------------------------------
-- Tabelle Besteht_Aus (mit zusammengesetztem PK)
-------------------------------------------------------------------------------

CREATE TABLE Besteht_Aus (
    fk_Bestellung_ID INTEGER NOT NULL,
    fk_Artikel_ID INTEGER NOT NULL,
    Anzahl INTEGER NOT NULL,
    CONSTRAINT PK_Besteht_Aus
        PRIMARY KEY (fk_Bestellung_ID, fk_Artikel_ID),
    CONSTRAINT FK_Besteht_Aus_Bestellung
        FOREIGN KEY (fk_Bestellung_ID)
            REFERENCES Bestellung (Bestellung_ID),
    CONSTRAINT FK_Besteht_Aus_Artikel
        FOREIGN KEY (fk_Artikel_ID)
            REFERENCES Artikel (Artikel_ID),
    CONSTRAINT CK_Besteht_Aus_Anzahl_Positive
        CHECK (Anzahl > 0)
);
GO
```

**Warum passt das gut zur Aufgabe?**

* Tabellen/Spalten/Datentypen entsprechen dem Aufgaben‑Schema.
* n:n‑Beziehung wird über Besteht_Aus gelöst.
* Regeln (CHECK/DEFAULT) sind eingebaut.
* Constraint‑Namen entsprechen dem Kontroll‑Beispiel (siehe Level 12)
