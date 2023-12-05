#!/bin/bash

# Variables con la información de la base de datos
DB_NAME="tarea2"
DB_USER="user"
DB_PASSWORD="pass"

# Comando SQL para calcular el ATTR
SQL_COMMAND="SELECT 1 - AVG(start.prob * final.prob) AS a2tr
FROM fibra_optica start
JOIN fibra_optica final ON start.final = final.inicio
WHERE start.id != final.id;"

# Ejecutar la consulta SQL y almacenar el resultado
RESULTADO=$(docker exec -i tarea2individual-postgres-postgis-pgrouting-1 psql -U $DB_USER -d $DB_NAME -c "$SQL_COMMAND")

# Verificar el resultado de la ejecución de la consulta SQL
if [ $? -ne 0 ]; then
  echo "Error al ejecutar la consulta."
  exit 1
fi

# Guardar el resultado en un archivo de texto (bloc de notas)
echo "El ATTR promedio obtenido fue: $RESULTADO" > resultado.txt

echo "Resultado guardado en resultado.txt"

# Pausar la ejecución del script para que no se cierre inmediatamente
read -p "Presiona Enter para salir
