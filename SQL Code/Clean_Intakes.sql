-- Membuat Tabel Outcomes
CREATE TABLE Outcomes(
	Animal_ID VARCHAR(15),
	Name VARCHAR(30),
	DateTime TEXT,
	MonthYear TEXT,
	Date_of_Birth TEXT,
	Outcome_Type VARCHAR(30),
	Outcome_Subtype VARCHAR(30),
	Animal_Type VARCHAR(20),
	Sex_upon_Outcome VARCHAR(20),
	Age_upon_Outcome VARCHAR(20),
	Breed TEXT,
	Color VARCHAR(30)
);

-- Menampilkan kolom Outcomes
SELECT * FROM Outcomes;

-- Membersihkan Data

-- Menghilangkan nilai duplikat
DELETE FROM Intakes
WHERE ctid NOT IN (
	SELECT MIN(ctid)
	FROM Intakes
	GROUP BY Animal_ID
);

-- Mengubah tipe data kolom DateTime dan Monthyear
ALTER TABLE Intakes
ALTER COLUMN DateTime TYPE TIMESTAMP
USING TO_TIMESTAMP(DateTime, 'MM/DD/YYYY HH24:MI');

ALTER TABLE Intakes
ALTER COLUMN Monthyear TYPE DATE
USING TO_DATE(MonthYear, 'MM/DD/YYYY');

-- Menghilangkan Tanda * Pada data yang terisi di kolom name
UPDATE Intakes
SET NAME = REPLACE(Name, '*', '');

-- Menampillkan kolom Intakes
SELECT * FROM Intakes;