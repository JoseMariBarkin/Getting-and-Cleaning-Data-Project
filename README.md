

# Run_Analysis, Script Description.

This file descrives the script that extract the requiered data as is especified on the project: "Merging and Organizing Data" of the course "GETTING AND CLEANING DATA" of the University Johns Hopkins.

*The script has five functions. 
*Input files to get data: x_train.txt, y_train.txt, subject_train.txt, features.txt, activity_labels.tx.
*Output file: tidyDataSet.txt.
*Description of variables of the output files is in the file: codebook.md 

----
## Script functions

1.- MergesTrainingData(): Get clean test data into the data frame: trainData
	Read file "x_train.txt" into the data frame ->				x_train
	Read file "y_train.txt" into the data frame -> 				Activity
	Read file "subject_train.txt" into the data frame 			subject_train
	Read file "features.txt" into the data frame				features
	Add, into "testData", the columns of the data frames: 		subject_train, y_train, Activity
	Add header to "testData" from features plus the names:		"Subject" and "ActivityID"
	
	Read file "activity_labels.txt" into the data frame			ActivityNames
	Add header to the data frame (ActivityID", "Activity)		ActivityNames
	
	Merge "testData" and "activityNames" by "ActivityID" into	trainData
    Delete column "ActivityID" of the data frame "trainData"
    Return (trainData)
	
2.- MergesTestData(): Get clean test data into the data frame: 	testData
	Read file "x_test.txt" into the data frame ->				x_test
	Read file "y_test.txt" into the data frame -> 				Activity
	Read file "subject_test.txt" into the data frame 			subject_test
	Read file "features.txt" into the data frame				features
	Add, into "testData", the columns of the data frames: 		subject_test, x_test, Activity
	Add header to "testData" from features plus the names:		"Subject" and "ActivityID"
	
	Read file "activity_labels.txt" into the data frame			ActivityNames
	Add header to the data frame (ActivityID", "Activity)		ActivityNames
	
	Merge "testData" and "activityNames" by "ActivityID" into	testData
    Delete column "ActivityID" of the data frame "testData"
    Return (testData)
	
	
3. AppendRows(): Add by rows the data frames "trainData", "testData"
	Gets trainData
	Gets testData
	Adds the rows of the data frames "trainData", "testData" into the data frame:	"appendedData"
    Return (appendedData)
	
	
4. EstractMeanStd(): Get the Result using melting and casting.
    Extracts variables with mean and standard deviation only into 	"dataFinal"
    Rearranges data frame "dataFinal" and make the new one "tidydatameans" with the means of the variables by activity and subject
    Return (tidydatameans)

5. run_analysis(): Execute the script
	Get cleanedData calling "EstractMeanStd()" into the data frame "cleanedData"
	Write to file the data frame "tidyDataSet.txt"


More on melting and casting [here](http://tgmstat.wordpress.com/2013/10/31/reshape-and-aggregate-data-with-the-r-package-reshape2/)
