/*
First Transaction [Etsy SQL Interview Question]
*/

-- SOLUTION:
with temp AS (
  SELECT *,
  RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) as rnk
  FROM user_transactions
)

SELECT COUNT(DISTINCT user_id) as users
FROM temp
WHERE rnk=1 AND spend>=50.00;