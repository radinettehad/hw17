SELECT   
    ar.firstname || ' ' || ar.lastname AS artist_name,   
    COUNT(t.track_id) AS track_count  
FROM   
    artists ar  
JOIN   
    tracks t ON ar.artist_id = t.artist_id  
GROUP BY   
    ar.artist_id  
HAVING   
    COUNT(t.track_id) >= 1;