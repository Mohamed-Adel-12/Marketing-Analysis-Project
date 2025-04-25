
select 
	c.CustomerID,
	c.CustomerName,
	c.Email,c.Gender,
	c.Age,
	g.Country,
	g.City
from dbo.customers c left join dbo.geography g
	on c.GeographyID = g.GeographyID;

---------------------------------------------------------------------
WITH CityPopulation AS (
select g.City, count(c.CustomerID) as customer_count 
from dbo.customers c right join dbo.geography g 
on c.GeographyID = g.GeographyID
group by g.City
),
CityCategories AS (
    SELECT 
        City,
        customer_count,
        -- Using average as the threshold (you can adjust this)
        CASE 
            WHEN customer_count >= (SELECT AVG(customer_count) FROM CityPopulation) 
            THEN 'Large'
            ELSE 'Small'
        END AS city_size_category
    FROM 
        CityPopulation
)
SELECT * FROM CityCategories
ORDER BY customer_count DESC;


