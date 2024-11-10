WITH latest_sales AS (  
    SELECT   
        s.sale_id,  
        s.track_id,  
        s.customer_id,  
        s.sale_date,  
        ROW_NUMBER() OVER (PARTITION BY t.album_id ORDER BY s.sale_date DESC) AS rn  
    FROM   
        sales s  
    JOIN   
        tracks t ON s.track_id = t.track_id  
)  
SELECT   
    t.album_id,  
    ls.track_id,  
    ls.customer_id  
FROM   
    latest_sales ls  
JOIN   
    tracks t ON ls.track_id = t.track_id  
WHERE   
    ls.rn = 1;