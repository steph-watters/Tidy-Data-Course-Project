# Codebook - Tidy Data Set.txt

***
_Some of the information appearing in this file comes from the README.txt and features_info.txt files from the following dataset:_ <br>
Human Activity Recognition Using Smartphones Dataset <br>
Version 1.0 <br>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. <br>
Smartlab - Non Linear Complex Systems Laboratory <br>
DITEN - Universit‡ degli Studi di Genova. <br>
Via Opera Pia 11A, I-16145, Genoa, Italy. <br>
activityrecognition@smartlab.ws <br>
www.smartlab.ws <br>

***

###Introduction

<br> This codebook was made to provide supplementary information to the ‘tidy_dataset’ output from the run_analysis.R script. This output can be found as a table in the file ‘tidy data set.txt’, located in the github repository https://github.com/steph-watters/Tidy-Data-Course-Project <br>

This dataset takes input from the test and training datasets from the “Human Activity Recognition Using Smartphones Dataset”. <br> <br>

###Experimental Design

<br> The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. <br> <br>

### Raw Data

<br> The data taken as input into ‘tidy data set.txt’ had undergone processing from uts raw from by the original researchers. <br>

#####The raw data taken as input to the ‘Tidy Data Set’ were as follows: <br>

Input File     | Description                     | Levels 
-------------- | ------------------------------- | ------------------------------
subject_test.txt | ID of the subject in the test group who completed the experiment, ordered by activity during measurement | 1 variable, 2947 observations
subject_test.txt | ID of the subject in the test group who completed the experiment, ordered by activity during measurement | 1 variable, 2947 observations
subject_train.txt | ID of the subject in the training group who completed the experiment, ordered by activity during measurement | 1 variable, 7352 observations
X_test.txt | Time and frequency domain output from the phone’s accelerometer and gyroscope for the test group | 561 variables, 2947 observations
X_train.txt | Time and frequency domain output from the phone’s accelerometer and gyroscope, for the training group | 561 variables, 7352 observations 
features.txt | Titles of the outcome variables for the time and frequency domains | 2 variables, 561 observations
y_test.txt | Activity completed during measurement, ordered by ID of subject | 1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING
y_train.txt | ctivity completed during measurement, ordered by ID of subject | 1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING

<br> The time and frequency domain output of the X_test.txt and X_train.txt files come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br>

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br>

Features were normalised and bounded within (-1, 1). <br> <br>




