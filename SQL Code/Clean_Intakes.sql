-- Membuat Tabel Intakes
CREATE TABLE Intakes(
	Animal_ID VARCHAR(15),
	Name VARCHAR(30),
	DateTime TEXT,
	MonthYear TEXT,
	Found_Location TEXT,
	Intake_Type VARCHAR(20),
	Intake_Condition VARCHAR(20),
	Animal_Type VARCHAR(20),
	Sex_upon_Intake VARCHAR(20),
	Age_upon_Intake VARCHAR(20),
	Breed TEXT,
	Color VARCHAR(30)
);

-- Menampillkan kolom Intakes
SELECT * FROM Intakes;

-- Membersihkan Data

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