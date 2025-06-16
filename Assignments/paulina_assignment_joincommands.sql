USE maven_advanced_sql;

SELECT * FROM orders;
SELECT * FROM products;

SELECT COUNT(DISTINCT product_id) FROM orders;
SELECT COUNT(DISTINCT product_id) FROM products;

SELECT 
    p.product_id, p.product_name, o.product_id
FROM
    products p
        LEFT JOIN
    orders o ON p.product_id = o.product_id
WHERE
    o.product_id IS NULL;