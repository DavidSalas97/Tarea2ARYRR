# Utiliza la imagen oficial de PostgreSQL con PostGIS
FROM postgres:16

# Variables de entorno para la configuración de la base de datos
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD pass
ENV POSTGRES_DB tarea2

# Copia el script SQL para la inicialización de la base de datos
COPY init.sql /docker-entrypoint-initdb.d/
COPY fibra_optica_detectada.* /docker-entrypoint-initdb.d/

# Descarga y compila pgrouting
RUN apt-get update
RUN apt-get install -y --no-install-recommends postgresql-16-postgis-3 postgresql-16-pgrouting gdal-bin
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expone el puerto de PostgreSQL
EXPOSE 5432
