/*
Highest Number of Products [eBay SQL Interview Question]
*/

-- SOLUTION:
SELECT user_id, product_num FROM
(
SELECT user_id, COUNT(product_id) as product_num, SUM(spend) as total 
FROM 
(
  SELECT user_id, product_id, spend FROM user_transactions 
  WHERE user_id IN 
  (SELECT user_id FROM user_transactions 
  GROUP BY user_id HAVING SUM(spend)>=1000)
) temp
GROUP BY user_id
ORDER BY product_num DESC, total DESC
LIMIT 3
) temp;