#!/bin/bash
# Initial .index must contain a single string that is "10000"

INDEX=$(cat ~/pictures/screenshots/.index.txt)
INDEX=$(( INDEX + 1 ))
APPEND=$(echo "$INDEX" | sed "s/^1//")
echo "$INDEX" > ~/pictures/screenshots/.index.txt
scrot ~/pictures/screenshots/screenshot-$APPEND.png
