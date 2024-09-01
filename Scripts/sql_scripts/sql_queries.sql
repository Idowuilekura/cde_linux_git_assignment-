-- Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000.
SELECT id 
FROM orders
WHERE gloss_qty > 4000 OR poster_qty  > 4000;


-- Return a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0
AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Find all the company names that start with a 'C' or 'W', 
-- and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.
SELECT name as company_name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND (primary_poc ILIKE '%ana%' AND primary_poc NOT ILIKE '%eana%');


-- Provide a table showing the region for each sales rep along with their associated accounts.
SELECT sr.id, sr.name AS sales_rep_name, 
		r.name AS region_name, a.name AS account_name
FROM sales_reps sr 
JOIN region r ON r.id = sr.region_id
JOIN accounts a ON a.sales_rep_id = sr.id
ORDER BY sr.id;
