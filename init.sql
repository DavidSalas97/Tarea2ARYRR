-- Extensiones PostGIS y pgrouting
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pgrouting;

-- Creación de la tabla fibra_optica, con un id, prob y geom(donde almacena la geometria espacial)
CREATE TABLE IF NOT EXISTS fibra_optica (
    id SERIAL PRIMARY KEY,
    prob DOUBLE PRECISION DEFAULT 0,
    geom GEOMETRY(LineString, 4326)
);

-- Creación de un indice para la tabla fibra_optica
CREATE INDEX index_fibra_optica_geom ON fibra_optica USING GIST (geom);

-- Creación de un rol con privilegios de superusuario, en caso de que encuentre problemas con el usuario user
CREATE ROLE root LOGIN PASSWORD 'pass' SUPERUSER;

-- Concesion de todos los privilegios en la tabla fibra_optica al usuario user
GRANT ALL PRIVILEGES ON TABLE fibra_optica TO "user";