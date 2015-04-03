# You should create one R script called run_analysis.R that does the following. 
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
# Good luck!

# Author: Raja Kumar
# Date: 18/03/2015

# first read in all the relevant files into variables

#load libraries
library(dplyr)

# read the common files
featureList<-read.table("features.txt",header=FALSE,sep=" ",stringsAsFactors = FALSE)
activityLabels<-read.table("activity_labels.txt",header=FALSE,sep=" ")

# load up all the feature names
newNames<-as.character(featureList[,2])

# read the training dataset
Xtrain<-read.table("./train/X_train.txt",header=FALSE)
YTrain<-read.table("./train/Y_train.txt",header=FALSE,sep=" ")
subjectsTrain<-read.table("./train/subject_train.txt",header=FALSE)

# read the test dataset
Xtest<-read.table("./test/X_test.txt",header=FALSE)
Ytest<-read.table("./test/Y_test.txt",header=FALSE,sep=" ")
subjectsTest<-read.table("./test/subject_test.txt",header=FALSE)

# relabel Xtrain and Xtest
names(Xtrain)=newNames
names(Xtest)=newNames

# add the subject id and activity labels data
Xtrain[,"SubjectID"]=subjectsTrain
Xtrain[,"ActivityLabel"]=YTrain

Xtest[,"SubjectID"]=subjectsTest
Xtest[,"ActivityLabel"]=Ytest

# Add the activity labels by looking up data from the provided activity label list
lookuplist<-activityLabels[2]
Xtrain[,"ActivityLabel"]=lookuplist[YTrain[,1],1]
Xtest[,"ActivityLabel"]=lookuplist[Ytest[,1],1]

# select the relevant columns... need anything that calculates mean or standard deviation
tidyDataTrain<-select(Xtrain,matches("mean\\(\\)|meanFreq\\(\\)|std\\(\\)|SubjectID|ActivityLabel"))
tidyDataTest<-select(Xtest,matches("mean\\(\\)|meanFreq\\(\\)|std\\(\\)|SubjectID|ActivityLabel"))

# merge the two datasets
tidyData<-rbind(tidyDataTrain,tidyDataTest)

# reorder the columns, put SubjectID/ActivityLabel up front followed by all the other columns
# ncol(tidyData)
# Move the last two columns to the front (SubjectID and activitylabel)
tidyData<-tidyData[,c(80,81,seq(1:79))]

# sort the data by the subject ID and Activity label (makes it easier to find specific subjects/activities)
tidyData<-tidyData[order(tidyData$SubjectID,tidyData$ActivityLabel),]

# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
# So in order to do this, need to group_by subjectID and subgroup by ActivityLabel then compute averages
tidyDataMeans<-tidyData %>% group_by(SubjectID,ActivityLabel) %>% summarise_each(funs(mean))

write.table(tidyDataMeans,file = "tidyDataMeans.txt",row.names = FALSE)
str(tidyDataMeans)

