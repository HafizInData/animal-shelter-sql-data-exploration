-- Membuat Tabel Stray_Map
CREATE TABLE Stray_Map (
	Animal_ID VARCHAR(15),
	Found_Location TEXT,
	At_AAC TEXT,
	Intake_Date TEXT,
	Type VARCHAR(30),
	Looks_Like TEXT,
	Color VARCHAR(30),
	Sex VARCHAR(20),
	Age VARCHAR(20),
	Image_Link TEXT
);

-- Menampilkan Tabel Stray_Map
SELECT * FROM Stray_Map;


-- Membersihkan Data

-- Mengubah tipe data kolom Intake_Date Menjadi DATE
ALTER TABLE Stray_Map
ALTER COLUMN Intake_Date TYPE DATE
USING TO_DATE(Intake_Date, 'MM/DD/YYYY');

-- Menampilkan Tabel Stray_Map
SELECT * FROM Stray_Map;