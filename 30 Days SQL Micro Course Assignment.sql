SELECT * FROM HOSPITAL_DATA;

-- 30 Days SQL Micro Course Assignment

--1. Total Number of Patients
   -- Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM("patients_count") AS TOTAL_NUMBER_OF_PATIENTS
FROM HOSPITAL_DATA;

--2. Average Number of Doctors per Hospital
   --Retrieve the average count of doctors available in each hospital.

SELECT "hospital_name", AVG("doctors_count") AS AVG_Doctors
FROM HOSPITAL_DATA
GROUP BY "hospital_name";

--3. Top 3 Departments with the Highest Number of Patients
   --Find the top 3 hospital departments that have the highest number of patients.

SELECT DEPARTMENT, SUM(PATIENTS_COUNT)AS TOTAL_PATIENTS_OF_EACH_DEPT
FROM HOSPITAL_DATA
GROUP BY DEPARTMENT
ORDER BY TOTAL_PATIENTS_OF_EACH_DEPT DESC LIMIT 3;
   
--4. Hospital with the Maximum Medical Expenses
   --Identify the hospital that recorded the highest medical expenses.

SELECT HOSPITAL_NAME, MAX(MEDICAL_EXPENSES)AS MAX__MEDICAL_EXPENSES
FROM HOSPITAL_DATA
GROUP BY HOSPITAL_NAME;
   
--5. Daily Average Medical Expenses
   --Calculate the average medical expenses per day for each hospital.

select 
    hospital_name,
	admission_date,
	avg(medical_expenses)as avg_daily_medical_expenses
from hospital_data
group by hospital_name, admission_date
order by hospital_name, admission_date;

--6. Longest Hospital Stay
   --Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT *, (DISCHARGE_DATE - ADMISSION_DATE)AS STAY_DAYS
FROM HOSPITAL_DATA
ORDER BY STAY_DAYS DESC LIMIT 10;

--7. Total Patients Treated Per City
   --Count the total number of patients treated in each city.

SELECT LOCATION,
SUM(PATIENTS_COUNT)AS TOTAL_PATIENTS_EACH_CITY
FROM HOSPITAL_DATA
GROUP BY LOCATION;
   
--8. Average Length of Stay Per Department
   --Calculate the average number of days patients spend in each department.

SELECT DEPARTMENT, AVG(DISCHARGE_DATE - ADMISSION_DATE)AS STAY_DAYS
FROM HOSPITAL_DATA
GROUP BY DEPARTMENT;
   
--9. Identify the Department with the Lowest Number of Patients
   --Find the department with the least number of patients.

SELECT DEPARTMENT, MIN(PATIENTS_COUNT) AS LOWEST_PATIENTS
FROM HOSPITAL_DATA
GROUP BY DEPARTMENT
ORDER BY LOWEST_PATIENTS ASC;

--10. Monthly Medical Expenses Report
   --Group the data by month and calculate the total medical expenses for each month.

SELECT
	date_trunc('month', admission_date)AS month,
	SUM(MEDICAL_EXPENSES) AS TOTAL_MEDICAL_EXPENSES
	from hospital_data
GROUP BY MONTH
ORDER BY MONTH;

SELECT
	extract(month from admission_date)AS month,
	SUM(MEDICAL_EXPENSES) AS TOTAL_MEDICAL_EXPENSES
	from hospital_data
GROUP BY MONTH
ORDER BY MONTH;   

   