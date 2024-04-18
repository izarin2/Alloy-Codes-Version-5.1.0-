#!/bin/bash
input_folders=(
    "/home/isratzarin/Desktop/Test/examples/algorithms"
    "/home/isratzarin/Downloads/Alloy-Codes-Version-5.1.0--main/Dataset/A4F-1B-ATR/CLASSROOM"
    "/home/isratzarin/Downloads/Alloy-Codes-Version-5.1.0--main/Dataset/A4F-1B-ATR/CV"
	"/home/isratzarin/Downloads/Alloy-Codes-Version-5.1.0--main/Dataset/A4F-1B-ATR/GRAPHS"
	"/home/isratzarin/Downloads/Alloy-Codes-Version-5.1.0--main/Dataset/A4F-1B-ATR/PRODUCTION"
	"/home/isratzarin/Downloads/Alloy-Codes-Version-5.1.0--main/Dataset/A4F-1B-ATR/TRASH"
    #"/yet/another/path/to/more/folders"

)
#input_folder="/home/isratzarin/Documents/Test/examples/algorithms"
output_folder="/home/isratzarin/Documents/Research/New One/Update Alloy/Output"
avg_output_folder="/home/isratzarin/Documents/Research/New One/Update Alloy/Output_AVG"
var1="/home/isratzarin/Documents/Test/examples/algorithms/dijkstra.als"

# var2="Minisat"
solvers=("Minisat" "Sat4j" "MiniSatProver" "CryptoMiniSatJNI" "Glucose" "Glucose41JNI" "KK" "Lingeling")
#solvers=("Minisat")
var3="/mnt/c/Users/israt/Research/Updated Alloy/x86-windows"

# Iterate over each file in the input folder
for input_folder in "${input_folders[@]}"; do
		for file in "$input_folder"/*; do
			# Check if the item is a file
			if [[ -f "$file" ]]; then
				# Extract filename without extension
				filename=$(basename -- "$file")
				filename_no_extension="${filename%.*}"

				# Create CSV file with the same name as input file
				output_csv="$output_folder/$filename_no_extension.csv"
				output_avg_csv="$avg_output_folder/AVG_$filename_no_extension.csv"
				
				echo "Solver Name,Execution Time,Memory" > "$output_csv" 
				echo "Solver Name,Execution Time,Memory" > "$output_avg_csv"
				cd "/home/isratzarin/Documents/Research/New One/Update Alloy/Updated New Alloy 5/Alloy 5/out/artifacts/tmp_jar"
				
				# Iterate over solvers and insert data into CSV file
				for solver in "${solvers[@]}"; do
					avg_time=0
					avg_memory=0
					for ((i=1; i<=5; i++)); do
						# Run Java command to generate output
						# Example:
						output=$(java -jar tmp.jar "$file" "$solver" "$var3" 2>&1 | grep -vE "OS _ ARCH = |Found = |Found native lib")
						solver_name=$(echo "$output" | awk 'NR==1{print $1}')
						execution_time=$(echo "$output" | awk 'NR==1{print $2}')
						memory=$(echo "$output" | awk 'NR==1{print $3}')
						avg_time=$((avg_time+execution_time))
						avg_memory=$((avg_memory+memory))
						echo "$solver,$execution_time, $memory" >> "$output_csv"
					done
					avg_time=$((avg_time/5))
					avg_memory=$((avg_memory/5))
					echo "$solver_name,$((avg_time)),$((avg_memory))" >> "$output_avg_csv"
				done
			fi
		done
done
