
SELECT 
    Country,
    CASE 
        WHEN Country IN ('Denmark', 'Estonia', 'Finland', 'Iceland', 'Ireland', 'Latvia', 'Lithuania', 'Norway', 'Sweden', 'United Kingdom') 
            THEN 'Northern Europe'
        WHEN Country IN ('Austria', 'Belgium', 'France', 'Germany', 'Liechtenstein', 'Luxembourg', 'Monaco', 'Netherlands', 'Switzerland') 
            THEN 'Western Europe'
        WHEN Country IN ('Belarus', 'Bulgaria', 'Czech Republic', 'Hungary', 'Moldova', 'Poland', 'Romania', 'Russia', 'Slovakia', 'Ukraine') 
            THEN 'Eastern Europe'
        WHEN Country IN ('Albania', 'Andorra', 'Bosnia and Herzegovina', 'Croatia', 'Greece', 'Italy', 'Malta', 'Montenegro', 'North Macedonia', 'Portugal', 'San Marino', 'Serbia', 'Slovenia', 'Spain', 'Vatican City') 
            THEN 'Southern Europe'
        ELSE 'Other'
    END AS region

From dbo.geography


