--Create view so we can use simpler queries
CREATE VIEW dbo.analysis_main AS 

SELECT s.set_num,s.name AS set_name,s.year,s.theme_id, CAST(s.num_parts AS numeric) num_parts, t.name AS theme_name, t.parent_id, p.name AS parent_theme_name,
CASE
	WHEN s.year between 1901 and 2000 then '20th_Century'
	WHEN s.year between 2001 and 2100 then '21st_Century'
END AS century
FROM dbo.sets s
LEFT JOIN dbo.themes t
	ON s.theme_id = t.id
LEFT JOIN dbo.themes p
	ON t.parent_id=p.id

--What is the total number of parts per theme?

SELECT theme_name, sum(num_parts) AS total_parts
FROM dbo.analysis_main
--WHERE parent_theme_name IS NOT NULL
GROUP BY theme_name
ORDER BY 2 DESC


-- What is the total number of parts per year?
SELECT year, sum(num_parts) AS total_parts
FROM dbo.analysis_main
--WHERE parent_theme_name IS NOT NULL
GROUP BY year
ORDER BY 2 DESC


-- How many sets were created in each century?
SELECT century, COUNT(set_num) AS total_sets
FROM dbo.analysis_main
--WHERE parent_theme_name IS NOT NULL
GROUP BY century


-- What percentage of sets released in the 21st century were Star Wars themed
;WITH cte AS
(
	SELECT century, theme_name, COUNT(set_num) total_set_num
	FROM analysis_main
	WHERE century = '21st_Century'
	GROUP BY century, theme_name
)
SELECT *
FROM(
	SELECT century, theme_name, total_set_num, sum(total_set_num) OVER() as total, cast(1.00 * total_set_num / sum(total_set_num) OVER() as decimal(5,4))*100 Percentage
	FROM cte
	--ORDER by 3 desc
) AS m
WHERE theme_name LIKE '%Star Wars%'


-- What was the most popular theme in each year of the 21st century?

SELECT year, theme_name, total_set_num
FROM (
	SELECT year, theme_name, COUNT(set_num) total_set_num, ROW_NUMBER() OVER (partition by year order by count(set_num) desc) rn
	FROM analysis_main
	WHERE Century = '21st_Century'
		--and parent_theme_name is not null
	GROUP BY year, theme_name
) AS m
WHERE rn = 1	
ORDER BY year DESC



---What is the most produced color of lego ever in terms of quantity of parts?

SELECT color_name, SUM(quantity) AS quantity_of_parts
FROM
	(
		SELECT
			inv.color_id, inv.inventory_id, inv.part_num, CAST(inv.quantity as numeric) quantity, inv.is_spare, c.name as color_name, c.rgb, p.name as part_name, p.part_material, pc.name as category_name
		FROM inventory_parts inv
		INNER JOIN colors c
			on inv.color_id = c.id
		INNER JOIN parts p
			on inv.part_num = p.part_num
		INNER JOIN part_categories pc
			on part_cat_id = pc.id
	)main

GROUP BY color_name
ORDER BY 2 desc;


-- What is the average amount of parts per set?
SELECT theme_name, AVG(num_parts) AS avg_parts_per_set
FROM dbo.analysis_main
GROUP BY theme_name
ORDER BY avg_parts_per_set DESC;

