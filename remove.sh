#!/bin/bash

# Loop through all files and directories in the current directory
find . -depth -name "* *" -o -name "*(*)*" | while IFS= read -r f; do
  # Construct the new filename by removing spaces and parentheses
  new_name=$(echo "$f" | sed 's/[ ()]//g')

  # Rename the file/directory
  mv "$f" "$new_name"
done
