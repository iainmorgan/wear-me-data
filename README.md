# wear-me-data
Wearable computing data cleaned up for further analysis

This repository contains scripts and data files that clean up and summarise a data set of wearable device data for further analysis.

The source data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
More background info is available is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The Code Books for this original data set havebeen included in the repository
The data files are not included due to size

The following script is included:

run_analysis.R			This script loads, transforms and saves the two below data files, as per the instructions for this passignment. The details of the transformations are contained in the code book.

The following data files are included:

combined_records.csv	This data file contains the combined data sets from the test and train data files, with a subset of columns. The transformations used to arrive at this set are included in the code book below and the comments of the script.
summarised_records.csv	This data file contains a summarised version of the combined_records file, with an average value of each variable for each combination of subject and activity type

The following code book is included:

CodeBook.md				This code book describes the two above data sets and outlines the transformations applied in the above script.
