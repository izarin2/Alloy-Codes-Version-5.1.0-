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

