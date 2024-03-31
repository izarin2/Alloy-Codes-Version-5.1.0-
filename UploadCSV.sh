#!/bin/bash

csv_file1="/home/isratzarin/Documents/test2.csv"
csv_file2="/home/isratzarin/Documents/test2.csv"
output_file="/home/isratzarin/Documents/test3.csv"

# Join the files based on the first column (assuming it's a unique identifier)
join -t ',' -j 1 "$csv_file1" "$csv_file2" > "$output_file"

# Rename the output columns for clarity (assuming 2nd and 3rd columns are to be kept from each file)
sed -i '1s/[^,]*/&_file1/' "$output_file"  # Rename 2nd and 3rd column from first file
sed -i '1s/[^,]*/&_file2/' "$output_file"  # Rename 2nd and 3rd column from second file


#!/bin/bash

var1="/home/isratzarin/Desktop/Test/examples/algorithms/dijkstra.als"
# var2="Minisat"
solvers=("Minisat" "Sat4j" "MiniSatProver" "CryptoMiniSatJNI" "Glucose" "Glucose41JNI" "KK" "Lingeling")
var3="/home/isratzarin/Documents/amd64-linux"

output_file="/home/isratzarin/Documents/test2.csv"
echo "Solver Name,Execution Time (Milli seconds),Memory(MB)" > "$output_file"
cd "/home/isratzarin/Documents/Research/New One/Update Alloy/Updated New Alloy 5/Alloy 5/out/artifacts/tmp_jar"

for solver in "${solvers[@]}"; do
    for ((i=1; i<=5; i++)); do
        output=$(java -jar tmp.jar "$var1" "$solver" "$var3" 2>&1 | grep -vE "OS _ ARCH = |Found = |Found native lib")
        solver_name=$(echo "$output" | awk 'NR==1{print $1}')
        execution_time=$(echo "$output" | awk 'NR==1{print $2}')
        memory=$(echo "$output" | awk 'NR==1{print $3}')
        echo "$output"
        echo "$solver_name, $execution_time, $memory" >> "$output_file"
    done
done

