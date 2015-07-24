## Background
This sample is based on Human Activity Recognition Using Smartphones Dataset, 
Version 1.0 available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From their README:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Raw data 
(based on original data):

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Processed data
Each measurement (aka 'feature') is normalized and bounded within [-1,1], therefore no units are given

For the large table (HAR_data), features were selected with _mean and _std designations.  All other notations, including meanFreq, kurtosis, and others were not selected.  All angles were also left out of the selection as they appear to be computed from the other measures.

For the smaller data table from which the aggregation is made, only _mean features are used, as an average of a standard deviation doesn't make much sense.

Activities are converted to a factor.

Feature names are stripped of parentheses, dashes, and dots for better use as column names.


All units remain normalized and bounded within [-1,1].



## Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

