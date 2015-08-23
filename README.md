# Tidy Data Course Project

### _README for run_analysis.R Script_

***
**Datasets from:**<br>
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
<br> This document describes the steps through which the run_analysis.R script transforms the training and test data components of the ‘Human Activity Recognition Using Smartphones Dataset’ into a tidy dataset that meets the requirements of the Coursera Getting and Cleaning Data Course Project. This R script does not use data from the ‘Inertial Signals’ files.<br>

To use the run_analysis.R script, the ‘UCI HAR Dataset’ folder must be downloaded into the working directory of R. This dataset can be downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br>

The dplyr package for R must also be downloaded. This can be accessed from the CRAN website: https://cran.r-project.org/ <br><br>

###Step 1.  Merge the training and test datasets to create one dataset

<br> Datasets of interest were read into R using the read.table() command. These datasets were then combined systematically. Test datasets were always the first argument passed to the rbind() commands so that the order of data would be preserved in the combined datasets.

<br> 

#####Datasets were combined as follows:

* _Subjects_
    * Test and train datasets were combined using rbind()
    * The column was labelled “Subjects” 
    
* _Activities_
    * Test and train datasets were combined using rbind()
    * The column was labelled “Activities”
    
* _Features_
    * Test and train datasets were combined using rbind()
    * The labels for these columns were taken from the features.txt file from the UCI HAR Dataset
    
* _Combined Dataset_
    * Subjects, Activities and Features datasets were combined using cbind()
    * Combined in that order to create a full dataset where each variable forms a column (as per Wickham’s principles of tidy data, 2014)
<br> <br>

###Step 2. Extract only measurements on the mean and standard deviation from the combined dataset 

<br> Measurements of the mean and standard deviation for time and frequency signals from the combined dataset were extracted from the dataset. Variables that were weighted averages of measurements were excluded, as these are not pure calculations of measurement mean.

<br> 

#####Processed as follows:

* _grep() used_
    * Means extracted by partially matching mean() in the columns of the combined dataset
    * Standard deviations extracted by partially matching std() in the columns of the combined dataset
* _New variable created to store columns of interest_
    * ‘Subjects’
    * ‘Activities’
    * The mean and standard deviation columns
* A new dataset was created by subsetting the combined dataset by the columns of interest <br> <br>


###Step 3. Uses descriptive activity names to name the activities in the dataset

<br> To make the dataset easier to understand, the activity labels of 1-6 were replaced with descriptive labels. The labels chosen were informed by watching a video of the experiment in which a subject completed the six recorded activities (accessed from https://www.youtube.com/watch?v=XOEN9W05_4A).

<br> 

##### The labels were substituted as follows:

1.	Walking
2.	Walking Up
3.	Walking Down
4.	Sitting Down
5.	Standing Up
6.	Laying Down

<br> The “Activities” column was then transformed into a factor variable. This was done to set the levels of the “Activities” as per the original dataset and the order specified above, not in the otherwise default alphabetical order. <br> <br>


###Step 4. Appropriately labels the dataset with descriptive variable names

<br> The features columns were renamed to a more descriptive form in this step. This complies with Wickham’s (2014) tidy data principle of easily understand variable names as column names. 

<br> 

#####This was completed as follows:

* _The dplyr package was loaded_
    * Used because it is easily used for data manipulation, an essential component of tidying data (Wickham, 2014)
* _Renaming_
    * Using rename() function of dplyr
    * Renamed using the long form versions of the column names - making them easier to read (Leek, lecture notes ‘Getting and Cleaning Data – Week 1’)
    * Organised by: time/frequency signal, mean/stddev and variable being measured
    * Organisation maintained the original grouping of data <br> <br>


###Step 5. From the dataset in step 4, create a second, independent tidy dataset with the average of each variable for each activity and each subject.

<br> The final dataset created is ‘tidy_dataset’ which follows the principles of tidy data as per Wickham (2014).

<br> 

#####To create this final dataset, the following steps were taken:

* _group_by() function used_
    * Allowed grouping by “Subjects” and “Activities” columns
    * Reordered the dataset so “Subjects” would appear in ascending order
    * Each activity grouped by level per subject 
* _summarise_each() function used_
    * Applied to the output of the group_by() function
    * Applied over each activity per subject to get a mean for all measurements
    * Output stored in a variable ‘tidy_dataset’

<br> The output, ‘tidy_dataset’, is considered tidy as it is in a wide form, in which each observation forms a row, each variable is in its own column, and column names are easily readable  (Wickham, 2014). <br> <br> <br>


***

_**References:**_ <br>
Leek, J. T. Lecture notes - Week 1. _Coursera: Getting and Cleaning Data._ <br>
Wickham, H. (2014). Tidy Data. _Journal of Statistical Software, 59_ (10), 1-23.

***