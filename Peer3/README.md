# Human Activity Recognition Using Smartphones
Course project for 'Getting and Cleaning Data' Coursera course.

From the project instructions: 
_The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis._

The [data][url_data] used for this project comes from the UCI Machine Learning Repository:[Human Activity Recognition Using Smartphones Data Set][uci_dataset] (1), and consist in recordings of 30 subjects performing daily living activities while carrying an smartphone   with embedded inertial sensors.

There are 10299 observations, as every subject perform every activity between 36 and 95 times. See next the table of activities versus subjects:   

```R
> table(df$activity, df$subject)
                    
                      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
  walking            95 59 58 60 56 57 57 48 52 53 59 50 57 59 54 51 61 56 52 51 52 46 59 58 74 59 57 54 53 65
  walking_upstairs   53 48 59 52 47 51 51 41 49 47 54 52 55 54 48 51 48 58 40 51 47 42 51 59 65 55 51 51 49 65
  walking_downstairs 49 47 49 45 47 48 47 38 42 38 46 46 47 45 42 47 46 55 39 45 45 36 54 55 58 50 44 46 48 62
  sitting            47 46 52 50 44 55 48 46 50 54 53 51 49 54 59 69 64 57 73 66 85 62 68 68 65 78 70 72 60 62
  standing           53 54 61 56 56 57 53 54 45 44 47 61 57 60 53 78 78 73 73 73 89 63 68 69 74 74 80 79 65 59
  laying             50 48 62 54 52 57 52 54 50 58 57 60 62 51 72 70 71 65 83 68 90 72 72 72 73 76 74 80 69 70
  
> sum(table(df$activity, df$subject))
[1] 10299
```

The initial datasets has 561 variables coming from the smartphone inertial sensors, but only variables about the mean and the standard deviation are kept: 79 variables. Check the [codebook](CodeBook.md) in this repository.

## run_analysis.R

This script: 

1. Merges the training and the test sets.
2. Extracts  measurements on the mean and standard deviation. 
3. Uses descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Some considerations: run_analysis.R should be in the same directory (working directory) where are the raw data files: 
```
UCI HAR Dataset\activity_labels.txt
                \features.txt

                \test\subjtect_test.txt
                     \X_test.txt
                     \y_test.txt

                \train\subject_train.txt
                      \X_train.txt
                      \y_train.txt
```
Please, unzip the data and copy: `actitivity_labels.txt, features.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, X_train.txt` and `y_train.txt` to the working directory.

This script uses plyr and reshape2 R packages, please install if are not already available.  

Read the script result file ("tidydf_wide.txt") with:

```R
tidydf.wide <- read.table("tidydf_wide.txt", header=TRUE)
```

#### Reference:
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

[url_data]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
[uci_dataset]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 