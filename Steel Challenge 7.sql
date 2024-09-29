create database Healthcare_Analysis ;

CREATE TABLE Patients (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(50),
age INT,
gender VARCHAR(10),
city VARCHAR(50)
);
CREATE TABLE Symptoms (
symptom_id INT PRIMARY KEY,
symptom_name VARCHAR(50)
);
CREATE TABLE Diagnoses (
diagnosis_id INT PRIMARY KEY,
diagnosis_name VARCHAR(50)
);
CREATE TABLE Visits (
visit_id INT PRIMARY KEY,
patient_id INT,
symptom_id INT,
diagnosis_id INT,
visit_date DATE,
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (symptom_id) REFERENCES Symptoms(symptom_id),
FOREIGN KEY (diagnosis_id) REFERENCES Diagnoses(diagnosis_id)
);
-- Insert data into Patients table
INSERT INTO Patients (patient_id, patient_name, age, gender, city)
VALUES
(1, 'John Smith', 45, 'Male', 'Seattle'),
(2, 'Jane Doe', 32, 'Female', 'Miami'),
(3, 'Mike Johnson', 50, 'Male', 'Seattle'),
(4, 'Lisa Jones', 28, 'Female', 'Miami'),
(5, 'David Kim', 60, 'Male', 'Chicago');
-- Insert data into Symptoms table
INSERT INTO Symptoms (symptom_id, symptom_name)
VALUES
(1, 'Fever'),
(2, 'Cough'),
(3, 'Difficulty Breathing'),
(4, 'Fatigue'),
(5, 'Headache');
-- Insert data into Diagnoses table
INSERT INTO Diagnoses (diagnosis_id, diagnosis_name)
VALUES
(1, 'Common Cold'),
(2, 'Influenza'),
(3, 'Pneumonia'),
(4, 'Bronchitis'),
(5, 'COVID-19');
-- Insert data into Visits table
INSERT INTO Visits (visit_id, patient_id, symptom_id, diagnosis_id, visit_date)
VALUES
(1, 1, 1, 2, '2022-01-01'),
(2, 2, 2, 1, '2022-01-02'),
(3, 3, 3, 3, '2022-01-02'),
(4, 4, 1, 4, '2022-01-03'),
(5, 5, 2, 5, '2022-01-03'),
(6, 1, 4, 1, '2022-05-13'),
(7, 3, 4, 1, '2022-05-20'),
(8, 3, 2, 1, '2022-05-20'),
(9, 2, 1, 4, '2022-08-19'),
(10, 1, 2, 5, '2022-12-01');



/*1. Write a SQL query to retrieve all patients who have been diagnosed with COVID-19*/

SELECT p.*, d.diagnosis_name
FROM visits AS v
JOIN patients AS p USING(patient_id)
JOIN diagnoses AS d USING(diagnosis_id)
WHERE d.diagnosis_name = 'COVID-19';


/*2. Write a SQL query to retrieve the number 
of visits made by each patient, ordered by
 the number of visits in descending order.*/
 
SELECT p.patient_id, p.patient_name, COUNT(visit_id) AS number_of_visits
FROM visits AS v
JOIN patients AS p USING (patient_id)
GROUP BY p.patient_id, p.patient_name
ORDER BY number_of_visits DESC;

 
 /*3. Write a SQL query to calculate the average age
 of patients who have been diagnosed with Pneumonia.*/
 
SELECT ROUND(AVG(p.age), 2) AS avg_age
FROM patients AS p
JOIN visits AS v USING(patient_id)
JOIN diagnoses AS d USING(diagnosis_id)
WHERE d.diagnosis_name = 'Pneumonia';



 
 /*4. Write a SQL query to retrieve 
the top 3 most common symptoms among all visits.*/


SELECT s.symptom_name, COUNT(v.symptom_id) AS count_of_symptoms
FROM symptoms s
JOIN visits v ON s.symptom_id = v.symptom_id
GROUP BY s.symptom_name
ORDER BY count_of_symptoms DESC
LIMIT 3;

/*5. Write a SQL query to retrieve the patient 
who has the highest number of different symptoms reported.*/

SELECT p.patient_id, p.patient_name, COUNT(DISTINCT v.symptom_id) AS num_symptoms
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.patient_id, p.patient_name
ORDER BY num_symptoms DESC
LIMIT 1;

/*6. Write a SQL query to calculate the percentage of patients 
who have been diagnosed with COVID-19 out of
the total number of patients.*/

SELECT COUNT(DISTINCT p.patient_id) AS total_patients,
COUNT(DISTINCT CASE WHEN d.diagnosis_name = 'COVID-19' THEN p.patient_id END) 
    AS covid_patients,
(COUNT(DISTINCT CASE WHEN d.diagnosis_name = 'COVID-19' THEN p.patient_id END) / CAST(COUNT(DISTINCT p.patient_id) AS FLOAT))*100 
    AS percentage_covid_patients
FROM patients p
LEFT JOIN visits v ON p.patient_id = v.patient_id
LEFT JOIN diagnoses d ON v.diagnosis_id = d.diagnosis_id;


/*7. Write a SQL query to retrieve the top 5 cities with the highest number of visits,
 along with the count of visits in each city.*/
 
SELECT city, COUNT(*) AS visit_count
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY city
ORDER BY visit_count DESC
LIMIT 5;


 /*8. Write a SQL query to find the patient who has the highest
 number of visits in a single day, along with the corresponding visit date.*/
 
 SELECT P.patient_id, P.patient_name, V.visit_date ,COUNT(*) AS visit_count
 FROM patients AS p
 JOIN visits AS v Using(patient_id)
 GROUP BY P.patient_id, P.patient_name, V.visit_date 
 ORDER BY visit_count DESC
 LIMIT 1 ;
 
/*9. Write a SQL query to retrieve the average age of patients for
 each diagnosis, ordered by the average age in descending order.*/
 
SELECT d.diagnosis_name, round(AVG(p.age),2) AS average_age
FROM visits v
JOIN diagnoses d ON v.diagnosis_id = d.diagnosis_id
JOIN patients p ON v.patient_id = p.patient_id
GROUP BY d.diagnosis_name
ORDER BY average_age DESC;


/*10. Write a SQL query to calculate the cumulative count of visits over 
time, ordered by the visit date.*/

SELECT v.visit_date, 
       COUNT(*) AS daily_visits,
       SUM(COUNT(*)) OVER (ORDER BY v.visit_date) AS cumulative_visits
FROM visits v
GROUP BY v.visit_date
ORDER BY v.visit_date;
