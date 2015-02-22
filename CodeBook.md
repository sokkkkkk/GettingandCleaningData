#Code Book
## Data source
The data downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip], and only files listing as below were used. 
* subject_*.txt
* y_*.txt
* x_*.txt
* features.txt
* activity_labels.txt 

## Data filtering
Only measurements on the mean and standard deviation for each measurement were used 

## ID fields in output file
All units are same as the original data set.
* subject - an ID for who performed the activity 
* activity - activity name
* Mean - average of each subject+activity's measurements 

