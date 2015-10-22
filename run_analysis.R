# Course Project for Getting and Cleaning Data
# created October 21, 2015
library(dplyr)

# Get the data sets
# read in the column names for the activity trackers
features <- read.table("UCI_HAR_Dataset/features.txt", header = FALSE, col.names = c("ID", "FeatureName"))
featureslist <- as.vector(features$FeatureName)

# read the individual test files
testxfile1 <- read.table("UCI_HAR_Dataset/test/testx.txt", header = FALSE, col.names = featureslist)
testxfile2 <- read.table("UCI_HAR_Dataset/test/subject_test.txt", header = FALSE, col.names = "SubjectID")
testxfile3 <- read.table("UCI_HAR_Dataset/test/y_test.txt", header = FALSE, col.names = "ActivityCode")
# combine to create the test file
testfile <- cbind(testxfile2, testxfile3, testxfile1)

# read the individual training files
trainxfile1 <- read.table("UCI_HAR_Dataset/train/trainx.txt", header = FALSE, col.names = featureslist)
trainxfile2 <- read.table("UCI_HAR_Dataset/train/subject_train.txt", header = FALSE, col.names = "SubjectID")
trainxfile3 <- read.table("UCI_HAR_Dataset/train/y_train.txt", header = FALSE, col.names = "ActivityCode")
# combine to create the test file
trainfile <- cbind(trainxfile2, trainxfile3, trainxfile1)

# merge the training and test files
totalfile <- rbind(trainfile, testfile)

# add in labels for activity types
ActivityLabels <- read.table("UCI_HAR_Dataset/activity_labels.txt", header = FALSE, col.names = c("ActivityID", "ActivityLabel"))
tempfile <- merge(ActivityLabels, totalfile, by.x = "ActivityID", by.y = "ActivityCode")

# select only the mean and stddev variables for each movement type
subfile1 <- select(tempfile, SubjectID, ActivityLabel, contains(".mean."))
subfile2 <- select(tempfile, SubjectID, ActivityLabel, contains(".std"))
tidyfile <- merge(subfile1, subfile2)

# create new data set with average for each subject/activity combo
# Use the derived magnitude variables (drop tGravityAccMag.mean because it's redundant)
groupfile <- group_by(subfile1, SubjectID, ActivityLabel)
tidyfile2 <- summarize(groupfile, TimeBodyAccMagMean = mean(tBodyAccMag.mean..), 
                       TimeBodyAccJerkMagMean = mean(tBodyAccJerkMag.mean..), TimeBodyGyroMagMean = mean(tBodyGyroMag.mean..), 
                       TimeBodyGyroJerkMagMean = mean(tBodyGyroJerkMag.mean..), FFTBodyAccMagMean = mean(fBodyAccMag.mean..),
                       FFTBodyAccJerkMagMean = mean(fBodyBodyAccJerkMag.mean..), FFTBodyGyroMagMean = mean(fBodyBodyGyroMag.mean..),
                       FFTBodyGyroJerkMagMean = mean(fBodyBodyGyroJerkMag.mean..))

# write finished data frame to an external file
write.table(tidyfile2, "tidyfile.txt", row.name = FALSE)
