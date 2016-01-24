library(dplyr)

#read all the files to be compiled into the data set

trainX <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/train/y_train.txt")
trainSubj <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/test/X_test.txt")
testY <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/test/Y_test.txt")
testSubj <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/test/subject_test.txt")
colNames <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/features.txt")
activityTable <- read.table("C:/R learning/getting and cleaning data/UCI HAR Dataset/activity_labels.txt")

# pasting the data together: combine the test and train data, give names to the columns and add activity and subject columns
fullSet <- rbind(testX, trainX)

names(fullSet) <- colNames$V2
fullSetY <- rbind(testY, trainY)
fullSetSubj <- rbind(testSubj, trainSubj)

fullerSet <- cbind(fullSetY, fullSet)
fullSet <- cbind(fullSetSubj, fullerSet)

# Extracts only the measurements on the mean and standard deviation for each measurement, and name each column.
# Appropriately labels the data set with descriptive variable names
meanStdofFullSet <- fullSet[,1:8]

names(meanStdofFullSet) <- c( "activity", "subject", "mean acceleration X axis", "mean acceleration Y axis",
                              "mean acceleration Z axis", "standard deviation of acceleration X axis",
                              "standard deviation of acceleration Y axis", "standard deviation of acceleration Z axis")

names(activityTable)[1] <- "activity"

# Use descriptive activity names to name the activities in the data set
meanStdofFullSet <- merge(meanStdofFullSet, activityTable, by = "activity", all = TRUE)

names(meanStdofFullSet)[9] <- "activity_description"

# creating a second, independent tidy data set with the average of each variable for each activity and each subject
newDataSet <- meanStdofFullSet %>% group_by(activity_description , subject) %>% summarise_each(funs(mean), matches("axis"))

write.table(newDataSet, file = "newData.txt", row.name=FALSE)
