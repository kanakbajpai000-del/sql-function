create database function_assignment;
use function_assignment;
create table student_performance (
student_id int primary key,
name varchar (50),
course varchar (50),
score int,
attendance int,
mentor varchar(50),
join_date date,
city varchar(50));

insert into student_performance( student_id, name, course, score,
attendance, mentor, join_date, city)
values
(101,'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data SCience',76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'), 
(103,  'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Delhi'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
(108, 'Meerra Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai' ),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
(113, ' Rohan Gupta', 'SQL' ,89 ,  91, 'Mr. Iyer', '2023-05-25', 'Delhi' ),
(114,  'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');

/*Question 1 : Create a ranking of students based on score (highest first). */
use  function_assignment;
SELECT 
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS rank_position
FROM student_performance;

/*Question 2 : Show each student's score and the previous student’s score (based on score order)*/






/*Question 3 : Convert all student names to uppercase and extract the month name from join_date.*/
SELECT 
    UPPER(name) AS student_name_upper,
    MONTHNAME(join_date) AS join_month
FROM student_performance;

/*Question 4 : Show each student's name and the next student’s attendance (ordered by attendance)*/
select name , attendance from student_performance
order by attendance asc;


/*Question 5 : Assign students into 4 performance groups using NTILE().*/
select name, score,
ntile(4) over (order by score desc) as performance_group
from student_performance;

/*Question 6 : For each course, assign a row number based on attendance (highest first).*/

SELECT 
    course,
    name,
    attendance,
    ROW_NUMBER() OVER (
        PARTITION BY course
        ORDER BY attendance DESC
    ) AS attendance_rank
FROM student_performance;

/*Question 7 : Calculate the number of days each student has been enrolled (from join_date to today).

(Assume current date = '2025-01-01')*/


SELECT 
    name,
    join_date,
    DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM student_performance;

/*Question 8 : Format join_date as “Month Year” (e.g., “June 2023”)*/
SELECT 
    name,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM student_performance;

/*Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes*/


SELECT 
    name,
    REPLACE(city, 'Mumbai', 'MUM') AS city_display
FROM student_performance;


/*Question 10 : For each course, find the highest score using FIRST_VALUE().*/

SELECT 
    course, name, score,
    FIRST_VALUE(score) OVER (
        PARTITION BY course
        ORDER BY score DESC
    ) AS highest_score_in_course
FROM student_performance;
