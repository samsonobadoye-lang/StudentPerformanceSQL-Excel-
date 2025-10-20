-- I created a schema called mysqlproject
use mysqlproject;
-- I imported my tables into my schema
select * from attendance;
select * from extracurricular;
select * from scores;
select * from students;

-- PROJECT QUESTION 
-- (1) Provide a list of all students with their grade level and study group.
SELECT student_id, grade_level, study_group from students;

-- (2) Show the total number of students by gender
select gender, count(student_id) from students
group by gender;

-- (3) Calculate the average score in each subject across the school.
select subject, round(avg(score), 1) as AVERAGE_SCORE from scores
group by subject;

-- (4) Identify students who scored above 80 in Math.
select student_id, subject, score from scores
where subject = 'math_score' and score > 80;

-- (5) How many students have an attendance rate above 90%?
select * from attendance
where attendance_percent > 90;

-- (6)What is the average attendance % per grade level?
select s.grade_level, round(avg(a.attendance_percent), 2) as AverageAttendance
from students s
join attendance a
on s.student_id = a.student_id
group by s.grade_level;

-- (7) Compare average Science scores by gender.
select students.gender, avg(scores.score) as AverageScienceScore
from students 
join scores 
on students.student_id = scores.student_id
where scores.subject = 'science_score'
group by students.gender;

-- (8) List the top 5 students with the highest average scores across all subjects.
select student_id,avg(score) as AverageScorePerHead
from scores
group by student_id
order by AverageScorePerHead desc
limit 5;

-- (9) Show the average score per subject by grade level
SELECT st.grade_level, sc.subject, ROUND(AVG(sc.score),2) AS avg_score
FROM students st
JOIN scores sc ON st.student_id = sc.student_id
GROUP BY st.grade_level, sc.subject
ORDER BY st.grade_level, sc.subject;


-- (10) Which students participate in Sports and have an attendance rate above 85%?
select e.student_id,e.extra_curricular, a.attendance_percent
from extracurricular e
join attendance a
on e.student_id = a.student_id
where e.extra_curricular = 'Sports' and a.attendance_percent > 85;

-- (11) Count the number of students in each extracurricular activity.
select extra_curricular, count(student_id) as StudentCountPerActivity
from extracurricular
group by extra_curricular;

-- (12) Which subject has the highest overall average score?
select subject, avg(score) as AverageScorePerSubject from scores
group by subject
order by AverageScorePerSubject desc
limit 1;

-- (13) Show average attendance percentage grouped by study group
select s.study_group, round(avg(a.attendance_percent), 2) as AverageAttendancePerStudygroup
from students s
join attendance a 
on s.student_id = a.student_id
group by s.study_group;

-- (14) List students with perfect attendance (100%).
select * from attendance
where attendance_percent > 99;

-- (15) What is the average Math score of students who do not participate in extracurricular activities?
select round(avg(s.score), 2)
from scores s
join extracurricular e
on s.student_id = e.student_id
where s.subject = 'math_score' and e.extra_curricular = 'none';

-- (16)Identify students whose average score is above the overall school average.
select student_id, avg(score) as Average
from scores
group by student_id
having Average > (
select avg(score) from scores 
);

-- (17) Which students scored higher than the average English score of their grade level?
SELECT s.student_id, sc.score, st.grade_level
FROM scores sc
JOIN students s ON sc.student_id = s.student_id
JOIN students st ON st.student_id = s.student_id
WHERE sc.subject = 'English_score'
  AND sc.score > (
      SELECT AVG(sc2.score)
      FROM scores sc2
      JOIN students s2 ON sc2.student_id = s2.student_id
      WHERE sc2.subject = 'English_score' AND s2.grade_level = st.grade_level
  )
ORDER BY st.grade_level, sc.score DESC;

-- (18) Which study group has the best average attendance?
select s.study_group, round(avg(a.attendance_percent), 2) as StudyGroupAttendance
from students s 
join attendance a
on s.student_id = a.student_id
group by s.study_group
order by StudyGroupAttendance desc
limit 1;

-- (19) Identify the student(s) with the highest average Science score.
select student_id, avg(score) from scores
where subject = 'science_score'
group by student_id
having avg(score) = (
select max(Avg_Sc)
from (
select avg(score) as Avg_Sc from scores
where subject = 'science_score'
group by student_id
) scores
);

-- (20) Which grade level has the lowest Math average score?
select st.grade_level, avg(sc.score) as MathAvg
from students st
join scores sc 
on st.student_id = sc.student_id
where subject = 'math_score'
group by st.grade_level
order by MathAvg asc
limit 1;

-- (21) Retrieve the average attendance % by extracurricular activity and rank them.
SELECT extracurricular.extra_curricular, ROUND(AVG(a.attendance_percent),2) AS avg_attendance, COUNT(DISTINCT extracurricular.student_id) AS num_students
FROM extracurricular 
JOIN attendance a ON extracurricular.student_id = a.student_id
GROUP BY extracurricular.extra_curricular
ORDER BY avg_attendance DESC;


-- (22) Which students scored above their gender’s average in all three subjects?
SELECT s.student_id
FROM students s
JOIN scores m ON s.student_id = m.student_id AND m.subject = 'Math_score'
JOIN scores sci ON s.student_id = sci.student_id AND sci.subject = 'Science_score'
JOIN scores eng ON s.student_id = eng.student_id AND eng.subject = 'English_score'
WHERE m.score > (SELECT AVG(m2.score) FROM scores m2 JOIN students st2 ON m2.student_id=st2.student_id WHERE m2.subject='Math_score' AND st2.gender = s.gender)
  AND sci.score > (SELECT AVG(sci2.score) FROM scores sci2 JOIN students st3 ON sci2.student_id=st3.student_id WHERE sci2.subject='Science_score' AND st3.gender = s.gender)
  AND eng.score > (SELECT AVG(eng2.score) FROM scores eng2 JOIN students st4 ON eng2.student_id=st4.student_id WHERE eng2.subject='English_score' AND st4.gender = s.gender);


-- (23) Show the difference between male and female average scores per subject.
SELECT subject,
       ROUND(AVG(CASE WHEN st.gender='Male' THEN sc.score END),2) AS male_avg,
       ROUND(AVG(CASE WHEN st.gender='Female' THEN sc.score END),2) AS female_avg,
       ROUND(AVG(CASE WHEN st.gender='Male' THEN sc.score END) - AVG(CASE WHEN st.gender='Female' THEN sc.score END),2) AS diff_male_minus_female
FROM scores sc
JOIN students st ON sc.student_id = st.student_id
GROUP BY subject
ORDER BY subject;

-- (24) Which Grade 12 students have attendance above the school-wide average?
select a.student_id, a.attendance_percent
from attendance a
join students s
on a.student_id = s.student_id
where s.grade_level = 'Grade 12' 
and a.attendance_percent > (select avg(attendance_percent) from attendance);

-- (25) Identify top performers: students with an average score above 85 and attendance above 90%.
select a.student_id, a.attendance_percent, avg(s.score)
from attendance a
join scores s 
on a.student_id = s.student_id
where a.attendance_percent > 90
group by a.student_id, a.attendance_percent
having avg(s.score) > 85;

-- (26) Which extracurricular activity has the highest number of participants in Grade 11?
select e.extra_curricular, count(s.student_id) as Grade11Activity
from extracurricular e
join students s
on e.student_id = s.student_id
where grade_level = 'Grade 11'
group by extra_curricular
order by Grade11Activity desc
limit 1;

-- (27) List the bottom 5 students with the lowest average scores.
select student_id, avg(score) as AverageScorePerHead
from scores
group by student_id
order by AverageScorePerHead asc
limit 5;

-- (28) Show the grade level with the best overall performance across all subjects.
SELECT st.grade_level, ROUND(AVG(sc.score),2) AS grade_avg
FROM students st
JOIN scores sc ON st.student_id = sc.student_id
GROUP BY st.grade_level
ORDER BY grade_avg DESC
LIMIT 1;


--                       THANK YOU 
