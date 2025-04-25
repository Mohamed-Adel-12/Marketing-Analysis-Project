
select 
	cr.CustomerID,
	cr.ProductID,
	cr.ReviewID,
	cr.ReviewDate,
	cr.Rating,
	REPLACE( cr.ReviewText, '  ',' ') as ReviewText
from dbo.customer_reviews cr