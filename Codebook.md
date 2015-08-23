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

<br> The data taken as input into ‘tidy data set.txt’ had undergone processing from uts raw from by the original researchers.

<br>

#####The raw data taken as input to the ‘Tidy Data Set’ were as follows: 
<br>

Input File     | Description                     | Levels 
-------------- | ------------------------------- | ------------------------------
subject_test.txt | ID of the subject in the test group who completed the experiment, ordered by activity during measurement | 1 variable, 2947 observations
subject_test.txt | ID of the subject in the test group who completed the experiment, ordered by activity during measurement | 1 variable, 2947 observations
subject_train.txt | ID of the subject in the training group who completed the experiment, ordered by activity during measurement | 1 variable, 7352 observations
X_test.txt | Time and frequency domain output from the phone’s accelerometer and gyroscope for the test group | 561 variables, 2947 observations
X_train.txt | Time and frequency domain output from the phone’s accelerometer and gyroscope, for the training group | 561 variables, 7352 observations 
features.txt | Titles of the outcome variables for the time and frequency domains | 2 variables, 561 observations
y_test.txt | Activity completed during measurement, ordered by ID of subject | 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING
y_train.txt | Activity completed during measurement, ordered by ID of subject | 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING

<br> The time and frequency domain output of the X_test.txt and X_train.txt files come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br>

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br>

Features were normalised and bounded within (-1, 1). <br> <br>

### Processed Data

<br> The following operations were performed to create the data contained within ‘tidy data set.txt’. 
<br> _**Subjects datasets**_ 

1.	subject_test.txt and subject_train.txt were combined
2.	Creating one variable with range 1:30

<br> _**Activity datasets**_

1.	y_test.txt and y_train.txt were combined
2.	Converted to a factor variable and renamed as follows
  * 1 = Walking
  * 2 = Walking Up
  * 3 = Walking Down
  * 4 = Sitting Down
  * 5 = Standing Up
  * 6 = Laying Down

<br> _**Time and frequency domain variables**_

1.	X_test.txt and X_train.txt were combined
2.	features_labels.txt was used as column labels for these measurements
3.	Variables calculating the mean and standard deviation were extracted from the dataset
  * Reducing 561 variables to 66 variables 
  * This process excluded the variables that were weighted average calculations (see README.md in https://github.com/steph-watters/Tidy-Data-Course-Project)
4.	The selected variables were renamed to their long-form versions in the final combined dataset (see Table below)

<br> _**New ‘tidy’ dataset created**_

1.	Subjects, Activities and Time/Frequency domain variables were combined into a new dataset
2.	Dataset sorted by ‘Subjects’ and ‘Activities’ columns
3.	Mean value of the time and frequency domain variables were calculated over each activity for each subject
4.	Resulting in 68 variables and 180 observations

<br>

_Renamed Time and Frequency Domain Variables_

Original Column Number | Old Column Description | New Column Number | New Column Description         
---------------------- | ---------------------- | ----------------- | ----------------------
1 | tBodyAcc-mean()-X |	3 | Time.MeanBodyAcceleration.X
2 | tBodyAcc-mean()-Y | 4 | Time.MeanBodyAcceleration.Y
3 | tBodyAcc-mean()-Z | 5 | Time.MeanBodyAcceleration.Z
4 | tBodyAcc-std()-X | 6 | Time.StdDevBodyAcceleration.X
5 | tBodyAcc-std()-Y | 7 | Time.StdDevBodyAcceleration.Y
6 | tBodyAcc-std()-Z | 8 | Time.StdDevBodyAcceleration.Z
41 | tGravityAcc-mean()-X | 9 | Time.MeanGravityAcceleration.X
42 | tGravityAcc-mean()-Y | 10 | Time.MeanGravityAcceleration.Y
43 | tGravityAcc-mean()-Z | 11 | Time.MeanGravityAcceleration.Z
44 | tGravityAcc-std()-X | 12 | Time.StdDevGravityAcceleration.X
45 | tGravityAcc-std()-Y | 13 | Time.StdDevGravityAcceleration.Y
46 | tGravityAcc-std()-Z | 14 |Time.StdDevGravityAcceleration.Z
81 | tBodyAccJerk-mean()-X | 15 | Time.MeanBodyAccelerometerJerk.X
82 | tBodyAccJerk-mean()-Y | 16 | Time.MeanBodyAccelerometerJerk.Y
83 | tBodyAccJerk-mean()-Z | 17 | Time.MeanBodyAccelerometerJerk.Z
84 | tBodyAccJerk-std()-X | 18 | Time.StdDevBodyAccelerometerJerk.X
85 | tBodyAccJerk-std()-Y | 19 | Time.StdDevBodyAccelerometerJerk.Y
86 | tBodyAccJerk-std()-Z | 20 | Time.StdDevBodyAccelerometerJerk.Z
121 | tBodyGyro-mean()-X | 21 | Time.MeanBodyGyroscopicAcceleration.X
122 | tBodyGyro-mean()-Y | 22 | Time.MeanBodyGyroscopicAcceleration.Y
123 | tBodyGyro-mean()-Z | 23 | Time.MeanBodyGyroscopicAcceleration.Z
124 | tBodyGyro-std()-X | 24 | Time.StdDevBodyGyroscopicAcceleration.X
125 | tBodyGyro-std()-Y | 25 | Time.StdDevBodyGyroscopicAcceleration.Y
126 | tBodyGyro-std()-Z | 26 | Time.StdDevBodyGyroscopicAcceleration.Z
161 | tBodyGyroJerk-mean()-X | 27 | Time.MeanBodyGyroscopicJerk.X
162 | tBodyGyroJerk-mean()-Y | 28 | Time.MeanBodyGyroscopicJerk.Y
163 | tBodyGyroJerk-mean()-Z | 29 | Time.MeanBodyGyroscopicJerk.Z
164 | tBodyGyroJerk-std()-X | 30 | Time.StdDevBodyGyroscopicJerk.X
165 | tBodyGyroJerk-std()-Y | 31 | Time.StdDevBodyGyroscopicJerk.Y
166 | tBodyGyroJerk-std()-Z | 32 | Time.StdDevBodyGyroscopicJerk.Z
201 | tBodyAccMag-mean() | 33 | Time.MeanMagnitudeBodyAcceleration
202 | tBodyAccMag-std()	| 34 | Time.StdDevMagnitudeBodyAcceleration
214 | tGravityAccMag-mean() | 35 | Time.MeanMagnitudeGravityAcceleration
215 | tGravityAccMag-std() | 36 | Time.StdDevMagnitudeGravityAcceleration
227 | tBodyAccJerkMag-mean() | 37 | Time.MeanMagnitudeBodyAccelerometerJerk
228 | tBodyAccJerkMag-std() | 38 | Time.StdDevMagnitudeBodyAccelerometerJerk
240 | tBodyGyroMag-mean() | 39 | Time.MeanMagnitudeBodyGyroscopicAcceleration
241 | tBodyGyroMag-std() | 40 | Time.StdDevMagnitudeBodyGyroscopicAcceleration
253 | tBodyGyroJerkMag-mean() | 41 | Time.MeanMagnitudeBodyGyroscopicJerk
254 | tBodyGyroJerkMag-std() | 42 | Time.StdDevMagnitudeBodyGyroscopicJerk
266 | fBodyAcc-mean()-X	| 43 | Freq.MeanBodyAcceleration.X
267 | fBodyAcc-mean()-Y | 44 | Freq.MeanBodyAcceleration.Y
268 | fBodyAcc-mean()-Z	| 45 | Freq.MeanBodyAcceleration.Z
269 | fBodyAcc-std()-X | 46 | Freq.StdDevBodyAcceleration.X
270 | fBodyAcc-std()-Y | 47 | Freq.StdDevBodyAcceleration.Y
271 | fBodyAcc-std()-Z | 48 | Freq.StdDevBodyAcceleration.Z
345 | fBodyAccJerk-mean()-X | 49 | Freq.MeanBodyAccelerometerJerk.X
346 | fBodyAccJerk-mean()-Y | 50 | Freq.MeanBodyAccelerometerJerk.Y
347 | fBodyAccJerk-mean()-Z | 51 | Freq.MeanBodyAccelerometerJerk.Z
348 | fBodyAccJerk-std()-X | 52 | Freq.StdDevBodyAccelerometerJerk.X
349 | fBodyAccJerk-std()-Y | 53 | Freq.StdDevBodyAccelerometerJerk.Y
350 | fBodyAccJerk-std()-Z | 54 | Freq.StdDevBodyAccelerometerJerk.Z
424 | fBodyGyro-mean()-X | 55 | Freq.MeanBodyGyroscopicAcceleration.X
425 | fBodyGyro-mean()-Y | 56 | Freq.MeanBodyGyroscopicAcceleration.Y
426 | fBodyGyro-mean()-Z | 57 | Freq.MeanBodyGyroscopicAcceleration.Z
427 | fBodyGyro-std()-X | 58 | Freq.StdDevBodyGyroscopicAcceleration.X
428 | fBodyGyro-std()-Y	| 59 | Freq.StdDevBodyGyroscopicAcceleration.Y
429 | fBodyGyro-std()-Z	| 60 | Freq.StdDevBodyGyroscopicAcceleration.Z
503 | fBodyAccMag-mean() | 61 | Freq.MeanMagnitudeBodyAcceleration
504 | fBodyAccMag-std()	| 62 | Freq.StdDevMagnitudeBodyAcceleration
516 | fBodyBodyAccJerkMag-mean() | 63 | Freq.MeanMagnitudeBodyAccelerometerJerk
517 | fBodyBodyAccJerkMag-std() | 64 | Freq.StdDevMagnitudeBodyAccelerometerJerk
529 | fBodyBodyGyroMag-mean() | 65 | Freq.MeanMagnitudeBodyGyroscopicAcceleration
530 | fBodyBodyGyroMag-std() | 66 | Freq.StdDevMagnitudeBodyGyroscopicAcceleration
542 | fBodyBodyGyroJerkMag-mean() | 67 | Freq.MeanMagnitudeBodyGyroscopicJerk
543 | fBodyBodyGyroJerkMag-std() | 68 | Freq.StdDevMagnitudeBodyGyroscopicJerk

<br> <br>

### Codebook

<br>

Variable Name | Column Number | Variable | Explanation         
------------- | ------------- | -------- | -----------
_Subjects_ | 1 | ID assigned to the subject of the test or training groups | Ordered by subject, in ascending order, Range - 1:30
_Activities_ | 2 | Activity completed by the subject during measurement | Levels: Walking, Walking Up, Walking Down, Sitting Down, Standing Up, Laying Down
_Mean and Standard Deviation of Time and Frequency Domain Variables_ | 3-68 | Average of each variable for each activity and each subject, normalised with range (-1, 1) | Time prefix = time domain signal, Freq prefix = frequency domain signal (fast fourier transformed time domain signal)
| | 3 | Time.MeanBodyAcceleration.X | Average linear acceleration of the body over time on the phones X Axis
| | 4 | Time.MeanBodyAcceleration.Y | Average linear acceleration of the body over time on the phones Y Axis
| | 5 | Time.MeanBodyAcceleration.Z | Average linear acceleration of the body over time on the phones Z Axis
| | 6 | Time.StdDevBodyAcceleration.X | Standard Deviation of linear body acceleration over time on the phones X Axis
| | 7 | Time.StdDevBodyAcceleration.Y | Standard Deviation of linear body acceleration over time on the phones Y Axis
| | 8 | Time.StdDevBodyAcceleration.Z | Standard Deviation of linear body acceleration over time on the phones Z Axis
| | 9 | Time.MeanGravityAcceleration.X | Average linear gravitational acceleration over time on the phones X Axis
| | 10 | Time.MeanGravityAcceleration.Y | Average linear gravitational acceleration  over time on the phones Y Axis
| | 11 | Time.MeanGravityAcceleration.Z | Average linear gravitational acceleration over time on the phones Z Axis
| | 12 | Time.StdDevGravityAcceleration.X | Standard deviation of linear gravitational acceleration over time on the phones X Axis
| | 13 | Time.StdDevGravityAcceleration.Y | Standard deviation of linear gravitational acceleration over time on the phones Y Axis
| | 14 | Time.StdDevGravityAcceleration.Z | Standard deviation of linear gravitational acceleration over time on the phones Z Axis
| | 15 | Time.MeanBodyAccelerometerJerk.X | Average accelerometer jerk of the body over time on the phones X axis
| | 16 | Time.MeanBodyAccelerometerJerk.Y | Average accelerometer jerk of the body over time on the phones Y axis
| | 17 | Time.MeanBodyAccelerometerJerk.Z | Average accelerometer jerk of the body over time on the phones Z axis
| | 18 | Time.StdDevBodyAccelerometerJerk.X | Standard deviation of accelerometer jerk of the body over time on the phones X axis
| | 19 | Time.StdDevBodyAccelerometerJerk.Y | Standard deviation of accelerometer jerk of the body over time on the phones Y axis
| | 20 | Time.StdDevBodyAccelerometerJerk.Z | Standard deviation of accelerometer jerk of the body over time on the phones Z axis
| | 21 | Time.MeanBodyGyroscopicAcceleration.X | Average gyroscopic acceleration of the body over time on the phones X Axis
| | 22 | Time.MeanBodyGyroscopicAcceleration.Y | Average gyroscopic acceleration of the body over time on the phones Y Axis
| | 23 | Time.MeanBodyGyroscopicAcceleration.Z | Average gyroscopic acceleration of the body over time on the phones Z Axis
| | 24 | Time.StdDevBodyGyroscopicAcceleration.X | Standard deviation of gyroscopic acceleration of the body over time on the phones X Axis
| | 25 | Time.StdDevBodyGyroscopicAcceleration.Y | Standard deviation of gyroscopic acceleration of the body over time on the phones Y Axis
| | 26 | Time.StdDevBodyGyroscopicAcceleration.Z | Standard deviation of gyroscopic acceleration of the body over time on the phones Z Axis
| | 27 | Time.MeanBodyGyroscopicJerk.X | Average gyroscopic jerk of the body over time on the phones X axis
| | 28 | Time.MeanBodyGyroscopicJerk.Y | Average gyroscopic jerk of the body over time on the phones Y axis
| | 29 | Time.MeanBodyGyroscopicJerk.Z | Average gyroscopic jerk of the body over time on the phones Z axis
| | 30 | Time.StdDevBodyGyroscopicJerk.X | Standard deviation of gyroscopic jerk of the body over time on the phones X axis
| | 31 | Time.StdDevBodyGyroscopicJerk.Y | Standard deviation of gyroscopic jerk of the body over time on the phones Y axis
| | 32 | Time.StdDevBodyGyroscopicJerk.Z | Standard deviation of gyroscopic jerk of the body over time on the phones Z axis
| | 33 | Time.MeanMagnitudeBodyAcceleration | Average magnitude of linear acceleration of the body over time
| | 34 | Time.StdDevMagnitudeBodyAcceleration | Standard deviation of the magnitude of linear acceleration of the body over time
| | 35 | Time.MeanMagnitudeGravityAcceleration | Average magnitude of linear gravitational acceleration over time
| | 36 | Time.StdDevMagnitudeGravityAcceleration | Standard deviation of the magnitude of linear gravitational acceleration over time
| | 37 | Time.MeanMagnitudeBodyAccelerometerJerk | Average magnitude of accelerometer jerk of the body over time
| | 38 | Time.StdDevMagnitudeBodyAccelerometerJerk | Standard deviation of the magnitude of accelerometer jerk of the body over time
| | 39 | Time.MeanMagnitudeBodyGyroscopicAcceleration | Average magnitude of gyroscopic acceleration of the body over time
| | 40 | Time.StdDevMagnitudeBodyGyroscopicAcceleration | Standard deviation of the magnitude of gyroscopic acceleration of the body over time
| | 41 | Time.MeanMagnitudeBodyGyroscopicJerk | Average magnitude of gyroscopic jerk of the body over time
| | 42 | Time.StdDevMagnitudeBodyGyroscopicJerk | Standard deviation of the magnitude of gyroscopic jerk of the body over time
| | 43 | Freq.MeanBodyAcceleration.X | Fast Fourier Transformed (FFT) average linear acceleration of the body over time on the phones X Axis
| | 44 | Freq.MeanBodyAcceleration.Y | Fast Fourier Transformed (FFT) average linear acceleration of the body over time on the phones Y Axis
| | 45 | Freq.MeanBodyAcceleration.Z | Fast Fourier Transformed (FFT) average linear acceleration of the body over time on the phones Z Axis
| | 46 | Freq.StdDevBodyAcceleration.X | Fast Fourier Transformed (FFT) standard deviation of linear acceleration of the body over time on the phones X Axis
| | 47 | Freq.StdDevBodyAcceleration.Y | Fast Fourier Transformed (FFT) standard deviation of linear acceleration of the body over time on the phones Y Axis
| | 48 | Freq.StdDevBodyAcceleration.Z | Fast Fourier Transformed (FFT) standard deviation of linear acceleration of the body over time on the phones Z Axis
| | 49 | Freq.MeanBodyAccelerometerJerk.X | Fast Fourier Transformed (FFT) average accelerometer jerk of the body over time on the phones X axis
| | 50 | Freq.MeanBodyAccelerometerJerk.Y | Fast Fourier Transformed (FFT) average accelerometer jerk of the body over time on the phones Y axis
| | 51 | Freq.MeanBodyAccelerometerJerk.Z | Fast Fourier Transformed (FFT) average accelerometer jerk of the body over time on the phones Z axis
| | 52 | Freq.StdDevBodyAccelerometerJerk.X | Fast Fourier Transformed (FFT) standard deviation of accelerometer jerk of the body over time on the phones X axis
| | 53 | Freq.StdDevBodyAccelerometerJerk.Y | Fast Fourier Transformed (FFT) standard deviation of accelerometer jerk of the body over time on the phones Y axis
| | 54 | Freq.StdDevBodyAccelerometerJerk.Z | Fast Fourier Transformed (FFT) standard deviation of accelerometer jerk of the body over time on the phones Z axis 
| | 55 | Freq.MeanBodyGyroscopicAcceleration.X | Fast Fourier Transformed (FFT) average gyroscopic acceleration of the body over time on the phones X Axis
| | 56 | Freq.MeanBodyGyroscopicAcceleration.Y | Fast Fourier Transformed (FFT) average gyroscopic acceleration of the body over time on the phones Y Axis
| | 57 | Freq.MeanBodyGyroscopicAcceleration.Z | Fast Fourier Transformed (FFT) average gyroscopic acceleration of the body over time on the phones Z Axis
| | 58 | Freq.StdDevBodyGyroscopicAcceleration.X | Fast Fourier Transformed (FFT) standard deviation of gyroscopic acceleration of the body over time on the phones X Axis
| | 59 | Freq.StdDevBodyGyroscopicAcceleration.Y | Fast Fourier Transformed (FFT) standard deviation of gyroscopic acceleration of the body over time on the phones Y Axis
| | 60 | Freq.StdDevBodyGyroscopicAcceleration.Z | Fast Fourier Transformed (FFT) standard deviation of gyroscopic acceleration of the body over time on the phones Z Axis
| | 61 | Freq.MeanMagnitudeBodyAcceleration | Fast Fourier Transformed (FFT) average magnitude of linear acceleration of the body over time
| | 62 | Freq.StdDevMagnitudeBodyAcceleration | Fast Fourier Transformed (FFT) standard deviation of the magnitude of linear acceleration of the body over time 
| | 63 | Freq.MeanMagnitudeBodyAccelerometerJerk | Fast Fourier Transformed (FFT) average magnitude of accelerometer jerk of the body over time
| | 64 | Freq.StdDevMagnitudeBodyAccelerometerJerk | Fast Fourier Transformed (FFT) standard deviation of the magnitude of accelerometer jerk of the body over time
| | 65 | Freq.MeanMagnitudeBodyGyroscopicAcceleration | Fast Fourier Transformed (FFT) average magnitude of gyroscopic acceleration of the body over time
| | 66 | Freq.StdDevMagnitudeBodyGyroscopicAcceleration | Fast Fourier Transformed (FFT) standard deviation of the magnitude of gyroscopic acceleration of the body over time
| | 67 | Freq.MeanMagnitudeBodyGyroscopicJerk | Fast Fourier Transformed (FFT) average magnitude of gyroscopic jerk of the body over time
| | 68 | Freq.StdDevMagnitudeBodyGyroscopicJerk | Fast Fourier Transformed (FFT) standard deviation of the magnitude of gyroscopic jerk of the body over time
