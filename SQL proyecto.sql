CREATE SCHEMA music_stream;

USE music_stream;

CREATE TABLE Artistas (
	id_artistas INT AUTO_INCREMENT PRIMARY KEY,
	nombre_artistas VARCHAR(255) UNIQUE,
    biografia TEXT,
    popularidad INTEGER,
    reproducciones INT,
    artistas_similares TEXT(1000)
);
CREATE TABLE AlbumesyCanciones (
    id_albumesycanciones VARCHAR(30) PRIMARY KEY,
    nombre_cancion VARCHAR(255),
    nombre_artista VARCHAR(50),
    genre VARCHAR(10),
    type VARCHAR(10),
    year INT,
    FOREIGN KEY (nombre_artista) REFERENCES Artistas(nombre_artistas)
);