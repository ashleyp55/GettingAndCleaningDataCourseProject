##Working directory was set to '/User/Documents/UCI HAR Dataset/'
##Import dplyr package
library(dplyr)

######
#1.Merges the training and the test sets to create one data set
######

##Read training data
trainingSubjects <- read.table("train/subject_train.txt")
trainingValues <- read.table("train/X_train.txt")
trainingActivities <- read.table("train/Y_train.txt")

##Read test data
testSubjects <- read.table("test/subject_test.txt")
testValues <- read.table("test/X_test.txt")
testActivities <- read.table("test/y_test.txt")

##Read features
featureData <- read.table("features.txt")

##Read activity labels and set column names
activityLabels <- read.table("activity_labels.txt")
colnames(activityLabels) <- c("activityId", "activityName")

##Merge training set 
trainingData <- cbind(trainingSubjects, trainingValues, trainingActivities)

##Merge test set
testData <- cbind(testSubjects, testValues, testActivities)

##Merge all data and set column names
allData <- rbind(trainingData, testData)
colnames(allData) <- c("subject", as.character(featureData[,2]), "activity")

######
#2.Extracts only the measurements on the mean and standard deviation for each measurement
######

##Determine column names to keep
keepColNames <- grepl("subject|activity|mean|std", colnames(allData))

##Reset allData with appropriate columns
allData <- allData[, keepColNames]

######
#3.Uses descriptive activity names to name the activities in the data set
######

##Replace activity values in allData with descriptive names
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])

######
#4.Appropriately labels the data set with descriptive variable names
######

##Get column names
allDataColumns <- colnames(allData)

##Remove special characters in column names
allDataColumns <- gsub("[\\(\\)-]", "", allDataColumns)

##Make column names descriptive
allDataColumns <- gsub("^f", "frequencyDomain", allDataColumns)
allDataColumns <- gsub("^t", "timeDomain", allDataColumns)
allDataColumns <- gsub("Acc", "Accelerometer", allDataColumns)
allDataColumns <- gsub("Gyro", "Gyroscope", allDataColumns)
allDataColumns <- gsub("Mag", "Magnitude", allDataColumns)
allDataColumns <- gsub("Freq", "Frequency", allDataColumns)
allDataColumns <- gsub("mean", "Mean", allDataColumns)
allDataColumns <- gsub("std", "Standard Deviation", allDataColumns)
allDataColumns <- gsub("BodyBody", "Body", allDataColumns)

##Set new column names
colnames(allData) <- allDataColumns

######
#5.Creates a second, independent tidy data set with the average of each variable 
#  for each activity and each subject
######

##Find means and group by subject and activity
meansBySubjectAndActivity <- allData %>% 
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

##Write to an output file
write.table(meansBySubjectAndActivity, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)