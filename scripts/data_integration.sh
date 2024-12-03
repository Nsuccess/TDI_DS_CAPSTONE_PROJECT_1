#!/usr/bin/env bash 

mkdir -p db

# check if we have the datahub folder
data_hub=./data-hub 

if 
	[ ! -d "$data_hub" ]; then
	echo "The '$data_hub' not found!"
	exit 1
fi

# Initialize the header flag as false
header_written=false

# Using a loop to integrate through the csv files and appending them into a consolidated file 

for file in "$data_hub"/*.csv; do
	# write the header which will form the columns
	if [ -f "$file" ]; then
		echo "processing file: $file"

		if [ "$header_written" = false ]; then
	
			head -n 1 "$file" > db/database.csv
			header_written=true
		fi
	
	fi

	tail -n +2 "$file" >> db/database.csv

done

echo "Data integration complete"
