CREATE SCHEMA music_stream;
USE music_stream;
CREATE TABLE Artistas (
	nombre_artistas VARCHAR(255),
    biografia TEXT,
    popularidad INTEGER,
    reproducciones INT,
    artistas_similares TEXT(1000)
);
CREATE TABLE AlbumesyCanciones (
    nombre_cancion VARCHAR(255),
    nombre_artista VARCHAR(50),
    genre VARCHAR(10),
    type VARCHAR(10),
    year INTEGER,
    id VARCHAR(30) PRIMARY KEY
);
