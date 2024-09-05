-- Find order IDs where gloss_qty or poster_qty > 4000
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Find orders where standard_qty = 0 and gloss_qty or poster_qty > 1000
SELECT *
FROM orders
WHERE standard_qty is null AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Find company names starting with 'C' or 'W', primary contact contains 'ana' or 'Ana', but not 'eana'
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';

-- Provide region, sales rep, and account names, sorted by account name
SELECT r.name AS region_name,
       s.name AS sales_rep_name,
       a.name AS account_name
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
ORDER BY a.name ASC;