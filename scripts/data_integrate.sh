#!/usr/bin/env bash

# Path to data-hub folder
data_hub="data-hub"

# Ensure db folder exists
mkdir -p db

# Check if data-hub exists
if [ ! -d "$data_hub" ]; then
  echo "Error: $data_hub folder does not exist."
  exit 1
fi

# Initialize header_written flag
header_written=false

# Integrate CSV files
for file in "$data_hub"/*.csv; do
  if [ -f "$file" ]; then
    echo "Processing $file..."
    if [ "$header_written" = false ]; then
      head -n 1 "$file" > db/dataset.csv
      header_written=true
    fi
    tail -n +2 "$file" >> db/dataset.csv
  fi
done

echo "Data integration complete."
