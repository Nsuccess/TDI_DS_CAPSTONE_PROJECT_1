#!/usr/bin/env bash
# Script to integrate datasets

# Concatenate all CSV files in the data-hub folder into a single file
cat data-hub/*.csv > db/integrated_data.csv

echo "Data integration complete. Integrated file saved to db/integrated_data.csv"
