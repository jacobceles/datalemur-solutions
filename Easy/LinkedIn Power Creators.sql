/*
LinkedIn Power Creators (Part 1) [LinkedIn SQL Interview Question]
*/

-- SOLUTION:
SELECT profile_id FROM personal_profiles a
JOIN 
company_pages b
ON a.employer_id=b.company_id
AND a.followers>b.followers
ORDER BY a.profile_id ASC;