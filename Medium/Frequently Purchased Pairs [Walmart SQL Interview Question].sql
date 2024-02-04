/*
Frequently Purchased Pairs [Walmart SQL Interview Question]
*/

-- SOLUTION:
WITH temp_table AS (
  SELECT * FROM (
    (SELECT * FROM transactions) a
    JOIN
    (SELECT product_id as id, product_name FROM products) b
    ON a.product_id=b.id
  ) c
)

SELECT * FROM
(
  SELECT product1, product2, SUM(cnt) as combo_num FROM (
    SELECT tid1, product1, product2, COUNT(tid1) as cnt FROM (
      (SELECT transaction_id as tid1, product_id as product1_id, product_name as product1 FROM temp_table) d
      INNER JOIN
      (SELECT transaction_id as tid2, product_id as product2_id, product_name as product2 FROM temp_table) e
      ON d.product1_id>e.product2_id AND d.tid1=e.tid2
    )
    WHERE product2 is NOT NULL
    GROUP BY tid1, product1, product2
  ) temp
  GROUP BY product1, product2, cnt
  ORDER BY product1, product2
) temp_new
ORDER BY combo_num DESC
LIMIT 3;