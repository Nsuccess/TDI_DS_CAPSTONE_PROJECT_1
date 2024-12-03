#!/usr/bin/env bash

# Define input and output paths
INPUT_DIR="data-hub"
OUTPUT_FILE="db/dataset.csv"

# Initialize the output file with a header (if it doesn't already exist)
HEADER="Application ID,Name,Email,Cohort,Submission Date"
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "$HEADER" > "$OUTPUT_FILE"
fi

# Flag to check if any files were processed
files_processed=false

# Process each CSV file in the input directory
for file in "$INPUT_DIR"/*.csv; do
    if [[ -f $file ]]; then
        echo "Processing $file..."

        # Skip the header row and append the data to the output file
        tail -n +2 "$file" >> "$OUTPUT_FILE"
        echo "Appended data from $file"

        files_processed=true
    fi
done

# If no files were processed, exit the script
if [ "$files_processed" = false ]; then
    echo "No new data files were found. No updates made."
    exit 0
fi

echo "Integration complete." 
