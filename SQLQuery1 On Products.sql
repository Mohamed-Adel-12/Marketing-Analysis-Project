
select
	ProductID,
	ProductName,
	Price,

	case 
		when Price < 50 then 'low'
		when Price between 50 and 200 then 'Medium'
		else 'High'
	end as PriceCategory
	
from dbo.products;