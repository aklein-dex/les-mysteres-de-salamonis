#!/bin/sh

DIRECTORY="./diagrammes"
OUTPUT="./images"

for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        FILENAME=$(basename "$FILE")

        if [ "$FILENAME" == "classes.d2" ] || [ "$FILENAME" == "cochon.png" ]; then
            continue
        fi

        echo "Processing $FILE"

        IMAGE="${FILENAME%.*}.svg"
        d2 -l elk --scale 1 "$FILE" "$OUTPUT/$IMAGE"
    fi
done
