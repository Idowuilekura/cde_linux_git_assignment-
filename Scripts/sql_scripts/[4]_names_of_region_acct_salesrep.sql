/* D) Provide a table that shows the region for each sales rep along with 
        their associated accounts. Your final table should include three 
        columns: the region name, the sales rep name, and the account name. 
        Sort the accounts alphabetically (A-Z) by account name. */
SELECT act.name AS account_name, srs.name AS name_of_sales_rep, rgn.name AS name_of_region FROM region AS rgn 
	INNER JOIN sales_reps AS srs ON rgn.id = srs.region_id
	INNER JOIN accounts AS act ON act.sales_rep_id = srs.id
	ORDER BY account_name;