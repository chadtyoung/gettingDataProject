# Human Activity Dataset 

## Introduction
This purpose of this project is to create a tidy-data subset of the UCI human activity dataset consisting of 
the mean and standard deviation features extracted from smartphone accelerometer and gyroscope measurements.

Dataset and details from the research documented at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

raw data file can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Requirements
[R] version 3.1.2 or later recommended


## Steps to extract the tidy data set
1) download the ZIP archive of the dataset from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
stored into the Data/Raw sub-directory
2) unzip the archive in the "Data/Raw/UCI HAR Dataset" sub-directory 
3) execute the run-analysis.R script found in the "Code" sub-directory
   working directory should be the "Code" directory where the run-analysis.R script resides

###Final directory structure
* Code/  - all scripts and other executable code
* Data/  - all data sets
* Data/Raw - raw, unprocessed data, directly from source
* Data/Processed - final processed output data, cleaned, labeled, etc.


## Analysis Script

The "run-analysis.R" script does the following:

- Loads X_train and X_test datasets, the subject for each observation, and the labeled activity associated with each observation merged into a single dataframe "dataAll"
- creates a subset of the full data containing only features with "mean" or "std" in the name, plus the subject number and activity label
- creates an "activity" feature using a text description of the activity number
- outputs the resulting subset in ASCII format with space delimeter
- computes a summary using the mean value of each activity for each user over all features
- outputs the summary table in ASCII format with space delimeter

## Results
run-analysis.R outputs two tables in ASCII text using a blank space delimiter:

- "tidyMeanStd.txt", a subset of the raw data containing mean and std. dev. features for all subjects and all activities
- "tidyMeanSummary.txt", a summary table consisting of the mean value of each feature of the first-named table.  
- "tidyFeatures.txt", list of all features used in the tidyMeanStd table