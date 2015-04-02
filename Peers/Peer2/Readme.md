
First we need to load the plyr library into R as we'll be using some of the functions in the code below.
library(plyr)

Here we are loading some all the files that we need for creating a clean data file.
y_test.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\test\\y_test.txt")## Reading the Test labels
X_test.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\test\\X_test.txt")  ## Reading the Test data of 561 columns
subject_test.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\test\\subject_test.txt") ## Each perosn is given a subject Id which is saved in this file

y_train.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\train\\y_train.txt") ## Reading the Training labels
X_train.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\train\\X_train.txt") ## Reading the Training data of 561 columns
subject_train.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\train\\subject_train.txt") ## Each person is given a subject ID which is saved in this file

The feature file has all the features that we need for the clean data and more. Some of the column will be filterd out.... and only the columns which give us mean and standard devisiton will be left behind. This is done further down the code.
## reading the features file which will become column names for the big data file
Features.txt <- read.table("getdata-projectfiles-UCIHARDataset\\UCIHARDataset\\features.txt")


I have created two datasets here, one which has all the data required for test and for training seperately. these data sets will be combined further down in the code using rbind and this will give us a combined dataset for test and training.
Test_dataset <- cbind(subject_test.txt,y_test.txt,X_test.txt) ## binding the test data set
Train_dataset <- cbind(subject_train.txt,y_train.txt,X_train.txt) ## binding the training dataset

Big_data_set <- rbind(Test_dataset, Train_dataset) ## combining the test and training data sets into one data set


Here we create a list variable which gives the names for all the column we will be requiring and the columns which need to be filtered.also the columns are renamed here so that it makes them easier to understand. Once we set the column names we create two data sets called semiTidymean and semiTidystd, these have all the columns required for calculating the mean and std for the final tidy dataset. Once we get that we combine those two data sets to form a data set which gives us a mean and std for all the data.
newlist <- as.vector(Features.txt[,2])
##renaming the columns of the big data set according to the names in the featues data set.
colnames(Big_data_set) <- c("Subject_ID","Activity_type",newlist)
semiTidymean <- Big_data_set[,grep("mean",colnames(Big_data_set))]
semiTidystd <- Big_data_set[,grep("std",colnames(Big_data_set))]
##creating the semi Tidy data set which has both the mean and std deviation askde to be calculated in the course
semiTidy <- cbind(semiTidymean, semiTidystd)

attaching the subjectIDs and the activity types for all the variables here. then we use a plyr function called arrange. This arranges the values of the dataset according to how we want the final data set to look. I have used the long form of data set. I first arrange all the subject Ids and then within that I arrange according to the acticvity doen by that subject. This will facilitate us finding the mean of the the values for each subject for each activity.Once this is done the dataset is split according to the subject into amller datasets.sapply is applied to all the datasets we gathered from split. in sapply we apply the mean function on all the columns for all the activities for all the subjects. this way we get all the data we require for the tidy dataset.
##attaching the subject vector and the activity vector to this data set.
semiTidy <- cbind(Big_data_set$Subject_ID, Big_data_set$Activity_type,semiTidy)
##arranging the data set accoring to the subject Id and then within each 
##subject id arranging according to the activity by that subject
semiTidy <- arrange(semiTidy, semiTidy[1], desc(semiTidy[2]))

## Spliting the semitidy data created above using the subject id as factors in R
SemiTidySplt <- split(semiTidy, semiTidy[1])

## This initialises a variable called final as a matrix where 
##our final tidy data will reside.
final <- matrix(ncol=length(SemiTidySplt[[1]]))


I am using rbind here to create a matrix of the final data set.
##for each subject id based data frame create in the split above 
##sapply colMeans function which using the activity ID as a factor
## this gives us a matrix for each subject for each activity done by that subject
##and the mean of the different values which are mentioned in more detail in the Ream and codebook.
for(i in 1:length(SemiTidySplt)){
  temp <- sapply(split(SemiTidySplt[[i]],SemiTidySplt[[i]][2]), colMeans, na.rm=TRUE)
  temp <- t(temp)
  final <- rbind(final,temp)
}
## remove the first NULL row
final <- final[-1,]
## naming the rows and renaming the columns
row.names(final) <- final[,1]

colnames(final)[1] <- "ID_of_the_person_wearing_the_device"
colnames(final)[2] <- "Activity_performed_by_the_person"

renaming all the values of the acitvities to a more readable form. 
## giving ID to different acitivties in accordance with the activities file
final[,2]<-sub("1", "Walking",final[,2])
final[,2]<-sub("2", "Walking_upstairs",final[,2])
final[,2]<-sub("3", "Walking_downstairs",final[,2])
final[,2]<-sub("4", "Sitting",final[,2])
final[,2]<-sub("5", "Standing",final[,2])
final[,2]<-sub("6", "Laying",final[,2])

## Removing uneccesary values
rm(semiTidy)
rm(temp)
rm(SemiTidySplt)
rm(newlist)

## Converting the matirx into a data frame
FinalDataFrm <- data.frame(final)

## Writing final data into a text file using write.table
write.table(FinalDataFrm, "FinalTidyData.txt", row.name=FALSE)