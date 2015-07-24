# Getting and Cleaning Data Course Project
## July 23, 2015

## Requirements
* dplyr package is required
* script assumes unzipped HAR dataset is located in working directory (available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Script Overview
* The script first reads in descriptive files from the HAR Dataset to identify the activities (e.g., WALKING) and features/measurements (e.g., tBodyAcc_mean_X)
* Then, it reads in the data from the test and train sub-directories (but nothing from the "Inertial Signals" sub-directories
* The data is combined into a data frame with Subject and Activity columns followed by features measured for each (see CODEBOOK.md for description of which measurements are selected)
* Finally, a 'mean of means' is taken, aggregating by subject and activity.  This results in an average of reported means for each subject in each activity (e.g., there is one row for Subject #1 in the WALKING activity

## Output
The mean of means table is saved in the "avg_by_subject_activity.txt" file


