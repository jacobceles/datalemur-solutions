/*
Photoshop Revenue Analysis [Adobe SQL Interview Question]
*/

-- SOLUTION:
SELECT customer_id, SUM(revenue) FROM (SELECT * FROM adobe_transactions WHERE product!='Photoshop') a
WHERE customer_id IN (SELECT customer_id FROM adobe_transactions WHERE product='Photoshop')
GROUP BY customer_id;