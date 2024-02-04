/*
Unique Money Transfer Relationships [PayPal SQL Interview Question]
*/

-- SOLUTION:
SELECT COUNT(*)/2 FROM 
(
  SELECT DISTINCT * FROM (
    (SELECT payer_id, recipient_id FROM payments) a
    JOIN
    (SELECT payer_id, recipient_id FROM payments) b
    ON a.payer_id=b.recipient_id
    AND b.payer_id=a.recipient_id
  ) temp
) temp1;