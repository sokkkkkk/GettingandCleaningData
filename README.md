# Getting and Cleaning Data 
## Overview
The goal of run_analysis.R script listing as follows.

1. Merged the training and the test sets to create one data set
2. Extracted only the measurements on the mean and standard deviation for each measurement 
3. Named the activities in the data set with descriptive activity names
4. Label the variable names with descriptive names
5. Created an independent tidy data set with the average of each variable for each activity and each subject

## Workflow 
1. Download the data set and unzip
2. Read in subject, labels, and data for both test and train data and combinded as a single dataframe
3. Extract mean and std columns
4. Add a new column to dataframe based on activity id 
5. Rename columns based on features
6. Calculate the average for each activity and each subject
7. Write output to a file under current working directory

## Pre-requirement
Following R libraries needs to be installed prior to excute the script
plyr, reshape
