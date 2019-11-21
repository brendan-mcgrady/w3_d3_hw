DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  album_id INT REFERENCES albums(id)
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES artists(id)
)
