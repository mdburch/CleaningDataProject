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

# Read in the column names
# Modify the names so they can be applied as column names
# Set names to columns names
colNames <- read.table("./features.txt", stringsAsFactors=FALSE)$V2
colNames <- gsub("-", "_", colNames)
colNames <- gsub("()", "Val", colNames, fixed=TRUE)
colnames(fullData) <- c("subject", "activity", make.names(colNames, unique=TRUE))

# Change the activity descriptions
activity_labels <- read.table("./activity_labels.txt")$V2
fullData$activity <-as.factor(fullData$activity)
levels(fullData$activity) <- activity_labels

# Extract the mean and std columns
meanStdData<-select(fullData, subject, activity, contains("meanVal", ignore.case=FALSE), contains("stdVal", ignore.case=FALSE))