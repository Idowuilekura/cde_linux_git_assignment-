#### SQL scripts to answer the following questions posed by the manager (Ayoola):

- /* Find a list of order IDs where either `gloss_qty` or `poster_qty` is greater than 4000. Only include the `id` field in the resulting table. */

**Result:**
```sql
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
```
id | 
--| 
362 | 
731 | 
1191 | 
1913 |
1939 | 
3778 | 
3858 | 
3963 | 
4016 | 
4230 |
4698 | 
4942 | 
5791 | 
6590 | 

*14 Order ids had either **gloss_qty** or **poster_qty** greater than 4000.*


- /* Write a query that returns a list of orders where the `standard_qty` is zero and either the `gloss_qty` or `poster_qty` is over 1000. */

**Result:**

```sql
SELECT *
FROM orders
WHERE standard_qty = 0 
  AND (gloss_qty > 1000 OR poster_qty > 1000);
```

| id | account_id | occurred_at | standard_qty | gloss_qty | poster_qty | total | standard_amt_usd | gloss_amt_usd | poster_amt_usd | total_amt_usd |
|----|------------|-------------|--------------|-----------|------------|-------|------------------|---------------|----------------|---------------|
|    |            |             |              |           |            |       |                  |               |                |               |

*No orders had a **standard_qty** of zero and either a **gloss_qty** or **poster_qty** greater than 1000.*


- /* Find all the company names that start with a '**C**' or '**W**', and where the primary contact contains '**ana**' or '**Ana**', but does not contain '**eana**'. */

**Result:**

```sql
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';
```

name | 
--| 
CSV Health | 
Comcast | 
     
*Only two accounts had their names starting with a **C** or **W** and had their primary contacts containg '**ana**' or '**Ana**', but not '**eana**'.*


- /* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */

**Result:**

```sql
SELECT 
    r.name AS region_name,
    sr.name AS sales_rep_name,
    a.name AS account_name
FROM sales_reps sr
JOIN region r ON sr.region_id = r.id
JOIN accounts a ON sr.id = a.sales_rep_id
ORDER BY account_name;
```
| region_name | sales_rep_name       | account_name              |
|-------------|-----------------------|---------------------------|
| Northeast   | Sibyl Lauria          | 3M                        |
| Southeast   | Earlie Schleusner     | ADP                       |
| Southeast   | Moon Torian           | AECOM                     |
| Southeast   | Calvin Ollison        | AES                       |
| Northeast   | Elba Felder           | AIG                       |
| Northeast   | Necole Victory        | AT&T                      |
| Midwest     | Julie Starr           | AbbVie                    |
| Midwest     | Chau Rowles           | Abbott Laboratories       |
| West        | Marquetta Laycock     | Advance Auto Parts        |
| Northeast   | Renetta Carew         | Aetna                     |

*The result shows the first few rows of the **351 rows** showing the region for each sales rep along with their associated accounts.*
