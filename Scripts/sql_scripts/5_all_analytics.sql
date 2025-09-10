/* A) Find a list of order IDs where either `gloss_qty` 
      or `poster_qty` is greater than 4000. 
      Only include the `id` field in the resulting table. */
SELECT id AS order_id FROM orders 
    WHERE gloss_qty > 4000 OR poster_qty > 4000;

/* B) Write a query that returns a list of orders where 
      the `standard_qty` is zero and either the `gloss_qty` 
      or `poster_qty` is over 1000. */
SELECT * FROM orders 
    WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

/* C) Find all the company names that start with a 'C' or 'W', 
      and where the primary contact contains 'ana' or 'Ana', 
      but does not contain 'eana'. */
SELECT name AS account_name FROM accounts 
    WHERE (name LIKE 'C%' OR name LIKE 'W%')
        AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%'))
        AND primary_poc NOT LIKE '%eana%';

/* D) Provide a table that shows the region for each sales rep along with 
        their associated accounts. Your final table should include three 
        columns: the region name, the sales rep name, and the account name. 
        Sort the accounts alphabetically (A-Z) by account name. */
SELECT act.name AS account_name, srs.name AS name_of_sales_rep, rgn.name AS name_of_region FROM region AS rgn 
	INNER JOIN sales_reps AS srs ON rgn.id = srs.region_id
	INNER JOIN accounts AS act ON act.sales_rep_id = srs.id
	ORDER BY account_name;