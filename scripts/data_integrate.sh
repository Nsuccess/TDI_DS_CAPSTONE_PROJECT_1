#!/usr/bin/env bash

# Define input and output paths
INPUT_DIR="data-hub"
OUTPUT_FILE="db/dataset.csv"

# Initialize the output file with a header (if it doesn't already exist)
HEADER="Application ID,Name,Email,Cohort,Submission Date"
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "$HEADER" > "$OUTPUT_FILE"
fi

# Process each CSV file in the input directory
for file in "$INPUT_DIR"/*.csv; do
    if [[ -f $file ]]; then
        echo "Processing $file..."

        # Skip the header row and append the data to the output file
        tail -n +2 "$file" >> "$OUTPUT_FILE"
        echo "Appended data from $file"
    fi
done
