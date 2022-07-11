SELECT 
    album.name  AS album,
    track.title AS track,
    artist.name AS artist
    
FROM
    track_raw JOIN artist ON artist_id = artist.id
              JOIN track  ON track_raw.track_id = track.id
              JOIN album  ON track.album_id = album.id

ORDER BY
    album,
    track;