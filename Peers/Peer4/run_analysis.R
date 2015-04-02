## This R script will do the following:
## Merge training and test sets using only the measurements on the mean and standard deviation
## Output is a second, independent tidy data set with the average of each variable for each activity and subject

if(!require("data.table")) {
        install.packages("data.table")
}

if(!require("reshape2")) {
        install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Loading labels, test data
activitylabels <- read.table("./activity_labels.txt")[,2]
features <- read.table("./features.txt")[,2]
Xtractfeatures <- grepl("mean|std", features)
Xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subjectest <- read.table("./test/subject_test.txt")
names(Xtest) = features
Xtest = Xtest[, Xtractfeatures]
ytest[,2] = activitylabels[ytest[,1]]
names(ytest) = c("Activity_ID", "Activity_Label")
names(subjectest) = "subject"

# Binding data
testdata <- cbind(as.data.table(subjectest), ytest, Xtest)

# Loading training data
Xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subjectrain <- read.table("./train/subject_train.txt")
names(Xtrain) = features
Xtrain = Xtrain[, Xtractfeatures]
ytrain[,2] = activitylabels[ytrain[,1]]
names(ytrain) = c("Activity_ID", "Activity_Label")
names(subjectrain) = "subject"

# Binding data
traindata <- cbind(as.data.table(subjectrain), ytrain, Xtrain)

# Merging test and training data
alldata = rbind(testdata, traindata)
idlabels = c("subject", "Activity_ID", "Activity_Label")
datalabels = setdiff(colnames(alldata), idlabels)
melteddata = melt(alldata, id = idlabels, measure.vars=datalabels)

#Applying mean to melted data using dcast 
tidydata = dcast(melteddata, subject + Activity_Label ~ variable, mean)

write.table(tidydata, file = "./tidy_data.txt", row.name=FALSE)


