library(plyr)
library(reshape)

## Goals
## 1.   Merges the training and the test sets to create one data set
## 2.   Extracts only the measurements on the mean and standard deviation
##      for each measurement
## 3.   Uses descriptive activity names to name the activities 
##      in the data set
## 4.   Appropriately labels the data set with desriptive activity names
## 5.   Creates a second, independent tidy data set with the average 
##      of each variable for each activity and each subject

# Get the data
#Download the file, put in the current working directory 
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f<-file.path(getwd(),"Dataset.zip")
download.file(url,f,method = "curl")

unzip(f) # unzip the file
list.files(getwd(),recursive = TRUE) # listing all files under current directory 

# Only files under test and train folders will be used 
dataPath<-paste(getwd(),"UCI HAR Dataset",sep = "/")

# read the train data 
myTrain<-cbind(subject = read.table(paste(dataPath,"train","subject_train.txt",sep = "/"),col.names = "subject"),
               y=read.table(paste(dataPath,"train","Y_train.txt",sep = "/"),col.names = "activity.id"),
               x=read.table(paste(dataPath,"train","X_train.txt",sep = "/")))

# read the test data 
myTest<-cbind(subject = read.table(paste(dataPath,"test","subject_test.txt",sep = "/"),col.names = "subject"),
              y=read.table(paste(dataPath,"test","Y_test.txt",sep = "/"),col.names = "activity.id"),
              x=read.table(paste(dataPath,"test","X_test.txt",sep = "/")))

#  Combined train and test data
myData<-rbind(myTrain,myTest)
message("Merged the training and the test sets to create one data set")


# read in features file
myFeatures<-read.table(file = paste(dataPath,"features.txt",sep = "/"),stringsAsFactors = FALSE)
colnames(myFeatures)<-c("id","name")

# extract mean and std base on feature names
myData<-myData[,c(1,2,grep("mean\\(\\)|std\\(\\)",myFeatures$name)+2)]
message("Extracted only the measurements on the mean and standard deviation for each measurement")

# Map the descriptive activity names to the data
# read in label file
myLabels<-read.table(paste(dataPath,"activity_labels.txt",sep = "/"),header = F)
colnames(myLabels)<-c("activity.id","activity")

# merge data based on activity id
myData<-merge(myData,myLabels,by="activity.id",all.x = TRUE)
message("Labeled the data set with desriptive activity names")

#  calculate average of each variable for each activity and each subject
myOutput<-ddply(melt(myData,id.vars = c("subject","activity")), .(subject,activity), summarise, Mean = mean(value))
message("Created myOutput which is a 2nd, independent tidy data set with the average of each variable for each activity and each subject")

# save to file
write.table(myOutput, file = "project_step5_output.txt",row.names = FALSE, sep = "\t", quote = FALSE)