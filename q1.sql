SELECT   
    a.album_id,  
    COUNT(t.track_id) AS number_of_tracks,  
    AVG(t.duration) AS average_duration,  
    SUM(t.price) AS total_cost  
FROM   
    albums a  
JOIN   
    tracks t ON a.album_id = t.album_id  
GROUP BY   
    a.album_id  
ORDER BY   
    total_cost DESC;