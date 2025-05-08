-- Menampilkan Tabel Intakes
SELECT * FROM Intakes;

-- Menampilkan Tabel Outcomes
SELECT * FROM Outcomes;

-- Menampilkan Tabel Stray_Map
SELECT * FROM Stray_Map;

-- Menggabungkan kolom intake type dan outcome type
SELECT
	Intakes.Animal_ID,
	Intakes.Intake_Type,
	Outcomes.Outcome_Type,
	Outcomes.Animal_Type
FROM Intakes
JOIN Outcomes ON Intakes.Animal_ID = Outcomes.Animal_ID;

-- Mencari tau kelompok tipe Outcome terbanyak dalam shelter
SELECT 
	Outcome_Type,
	COUNT(*) AS Total
FROM Outcomes 
GROUP BY Outcome_Type 
ORDER BY Total DESC;

-- Mencari tau jumlah jenis outcome berdarkan jenis hewannya
SELECT 
	Animal_Type,
	Outcome_Type,
	COUNT(Outcome_Type) AS Total
FROM Outcomes
GROUP BY Animal_Type, Outcome_Type;

-- TOP 10 Ras hewan terbanyak yang datang ke shelter
SELECT 
	Animal_Type,
	Breed,
COUNT(*) AS Total
FROM Intakes
GROUP BY Animal_Type, Breed
ORDER BY Total DESC LIMIT 10;

-- TOP 10 lokasi penemuan hewan terbanyak
SELECT
	Found_Location,
	COUNT(*) AS Total
FROM Intakes
GROUP BY Found_Location
ORDER BY Total DESC LIMIT 10;

-- Menghitung Persentase Tipe Outcome
SELECT
	Outcome_Type,
	ROUND(Count(*) * 100 / SUM(COUNT (*) ) OVER(), 2) || '%' AS Percentage
FROM Outcomes
GROUP BY Outcome_Type
ORDER BY COUNT(*) DESC;

-- TOP 10 Ras hewan dengan angka Adopsi tertinggi
SELECT
	Intakes.Animal_Type,
 	Intakes.Breed,
 	COUNT(*) Total_Adoption
FROM Intakes JOIN Outcomes ON intakes.Animal_ID = Outcomes.Animal_ID
WHERE Outcomes.Outcome_Type = 'Adoption'
Group BY Intakes.Breed, Intakes.Animal_Type
ORDER BY Total_Adoption DESC LIMIT 10;

-- Mencari tau Jumlah outcome hewan yang diadopsi berdasarkan intake kehidupan liar
SELECT 
	Intakes.Animal_Type,
	Intakes.Intake_type,
	COUNT(*) AS Total_Adoption
FROM Intakes 
JOIN Outcomes ON Intakes.Animal_ID = Outcomes.Animal_ID
	WHERE Intakes.Intake_Type IN ('Stray', 'Wildlife') 
	AND Outcomes.Outcome_Type = 'Adoption'
GROUP BY Intakes.Animal_Type, Intakes.Intake_type
ORDER BY Total_Adoption DESC;

--  TOP 5 Lokasi dengan penemuan anjing liar terbanyak
SELECT 
	Found_Location,
	COUNT(*) AS Total_Dog
FROM Intakes 
	WHERE Animal_Type = 'Dog' 
	AND Intake_Type IN ('Stray', 'Wildlife')
GROUP BY Found_Location
ORDER BY Total_Dog DESC LIMIT 5;

-- Rentang waktu hewan dalam shelter berdasarkan kepentingan outcomenya
SELECT 
	Intakes.Animal_ID,
	Intakes.Animal_Type,
	Outcomes.Outcome_Type,
	Intakes.Datetime AS Intake_Time,
	Outcomes.Datetime AS Outcome_Time,
	(Outcomes.Datetime - Intakes.Datetime) AS Duration_in_Shelter
FROM Intakes
JOIN Outcomes ON Intakes.Animal_ID = Outcomes.Animal_ID
WHERE Outcomes.Datetime IS NOT NULL
ORDER BY Duration_in_Shelter DESC;

-- Total Adopsi berdasarkan jenis kelamin hewan
SELECT
	Intakes.Sex_upon_Intake,
	Outcomes.Sex_upon_Outcome,
	COUNT(*) As Total_Adoption
FROM Intakes JOIN Outcomes ON Intakes.Animal_ID = Outcomes.Animal_ID
WHERE Outcome_Type = 'Adoption'
GROUP BY Intakes.Sex_upon_Intake, Outcomes.Sex_upon_Outcome
ORDER BY Total_Adoption DESC;
