SELECT   
    t.track_id,  
    SUM(s.quantity * t.price) AS total_revenue  
FROM   
    sales s  
JOIN   
    tracks t ON s.track_id = t.track_id  
GROUP BY   
    t.track_id  
HAVING   
    total_revenue < 0.002;