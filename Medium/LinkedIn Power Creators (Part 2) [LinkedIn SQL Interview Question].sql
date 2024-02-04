/*
LinkedIn Power Creators (Part 2) [LinkedIn SQL Interview Question]
*/

-- SOLUTION:
WITH temp AS (
  SELECT profile_id, MAX(ab.followers) as personal_followers, 
  c.company_id, c.followers as company_followers
  FROM
  (
    (
      (SELECT * FROM personal_profiles) a
      JOIN
      (SELECT * FROM employee_company) b
      ON a.profile_id=b.personal_profile_id
    ) ab
    LEFT JOIN
    (SELECT * FROM company_pages) c
    ON ab.company_id=c.company_id
    AND ab.followers>=c.followers
  )
  WHERE c.company_id is not NULL
  GROUP BY profile_id, c.company_id, company_followers
)

SELECT DISTINCT(profile_id)
FROM temp 
ORDER BY profile_id ASC;
/*
WITH popular_companies AS (
SELECT
  ec.personal_profile_id,
  MAX(cp.followers) AS highest_followers
FROM employee_company AS ec
LEFT JOIN company_pages AS cp
  ON ec.company_id = cp.company_id
GROUP BY ec.personal_profile_id)

SELECT
   DISTINCT profile_id
FROM popular_companies AS pc
LEFT JOIN personal_profiles AS pp
  ON pc.personal_profile_id = pp.profile_id
WHERE followers>highest_followers
ORDER BY profile_id ASC;
*/