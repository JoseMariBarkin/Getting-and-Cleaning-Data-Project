# Code Book

## Human Activity Recognition Using Smartphones
Course project for 'Getting and Cleaning Data' Coursera course.

### Column 1: activity
Daily linving activity performed. 
Factor variable with 6 levels:

* standing
* sitting
* laying
* walking
* walking_downstairs
* walking_upstairs


### Column 2: subject
Subject identifier
Integer, from 1 to 30 


### Columns 3 to 81: inertial phone sensors
Readings from the inertial phone sensors. From the 561 original variables, 79 containing 'mean' or 'std' in the name where automatically selected. Original names where modified trying to make more readable.  

```R
> tempdf
                          old_name                           new_name
3                tBodyAcc-mean()-X               timebodyaccel_mean_x
4                tBodyAcc-mean()-Y               timebodyaccel_mean_y
5                tBodyAcc-mean()-Z               timebodyaccel_mean_z
6                 tBodyAcc-std()-X                timebodyaccel_std_x
7                 tBodyAcc-std()-Y                timebodyaccel_std_y
8                 tBodyAcc-std()-Z                timebodyaccel_std_z
9             tGravityAcc-mean()-X            timegravityaccel_mean_x
10            tGravityAcc-mean()-Y            timegravityaccel_mean_y
11            tGravityAcc-mean()-Z            timegravityaccel_mean_z
12             tGravityAcc-std()-X             timegravityaccel_std_x
13             tGravityAcc-std()-Y             timegravityaccel_std_y
14             tGravityAcc-std()-Z             timegravityaccel_std_z
15           tBodyAccJerk-mean()-X           timebodyacceljerk_mean_x
16           tBodyAccJerk-mean()-Y           timebodyacceljerk_mean_y
17           tBodyAccJerk-mean()-Z           timebodyacceljerk_mean_z
18            tBodyAccJerk-std()-X            timebodyacceljerk_std_x
19            tBodyAccJerk-std()-Y            timebodyacceljerk_std_y
20            tBodyAccJerk-std()-Z            timebodyacceljerk_std_z
21              tBodyGyro-mean()-X                timebodygyro_mean_x
22              tBodyGyro-mean()-Y                timebodygyro_mean_y
23              tBodyGyro-mean()-Z                timebodygyro_mean_z
24               tBodyGyro-std()-X                 timebodygyro_std_x
25               tBodyGyro-std()-Y                 timebodygyro_std_y
26               tBodyGyro-std()-Z                 timebodygyro_std_z
27          tBodyGyroJerk-mean()-X            timebodygyrojerk_mean_x
28          tBodyGyroJerk-mean()-Y            timebodygyrojerk_mean_y
29          tBodyGyroJerk-mean()-Z            timebodygyrojerk_mean_z
30           tBodyGyroJerk-std()-X             timebodygyrojerk_std_x
31           tBodyGyroJerk-std()-Y             timebodygyrojerk_std_y
32           tBodyGyroJerk-std()-Z             timebodygyrojerk_std_z
33              tBodyAccMag-mean()              timebodyaccelmag_mean
34               tBodyAccMag-std()               timebodyaccelmag_std
35           tGravityAccMag-mean()           timegravityaccelmag_mean
36            tGravityAccMag-std()            timegravityaccelmag_std
37          tBodyAccJerkMag-mean()          timebodyacceljerkmag_mean
38           tBodyAccJerkMag-std()           timebodyacceljerkmag_std
39             tBodyGyroMag-mean()               timebodygyromag_mean
40              tBodyGyroMag-std()                timebodygyromag_std
41         tBodyGyroJerkMag-mean()           timebodygyrojerkmag_mean
42          tBodyGyroJerkMag-std()            timebodygyrojerkmag_std
43               fBodyAcc-mean()-X               freqbodyaccel_mean_x
44               fBodyAcc-mean()-Y               freqbodyaccel_mean_y
45               fBodyAcc-mean()-Z               freqbodyaccel_mean_z
46                fBodyAcc-std()-X                freqbodyaccel_std_x
47                fBodyAcc-std()-Y                freqbodyaccel_std_y
48                fBodyAcc-std()-Z                freqbodyaccel_std_z
49           fBodyAcc-meanFreq()-X           freqbodyaccel_mean_freqx
50           fBodyAcc-meanFreq()-Y           freqbodyaccel_mean_freqy
51           fBodyAcc-meanFreq()-Z           freqbodyaccel_mean_freqz
52           fBodyAccJerk-mean()-X           freqbodyacceljerk_mean_x
53           fBodyAccJerk-mean()-Y           freqbodyacceljerk_mean_y
54           fBodyAccJerk-mean()-Z           freqbodyacceljerk_mean_z
55            fBodyAccJerk-std()-X            freqbodyacceljerk_std_x
56            fBodyAccJerk-std()-Y            freqbodyacceljerk_std_y
57            fBodyAccJerk-std()-Z            freqbodyacceljerk_std_z
58       fBodyAccJerk-meanFreq()-X       freqbodyacceljerk_mean_freqx
59       fBodyAccJerk-meanFreq()-Y       freqbodyacceljerk_mean_freqy
60       fBodyAccJerk-meanFreq()-Z       freqbodyacceljerk_mean_freqz
61              fBodyGyro-mean()-X                freqbodygyro_mean_x
62              fBodyGyro-mean()-Y                freqbodygyro_mean_y
63              fBodyGyro-mean()-Z                freqbodygyro_mean_z
64               fBodyGyro-std()-X                 freqbodygyro_std_x
65               fBodyGyro-std()-Y                 freqbodygyro_std_y
66               fBodyGyro-std()-Z                 freqbodygyro_std_z
67          fBodyGyro-meanFreq()-X            freqbodygyro_mean_freqx
68          fBodyGyro-meanFreq()-Y            freqbodygyro_mean_freqy
69          fBodyGyro-meanFreq()-Z            freqbodygyro_mean_freqz
70              fBodyAccMag-mean()              freqbodyaccelmag_mean
71               fBodyAccMag-std()               freqbodyaccelmag_std
72          fBodyAccMag-meanFreq()         freqbodyaccelmag_mean_freq
73      fBodyBodyAccJerkMag-mean()      freqbodybodyacceljerkmag_mean
74       fBodyBodyAccJerkMag-std()       freqbodybodyacceljerkmag_std
75  fBodyBodyAccJerkMag-meanFreq() freqbodybodyacceljerkmag_mean_freq
76         fBodyBodyGyroMag-mean()           freqbodybodygyromag_mean
77          fBodyBodyGyroMag-std()            freqbodybodygyromag_std
78     fBodyBodyGyroMag-meanFreq()      freqbodybodygyromag_mean_freq
79     fBodyBodyGyroJerkMag-mean()       freqbodybodygyrojerkmag_mean
80      fBodyBodyGyroJerkMag-std()        freqbodybodygyrojerkmag_std
81 fBodyBodyGyroJerkMag-meanFreq()  freqbodybodygyrojerkmag_mean_freq
```

More information on the data can be found at the [dataset description][uci_dataset]. 

#### Reference:
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

[uci_dataset]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
