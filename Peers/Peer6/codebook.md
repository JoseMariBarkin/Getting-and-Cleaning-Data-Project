# Human Activity Recognition Using Smartphones CodeBook

This dataset is based on the experiments carried out by Jorge L. Reyes-Ortiz,
Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Data source

The data is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

For this experiment, the raw data was processed to obtain a tidy dataset.
Test and Training data was merged, and only the average value for each measurement
is included for each subject performing each activity.

The processing is performed by the script `run_analysis.R`.

## IDs

+ **Subject**: Identify the subject who wear the smartphone during the experiment.

30 subjects, identified with number 1 to 30, are included in this data.

+ **Activity**: Activity performed while the measurements were taken.

The possible values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING.

## Measurements

The prefix time, frequency or angle indicates the kind of measurement.
Only mean and standard deviation has been included in the resulting dataset.

+ time.BodyAcc.mean.X
+ time.BodyAcc.mean.Y
+ time.BodyAcc.mean.Z
+ time.GravityAcc.mean.X
+ time.GravityAcc.mean.Y
+ time.GravityAcc.mean.Z
+ time.BodyAccJerk.mean.X
+ time.BodyAccJerk.mean.Y
+ time.BodyAccJerk.mean.Z
+ time.BodyGyro.mean.X
+ time.BodyGyro.mean.Y
+ time.BodyGyro.mean.Z
+ time.BodyGyroJerk.mean.X
+ time.BodyGyroJerk.mean.Y
+ time.BodyGyroJerk.mean.Z
+ time.BodyAccMag.mean
+ time.GravityAccMag.mean
+ time.BodyAccJerkMag.mean
+ time.BodyGyroMag.mean
+ time.BodyGyroJerkMag.mean
+ frequency.BodyAcc.mean.X
+ frequency.BodyAcc.mean.Y
+ frequency.BodyAcc.mean.Z
+ frequency.BodyAcc.meanFreq.X
+ frequency.BodyAcc.meanFreq.Y
+ frequency.BodyAcc.meanFreq.Z
+ frequency.BodyAccJerk.mean.X
+ frequency.BodyAccJerk.mean.Y
+ frequency.BodyAccJerk.mean.Z
+ frequency.BodyAccJerk.meanFreq.X
+ frequency.BodyAccJerk.meanFreq.Y
+ frequency.BodyAccJerk.meanFreq.Z
+ frequency.BodyGyro.mean.X
+ frequency.BodyGyro.mean.Y
+ frequency.BodyGyro.mean.Z
+ frequency.BodyGyro.meanFreq.X
+ frequency.BodyGyro.meanFreq.Y
+ frequency.BodyGyro.meanFreq.Z
+ frequency.BodyAccMag.mean
+ frequency.BodyAccMag.meanFreq
+ frequency.BodyBodyAccJerkMag.mean
+ frequency.BodyBodyAccJerkMag.meanFreq
+ frequency.BodyBodyGyroMag.mean
+ frequency.BodyBodyGyroMag.meanFreq
+ frequency.BodyBodyGyroJerkMag.mean
+ frequency.BodyBodyGyroJerkMag.meanFreq
+ angle.tBodyAccMean.gravity
+ angle.tBodyAccJerkMean.gravityMean
+ angle.tBodyGyroMean.gravityMean
+ angle.tBodyGyroJerkMean.gravityMean
+ angle.X.gravityMean
+ angle.Y.gravityMean
+ angle.Z.gravityMean
+ time.BodyAcc.std.X
+ time.BodyAcc.std.Y
+ time.BodyAcc.std.Z
+ time.GravityAcc.std.X
+ time.GravityAcc.std.Y
+ time.GravityAcc.std.Z
+ time.BodyAccJerk.std.X
+ time.BodyAccJerk.std.Y
+ time.BodyAccJerk.std.Z
+ time.BodyGyro.std.X
+ time.BodyGyro.std.Y
+ time.BodyGyro.std.Z
+ time.BodyGyroJerk.std.X
+ time.BodyGyroJerk.std.Y
+ time.BodyGyroJerk.std.Z
+ time.BodyAccMag.std
+ time.GravityAccMag.std
+ time.BodyAccJerkMag.std
+ time.BodyGyroMag.std
+ time.BodyGyroJerkMag.std
+ frequency.BodyAcc.std.X
+ frequency.BodyAcc.std.Y
+ frequency.BodyAcc.std.Z
+ frequency.BodyAccJerk.std.X
+ frequency.BodyAccJerk.std.Y
+ frequency.BodyAccJerk.std.Z
+ frequency.BodyGyro.std.X
+ frequency.BodyGyro.std.Y
+ frequency.BodyGyro.std.Z
+ frequency.BodyAccMag.std
+ frequency.BodyBodyAccJerkMag.std
+ frequency.BodyBodyGyroMag.std
+ frequency.BodyBodyGyroJerkMag.std
