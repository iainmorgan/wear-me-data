# This script gets and cleans the following dataset, so that it can be used in analysis
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

setwd("~/Data science/Getting data")

## Merge the two data sets

#Read the training set
training_data <- read.fwf("./UCI HAR data/train/X_train.txt", widths = rep(16,561))

# Read the test set
test_data <- read.fwf("./UCI HAR data/test/X_test.txt", widths = rep(16,561))

# Merge the two data sets
whole_data <- rbind(training_data, test_data)


## Extract the columns containing mean and std dev on each measurement

# Read features list from file
features_list <- read.table("./UCI HAR data/features.txt")

# Identify mean and std deviation variables
keep_cols <- grep("mean|std", features_list$V2)

# Eliminate all other variables
whole_data <- whole_data[,keep_cols]


## Rename activities using descriptive names

#Read the train and test and activity names
train_names <- read.table("./UCI HAR data/train/y_train.txt")
test_names <- read.table("./UCI HAR data/test/y_test.txt")
activity_names <- read.table("./UCI HAR data/activity_labels.txt")

# Merge the train and test name lists
whole_names <- rbind(train_names,test_names)

# Map the activity names onto the records
whole_names$V2 <- activity_names[whole_names$V1,2]

# Merge the descriptive names into the main data set 
whole_data$name <- whole_names$V2


## Relabel the data set with descriptive variable names

# Relabel the main data set variables with the descriptive names from the activity set
names(whole_data) <- c(as.character(features_list$V2[keep_cols]),"activityName")

## Create separate tidy data set with average of each variable and each subject

# Read the subject data from the train and test files and merge
train_subjects <- read.table("./UCI HAR data/train/subject_train.txt")
test_subjects <- read.table("./UCI HAR data/test/subject_test.txt")
whole_subjects <- rbind(train_subjects,test_subjects)

# Merge subject ID with the main data set
whole_data$subject <- whole_subjects$V1

# Convert to a dplyr-compatible data table
df <- tbl_df(whole_data)

# Summarise data using dyplr to group and summarise
new_data <- df %>% group_by(.dots=c("activityName","subject")) %>% summarise_all(funs(mean))

# Convert back to a data frame
new_data <- as.data.frame(new_data)

# Write output to file
write.table(new_data, "Summarised_records.txt", row.names = FALSE)

