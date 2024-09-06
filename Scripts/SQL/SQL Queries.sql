/* 
Find a list of order IDs where either `gloss_qty` or `poster_qty` is greater than 4000.
*/

SELECT id
FROM orders
WHERE CAST(gloss_qty AS INTEGER) > 4000
   OR CAST(poster_qty AS INTEGER) > 4000;

/* 
Find orders where `standard_qty` is zero and either `gloss_qty` or `poster_qty` is greater than 1000.
*/

SELECT *
FROM orders
WHERE CAST(standard_qty AS INTEGER) = 0
  AND (CAST(gloss_qty AS INTEGER) > 1000
  OR CAST(poster_qty AS INTEGER) > 1000);

/*
Find all companies where the company name starts with 'C' or 'W', 
and the primary contact contains 'ana' (case insensitive) but does not contain 'eana'.
*/

SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc ILIKE '%ana%')
  AND (primary_poc NOT ILIKE '%eana%');

/*
Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, 
the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name..
*/

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, accounts.name AS account_name
FROM sales_reps
JOIN region ON sales_reps.region_id = region.id
JOIN accounts ON sales_reps.id = accounts.sales_rep_id
ORDER BY accounts.name ASC;