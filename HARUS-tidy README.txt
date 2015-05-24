==================================================================
HARUS analysis - Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Johns Hopkins/Coursera/Getting and Cleaning Data - student assignment
==================================================================

This archive represents a tidy dataset produced from the “Human Activity Recognition Using Smartphones Dataset, provided by the Machine Learning Repository of the Center for Machine Learning and Intelligent Systems of University of California Irvine.

This data was derived from experiments conducted with 30 volunteers between ages 19 to 48 years performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with a smartphone attached to the waist. Acceleration and angular velocity data was captured using the smartphone’s accelerometer and gyroscope. 

This analysis includes:
======================================

- An R script, run_analysis.R, capable of producing a tidy data set meeting specified parameters
- A text file representing a tidy dataset, “HARUS-tidy.txt”
- A codebook clarifying the variables of the HARUS-tidy dataset
- A README file which describes the source of the data and the concept of the analysis

The dataset includes the following files:
=========================================

- 'README.txt'

- ‘run_analysis.R’: R programming script which inputs the UCI HAR data and produces a tidy dataset with mean and standard deviation.

- 'CODEBOOK.md’: Listing and description of variables.

- ‘HARUS-tidy.txt’: A text version of the tidy dataset produced by the run_analysis.R script.


Notes: 
======
- Training and Test data are combined into this dataset
- Activity names are provided (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- Mean and Standard Deviation for each activity is calculated for each subject.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
