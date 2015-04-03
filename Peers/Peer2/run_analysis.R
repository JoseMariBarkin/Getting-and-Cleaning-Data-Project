
y_test.txt <- read.table("./test/y_test.txt")                       ## Reading the Test labels
X_test.txt <- read.table("./test/X_test.txt")                       ## Reading the Test data of 561 columns
subject_test.txt <- read.table("./test/subject_test.txt")           ## Each perosn is given a subject Id which is saved in this file

y_train.txt <- read.table("./train/y_train.txt")                    ## Reading the Training labels
X_train.txt <- read.table("./train/X_train.txt")                    ## Reading the Training data of 561 columns
subject_train.txt <- read.table("./train/subject_train.txt")        ## Each person is given a subject ID which is saved in this file

## reading the features file which will become column names for the big data file
Features.txt <- read.table("./features.txt")

Test_dataset <- cbind(subject_test.txt,y_test.txt,X_test.txt)       ## binding the test data set
Train_dataset <- cbind(subject_train.txt,y_train.txt,X_train.txt)   ## binding the training dataset

##cleanup of data sets which wont be used later
rm(y_test.txt) 
rm(X_test.txt)
rm(subject_test.txt)

rm(y_train.txt)
rm(X_train.txt)
rm(subject_train.txt)

Big_data_set <- rbind(Test_dataset, Train_dataset) ## combining the test and training data sets into one data set

##cleanup of data sets which wont be used later
rm(Test_dataset)
rm(Train_dataset)

newlist <- as.vector(Features.txt[,2])
##renaming the columns of the big data set according to the names in the featues data set.
colnames(Big_data_set) <- c("Subject_ID","Activity_type",newlist)
semiTidymean <- Big_data_set[,grep("mean",colnames(Big_data_set))]
semiTidystd <- Big_data_set[,grep("std",colnames(Big_data_set))]

##creating the semi Tidy data set which has both the mean and std deviation askde to be calculated in the course
semiTidy <- cbind(semiTidymean, semiTidystd)

##attaching the subject vector and the activity vector to this data set.
semiTidy <- cbind(Big_data_set$Subject_ID, Big_data_set$Activity_type,semiTidy)
##arranging the data set accoring to the subject Id and then within each 
##subject id arranging according to the activity by that subject
semiTidy <- arrange(semiTidy, semiTidy[1], desc(semiTidy[2]))

## remove simetidy mean and semitidy std data frames.
rm(semiTidymean)
rm(semiTidystd)
rm(Big_data_set)
rm(Features.txt)

## Spliting the semitidy data created above using the subject id as factors in R
SemiTidySplt <- split(semiTidy, semiTidy[1])

## This initialises a variable called final as a matrix where 
##our final tidy data will reside.
final <- matrix(ncol=length(SemiTidySplt[[1]]))

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