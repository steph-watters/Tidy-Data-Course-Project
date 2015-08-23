## 1. Merges training and test datasets to create one data set

## Reads in the test and training data sets
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test_data <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train_data <- read.table("./UCI HAR Dataset/train/Y_train.txt")

## Combines subject files to create one variable labelled "Subjects"
subjects_data <- rbind(subjects_test, subjects_train)
colnames(subjects_data) <- "Subjects"

## Combine activity files to create one variable labelled "Activities"
activities_data <- rbind(Y_test_data, Y_train_data)
colnames(activities_data) <- "Activities"

## Combines the features files to form separate columns and label them from the
## features.txt file
features_data <- rbind(X_test_data, X_train_data)
features_labels <- read.table("./UCI HAR Dataset/features.txt")
colnames(features_data) <- features_labels$V2

## Combines the subjects, activities and features datasets
combined_dataset <- cbind(subjects_data, activities_data, features_data)


## 2. Extracts only measurements containing mean() and stdev() from 
## the combined dataset

## Extracts column numbers for mean and std
means_only <- grep("mean\\(\\)", colnames(combined_dataset))
std_only <- grep("std\\(\\)", colnames(combined_dataset))

## Selects all columns of interest for the final dataset
total_columns <- c(1, 2, means_only, std_only)

## Reorders the columns to match the order of the original dataset
sort_columns <- sort(total_columns)

## Subsets combined_dataset by only the columns of interest
tidydata_columns <- combined_dataset[sort_columns]


## 3. Applies descriptive names to activities in the dataset

## Changes characters in "Activities" to be more descriptive names, these make
## it easier to understand what activity was happening during measurement
tidydata_columns$Activities[tidydata_columns$Activities %in% "1"] <- "Walking"
tidydata_columns$Activities[tidydata_columns$Activities %in% "2"] <- "Walking Up"
tidydata_columns$Activities[tidydata_columns$Activities %in% "3"] <- "Walking Down"
tidydata_columns$Activities[tidydata_columns$Activities %in% "4"] <- "Sitting Down"
tidydata_columns$Activities[tidydata_columns$Activities %in% "5"] <- "Standing Up"
tidydata_columns$Activities[tidydata_columns$Activities %in% "6"] <- "Laying Down"
tidydata_columns$Activities = factor(tidydata_columns$Activities, levels = 
                                             c("Walking", "Walking Up", 
                                               "Walking Down", "Sitting Down", 
                                               "Standing Up", "Laying Down"), 
                                     ordered = TRUE)


## 4. Changes labels on 'features' columns

## Loads dplyr package to allow easier renaming
library(dplyr)

## Changes column names to their longform version, making it easier to 
## understand what was being measured by each variable
tidydata_renamed <- dplyr::rename(tidydata_columns, 
                                  Time.MeanBodyAcceleration.X = 
                                          `tBodyAcc-mean()-X`, 
                                  Time.MeanBodyAcceleration.Y = 
                                          `tBodyAcc-mean()-Y`, 
                                  Time.MeanBodyAcceleration.Z = 
                                          `tBodyAcc-mean()-Z`, 
                                  Time.StdDevBodyAcceleration.X =
                                          `tBodyAcc-std()-X`,
                                  Time.StdDevBodyAcceleration.Y =
                                          `tBodyAcc-std()-Y`,
                                  Time.StdDevBodyAcceleration.Z = 
                                          `tBodyAcc-std()-Z`,
                                  Time.MeanGravityAcceleration.X =
                                          `tGravityAcc-mean()-X`,
                                  Time.MeanGravityAcceleration.Y = 
                                          `tGravityAcc-mean()-Y`,
                                  Time.MeanGravityAcceleration.Z = 
                                          `tGravityAcc-mean()-Z`,
                                  Time.StdDevGravityAcceleration.X = 
                                          `tGravityAcc-std()-X`,
                                  Time.StdDevGravityAcceleration.Y = 
                                          `tGravityAcc-std()-Y`,
                                  Time.StdDevGravityAcceleration.Z = 
                                          `tGravityAcc-std()-Z`,
                                  Time.MeanBodyAccelerometerJerk.X = 
                                          `tBodyAccJerk-mean()-X`,
                                  Time.MeanBodyAccelerometerJerk.Y =
                                          `tBodyAccJerk-mean()-Y`,
                                  Time.MeanBodyAccelerometerJerk.Z = 
                                          `tBodyAccJerk-mean()-Z`,
                                  Time.StdDevBodyAccelerometerJerk.X = 
                                          `tBodyAccJerk-std()-X`,
                                  Time.StdDevBodyAccelerometerJerk.Y =
                                          `tBodyAccJerk-std()-Y`,
                                  Time.StdDevBodyAccelerometerJerk.Z =
                                          `tBodyAccJerk-std()-Z`,
                                  Time.MeanBodyGyroscopicAcceleration.X =
                                          `tBodyGyro-mean()-X`,
                                  Time.MeanBodyGyroscopicAcceleration.Y =
                                          `tBodyGyro-mean()-Y`,
                                  Time.MeanBodyGyroscopicAcceleration.Z =
                                          `tBodyGyro-mean()-Z`,
                                  Time.StdDevBodyGyroscopicAcceleration.X =
                                          `tBodyGyro-std()-X`,
                                  Time.StdDevBodyGyroscopicAcceleration.Y =
                                          `tBodyGyro-std()-Y`,
                                  Time.StdDevBodyGyroscopicAcceleration.Z =
                                          `tBodyGyro-std()-Z`,
                                  Time.MeanBodyGyroscopicJerk.X =
                                          `tBodyGyroJerk-mean()-X`,
                                  Time.MeanBodyGyroscopicJerk.Y =
                                          `tBodyGyroJerk-mean()-Y`,
                                  Time.MeanBodyGyroscopicJerk.Z =
                                          `tBodyGyroJerk-mean()-Z`,
                                  Time.StdDevBodyGyroscopicJerk.X =
                                          `tBodyGyroJerk-std()-X`,
                                  Time.StdDevBodyGyroscopicJerk.Y =
                                          `tBodyGyroJerk-std()-Y`,
                                  Time.StdDevBodyGyroscopicJerk.Z =
                                          `tBodyGyroJerk-std()-Z`,
                                  Time.MeanMagnitudeBodyAcceleration =
                                          `tBodyAccMag-mean()`,
                                  Time.StdDevMagnitudeBodyAcceleration =
                                          `tBodyAccMag-std()`,
                                  Time.MeanMagnitudeGravityAcceleration =
                                          `tGravityAccMag-mean()`,
                                  Time.StdDevMagnitudeGravityAcceleration =
                                          `tGravityAccMag-std()`,
                                  Time.MeanMagnitudeBodyAccelerometerJerk =
                                          `tBodyAccJerkMag-mean()`,
                                  Time.StdDevMagnitudeBodyAccelerometerJerk =
                                          `tBodyAccJerkMag-std()`,
                                  Time.MeanMagnitudeBodyGyroscopicAcceleration =
                                          `tBodyGyroMag-mean()`,
                                  Time.StdDevMagnitudeBodyGyroscopicAcceleration 
                                  =`tBodyGyroMag-std()`,
                                  Time.MeanMagnitudeBodyGyroscopicJerk =
                                          `tBodyGyroJerkMag-mean()`,
                                  Time.StdDevMagnitudeBodyGyroscopicJerk =
                                          `tBodyGyroJerkMag-std()`,
                                  Freq.MeanBodyAcceleration.X =
                                          `fBodyAcc-mean()-X`,
                                  Freq.MeanBodyAcceleration.Y = 
                                          `fBodyAcc-mean()-Y`,
                                  Freq.MeanBodyAcceleration.Z =
                                          `fBodyAcc-mean()-Z`,
                                  Freq.StdDevBodyAcceleration.X =
                                          `fBodyAcc-std()-X`,
                                  Freq.StdDevBodyAcceleration.Y =
                                          `fBodyAcc-std()-Y`,
                                  Freq.StdDevBodyAcceleration.Z =
                                          `fBodyAcc-std()-Z`,
                                  Freq.MeanBodyAccelerometerJerk.X =
                                          `fBodyAccJerk-mean()-X`,
                                  Freq.MeanBodyAccelerometerJerk.Y =
                                          `fBodyAccJerk-mean()-Y`,
                                  Freq.MeanBodyAccelerometerJerk.Z =
                                          `fBodyAccJerk-mean()-Z`,
                                  Freq.StdDevBodyAccelerometerJerk.X =
                                          `fBodyAccJerk-std()-X`,
                                  Freq.StdDevBodyAccelerometerJerk.Y =
                                          `fBodyAccJerk-std()-Y`,
                                  Freq.StdDevBodyAccelerometerJerk.Z =
                                          `fBodyAccJerk-std()-Z`,
                                  Freq.MeanBodyGyroscopicAcceleration.X =
                                          `fBodyGyro-mean()-X`,
                                  Freq.MeanBodyGyroscopicAcceleration.Y =
                                          `fBodyGyro-mean()-Y`,
                                  Freq.MeanBodyGyroscopicAcceleration.Z =
                                          `fBodyGyro-mean()-Z`,
                                  Freq.StdDevBodyGyroscopicAcceleration.X =
                                          `fBodyGyro-std()-X`,
                                  Freq.StdDevBodyGyroscopicAcceleration.Y =
                                          `fBodyGyro-std()-Y`,
                                  Freq.StdDevBodyGyroscopicAcceleration.Z =
                                          `fBodyGyro-std()-Z`,
                                  Freq.MeanMagnitudeBodyAcceleration =
                                          `fBodyAccMag-mean()`,
                                  Freq.StdDevMagnitudeBodyAcceleration =
                                          `fBodyAccMag-std()`,
                                  Freq.MeanMagnitudeBodyAccelerometerJerk =
                                          `fBodyBodyAccJerkMag-mean()`,
                                  Freq.StdDevMagnitudeBodyAccelerometerJerk =
                                          `fBodyBodyAccJerkMag-std()`,
                                  Freq.MeanMagnitudeBodyGyroscopicAcceleration =
                                          `fBodyBodyGyroMag-mean()`,
                                  Freq.StdDevMagnitudeBodyGyroscopicAcceleration
                                  = `fBodyBodyGyroMag-std()`,
                                  Freq.MeanMagnitudeBodyGyroscopicJerk =
                                          `fBodyBodyGyroJerkMag-mean()`,
                                  Freq.StdDevMagnitudeBodyGyroscopicJerk =
                                          `fBodyBodyGyroJerkMag-std()`
)


## 5. Creates new dataset that averages each variable for each activity and 
## subject
order_dataset <- group_by(tidydata_renamed, Subjects, Activities)
tidy_dataset <- summarise_each(order_dataset, funs(mean))
tidy_datset