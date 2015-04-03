## Load the dplyr library, which provides a lot of convenientx methods to
## manipulate tables
library(dplyr)


# Load "lookup" tables, their values are useful to describe codified values in
# other tables
features <- read.table('features.txt')
activities <- read.table('activity_labels.txt')

# Load activity data for training & test
ytrain <- read.table('train/Y_train.txt')
ytest <- read.table('test/Y_test.txt')

# Load subject data
stest <- read.table('test/subject_test.txt')
strain <- read.table('train/subject_train.txt')

# Load "measures" data as a regular table
xtestraw <- read.table('test/X_test.txt')
xtrainraw <- read.table('train/X_train.txt')

## STEP 1

y_all <- rbind(ytest, ytrain)
s_all <- rbind(stest, strain)

# Create a tbl data frame (from package dplyr) to have powerful functions to
# manage data and structure
x_all <- tbl_df(rbind(xtestraw, xtrainraw))

## STEP 3 & 4

# I've decided to put good names to columns before going further

# Set a good naming for columns
names(y_all)[1] <- "Activity"

# Replace the activity code with the activity name
y_all$Activity <- activities$V2[y_all$Activity]

# Set a good naming for columns
names(s_all)[1] <- "Subject"

# Rename columns in data tables with their descriptive name from the features
# table. Ensure all columns have a valid & unique name
names(x_all) <- make.names(as.character(features[paste("V",features$V1, sep="") == names(x_all),2]), unique=TRUE)
names(x_all) <- gsub("\\.\\.\\.", ".", names(x_all))
names(x_all) <- gsub("\\.\\.", ".", names(x_all))
names(x_all) <- sub("\\.\\.$", "", names(x_all))
names(x_all) <- sub("\\.$", "", names(x_all))
names(x_all) <- sub("^t", "time.", names(x_all))
names(x_all) <- sub("^f", "frequency.", names(x_all))

## STEP 2

# Select only columns with a mean or standard deviation data
x_allSelected <- select(x_all, contains('mean'), contains('std'))

# Join the subject, activity & data columns into a new table
all <- tbl_df(cbind(s_all, y_all, x_allSelected))

## STEP 5

# Generate a new data frame with the average for each data variable grouped by
# Subject & Activity
result <- all %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## To write the resulting dataset use the following function
# write.table(result, 'result.txt', row.names=FALSE)
