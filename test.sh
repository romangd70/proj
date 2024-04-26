#!/bin/bash


input_dir=$1
output_dir=$2

mkdir -p "$output_dir"

find "$input_dir" -type f | while read -r file; do
    base_name=$(basename "$file")
    if [ ! -f "$output_dir/$base_name" ]; then
        
        cp "$file" "$output_dir/$base_name"
    else
               
	counter=1
        new_name="${base_name%.*}_$counter.${base_name##*.}"
        while [ -f "$output_dir/$new_name" ]; do
            counter=$((counter + 1))
            new_name="${base_name%.*}_$counter.${base_name##*.}"
        done
        cp "$file" "$output_dir/$new_name"
    fi
done

