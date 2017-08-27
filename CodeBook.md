Code Book for wear-me-data repository
=====================================

This code book describes the source data and transformations that have been done to produce the two data files in this repository

The source data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
More background info is available is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The Code Books for this original data set havebeen included in the repository
The data files are not included due to size

Combined Records
================

This database produces a subset of the original source data, prepared using the following steps:

1 - Training and test records were read from the X_train.txt and X_test.txt files
2 - A subset of variables was selected, including all "mean" and "std deviation" variables, and the rest of the variables were discarded
3 - The activity type IDs were read from the y_train.txt and y_test.txt files and merged with the combined data set using their rowID
4 - Descriptive activity types for each record were read from the activity_labels.txt file and merged with the combined records, using their activity type IDs
5 - Descriptive variable labels were read from the features.txt file and used to relabel the variables
6 - The resulting data set was stored in csv format in combined_records.txt

The file contains 10299 records.

The following variables are included in the file, with the first 79 as per the source file code book.

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
activityName					Descriptive name for the activity corresponding to the record
subject							ID of the subject (1-30)

Summarised Records
==================

This database contains a summary of the data set contained in combined_records.txt

The dataset has been prepared using the following steps:
- Combined records read from the combined_records.txt file
- Subject IDs for the test and train data sets read from the subject_train.txt files and combined
- Subject IDs merged with the combined records data set using the rowID
- Summarised data set created containing the average of each variable for each combination of subject ID and activity name
- Resulting data table saved in the summarised_records.txt file in csv format

The database contains 180 records, made up of 30 subjects and 6 activity types

The 81 variables are:

activityName	descriptive name of the activity for the record
subject		ID of the subject that performed the activity for the record
... 		Mean values of the variables (descriptions as per source data) in the combined_records.txt database, for each combination of activityName and subject
