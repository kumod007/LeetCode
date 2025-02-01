# Write your MySQL query statement below


SELECT 
    s.student_id,
    s.student_name,
    sb.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM
    students AS s
        CROSS JOIN
    Subjects AS sb
        LEFT JOIN
    examinations AS e ON s.student_id = e.student_id
        AND sb.subject_name = e.subject_name
GROUP BY 1 , 2 , 3
ORDER BY 1 , 2;
