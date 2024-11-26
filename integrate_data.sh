#!/usr/bin/env bash

# Ensure the 'db' folder exists
mkdir -p db

# Define the output file
output_file="db/consolidated_data.csv"

# Clear the output file if it exists
> $output_file

# Loop through each CSV file in the 'data-hub' folder
for file in data-hub/*.csv; do
    echo "Processing $file"
    if [ ! -s $output_file ]; then
        # Include headers from the first file
        cat $file >> $output_file
    else
        # Skip headers for subsequent files
        tail -n +2 $file >> $output_file
    fi
done

echo "Data integration completed. Output saved to $output_file"
