#!/bin/bash

# Directorio base (pasa como argumento)
BASE_DIR="$1"

if [ -z "$BASE_DIR" ]; then
    echo "Uso: $0 /ruta/del/directorio"
    exit 1
fi

# Buscar archivos .mp3 y .opus
find "$BASE_DIR" -type f \( -iname "*.mp3" -o -iname "*.opus" \) | while read -r file; do
    dir=$(dirname "$file")
    filename=$(basename "$file")
    name="${filename%.*}"  # nombre sin extensión
    parent=$(basename "$dir")

    # Comprobamos si el nombre del archivo y de la carpeta son distintos
    if [ "$name" != "$parent" ]; then
        target="$dir/$name"
        mkdir -p "$target"
        mv "$file" "$target/"
        echo "Movido: $file → $target/"
    fi
done

