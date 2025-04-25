
--select *
--from dbo.customer_journey
-- Common Table Expression (CTE) to identify and tag duplicate records
WITH DuplicateRecords AS (
	select
		cj.JourneyID,
		cj.CustomerID,
		cj.ProductID,
		cj.VisitDate,
		cj.Stage,
		cj.Action,
		cj.Duration,
		ROW_NUMBER() OVER(
			partition by CustomerID, ProductID, VisitDate, Stage, Action
			order by JourneyID
		) as row_num
	from dbo.customer_journey cj
)

SELECT *
FROM DuplicateRecords
 WHERE row_num > 1  -- Filters out the first occurrence (row_num = 1) and only shows the duplicates (row_num > 1)
ORDER BY JourneyID
----------------------------------------------
Select 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		Coalesce(Duration, avg_duration) as Duration
From
(
		select
			JourneyID,
			CustomerID,
			ProductID,
			VisitDate,
			upper(Stage) as Stage,
			Action,
			Duration,
			AVG(Duration) over (partition by VisitDate) as avg_duration,
			ROW_NUMBER() Over
			(
				partition by 			
					Action,
					CustomerID,
					ProductID,
					VisitDate,
					upper(Stage) 
				order by JourneyID
			) as row_num
      from dbo.customer_journey
	  ) as subQury
 where row_num = 1;
			