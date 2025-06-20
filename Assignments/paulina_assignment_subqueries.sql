-- ASSIGNMENT DESCRIPTION:
-- Hello! Our Product Team plans on evaluating our product prices
-- later this week to see if any adjustments need to be made for 
-- next year.
-- Can you give me a list of our products from the most to least
-- expensive, along with how much each product differs from the 
-- average unit price?
-- Thanks! 
-- Mandy


USE maven_advanced_sql;

SELECT product_id, product_name, unit_price, (SELECT AVG(unit_price) FROM products) AS avg_unit_price, 
		unit_price - (SELECT AVG(unit_price) FROM products) AS diff_price FROM products
ORDER BY unit_price DESC;
