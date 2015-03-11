library(dplyr)
library(tidyr)

# Read in the test data
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/Y_test.txt")
testSubject <- read.table("./test/subject_test.txt")

# Bind the test data together
testData <- cbind(testSubject, testY, testX)

# Read in the training data
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/Y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")

# Bind the training data together
trainData <- cbind(trainSubject, trainY, trainX)

# Combine the test and training data
fullData <- rbind(testData, trainData)
fullData <- tbl_df(fullData)

# Read in the column names and set them to the data
colNames <- make.names(read.table("./features.txt", stringsAsFactors=FALSE)$V2, unique=TRUE)
colnames(fullData) <- c("subject", "activity", colNames)

# Change the activity descriptions
activity_labels <- read.table("./activity_labels.txt")$V2
fullData$activity <-as.factor(fullData$activity)
levels(fullData$activity) <- activity_labels

# Extract the mean and std columns
meanStdData<-select(fullData, subject, activity, contains("mean"), contains("std"))