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


-- CONSULTAS VARIAS DE COMPROBACIONES
select * from albumesycanciones;
select * from artistas;
select nombre_artista from albumesycanciones;
select nombre_artistas from artistas;
DROP SCHEMA music_stream;

-- Comprobar qué nombres están repetidos
SELECT DISTINCT ac.nombre_artista FROM albumesycanciones ac
LEFT JOIN artistas a
ON ac.nombre_artista = a.nombre_artistas
AND ac.nombre_artista = a.nombre_artistas
WHERE a.nombre_artistas IS NULL;

-- Comprobar cuántos veces está el nombre de cada artista
SELECT nombre_artistas, count(nombre_artistas) AS repetidos FROM artistas 
GROUP BY nombre_artistas;

-- Comprobar cuántos veces está el nombre de cada artista
SELECT nombre_artista, count(nombre_artista) AS repetidos FROM albumesycanciones 
GROUP BY nombre_artista;