---
title: "CodeBook.md"
author: "Chad Young"
date: "March 21, 2015"
output: html_document
---

The

## Introduction

## Experimental Design and Background
The dataset was taken from accelerometer and gyroscope data of a smartphone attached to a group of 30 volunteers while performing six activities for the purpose of predicting activity based on these measurements. The original dataset was broken into a training set of 70% of the subjects, and a test set with the remaining 30 subjects. 

Accelerometer and Gyroscope measurements were made at 50 Hz sample rate in each of three axes. Further features were derived from the raw data based on filtered versions of the raw data, frequency components, velocity, etc. 

More detailed information is contained in the raw dataset "UCI HAR Dataset" README.txt and features_info.txt files

## Raw Data
Each record contains the triaxial acceleration, triaxial angular velocity, 561 more features derived from the raw sensor readings, an activity label based on visual observation of the subject's activity, and the subject identifier number.

The dataset includes the following files:
Information taken directly from "README.txt" with the raw dataset (Jorge Reyes, et al)

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## Processed Data

The "run-analysis.R" script does the following:

- Loads X_train and X_test datasets, the subject for each observation, and the labeled activity associated with each observation merged into a single dataframe "dataAll"
- creates a subset of the full data containing only features with "mean" or "std" in the name, plus the subject number and activity label
- creates an "activity" feature using a text description of the activity number
- outputs the resulting subset in ASCII format with space delimeter
- computes a summary using the mean value of each activity for each user over all features
- outputs the summary table in ASCII format with space delimeter

For use in [R], feature names have been changed, replacing parenthesis and spaces to '.' (full-stop) make access easier.

### Extracted features
A total of 81 features were extracted, including subject ID and activity. 
Only features containing mean or standard deviation values were extracted for the final dataset, including mean/std dev of frequency components as these may be useful for predicting the average frequency of changes during walking or steps to resolve walking vs climbing.

Output files

run-analysis.R outputs two tables in ASCII text using a blank space delimiter:

- "tidyMeanStd.txt", a subset of the raw data containing mean and std. dev. features for all subjects and all activities
- "tidyMeanSummary.txt", a summary table consisting of the mean value of each feature of the first-named table.  
- "tidyFeatures.txt", list of all features used in the tidyMeanStd table

## Feature Names and Description
Feature:   Description:   
subject:   Volunteer Subject ID number:   
activity:   Text description of the observed activity:   
tBodyAcc.std...X:   std. deviation of body acceleration:   X-axis
tBodyAcc.std...Y:   std. deviation of body acceleration:   Y-axis
tBodyAcc.std...Z:   std. deviation of body acceleration:   Z-axis
tGravityAcc.std...X:   std. deviation of gravity acceleration:   X-axis
tGravityAcc.std...Y:   std. deviation of gravity acceleration:   Y-axis
tGravityAcc.std...Z:   std. deviation of gravity acceleration:   Z-axis
tBodyAccJerk.std...X:   std. deviation of body jerk:   X-axis
tBodyAccJerk.std...Y:   std. deviation of body jerk:   Y-axis
tBodyAccJerk.std...Z:   std. deviation of body jerk:   Z-axis
tBodyGyro.std...X:   std. deviation of body gyroscope angular acceleration:   X-axis
tBodyGyro.std...Y:   std. deviation of body gyroscope angular acceleration:   Y-axis
tBodyGyro.std...Z:   std. deviation of body gyroscope angular acceleration:   Z-axis
tBodyGyroJerk.std...X:   std. deviation of body gyroscope angular jerk:   X-axis
tBodyGyroJerk.std...Y:   std. deviation of body gyroscope angular jerk:   Y-axis
tBodyGyroJerk.std...Z:   std. deviation of body gyroscope angular jerk:   Z-axis
tBodyAccMag.std..:   std. deviation of body acceleration (magnitude):   
tGravityAccMag.std..:   std. deviation of gravity acceleration (magnitude):   
tBodyAccJerkMag.std..:   std. deviation of body acceleration jerk (magnitude):   
tBodyGyroMag.std..:   std. deviation of body gyroscope angular acceleration (magnitude):   
tBodyGyroJerkMag.std..:   std. deviation of body gyroscope jerk (magnitude):   
fBodyAcc.std...X:   std. deviation of body acceleration (Frequency):   X-axis
fBodyAcc.std...Y:   std. deviation of body acceleration (Frequency):   Y-axis
fBodyAcc.std...Z:   std. deviation of body acceleration (Frequency):   Z-axis
fBodyAccJerk.std...X:   std. deviation of body jerk (Frequency):   X-axis
fBodyAccJerk.std...Y:   std. deviation of body jerk (Frequency):   Y-axis
fBodyAccJerk.std...Z:   std. deviation of body jerk (Frequency):   Z-axis
fBodyGyro.std...X:   std. deviation of body gyroscope angular acceleration (Frequency):   X-axis
fBodyGyro.std...Y:   std. deviation of body gyroscope angular acceleration (Frequency):   Y-axis
fBodyGyro.std...Z:   std. deviation of body gyroscope angular acceleration (Frequency):   Z-axis
fBodyAccMag.std..:   std. deviation of body acceleration (magnitude) (Frequency):   
fBodyBodyAccJerkMag.std..:   std. deviation of body acceleration jerk (magnitude) (Frequency):   
fBodyBodyGyroMag.std..:   std. deviation of body gyroscope angular acceleration (magnitude)  (Frequency):   
fBodyBodyGyroJerkMag.std..:   std. deviation of body gyroscope jerk (magnitude)  (Frequency):   
tBodyAcc.mean...X:   mean body acceleration:   X-axis
tBodyAcc.mean...Y:   mean body acceleration:   Y-axis
tBodyAcc.mean...Z:   mean body acceleration:   Z-axis
tGravityAcc.mean...X:   mean gravity acceleration:   X-axis
tGravityAcc.mean...Y:   mean gravity acceleration:   Y-axis
tGravityAcc.mean...Z:   mean gravity acceleration:   Z-axis
tBodyAccJerk.mean...X:   mean body jerk:   X-axis
tBodyAccJerk.mean...Y:   mean body jerk:   Y-axis
tBodyAccJerk.mean...Z:   mean body jerk:   Z-axis
tBodyGyro.mean...X:   mean body gyroscope angular acceleration:   X-axis
tBodyGyro.mean...Y:   mean body gyroscope angular acceleration:   Y-axis
tBodyGyro.mean...Z:   mean body gyroscope angular acceleration:   Z-axis
tBodyGyroJerk.mean...X:   mean body gyroscope angular jerk:   X-axis
tBodyGyroJerk.mean...Y:   mean body gyroscope angular jerk:   Y-axis
tBodyGyroJerk.mean...Z:   mean body gyroscope angular jerk:   Z-axis
tBodyAccMag.mean..:   mean body acceleration (magnitude):   
tGravityAccMag.mean..:   mean gravity acceleration (magnitude):   
tBodyAccJerkMag.mean..:   mean body acceleration jerk (magnitude):   
tBodyGyroMag.mean..:   mean body gyroscope angular acceleration (magnitude):   
tBodyGyroJerkMag.mean..:   mean body gyroscope jerk (magnitude):   
fBodyAcc.mean...X:   mean body acceleration (Frequency):   X-axis
fBodyAcc.mean...Y:   mean body acceleration (Frequency):   Y-axis
fBodyAcc.mean...Z:   mean body acceleration (Frequency):   Z-axis
fBodyAcc.meanFreq...X:   mean body acceleration (Mean Frequency):   X-axis
fBodyAcc.meanFreq...Y:   mean body acceleration (Mean Frequency):   Y-axis
fBodyAcc.meanFreq...Z:   mean body acceleration (Mean Frequency):   Z-axis
fBodyAccJerk.mean...X:   mean body jerk (Frequency):   X-axis
fBodyAccJerk.mean...Y:   mean body jerk (Frequency):   Y-axis
fBodyAccJerk.mean...Z:   mean body jerk (Frequency):   Z-axis
fBodyAccJerk.meanFreq...X:   mean body jerk (Mean Frequency):   X-axis
fBodyAccJerk.meanFreq...Y:   mean body jerk (Mean Frequency):   Y-axis
fBodyAccJerk.meanFreq...Z:   mean body jerk (Mean Frequency):   Z-axis
fBodyGyro.mean...X:   mean body gyroscope angular acceleration (Frequency):   X-axis
fBodyGyro.mean...Y:   mean body gyroscope angular acceleration (Frequency):   Y-axis
fBodyGyro.mean...Z:   mean body gyroscope angular acceleration (Frequency):   Z-axis
fBodyGyro.meanFreq...X:   mean body gyroscope angular acceleration (Mean Frequency):   X-axis
fBodyGyro.meanFreq...Y:   mean body gyroscope angular acceleration (Mean Frequency):   Y-axis
fBodyGyro.meanFreq...Z:   mean body gyroscope angular acceleration (Mean Frequency):   Z-axis
fBodyAccMag.mean..:   mean body acceleration (magnitude) (Frequency):   
fBodyAccMag.meanFreq..:   mean body acceleration (magnitude) (Mean Frequency):   
fBodyBodyAccJerkMag.mean..:   mean body acceleration jerk (magnitude) (Frequency):   
fBodyBodyAccJerkMag.meanFreq..:   mean body acceleration jerk (magnitude) (Mean Frequency):   
fBodyBodyGyroMag.mean..:   mean body gyroscope angular acceleration (magnitude)  (Frequency):   
fBodyBodyGyroMag.meanFreq..:   mean body gyroscope angular acceleration (magnitude)  (Mean Frequency):   
fBodyBodyGyroJerkMag.mean..:   mean body gyroscope jerk (magnitude)  (Frequency):   
fBodyBodyGyroJerkMag.meanFreq..:   mean body gyroscope jerk (magnitude)  (Mean Frequency):   

