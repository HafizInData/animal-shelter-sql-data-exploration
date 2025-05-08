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

-- -- Mengubah tipe data kolom DateTime, Monthyear, dan Date_of_Birth
ALTER TABLE Outcomes
ALTER COLUMN DateTime TYPE TIMESTAMP
USING TO_TIMESTAMP(DateTime, 'MM/DD/YYYY HH24:MI');

ALTER TABLE Outcomes
ALTER COLUMN Monthyear TYPE DATE
USING TO_DATE(MonthYear, 'MM/DD/YYYY');

ALTER TABLE Outcomes
ALTER COLUMN Date_of_Birth TYPE Date
USING TO_DATE(Date_of_Birth, 'MM/DD/YYYY');

-- Menghilangkan Tanda * Pada data yang terisi di kolom name
UPDATE Outcomes
SET Name = REPLACE(Name, '*', '');

-- Menampilkan kolom Outcomes
SELECT * FROM Outcomes;