# clean workspace
rm(list=ls())

# Please, download and descompress the data:
# Human Activity Recognition Using Smartphones Data Set
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#  
# Copy the files: 
# UCI HAR Dataset\activity_labels.txt
#                \features.txt
#
#                \test\subjtect_test.txt
#                     \X_test.txt
#                     \y_test.txt
#
#                \train\subject_train.txt
#                      \X_train.txt
#                      \y_train.txt
#
# To the R working directory, where run_analysis.R script is.
#


##
## 1 Merges the training and the test sets to create one data set.

# Read data: Train and test X
# x_[train|test]       contains phone sensor data
# y_[train|test]       contains the activity performed
# subject_[train|test] contains the subject that perform the activity

x_train          <- read.table("./train/X_train.txt")
y_train          <- read.table("./train/y_train.txt")
subject_train    <- read.table("./train/subject_train.txt")

x_test           <- read.table("./test/X_test.txt")
y_test           <- read.table("./test/y_test.txt")
subject_test     <- read.table("./test/subject_test.txt")

# Merge train and test data, by information type
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Incorporate all the information to only one dataset
# first column: activity, second column: subject, and then all the phone sensors values
df <- cbind(activity = y[[1]], subject = subject[[1]], x)


# remove big orignal matrices once merged to save memory
rm(list = c("x_train", "y_train", "subject_train"))
rm(list = c("x_test", "y_test", "subject_test"))
rm(list = c("x", "y", "subject"))

##
## 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 

# Read data: features and activity_labels
df_features <- read.table("features.txt")
df_features <- df_features[,-1]

# Look for mean or std in variable's names. Create a dataframe with two columns 
# one for each condition

usedata <- sapply(c("mean","std"), grepl, df_features)

# merge both columns with an OR expression
usedata <- usedata[, 1] | usedata[, 2]   

# add two TRUE values, as phone sensor data variables are in columns 3:563, to keep
# in the dataframe the subject and activity added info.
usedata2 <- c(TRUE, TRUE, usedata)

df <- df[,usedata2]

##
## 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
activity_labels <- tolower(activity_labels[,2])

# convert the activity column of the DF in a factor variables with the 
# labels from activity_labels.txt text file.
df$activity <- factor(df$activity, labels = activity_labels)

##
## 4. Appropriately labels the data set with descriptive variable names.

# change 't' and 'f' prefix to 'time' and 'freq'
mdf <- gsub("^t","time",df_features[usedata])
mdf <- gsub("^f","freq",mdf)
# change Acc to Accel
mdf <- gsub("Acc","Accel",mdf)

# Remove hyphens and parentheses
mdf <- gsub("-","",mdf)
mdf <- gsub("\\(\\)","",mdf)

# Put mean and std surrounded by underscores _mean_ and _std_
mdf <- gsub("mean","_mean_",mdf)
mdf <- gsub("std","_std_",mdf)
# remove the _ if it is at the end of the string
mdf <- gsub("_$","",mdf)

# All names in lower case
mdf <- tolower(mdf)

# Apply the new column names to the dataframe
colnames(df) <- c("activity", "subject", mdf)

# remove unnecessary data from the workspace
rm(list = c("activity_labels", "df_features", "mdf", "usedata", "usedata2"))


##
## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
##
## for this step functions: melt() and ddply() will be necessary. Please 
## install reshape2 and plyr packages if are not already available. 
library(reshape2)
library(plyr)


# http://www.r-bloggers.com/using-r-quickly-calculating-summary-statistics-from-a-data-frame/

# Melt the dataframe with activiy and subject as id variables 
melted <- melt(df, id.vars=c("activity", "subject"))

# head(melted)
# activity subject             variable     value
# 1 standing       1 timebodyaccel_mean_x 0.2885845
# 2 standing       1 timebodyaccel_mean_x 0.2784188
# 3 standing       1 timebodyaccel_mean_x 0.2796531

# Calculate the mean summary using the split-apply function ddply
# mean of each 'variable' for every subject and activity. 
tidydf <- ddply (melted, c("activity", "subject", "variable"), summarise, 
                 mean = mean(value))

# head(tidydf)
# activity subject             variable        mean
# 1  walking       1 timebodyaccel_mean_x  0.27733076
# 2  walking       1 timebodyaccel_mean_y -0.01738382
# 3  walking       1 timebodyaccel_mean_z -0.11114810

# Convert data from long to wide format again (variables in columns)
tidydf.wide <- dcast(tidydf, activity + subject ~ variable, value.var = "mean")

# str(tidydf.wide)
# 'data.frame':        180 obs. of  81 variables:
# $ activity                          : Factor w/ 6 levels "walking","walking_upstairs",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ subject                           : int  1 2 3 4 5 6 7 8 9 10 ...
# $ timebodyaccel_mean_x              : num  0.277 0.276 0.276 0.279 0.278 ...
# $ timebodyaccel_mean_y              : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
# $ timebodyaccel_mean_z              : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...

# Write the tidy data in wide format to a file, using write.table.
write.table(tidydf.wide, file="tidydf_wide.txt",row.name=FALSE)






