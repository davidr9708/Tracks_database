DROP TABLE IF EXISTS artist;
CREATE TABLE artist(
    id   SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS album;
CREATE TABLE album(
    id   SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS track;
CREATE TABLE track(
    id SERIAL,
    title TEXT, 
    artist TEXT, 
    artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
    album TEXT, 
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    count INTEGER, 
    rating INTEGER, 
    len INTEGER,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS track_raw;
CREATE TABLE track_raw(
    id SERIAL,
    track TEXT,
    track_id INTEGER REFERENCES track(id) ON DELETE CASCADE,
    artist TEXT,
    artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
    );
    