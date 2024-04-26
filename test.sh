#!/bin/bash

input_dir=$1
output_dir=$2

mkdir -p "$output_dir"

find "$input_dir" -type f | while read -r file; do
    base=$(basename "$file")
    if [ ! -f "$output_dir/$base" ]; then
        
        cp "$file" "$output_dir/$base"
    else
               
	ct=1
        new="${base%.*}_$ct.${base_name##*.}"
        while [ -f "$output_dir/$new" ]; do
            counter=$((counter + 1))
            new="${base%.*}_$ct.${base##*.}"
        done
        cp "$file" "$output_dir/$new"
    fi
done
