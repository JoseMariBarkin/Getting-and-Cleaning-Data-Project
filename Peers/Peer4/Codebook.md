# CODEBOOK

##  DATA SOURCE
###Data set is described here:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
### File that what downloaded from here:
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## STUDY DESIGN
* Experiments on 30 volunteers from ages 19-48 years
* 6 Activities included walking, walking upstairs, walking downstairs, sitting, standing and laying while wearing smartphone on waist
* READINGS:  3-axial linear acceleration and 3-axial angular velociy at constant rate of 50Hz
* MODE - Video recorded to label data manually
* Randomly partitioned volunteers - 70% training and 30% testing
* RESULTING VECTOR - vector of features by calculating variables for the time and frequency domain


## FILES IN THE UCI HAR DATASET AND TRANSFORMATION PROCESS
* README.txt
* LOADED features.txt and
*               activity_labels.txt
*               EXTRACTED mean and standard deviation column names and data
* LOADED train/X-train.txt
*               train/y_train.txt
*                       test/X_test.txt
*                               test/y_test.txt
* LOAD and use to bind train/subject_train.txt
*               test/subject_test.txt
* MERGE test and train data, melt data so each is a unique-id variable combo
* APPLY mean function to data using dcast function to obtain final tidy data set
