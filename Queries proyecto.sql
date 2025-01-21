-- ¿Cuál es el artista con más álbumes?
SELECT nombre_artista, COUNT(*) AS num_albumes
FROM AlbumesyCanciones
GROUP BY nombre_artista
ORDER BY num_albumes DESC
LIMIT 1;

-- ¿Qué género es el mejor valorado?
SELECT genre, COUNT(*) AS cantidad_albumes
FROM AlbumesyCanciones
GROUP BY genre
ORDER BY cantidad_albumes DESC
LIMIT 1;

-- ¿En qué año se lanzaron más álbumes?
SELECT year, COUNT(*) AS num_albumes
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

-- ¿Cuál es el artista con más valoración? 
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

-- ¿Qué país tiene más artistas? (ordenar por popularidad) NO HAY COLUMNA PAIS - ALTER TABLE Artistas ADD COLUMN pais VARCHAR(255);
SELECT 'España' AS pais, COUNT(*) AS num_artistas, AVG(popularidad) AS avg_popularidad
FROM Artistas
WHERE biografia LIKE '%España%'
UNION
SELECT 'México' AS pais, COUNT(*) AS num_artistas, AVG(popularidad) AS avg_popularidad
FROM Artistas
WHERE biografia LIKE '%México%'
-- Agrega más países según sea necesario
ORDER BY num_artistas DESC, avg_popularidad DESC
LIMIT 1;

SELECT pais, COUNT(*) AS num_artistas, AVG(popularidad) AS avg_popularidad
FROM Artistas
GROUP BY pais
ORDER BY num_artistas DESC, avg_popularidad DESC
LIMIT 1;

-- ¿Qué artista estuvo má tiempo y cuántos albums tiene?
SELECT nombre_artista, 
       COUNT(*) AS num_albumes, 
       MAX(year) - MIN(year) AS tiempo_activo
FROM AlbumesyCanciones
GROUP BY nombre_artista
ORDER BY tiempo_activo DESC
LIMIT 1;