use corona_test;
SELECT * FROM corona_test.corona_tb;

-- Q1. Find the number of corona patients who faced shortness of breath.

SELECT * FROM Corona_tb
WHERE Corona = "Positive" AND Shortness_Of_Breath = "True";

-- Q2. Find the number of negative corona patients who have fever and sore_throat. 

SELECT * FROM Corona_tb
WHERE Corona = "Negative" AND Fever = "True" AND Sore_Throat = "True";

-- Q3. Group the data by month and rank the number of positive cases.

SELECT
    EXTRACT(MONTH FROM Test_date) AS Month,
    COUNT(*) AS PositiveCasesCount,
    RANK() OVER (ORDER BY COUNT(*) ASC) AS MonthRank
FROM corona_tb
WHERE Corona = 'positive'
GROUP BY Month
ORDER BY Month;

-- Q4.Find the female negative corona patients who faced cough and headache. 

SELECT Sex, Cough_Symptoms, Headache, Corona, COUNT(*) AS Count
FROM corona_tb
WHERE Corona = 'Negative' AND Cough_Symptoms = 'True' AND Headache = 'True' AND Sex = 'female'
GROUP BY Sex, Cough_Symptoms, Headache;

-- Q5.How many elderly corona patients have faced breathing problems?

SELECT count(Age_60_above) FROM corona_tb
WHERE Shortness_of_breath = "True" AND Age_60_above = "Yes"

-- Q6.Which three symptoms were more common among COVID positive patients?

SELECT
    'Cough_symptoms' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Cough_symptoms = 'TRUE'
UNION ALL
SELECT
    'Fever' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Fever = 'TRUE'
UNION ALL
SELECT
    'Sore_throat' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Sore_throat = 'TRUE'
UNION ALL
SELECT
    'Shortness_of_breath' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Shortness_of_breath = 'TRUE'
UNION ALL
SELECT
    'Headache' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Headache = 'TRUE'
ORDER BY symptom_count DESC
LIMIT 3;




-- Q7.Which symptom was less common among COVID negative people?

SELECT
    'Cough_symptoms' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Negative' AND Cough_symptoms = 'TRUE'
UNION ALL
SELECT
    'Fever' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Negative' AND Fever = 'TRUE'
UNION ALL
SELECT
    'Sore_throat' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Negative' AND Sore_throat = 'TRUE'
UNION ALL
SELECT
    'Shortness_of_breath' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Negative' AND Shortness_of_breath = 'TRUE'
UNION ALL
SELECT
    'Headache' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Headache = 'TRUE'
ORDER BY symptom_count 
LIMIT 1;


-- Q8.What are the most common symptoms among COVID positive males whose known contact was abroad? 

SELECT
    'Cough_symptoms' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Positive' AND Cough_symptoms = 'TRUE' AND known_contact = "abroad"
UNION ALL
SELECT
    'Fever' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Positive' AND Fever = 'TRUE' AND known_contact = "abroad"
UNION ALL
SELECT
    'Sore_throat' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Positive' AND Sore_throat = 'TRUE' AND known_contact = "abroad"
UNION ALL
SELECT
    'Shortness_of_breath' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'Positive' AND Shortness_of_breath = 'TRUE' AND known_contact = "abroad"
UNION ALL
SELECT
    'Headache' AS symptom,
    COUNT(*) AS symptom_count
FROM corona_tb
WHERE Corona = 'positive' AND Headache = 'TRUE' AND known_contact = "abroad"
ORDER BY symptom_count DESC
LIMIT 1;
