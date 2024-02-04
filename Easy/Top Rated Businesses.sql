/*
Top Rated Businesses [Yelp SQL Interview Question]
*/

-- SOLUTION:
SELECT COUNT(business_id) as business_count, 
COUNT(business_id)*100/(SELECT COUNT(business_id) FROM reviews) as top_rated_pct
FROM reviews
WHERE review_stars>=4;