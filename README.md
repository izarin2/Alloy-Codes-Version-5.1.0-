<<<<<<< Updated upstream

# Alloy-Codes-Version-5.1.0
# 1. Project's Title:
A machine learning-based framework for efficient solver.
# 2. Project Description:
The goal of this research will be to design a structure that will select tools from several tuning tools and identify which tool works efficiently for a specific model. Here, we will select some tools from Alloy, and we will select some program models as input. Then, we will use machine learning to make decisions. In terms of several criteria such as execution time and memory allocation, it will take decisions. Essentially, a GNN's job is to convert graph data into a format that can be used with conventional machine learning methods, a feed-forward neural network, while still capturing the hidden information found in the design of the graph. Then, the conventional method can carry out the task for which it is designed, such as prediction. Figure 1 describes the prototype of the method. The proposed method would leverage PyTorch and PyTorch Geometric modules to create machine-learning features. Efficient representations for prominent machine learning methods are offered by PyTorch Geometric, an extension of the PyTorch framework. At first, we will collect some benchmarked program models. Then we will run each code in all SAT solvers and calculate the execution time and memory consumption. After that, we will feed the information to train the machine learning model. When we provide configurations and input program models as input, it will figure out which solver will work more.
# 3. How to set up the project in Intellj:
## Step 1: 
Follow the instructions in the readme file of the 'Code' folder.
## Step 2: 
Go to Files >Settings> Plugins>OSGI
## Step 3: 
Go to Files> Project Structure > Project> SDK 1.8 
## Step 4: 
Go to Files> Project Structure > Libraries> Dependencies > Add Alloy.jar as dependencies
## Step 5:
Add the location of the main java file (Codes>org.alloytools. alloy.core>src>main>java>tmp>SolverExplorer) and jar file (Codes\org.alloytools.alloy.core\target\org.alloytools.alloy.core.jar)in the alloy.sh file
## Step 6:
Edit configurations and set tmp.SolverExplorer is the main Java  file
## Step 7:
Go to Files> Project Structure > Artifacts> Dependencies > JAR > Module with dependencies > Module:org.Alloytools.Alloy.core ; Main class: tmp.SolverExplorer
# 4. How to Install and Run the Project:
## Step 1: 
The 'amd64-linux' folder contains all the library. Add the library path in the alloy.sh file.
## Step 2: 
Add one of the modes from the example folder in the alloy.sh file.
## Step 3:
Add the location of the main java file (Codes>org.alloytools. alloy.core>src>main>java>tmp>SolverExplorer) and jar file (Codes\org.alloytools.alloy.core\target\org.alloytools.alloy.core.jar)in the alloy.sh file
# 3. Dataset Collection:
## Step 1: https://github.com/Kaixi26/TAR/tree/main/beafix_benchmarks
=======
# Alloy-Codes-Version-5.1.0-
###Project's Title: A machine learning-based framework for efficient solver.
Project Description: The goal of this research will be to design a structure that will select tools from several tuning tools and identify which tool works efficiently for a specific model. Here, we will select some tools from Alloy, and we will select some program models as input. Then, we will use machine learning to make decisions. In terms of several criteria such as execution time and memory allocation, it will take decisions. Essentially, a GNN's job is to convert graph data into a format that can be used with conventional machine learning methods, a feed-forward neural network, while still capturing the hidden information found in the design of the graph. Then, the conventional method can carry out the task for which it is designed, such as prediction. Figure 1 describes the prototype of the method. The proposed method would leverage PyTorch and PyTorch Geometric modules to create machine-learning features. Efficient representations for prominent machine learning methods are offered by PyTorch Geometric, an extension of the PyTorch framework. At first, we will collect some benchmarked program models. Then we will run each code in all SAT solvers and calculate the execution time and memory consumption. After that, we will feed the information to train the machine learning model. When we provide configurations and input program models as input, it will figure out which solver will work more.
How to Install and Run the Project: Step 1: Follow the instructions in the readme file of the 'Code' folder. Step 2: The 'amd64-linux' folder contains all the library. Add the library path in the alloy.sh file. Step 3: Add one of the modes from the example folder in the alloy.sh file. Step 4: Add the location of the main java file (Codes>org.alloytools. alloy.core>src>main>java>tmp>SolverExplorer) and jar file (Codes\org.alloytools.alloy.core\target\org.alloytools.alloy.core.jar)in the alloy.sh file
>>>>>>> Stashed changes
