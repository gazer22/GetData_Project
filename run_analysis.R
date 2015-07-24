## run_analysis.R : main script for class project
#
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.



## Goal = table with columns: subject, activity, features...

library(dplyr)

## Load descriptive data for use as factors and labels
setwd("UCI HAR Dataset")
act_table <- read.table("activity_labels.txt", stringsAsFactors = FALSE, 
                         col.names = c("index","activity"))
feat_table <- read.table("features.txt", stringsAsFactors = FALSE,
                         col.names = c("index", "feature"))

# pull activities and features out of the tables into their own variables
activities <- act_table$activity
features   <- feat_table$feature

# remove (), ., and - from feature names as dplyr chokes on them
features <- gsub("()", "", features, fixed=TRUE)
features <- gsub("(", "-", features, fixed=TRUE)
features <- gsub(")", "-", features, fixed=TRUE)
features <- gsub("-", "_", features, fixed=TRUE)
features <- gsub(",", "_", features, fixed=TRUE)

# read in data from 'train' subfolder
setwd("train")
subject_train <- read.table("subject_train.txt", col.names = c("Subject"))
X_train <- read.table("X_train.txt", col.names = features)
Y_train <- read.table("y_train.txt")

# read in data from 'test' subfolder
setwd("../test")
subject_test <- read.table("subject_test.txt", col.names = c("Subject"))
X_test <- read.table("X_test.txt", col.names = features)
Y_test <- read.table("y_test.txt")

## set working directory back to the project base
setwd("../..")

# combine test & train data
subjects <- rbind(subject_train, subject_test)
X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)

# convert Y_data to activities
act_data <- data.frame( Activity = factor(Y_data$V1, levels=1:6, labels=activities))

## Collect into tidy data table : pulling just the means and stds from X-data
HAR_data <- cbind(subjects, act_data, select(X_data,
                                             tBodyAcc_mean_X,
                                             tBodyAcc_mean_Y,
                                             tBodyAcc_mean_Z,
                                             tBodyAcc_std_X,
                                             tBodyAcc_std_Y,
                                             tBodyAcc_std_Z,
                                             tGravityAcc_mean_X,
                                             tGravityAcc_mean_Y,
                                             tGravityAcc_mean_Z,
                                             tGravityAcc_std_X,
                                             tGravityAcc_std_Y,
                                             tGravityAcc_std_Z,
                                             tBodyAccJerk_mean_X,
                                             tBodyAccJerk_mean_Y,
                                             tBodyAccJerk_mean_Z,
                                             tBodyAccJerk_std_X,
                                             tBodyAccJerk_std_Y,
                                             tBodyAccJerk_std_Z,
                                             tBodyGyro_mean_X,
                                             tBodyGyro_mean_Y,
                                             tBodyGyro_mean_Z,
                                             tBodyGyro_std_X,
                                             tBodyGyro_std_Y,
                                             tBodyGyro_std_Z,
                                             tBodyGyroJerk_mean_X,
                                             tBodyGyroJerk_mean_Y,
                                             tBodyGyroJerk_mean_Z,
                                             tBodyGyroJerk_std_X,
                                             tBodyGyroJerk_std_Y,
                                             tBodyGyroJerk_std_Z,
                                             tBodyAccMag_mean,
                                             tBodyAccMag_std,
                                             tGravityAccMag_mean,
                                             tGravityAccMag_std,
                                             tBodyAccJerkMag_mean,
                                             tBodyAccJerkMag_std,
                                             tBodyGyroMag_mean,
                                             tBodyGyroMag_std,
                                             tBodyGyroJerkMag_mean,
                                             tBodyGyroJerkMag_std,
                                             fBodyAcc_mean_X,
                                             fBodyAcc_mean_Y,
                                             fBodyAcc_mean_Z,
                                             fBodyAcc_std_X,
                                             fBodyAcc_std_Y,
                                             fBodyAcc_std_Z,
                                             fBodyAccJerk_mean_X,
                                             fBodyAccJerk_mean_Y,
                                             fBodyAccJerk_mean_Z,
                                             fBodyAccJerk_std_X,
                                             fBodyAccJerk_std_Y,
                                             fBodyAccJerk_std_Z,
                                             fBodyGyro_mean_X,
                                             fBodyGyro_mean_Y,
                                             fBodyGyro_mean_Z,
                                             fBodyGyro_std_X,
                                             fBodyGyro_std_Y,
                                             fBodyGyro_std_Z,
                                             fBodyAccMag_mean,
                                             fBodyAccMag_std,
                                             fBodyBodyAccJerkMag_mean,
                                             fBodyBodyAccJerkMag_std,
                                             fBodyBodyGyroMag_mean,
                                             fBodyBodyGyroMag_std,
                                             fBodyBodyGyroJerkMag_mean,
                                             fBodyBodyGyroJerkMag_std))

## compute mean of each mean, grouped by activity and subject
### pull mean data out of the HAR_data
HAR_data_small <- select(HAR_data,
                         Subject,
                         Activity,
                         tBodyAcc_mean_X,
                         tBodyAcc_mean_Y,
                         tBodyAcc_mean_Z,
                         tGravityAcc_mean_X,
                         tGravityAcc_mean_Y,
                         tGravityAcc_mean_Z,
                         tBodyAccJerk_mean_X,
                         tBodyAccJerk_mean_Y,
                         tBodyAccJerk_mean_Z,
                         tBodyGyro_mean_X,
                         tBodyGyro_mean_Y,
                         tBodyGyro_mean_Z,
                         tBodyGyroJerk_mean_X,
                         tBodyGyroJerk_mean_Y,
                         tBodyGyroJerk_mean_Z,
                         tBodyAccMag_mean,
                         tGravityAccMag_mean,
                         tBodyAccJerkMag_mean,
                         tBodyGyroMag_mean,
                         tBodyGyroJerkMag_mean,
                         fBodyAcc_mean_X,
                         fBodyAcc_mean_Y,
                         fBodyAcc_mean_Z,
                         fBodyAccJerk_mean_X,
                         fBodyAccJerk_mean_Y,
                         fBodyAccJerk_mean_Z,
                         fBodyGyro_mean_X,
                         fBodyGyro_mean_Y,
                         fBodyGyro_mean_Z,
                         fBodyAccMag_mean,
                         fBodyBodyAccJerkMag_mean,
                         fBodyBodyGyroMag_mean,
                         fBodyBodyGyroJerkMag_mean)

### aggregate by subject & activity
avg_by_subject_activity <- aggregate(. ~ Subject + Activity,
                                     data=HAR_data_small, mean)

## output the avg_by_subject_activity table
write.table(avg_by_subject_activity, file="avg_by_subject_activity.txt",
            row.names = FALSE)
