SELECT * FROM mark1sajid.pelicanstore;
ALTER TABLE pelican_store CHANGE COLUMN `Discount ` Discount DECIMAL(10,2);
SELECT ROUND(SUM(Sales), 2) AS total_revenue
FROM pelicanstore;
SELECT SUM(Items) AS total_items_sold
FROM pelicanstore;
SELECT ROUND(SUM(Sales) / COUNT(*), 2) AS avg_order_value
FROM pelicanstore;
SELECT ROUND(AVG(Items), 2) AS avg_items_per_order
FROM pelicanstore;
SELECT ROUND(AVG(Discount), 2) AS avg_discount_per_order
FROM pelicanstore;
SELECT ROUND(SUM(Discount) / NULLIF(SUM(Sales),0) * 100, 2) AS discount_pct_of_sales
FROM pelicanstore;
SELECT
COUNT(*) AS orders,
SUM(Items) AS items_sold,
ROUND(SUM(Sales), 2) AS revenue,
ROUND(SUM(Discount), 2) AS total_discount,
ROUND(AVG(Sales), 2) AS avg_order_value
FROM pelicanstore
ORDER BY revenue DESC;
SELECT Gender,
       COUNT(*) AS orders,
       ROUND(SUM(Sales), 2) AS revenue,
       ROUND(AVG(Sales), 2) AS avg_order_value,
       ROUND(SUM(Discount), 2) AS total_discount
FROM pelicanstore
GROUP BY Gender
ORDER BY revenue DESC;
WITH cohorts AS (
  SELECT CASE
           WHEN Age < 25 THEN '<25'
           WHEN Age BETWEEN 25 AND 34 THEN '25-34'
           WHEN Age BETWEEN 35 AND 44 THEN '35-44'
           WHEN Age BETWEEN 45 AND 54 THEN '45-54'
           WHEN Age BETWEEN 55 AND 64 THEN '55-64'
           ELSE '65+'
         END AS age_band,
         Sales, Items, Discount
  FROM pelicanstore
)
SELECT age_band,
       COUNT(*) AS orders,
       SUM(Items) AS items_sold,
       ROUND(SUM(Sales),2) AS revenue,
       ROUND(AVG(Sales),2) AS avg_order_value,
       ROUND(AVG(Discount),2) AS avg_discount
FROM cohorts
GROUP BY age_band
ORDER BY revenue DESC;
SELECT Customer,
       COUNT(*) AS orders,
       SUM(Items) AS items_sold,
       ROUND(SUM(Sales),2) AS revenue,
       ROUND(SUM(Discount),2) AS total_discount
FROM pelicanstore
GROUP BY Customer
ORDER BY revenue DESC
LIMIT 10;
SELECT Customer,
       ROUND(SUM(Discount),2) AS total_discount,
       ROUND(SUM(Sales),2) AS revenue,
       ROUND(SUM(Discount) / NULLIF(SUM(Sales),0) * 100, 2) AS discount_pct_of_sales
FROM pelicanstore
GROUP BY Customer
HAVING SUM(Sales) > 0
ORDER BY discount_pct_of_sales DESC, total_discount DESC
LIMIT 10;
SELECT ROUND(AVG(Items),2) AS avg_items,
       ROUND(AVG(Sales),2) AS avg_sales,
       ROUND(AVG(Sales) / NULLIF(AVG(Items),0), 2) AS avg_sales_per_item
FROM pelicanstore;
SELECT MethodOfPayment,
       ROUND(SUM(Sales) / NULLIF(SUM(Items),0), 2) AS sales_per_item,
       ROUND(SUM(Sales),2) AS revenue,
       SUM(Items) AS items
FROM pelican_store
GROUP BY MethodOfPayment
ORDER BY sales_per_item DESC;
WITH cohorts AS (
  SELECT CASE
           WHEN Age < 25 THEN '<25'
           WHEN Age BETWEEN 25 AND 34 THEN '25-34'
           WHEN Age BETWEEN 35 AND 44 THEN '35-44'
           WHEN Age BETWEEN 45 AND 54 THEN '45-54'
           WHEN Age BETWEEN 55 AND 64 THEN '55-64'
           ELSE '65+'
         END AS age_band,
         Discount
  FROM pelicanstore
)
SELECT age_band,
       ROUND(AVG(Discount),2) AS avg_discount_per_order
FROM cohorts
GROUP BY age_band
ORDER BY avg_discount_per_order DESC;
WITH bands AS (
  SELECT CASE
           WHEN Discount >= 50 THEN '50+'
           WHEN Discount BETWEEN 20 AND 49.99 THEN '20-49.99'
           WHEN Discount BETWEEN 1 AND 19.99 THEN '1-19.99'
           ELSE '0'
         END AS discount_band,
         Sales
  FROM pelicanstore
)
SELECT discount_band,
       COUNT(*) AS orders,
       ROUND(AVG(Sales),2) AS avg_order_value
FROM bands
GROUP BY discount_band
ORDER BY FIELD(discount_band,'0','1-19.99','20-49.99','50+');
SELECT *
FROM pelicanstore
ORDER BY Sales DESC
LIMIT 5;
SELECT *
FROM pelicanstore
WHERE Sales < 0 OR Items <= 0 OR Discount < 0 OR Age <= 0;

