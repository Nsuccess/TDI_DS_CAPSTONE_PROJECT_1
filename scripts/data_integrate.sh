#!/usr/bin/env bash

# Define input and output paths
INPUT_DIR="data-hub"
OUTPUT_FILE="db/dataset.csv"
LOG_FILE="integration.log"

# Initialize or clear the log file
echo "=== Data Integration Log ===" > "$LOG_FILE"
echo "Integration started: $(date)" >> "$LOG_FILE"

# Initialize the output file with a header
HEADER="Application ID,Name,Email,Cohort,Submission Date"
echo "$HEADER" > "$OUTPUT_FILE"

# Process each CSV file in the input directory
for file in "$INPUT_DIR"/*.csv; do
    if [[ -f $file ]]; then
        echo "Processing $file..." | tee -a "$LOG_FILE"

        # Skip the header row and append the data to the output file
        tail -n +2 "$file" >> "$OUTPUT_FILE"
        echo "Appended data from $file" >> "$LOG_FILE"
    else
        echo "No CSV files found in $INPUT_DIR." >> "$LOG_FILE"
    fi
done

# Log the integration summary
echo "Integration complete: $(date)" >> "$LOG_FILE"
ROW_COUNT=$(wc -l < "$OUTPUT_FILE")
echo "Total rows in integrated file (including header): $ROW_COUNT" >> "$LOG_FILE"

# Preview the first few rows of the output
echo "Preview of integrated file:" >> "$LOG_FILE"
head -n 10 "$OUTPUT_FILE" >> "$LOG_FILE"

echo "Log saved to $LOG_FILE."
