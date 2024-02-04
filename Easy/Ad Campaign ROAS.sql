/*
Ad Campaign ROAS [Google SQL Interview Question]
*/

-- SOLUTION:
SELECT advertiser_id, ROUND(CAST(SUM(revenue)/SUM(spend) AS numeric), 2) as "ROAS"
FROM ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id;
