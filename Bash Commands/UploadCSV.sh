#!/bin/bash

csv_file1="/home/isratzarin/Documents/test2.csv"
csv_file2="/home/isratzarin/Documents/test2.csv"
output_file="/home/isratzarin/Documents/test3.csv"

# Join the files based on the first column (assuming it's a unique identifier)
join -t ',' -j 1 "$csv_file1" "$csv_file2" > "$output_file"

# Rename the output columns for clarity (assuming 2nd and 3rd columns are to be kept from each file)
sed -i '1s/[^,]*/&_file1/' "$output_file"  # Rename 2nd and 3rd column from first file
sed -i '1s/[^,]*/&_file2/' "$output_file"  # Rename 2nd and 3rd column from second file

