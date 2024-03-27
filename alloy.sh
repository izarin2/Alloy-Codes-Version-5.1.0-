#!/bin/sh
var1="/mnt/c/Users/israt/Research/examples/algorithms/dijkstra.als" //model
var2="/mnt/c/Users/israt/Research/Alloy_code/Alloy_code/amd64-linux"// Library
cd "/mnt/c/Users/israt/Research/Alloy 5/Alloy_code/org.alloytools.alloy-5.1.0/org.alloytools.alloy.core/target/"
java -cp "org.alloytools.alloy.core.jar" tmp.SolverExplorer $var1 $var2

