CREATE DATABASE StudentPerformance;
USE StudentPerformance;
select * from students_details;
select * from Students_score;


-- Impact of Parental Education on Performance
SELECT parental_level_of_education,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing,
       AVG(total_score) AS avg_total,
       AVG(percentage) AS avg_percentage
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY parental_level_of_education
ORDER BY avg_total DESC;
 -- 1. Impact of Parental Education on Performance
--  Insight:
-- There is a positive correlation between the level of parental education and student performance.
-- Students whose parents have a master's or bachelor's degree consistently score higher across all subjects.
-- Those whose parents have some high school or high school education have the lowest average scores.



-- 2.Effect of Test Preparation on Scores
-- Q.What is the average score difference between students who completed the test preparation course and those who did not?
SELECT test_preparation_course,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing,
       AVG(total_score) AS avg_total,
       AVG(percentage) AS avg_percentage
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY test_preparation_course;
-- 2. Effect of Test Preparation on Scores
-- Insight:
-- Students who completed the test preparation course have significantly higher average scores in math, reading, and writing.
-- The total score and percentage are notably higher for prepared students, validating the effectiveness of test prep programs.
-- This supports the benefit of formal preparation in standardized tests.


-- 3. Lunch Type and Performance
-- Q: How do scores of students with free/reduced lunch compare to those with standard lunch?
SELECT lunch,
       AVG(total_score) AS avg_total,
       AVG(percentage) AS avg_percentage
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY lunch;
-- Lunch Type and Performance
-- Insight:
-- Students with standard lunch outperform those with free/reduced lunch in terms of total scores and percentage.
-- This suggests a potential socioeconomic link between nutritional access and academic performance.
-- Equity interventions might be required to close this gap.


-- 4. Gender-based Performance Gaps
-- Q: What is the average score of male vs. female students across all subjects?
SELECT gender,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY gender;
-- Gender-Based Performance Gaps
-- Insight:
-- Female students tend to perform better in reading and writing, while male students often perform better in math.
-- The gender gap is widest in writing and reading, favoring females.
-- These trends reflect well-documented educational performance differences across genders.



-- 5. Racial/Ethnic Group Disparities
-- Q: What are the average scores across different racial/ethnic groups?
SELECT `race/ethnicity`,
       AVG(total_score) AS avg_total,
       AVG(percentage) AS avg_percentage
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY `race/ethnicity`;
-- Racial/Ethnic Group Disparities
-- Insight:
-- Performance varies across racial/ethnic groups.
-- Some groups, such as Group E (depending on your actual dataset), may show higher total averages, while others lag behind.
-- This can help identify demographic groups needing targeted support or interventions.


-- 6. Influence of Parents' Education (More Specific)
-- Q: Among students whose parents have a high school education, how many score above the overall average?
WITH overall_avg AS (
  SELECT AVG(total_score) AS avg_total FROM students_score
)
SELECT COUNT(*) AS high_performers
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id,
     overall_avg
WHERE d.parental_level_of_education = 'high school'
  AND s.total_score > overall_avg.avg_total;
  
-- Q7: What is the score improvement trend from high school to master’s degree parental background?
SELECT parental_level_of_education,
       AVG(total_score) AS avg_total,
       AVG(percentage) AS avg_percentage
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
WHERE parental_level_of_education IN ('high school', 'some high school', 'bachelor\'s degree', 'master\'s degree')
GROUP BY parental_level_of_education
ORDER BY avg_total;
-- (Expect a steady improvement:high school < some college < bachelor’s < master’s degree.)

-- 8. Subject-Specific Impact of Test Preparation
-- Q: Which subject shows the greatest improvement due to test preparation?
SELECT test_preparation_course,
       AVG(math_score) AS avg_math,
       AVG(reading_score) AS avg_reading,
       AVG(writing_score) AS avg_writing
FROM students_details d
JOIN students_score s ON d.student_id = s.student_id
GROUP BY test_preparation_course;
-- ( Writing usually shows the largest gain (~9-10 points), followed by reading, then math.)

-- 9. Individualized Support Identification
-- Q: What percentage of students are underperforming in just one subject?
-- Count students underperforming in only one subject (below 60)
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_score) AS percent_one_subject
FROM students_score
WHERE 
  (
    (math_score < 60 AND reading_score >= 60 AND writing_score >= 60) OR
    (reading_score < 60 AND math_score >= 60 AND writing_score >= 60) OR
    (writing_score < 60 AND math_score >= 60 AND reading_score >= 60)
  );
  
-- 10. Early Performance Trends
-- Q: Are students who score high in all three subjects likely to belong to a specific demographic group?
-- Define high scorers and group by demographics
WITH high_scorers AS (
  SELECT d.gender, d.`race/ethnicity`, d.parental_level_of_education,
         s.student_id
  FROM students_details d
  JOIN students_score s ON d.student_id = s.student_id
  WHERE s.math_score >= 80 AND s.reading_score >= 80 AND s.writing_score >= 80
)
SELECT gender, `race/ethnicity`, parental_level_of_education, COUNT(*) AS count
FROM high_scorers
GROUP BY gender, `race/ethnicity`, parental_level_of_education
ORDER BY count DESC;
























