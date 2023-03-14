#!/bin/bash
# Parámetros de entrada
DB=$1
TABLE=$2
user=root
pass=yzaguirre

# Validación de parámetros
if [[ -z $DB || -z $TABLE ]]; then
  echo "Error: debe ingresar la base de datos y la tabla como parámetros de entrada."
  exit 100
fi

# Ejecución
mysql --user="$user" --password="$pass" --database="$DB" --execute=" TRUNCATE TABLE ${DB}.${TABLE};"

# Verificación del resultado de la ejecución
if [[ $? -ne 0 ]]; then
  echo "Error al ejecutar el comando."
  exit 100
fi

echo "La tabla $TABLE de la base de datos $DB ha sido actualizada correctamente."

exit 0
