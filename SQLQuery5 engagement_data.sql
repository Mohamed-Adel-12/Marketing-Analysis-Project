
select
	ed.EngagementID,
	ed.ContentID,
	ed.CampaignID,
	ed.ProductID,
	ed.Likes,
	UPPER(replace(ed.ContentType, 'Socialmedia', 'Social Media')) as ContentType,
	 LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
	 RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
	 FORMAT(CONVERT(date, ed.EngagementDate), 'dd-MM-yyyy')AS EngagementDate
from dbo.engagement_data ed
where ContentType != 'NEWSLETTER'