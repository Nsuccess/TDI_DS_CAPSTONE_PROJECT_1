#!/usr/bin/env bash

# Set paths
DATA_HUB="data-hub"
OUTPUT_DIR="db"
OUTPUT_FILE="${OUTPUT_DIR}/integrated_data.csv"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Combine all CSV files
echo "Combining all CSV files in $DATA_HUB into $OUTPUT_FILE..."

# Use the first CSV as the header and append the rest without headers
head -n 1 "${DATA_HUB}/$(ls $DATA_HUB | head -n 1)" > "$OUTPUT_FILE"  # Extract header from the first file
tail -n +2 -q "${DATA_HUB}"/*.csv >> "$OUTPUT_FILE"  # Append all data without headers

echo "Integration complete. File saved at $OUTPUT_FILE."
