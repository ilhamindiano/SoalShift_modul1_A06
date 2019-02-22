#!/bin/bash

number=0

while test -e "Password$suffix.txt"; do
    (( number++ ))
    suffix="$( printf '%2d' "$number" )"
done

fname="Password$suffix.txt" ||
touch "fname"
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12 > "$fname"

