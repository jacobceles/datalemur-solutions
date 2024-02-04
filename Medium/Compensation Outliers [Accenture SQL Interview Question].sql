/*
Compensation Outliers [Accenture SQL Interview Question]
*/

-- SOLUTION:
SELECT * FROM (
  SELECT employee_id, salary, 
  CASE 
    WHEN salary>avg_sal*2 THEN 'Overpaid'
    WHEN salary<avg_sal/2 THEN 'Underpaid'
  END AS status
  FROM 
  (
    (SELECT * FROM employee_pay) a
    JOIN
    (SELECT title, AVG(salary) as avg_sal FROM employee_pay GROUP BY title) b
    ON a.title=b.title
  )
) temp
WHERE status is not NULL;


