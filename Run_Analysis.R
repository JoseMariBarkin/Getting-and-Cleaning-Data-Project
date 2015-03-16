
## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on 
## a series of yes/no questions related to the project. You will be required to submit: 
##    1) a tidy data set as described below, 
##    2) a link to a Github repository with your script for performing the analysis, and 
##    3) a code book that describes the variables, the data, and any transformations or work that you performed 
##    to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
##    This repo explains how all of the scripts work and how they are connected. 
##
## One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
## Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
## The data linked to from the course website represent data collected from the accelerometers from the 
## Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
##    
##    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## Here are the data for the project:
##    
##    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## You should create one R script called run_analysis.R that does the following. 
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## 1. Merges the training and the test sets to create one data set.
## 4. Appropriately labels the data set with descriptive activity names.
MergesTrainingData <- function(){
    x_train <- read.table("./train/x_train.txt", header=FALSE, sep="")
    Activity <- read.table("./train/y_train.txt", header=FALSE, sep="")
    subject_train <- read.table("./train/subject_train.txt", header=FALSE, sep="")
    features <- read.table("./features.txt")
    trainData <- cbind(subject_train, x_train, Activity)
    names(trainData) <- c("Subject", as.vector(features[,2]), "ActivityID")
    
    activityNames <- read.table("./activity_labels.txt")
    names(activityNames) <- c("ActivityID", "Activity")
    trainData <- merge(x = trainData, y = activityNames, by = "ActivityID", all = TRUE)
    trainData$ActivityID = NULL
    return (trainData)
}


MergesTestData <- function(){
    x_test <- read.table("./test/x_test.txt", header=FALSE, sep="")
    Activity <- read.table("./test/y_test.txt", header=FALSE, sep="")
    subject_test <- read.table("./test/subject_test.txt", header=FALSE, sep="")
    features <- read.table("./features.txt")
    testData <- cbind(subject_test, x_test, Activity)
    names(testData) <- c("Subject", as.vector(features[,2]), "ActivityID")
    
    activityNames <- read.table("./activity_labels.txt")
    names(activityNames) <- c("ActivityID", "Activity")
    testData <- merge(x = testData, y = activityNames, by = "ActivityID", all = TRUE)
    testData$ActivityID = NULL
    return (testData)
}


AppendRows <- function(){
    trainData <- MergesTrainingData()
    testData <- MergesTestData()
    appendedData <- rbind(trainData, testData)
    write.table(appendedData, file = "rawCleanData.txt", row.names = F)
    return (appendedData)
}


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
EstractMeanStd <- function(){
    library(reshape2)
    data <- AppendRows()
    ## Extracting variables with mean and standard deviation only
    dataFinal <- data[,c(1, grep("mean", colnames(data)),
                         grep("std", colnames(data)), 563)]
    
    ## Rearrange data frame and make a new one with the means of the variables by activity and subject
    melted <- melt(dataFinal, id.vars=c("Subject", "Activity"))
    tidydatameans <- dcast(melted, Activity + Subject ~ variable, mean)
     
    return (tidydatameans)
}


## Main 
run_analysis <- function(){
    cleanedData <- EstractMeanStd()
    write.table(cleanedData, file = "tidyDataSet.txt", row.names = F)
}

