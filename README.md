# da-project-promo-47-modulo-2-team-3
## Segundo proyecto. Módulo2. MusicStream.

###  ¿Qué queremos lograr?

El propósito principal es identificar cuáles canciones y álbumes destacan entre la multitud y por qué. Para ello:
- Recopilamos datos relevantes desde APIs confiables como **Spotify** y **Last.fm**.
- Organizamos esta información en una base de datos clara y funcional.
- Analizamos los datos para descubrir patrones y responder preguntas clave.

###  ¿Cómo lo hacemos?

1. **Recopilación de Datos**:
   - Usamos APIs para obtener datos de canciones, artistas y álbumes populares.
   - Combinamos información de distintas fuentes para un análisis más completo.

2. **Almacenamiento Inteligente**:
   - Diseñamos una base de datos que permite manejar grandes volúmenes de información.
   - Transformamos los datos en un formato adecuado para su análisis.

3. **Análisis en Acción**:
   - Buscamos tendencias que expliquen la popularidad de ciertas canciones.
   - Comparamos géneros y artistas a lo largo de las décadas.

###  Herramientas que utilizamos

- **Lenguajes**: Python y SQL.
- **APIs**: Spotify y Last.fm.
- **Bases de Datos**: MySQL Workbench.
- **Bibliotecas**: Pandas.

## ¿Cómo empezar?

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/lucia18nozal/da-project-promo-47-modulo-2-team-3
   cd MusicStream-Analysis
   ```

2. **Instalar dependencias**:
   - Crea un entorno virtual e instala las bibliotecas necesarias:
     ```bash
     python -m venv venv
     source venv/bin/activate  # En Windows: venv\Scripts\activate
     pip install -r requirements.txt
     ```

3. **Configurar claves de acceso**:
   - Añade un archivo `.env` con tus credenciales:
     ```env
     SPOTIFY_CLIENT_ID=tu_client_id
     SPOTIFY_CLIENT_SECRET=tu_client_secret
     LASTFM_API_KEY=tu_api_key
     ```

4. **Iniciar el análisis**:
   - Ejecuta el script principal:
     ```bash
     python src/main.py
     ```

### Contribuciones

Si tienes ideas o mejoras para este proyecto, ¡eres bienvenido! Abre un issue o envía un pull request con tus propuestas

### Componentes

Las componentes del equipo CODIGOLIS, y por tanto autoras de este proyecto son:
- Elena Alique Baumann.
- Neyde Gabriela Fernández Meza. 
- Carlota Gómez Martínez.
- Tahiera Jafari.
- Paola Nadales Sánchez de Puerta.
- Lucía Nozal Benito.
