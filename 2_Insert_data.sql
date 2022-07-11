COPY track(title, artist, album, count, rating, len) FROM 'C:/Program Files/PostgreSQL/14/data/projects_data/library.csv' WITH DELIMITER ',' CSV HEADER;

INSERT INTO album(name) SELECT DISTINCT album FROM track;
INSERT INTO artist(name) SELECT DISTINCT artist FROM track;
INSERT INTO track_raw(track, artist) SELECT DISTINCT title, artist FROM track;

UPDATE track SET album_id = (SELECT 
                                album.id
                             FROM
                                album
                             WHERE
                                album.name = track.album);



UPDATE track SET artist_id = (SELECT 
                                 artist.id
                              FROM
                                 artist
                              WHERE
                                 artist.name = track.artist);
                                 
UPDATE track_raw SET artist_id = (SELECT 
                                    artist.id
                                  FROM
                                     artist
                                  WHERE
                                     artist.name = track_raw.artist);
UPDATE track_raw SET track_id = (SELECT 
                                    track.id
                                  FROM
                                     track
                                  WHERE
                                     track.title = track_raw.track);                                     
SELECT
    *
FROM
    track_raw;