---
title: "Codebook for Getting and Cleaning Data project"
author: "Raja Kumar"
date: "Saturday, March 21, 2015"
output: html_document
---
#Data Collection:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.    
Source for this data is : Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#Data Processing:
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Raw Data:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (**tBodyAcc-XYZ** and **tGravityAcc-XYZ**) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**tBodyAccJerk-XYZ** and **tBodyGyroJerk-XYZ**). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag**). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag**. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

**mean()**: Mean value. 
for example tBodyAcc-mean()-X is the mean value of the separated body acceleration component along the X axis
**std()**: Standard deviation  
**meanFreq()**: Weighted average of the frequency components to obtain a mean frequency (Only for frequency components)   
**NOTE**: - Features are normalized and bounded within [-1,1].

*Note: Other values are also calculated in the Raw dataset, but they have not been used for further processing in this report*

#Transformed output data:
Each row in the tidy data set has one variable per column  
1) SubjectID : (1-30 , id of the subject)  
2) ActivityLabel: (type factor: LAYING, SITTING, STANDING,WALKING,WALKING_DOWNSTAIRS , WALKING_UPSTAIRS)    
Only the mean(), std() and meanFreq() calculations are included in the tidy data set. The raw variables of interest for each of the subjects (1-30) is aggregated by activity type (LAYING,SITTING,STANDING,WALKING ....etc) and the mean value is calculated. There are 30 subjects*6 activities per subject for a total of 180 rows in the tidy data set.  
The following numeric variables are included in the transformed data set.The descriptions for all the variables are the same as that provided in the raw data description above. The only transformation applied is that the variables are grouped by SubjectID and ActivityLabel and then the mean is taken.  
Variable				Type		Units  
tBodyAcc-mean()-X		numeric		gravity units 'g'    
tBodyAcc-mean()-Y		numeric		gravity units 'g'    
tBodyAcc-mean()-Z		numeric		gravity units 'g'    
tBodyAcc-std()-X		numeric		gravity units 'g'    
tBodyAcc-std()-Y		numeric		gravity units 'g'    
tBodyAcc-std()-Z		numeric		gravity units 'g'  
tGravityAcc-mean()-X		numeric		gravity units 'g'  
tGravityAcc-mean()-Y		numeric		gravity units 'g'  
tGravityAcc-mean()-Z		numeric		gravity units 'g'  
tGravityAcc-std()-X		numeric		gravity units 'g'  
tGravityAcc-std()-Y		numeric		gravity units 'g'  
tGravityAcc-std()-Z		numeric		gravity units 'g'  
tBodyAccJerk-mean()-X		numeric		gravity units 'g'  
tBodyAccJerk-mean()-Y		numeric		gravity units 'g'  
tBodyAccJerk-mean()-Z		numeric		gravity units 'g'  
tBodyAccJerk-std()-X		numeric		gravity units 'g'  
tBodyAccJerk-std()-Y		numeric		gravity units 'g'  
tBodyAccJerk-std()-Z		numeric		gravity units 'g'  
tBodyGyro-mean()-X		numeric		radians/s  
tBodyGyro-mean()-Y		numeric		radians/s  
tBodyGyro-mean()-Z		numeric		radians/s  
tBodyGyro-std()-X		numeric		radians/s  
tBodyGyro-std()-Y		numeric		radians/s  
tBodyGyro-std()-Z		numeric		radians/s  
tBodyGyroJerk-mean()-X		numeric		radians/s  
tBodyGyroJerk-mean()-Y		numeric		radians/s  
tBodyGyroJerk-mean()-Z		numeric		radians/s  
tBodyGyroJerk-std()-X		numeric		radians/s  
tBodyGyroJerk-std()-Y		numeric		radians/s  
tBodyGyroJerk-std()-Z		numeric		radians/s  
tBodyAccMag-mean()		numeric		gravity units 'g'  
tBodyAccMag-std()		numeric		gravity units 'g'  
tGravityAccMag-mean()		numeric		gravity units 'g'  
tGravityAccMag-std()		numeric		gravity units 'g'  
tBodyAccJerkMag-mean()		numeric		gravity units 'g'  
tBodyAccJerkMag-std()		numeric		gravity units 'g'  
tBodyGyroMag-mean()		numeric		radians/s  
tBodyGyroMag-std()		numeric		radians/s  
tBodyGyroJerkMag-mean()		numeric		radians/s  
tBodyGyroJerkMag-std()		numeric		radians/s  
fBodyAcc-mean()-X		numeric		gravity units 'g'  
fBodyAcc-mean()-Y		numeric		gravity units 'g'  
fBodyAcc-mean()-Z		numeric		gravity units 'g'  
fBodyAcc-std()-X		numeric		gravity units 'g'  
fBodyAcc-std()-Y		numeric		gravity units 'g'  
fBodyAcc-std()-Z		numeric		gravity units 'g'  
fBodyAcc-meanFreq()-X		numeric		gravity units 'g'  
fBodyAcc-meanFreq()-Y		numeric		gravity units 'g'  
fBodyAcc-meanFreq()-Z		numeric		gravity units 'g'  
fBodyAccJerk-mean()-X		numeric		gravity units 'g'  
fBodyAccJerk-mean()-Y		numeric		gravity units 'g'  
fBodyAccJerk-mean()-Z		numeric		gravity units 'g'  
fBodyAccJerk-std()-X		numeric		gravity units 'g'  
fBodyAccJerk-std()-Y		numeric		gravity units 'g'  
fBodyAccJerk-std()-Z		numeric		gravity units 'g'  
fBodyAccJerk-meanFreq()-X		numeric		gravity units 'g'  
fBodyAccJerk-meanFreq()-Y		numeric		gravity units 'g'  
fBodyAccJerk-meanFreq()-Z		numeric		gravity units 'g'  
fBodyGyro-mean()-X		numeric		radians/s  
fBodyGyro-mean()-Y		numeric		radians/s  
fBodyGyro-mean()-Z		numeric		radians/s  
fBodyGyro-std()-X		numeric		radians/s  
fBodyGyro-std()-Y		numeric		radians/s  
fBodyGyro-std()-Z		numeric		radians/s  
fBodyGyro-meanFreq()-X		numeric		radians/s  
fBodyGyro-meanFreq()-Y		numeric		radians/s  
fBodyGyro-meanFreq()-Z		numeric		radians/s  
fBodyAccMag-mean()		numeric		gravity units 'g'  
fBodyAccMag-std()		numeric		gravity units 'g'  
fBodyAccMag-meanFreq()		numeric		gravity units 'g'  
fBodyBodyAccJerkMag-mean()		numeric		gravity units 'g'  
fBodyBodyAccJerkMag-std()		numeric		gravity units 'g'  
fBodyBodyAccJerkMag-meanFreq()		numeric		gravity units 'g'  
fBodyBodyGyroMag-mean()		numeric		radians/s  
fBodyBodyGyroMag-std()		numeric		radians/s  
fBodyBodyGyroMag-meanFreq()		numeric		radians/s  
fBodyBodyGyroJerkMag-mean()		numeric		radians/s  
fBodyBodyGyroJerkMag-std()		numeric		radians/s  
fBodyBodyGyroJerkMag-meanFreq()		numeric		radians/s  
