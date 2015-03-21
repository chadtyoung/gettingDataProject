# Clear all variable in workspace
rm(list = ls())

# Project dataset is stored in  ~/coursera_github/getdata_HumanActivity/Data/Raw/UCI HAR Dataset
# Processed output files are stored in ~/coursera_github/getdata_HumanActivity/Data/Processed

#setwd("~/coursera_github/getdata_HumanActivity")
# Assumes CWD is the "Code" subdirectory where all scripts are stored, changes WD up one level to access the data
setwd("../")

# original data set at
# https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda
# new set for getting and cleaning data (getdata-012)
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method="curl", destfile="~/coursera_github/getdata_HumanActivity/Data/Raw/UCI_HAR_Dataset.zip")
# needs to be unzipped into "UCI HAR Dataset" directory 

# Load names to be used as dataframe features
ffile <- file("Data/Raw/UCI HAR Dataset/features.txt")
features <- read.table(ffile, sep=" ", header=FALSE)

# note that R automatically replaces spaces and "()" with "." when assigned to a column name

fdata <- file("Data/Raw/UCI HAR Dataset/test/X_test.txt")
dataTest <- read.table(fdata, as.is=TRUE, col.names=features[,2])
fdata <- file("Data/Raw/UCI HAR Dataset/test/y_test.txt")
resultTest <- read.table(fdata)
dataTest['activitynum'] <- resultTest
fdata <- file("Data/Raw/UCI HAR Dataset/test/subject_test.txt")
resultTest <- read.table(fdata)
dataTest['subject'] <- resultTest

fdata2 <- file("Data/Raw/UCI HAR Dataset/train/X_train.txt")
dataTrain <- read.table(fdata2, as.is=TRUE, col.names=features[,2])
fdata3 <- file("Data/Raw/UCI HAR Dataset/train/y_train.txt")
resultTrain <- read.table(fdata3)
dataTrain['activitynum'] <- resultTrain
fdata <- file("Data/Raw/UCI HAR Dataset/train/subject_train.txt")
resultTest <- read.table(fdata)
dataTrain['subject'] <- resultTest

# Combine train and test datasets, assumes both sets have same features
dataAll <- rbind(dataTest, dataTrain)

# extract only columns with standard dev and mean, plus the subject and activity number
dataSubset <- cbind(dataAll[ grep(".std", colnames(dataAll))], dataAll[ grep(".mean", colnames(dataAll))], dataAll['activitynum'], dataAll['subject'])

# Read activity labels and use to add text description "activity", matching activity label to activity number
fdata <- file("Data/Raw/UCI HAR Dataset/activity_labels.txt")
activitydf <- read.table(fdata)
for (i in 1:nrow(activitydf)) { 
  dataSubset[ dataSubset['activitynum'] == activitydf[i,1], 'activity'] <- activitydf[i,2]                
}

# remove the activty number column
dataSubset['activitynum'] <- NULL 

# write final tidy data-table
write.table(dataSubset, file('Data/Processed/tidyMeanStd.txt'), row.names=FALSE)

# SUMMARIZE data by showing mean value for each activtiy and each subject
# groub by subject, then by activity showing average for each variable
meanvaldf <- aggregate(. ~ activity+subject,dataSubset, mean)

# write final mean summary of tidy-data table
write.table(meanvaldf, file('Data/Processed/tidyMeanSummary.txt'), row.names=FALSE)

# save tidy-data feature names to 'tidyfeatures.txt' in processed directory for use in codebook
tidyNames <- names(dataSubset)
f <- file('Data/Processed/tidyFeatures.txt')
write(tidyNames, f, sep="\n")
close(f)