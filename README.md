# Getting-and-Cleaning-Data-project

# script description for Run_analysis.R

The script read the different tables of the data collected from the accelerometers from the Samsung Galaxy S smartphone. Both the test tables are combined into a big table that includes all the data obtained from the phones, attached to the subject number and the activity that was performed during data recording.

Thereafter, a subset of the data is derived from the large data above, to include the mean measurments and standard deviation and keep the subject and activity data.

each column received a descriptive name, and the activities number are replaced with the name of each activity.

finally, a table the script creates an independent tidy data set with the average of each variable for each activity and each subject.

code book:
trainX - includes the data from the smartphones for the training set
trainY - includes the activity numerical code for the training set
trainSubj - includes the subject number for the training set
testX- includes the data from the smartphones for the test set
testY - includes the activity numerical code for the test set
testSubj - includes the subject number for the test set
colNames - the names of each column in the trainX and testX data sets
activityTable - a table discribing the numerical code for each activity
fullSet - a table that combine all the data from the training and test data sets including subject and activity
fullSetY - includes the activities for the training and test data 
fullSetSubj - includes the subjects for the training and test data 
fullerSet - a temporary to hold the fullSet when adding columns
meanStdofFullSet - the subset of fullSet that include the mean measurments and standard deviation and keep the subject and activity data.
newDataSet
