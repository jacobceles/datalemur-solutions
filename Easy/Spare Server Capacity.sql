/*
Spare Server Capacity [Microsoft SQL Interview Question]
*/

-- SOLUTION:
SELECT datacenter_id, monthly_capacity-monthly_demand as spare_capacity FROM 
(
  (SELECT * FROM datacenters) a
  JOIN
  (SELECT datacenter_id as id, SUM(monthly_demand) as monthly_demand FROM forecasted_demand GROUP BY datacenter_id) b
  ON a.datacenter_id=b.id
) temp
ORDER BY datacenter_id ASC;