## Background
This sample is based on Human Activity Recognition Using Smartphones Dataset, 
Version 1.0 available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From their README:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Raw data 
(based on original data):

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Feature Selection (from original data description)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


## Processed data
Each measurement (aka 'feature') is normalized and bounded within [-1,1], therefore no units are given

For the large table (HAR_data), features were selected with _mean and _std designations.  All other notations, including meanFreq, kurtosis, and others were not selected.  All angles were also left out of the selection as they appear to be computed from the other measures.

For the smaller data table from which the aggregation is made, only _mean features are used, as an average of a standard deviation doesn't make much sense.

Activities are converted to a factor.

Feature names are stripped of parentheses, dashes, and dots for better use as column names.


All units remain normalized and bounded within [-1,1].

### Summarized variables
Variable/Feature | Description | Units
---------------- | ------------- | ---------
tBodyAcc_mean_X | mean X body acceleration 
                         tBodyAcc_mean_Y | mean body Y acceleration | normalized
                         tBodyAcc_mean_Z | mean body Z acceleration | normalized
                         tGravityAcc_mean_X | mean gravity X acceleration | normalized
                         tGravityAcc_mean_Y | mean gravity Y acceleration | normalized
                         tGravityAcc_mean_Z | mean gravity Z acceleration | normalized
                         tBodyAccJerk_mean_X | mean body X jerk | normalized
                         tBodyAccJerk_mean_Y | mean body Y jerk | normalized
                         tBodyAccJerk_mean_Z | mean body Z jerk | normalized
                         tBodyGyro_mean_X | mean body angular acceleration-X | normalized
                         tBodyGyro_mean_Y | mean body angular acceleration-Y | normalized
                         tBodyGyro_mean_Z | mean body angular acceleration-Z | normalized
                         tBodyGyroJerk_mean_X | mean body angular jerk - X | normalized
                         tBodyGyroJerk_mean_Y | mean body angular jerk - Y | normalized
                         tBodyGyroJerk_mean_Z | mean body angular jerk - Z | normalized
                         tBodyAccMag_mean | mean body acceleration magnitude | normalized
                         tGravityAccMag_mean | mean gravity acceleration magnitude | normalized
                         tBodyAccJerkMag_mean | mean body jerk magnitude | normalized
                         tBodyGyroMag_mean | mean body angular acceleration magnitude | normalized
                         tBodyGyroJerkMag_mean | mean body angular jerk magnitude | normalized
                         fBodyAcc_mean_X | mean FFT of body x-accel | normalized
                         fBodyAcc_mean_Y | mean FFT of body y-accel | normalized
                         fBodyAcc_mean_Z | mean FFT of body z-accel | normalized
                         fBodyAccJerk_mean_X | mean FFT of body x jerk | normalized
                         fBodyAccJerk_mean_Y | mean FFT of body y jerk | normalized
                         fBodyAccJerk_mean_Z | mean FFT of body z jerk | normalized
                         fBodyGyro_mean_X | mean FFT of body x angular accel | normalized
                         fBodyGyro_mean_Y | mean FFT of body y angular accel | normalized
                         fBodyGyro_mean_Z | mean FFT of body z angular accel | normalized
                         fBodyAccMag_mean | mean FFT of body accel magnitude | normalized
                         fBodyBodyAccJerkMag_mean | mean FFT of body jerk magnitude | normalized
                         fBodyBodyGyroMag_mean | mean FFT of body angular accel magnitude | normalized
                         fBodyBodyGyroJerkMag_mean | mean FFT of body angular jerk | normalized magnitude 



## Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

