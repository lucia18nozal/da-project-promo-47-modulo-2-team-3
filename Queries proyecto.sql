-- ¿Cuál es el artista con más álbumes?
SELECT nombre_artista, COUNT(nombre_cancion) AS num_albumes
FROM AlbumesyCanciones
GROUP BY nombre_artista
ORDER BY num_albumes DESC
LIMIT 1;

-- ¿Qué género es el mejor valorado?
SELECT genre, COUNT(nombre_cancion) AS cantidad_albumes
FROM AlbumesyCanciones
GROUP BY genre
ORDER BY cantidad_albumes DESC
LIMIT 1;

-- ¿En qué año se lanzaron más álbumes?
SELECT year, COUNT(nombre_cancion) AS num_albumes
FROM AlbumesyCanciones
GROUP BY year
ORDER BY num_albumes DESC
LIMIT 1;

-- ¿Cuál es la canción mejor valorada?
SELECT ac.nombre_cancion, a.reproducciones
FROM AlbumesyCanciones ac
INNER JOIN Artistas a ON ac.nombre_artista = a.nombre_artistas
ORDER BY a.reproducciones DESC
LIMIT 1;

-- ¿Cuál es el artista con más valoración? // Artistas con más popularidad
SELECT nombre_artistas, MAX(popularidad) AS max_popularidad
FROM Artistas
GROUP BY nombre_artistas
ORDER BY max_popularidad DESC
LIMIT 1;

-- ¿Cuál es el album más valorado de los años pares de mi selección?
SELECT ac.nombre_cancion, MAX(a.reproducciones) AS max_reproducciones
FROM AlbumesyCanciones ac
JOIN Artistas a ON ac.nombre_artista = a.nombre_artistas
WHERE MOD(ac.year, 2) = 0  -- Filtramos años pares
GROUP BY ac.nombre_cancion
ORDER BY max_reproducciones DESC
LIMIT 1;

-- ¿Qué artista estuvo más tiempo y cuántos albums tiene?
SELECT nombre_artista, COUNT(nombre_cancion) AS num_albumes, MAX(year) - MIN(year) AS tiempo_activo
FROM AlbumesyCanciones
GROUP BY nombre_artista
ORDER BY tiempo_activo DESC
LIMIT 1;

-- ¿Cuáles son los artistas más escuchados de cada género?
SELECT genero, nombre_artistas, reproducciones
FROM (
    SELECT ac.genre AS genero, a.nombre_artistas, MAX(a.reproducciones) AS reproducciones,
        ROW_NUMBER() OVER (PARTITION BY ac.genre ORDER BY reproducciones DESC) AS fila
    FROM artistas a
    INNER JOIN AlbumesyCanciones ac 
    ON ac.nombre_artista = a.nombre_artistas
    GROUP BY ac.genre, a.nombre_artistas
) AS subconsulta
WHERE fila <= 3
ORDER BY genero, reproducciones DESC;

-- Número de álbumes por género y año.
SELECT year, genre, COUNT(nombre_cancion) AS numero_albumes FROM AlbumesyCanciones
WHERE type = 'album'
GROUP BY year, genre
ORDER BY year, genre;

-- Álbumes más reproducidos por año.
SELECT year, nombre_cancion, nombre_artistas, reproducciones
FROM (
	SELECT ac.year, ac.nombre_cancion, a.nombre_artistas, SUM(a.reproducciones) AS reproducciones, 
	ROW_NUMBER() OVER (PARTITION BY ac.year ORDER BY SUM(a.reproducciones) DESC) AS fila
    FROM AlbumesyCanciones ac
	INNER JOIN artistas a ON ac.nombre_artista = a.nombre_artistas
	WHERE ac.type = 'album'
	GROUP BY ac.year, ac.nombre_cancion, a.nombre_artistas
) AS subconsulta
WHERE fila <= 5
ORDER BY year, reproducciones DESC;

-- Número de oyentes por género.
SELECT genre, reproducciones
FROM (
	SELECT ac.genre, SUM(a.reproducciones) AS reproducciones, 
	ROW_NUMBER() OVER (PARTITION BY ac.genre ORDER BY SUM(a.reproducciones) DESC) AS fila FROM artistas a
	INNER JOIN AlbumesyCanciones ac ON ac.nombre_artista = a.nombre_artistas
	GROUP BY ac.genre, a.reproducciones
) AS subconsulta
WHERE fila = 1
ORDER BY reproducciones DESC;

-- ¿Cuáles son los artistas con biografía más extensa?
SELECT nombre_artistas, biografia, LENGTH(biografia) AS longitud_biografia FROM Artistas
ORDER BY longitud_biografia DESC
LIMIT 5;

-- ¿Cuál es el álbum más reciente lanzado?
SELECT year, nombre_cancion, nombre_artista FROM AlbumesyCanciones 
WHERE type = 'album'
ORDER BY year DESC
LIMIT 1;

-- ¿Cuántas canciones hay por género?
SELECT genre, COUNT(nombre_cancion) FROM AlbumesyCanciones
GROUP BY genre;

-- ¿Cuál es el género con más canciones?
SELECT genre, COUNT(nombre_cancion) AS total_canciones FROM AlbumesyCanciones
GROUP BY genre
ORDER BY total_canciones DESC
LIMIT 1;

-- Selecciona el nombre y el año de lanzamiento de los albumes en cada año elegido.
SELECT year, nombre_cancion, nombre_artista FROM AlbumesyCanciones
WHERE year = 2002
ORDER BY year DESC
LIMIT 20;

-- ¿Qué artistas tienen canciones en colaboración con otros artistas?
SELECT ac.nombre_cancion, ac.nombre_artista FROM AlbumesyCanciones ac
WHERE ac.nombre_artista IN (
        SELECT nombre_artista
        FROM AlbumesyCanciones
        GROUP BY nombre_artista, nombre_cancion
        HAVING COUNT(DISTINCT nombre_artista) > 1
    )
ORDER BY ac.nombre_artista, ac.nombre_cancion;