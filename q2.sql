WITH total_sales AS (  
    SELECT   
        track_id,   
        SUM(quantity) AS total_quantity  
    FROM   
        sales  
    GROUP BY   
        track_id  
),  
overall_sales AS (  
    SELECT   
        SUM(total_quantity) AS total_sold  
    FROM   
        total_sales  
)  
SELECT   
    ts.track_id,  
    ts.total_quantity  
FROM   
    total_sales ts,  
    overall_sales os  
WHERE   
    ts.total_quantity > 1200 or ts.total_quantity > 0.6 * os.total_sold;