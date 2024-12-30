#!/bin/bash

# Function to rename directories and files
rename_files_and_dirs() {
    local dir="$1"

    # Rename directories first
    for d in "$dir"/*; do
        if [ -d "$d" ]; then
            # Remove whitespace from directory name
            local new_dir_name="$(echo "$d" | tr -d ' ')"
            if [ "$d" != "$new_dir_name" ]; then
                mv "$d" "$new_dir_name"
                echo "Renamed directory: $d to $new_dir_name"
            fi
            # Recursively call the function for subdirectories
            rename_files_and_dirs "$new_dir_name"
        fi
    done

    # Rename files
    for f in "$dir"/*; do
        if [ -f "$f" ]; then
            # Remove whitespace from filename
            local new_file_name="$(echo "$f" | tr -d ' ')"
            if [ "$f" != "$new_file_name" ]; then
                mv "$f" "$new_file_name"
                echo "Renamed file: $f to $new_file_name"
            fi
        fi
    done
}

# Start the renaming process in the current directory
rename_files_and_dirs "."

echo "Whitespaces have been removed from filenames and directory names."
