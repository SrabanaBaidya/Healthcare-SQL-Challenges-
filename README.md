# Healthcare SQL Challenge 🏥

Welcome to my SQL project where I tackled several healthcare-related challenges using a structured dataset involving patients, diagnoses, symptoms, and visits. The project was inspired by SQL challenges from **Matthew Steel** and **Datacoach**, designed to improve SQL proficiency in real-world scenarios.

## 🚀 Project Overview
This project focuses on querying a healthcare dataset with multiple tables (`Patients`, `Diagnoses`, `Symptoms`, and `Visits`) to answer important business and medical questions. I used various SQL clauses and techniques to generate insightful reports from the data.

## 📁 Dataset Structure
The dataset consists of the following tables:
- **Patients**: Contains patient demographic information.
- **Symptoms**: Lists all symptoms experienced by patients.
- **Diagnoses**: Stores diagnoses for each patient visit.
- **Visits**: Links patients to their symptoms and diagnoses on a visit-by-visit basis.

## 🔍 Key SQL Clauses Used
- **`JOIN`**: To merge and relate data across multiple tables.
- **`GROUP BY`**: To group and aggregate data for analysis.
- **`COUNT`**: To calculate the number of records in each group.
- **`CASE WHEN`**: For conditional queries and logic-based operations.
- **`ORDER BY`**: To rank results in descending or ascending order.
- **`LIMIT`**: To extract top records from results.
- **Window Functions**: For cumulative count of visits over time.

## 📊 SQL Queries Highlights
- **Patient Diagnoses**: Retrieve all patients diagnosed with COVID-19.
- **Visit Count**: Calculate the number of visits per patient, ordered by the highest count.
- **Average Age**: Calculate the average age of patients diagnosed with Pneumonia.
- **Common Symptoms**: Find the top 3 most reported symptoms among all visits.
- **Cumulative Visits**: Compute the cumulative number of visits over time.

## 🛠️ Tools & Technologies
- **SQL** for querying the healthcare dataset.
- **Database Management System** to create and manipulate tables and queries.

## 📌 Challenges Solved
This project contains solutions for 10 SQL challenges that cover topics like patient diagnosis, symptom analysis, visit frequency, and more. You can find the detailed queries in the SQL file available in this repository.

## 🤝 Acknowledgements
A special thanks to **Matthew Steel** and **Datacoach** for designing these challenges and providing an excellent platform for learning SQL through practical scenarios.
