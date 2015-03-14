library(dplyr)

dir <- paste0(getwd(), "/UCI HAR Dataset")

# Read in the test data
testX <- read.table(paste0(dir,"/test/X_test.txt"))
testY <- read.table(paste0(dir,"/test/Y_test.txt"))
testSubject <- read.table(paste0(dir,"/test/subject_test.txt"))

# Bind the test data together
testData <- cbind(testSubject, testY, testX)

# Read in the training data
trainX <- read.table(paste0(dir,"/train/X_train.txt"))
trainY <- read.table(paste0(dir,"/train/Y_train.txt"))
trainSubject <- read.table(paste0(dir,"/train/subject_train.txt"))

# Bind the training data together
trainData <- cbind(trainSubject, trainY, trainX)

# Combine the test and training data
fullData <- rbind(testData, trainData)
fullData <- tbl_df(fullData)

# Read in the column names
# Modify the names so they can be applied as column names
# Set names to columns names
colNames <- read.table(paste0(dir,"/features.txt"), stringsAsFactors=FALSE)$V2
colNames <- gsub("-", "_", colNames)
colNames <- gsub("()", "Val", colNames, fixed=TRUE)
colnames(fullData) <- c("subject", "activity", make.names(colNames, unique=TRUE))

# Change the activity descriptions
activity_labels <- read.table(paste0(dir,"/activity_labels.txt"))$V2
fullData$activity <-as.factor(fullData$activity)
levels(fullData$activity) <- activity_labels

# Extract the mean and std columns
meanStdData<-select(fullData, subject, activity, contains("meanVal", ignore.case=FALSE), contains("stdVal", ignore.case=FALSE))

# Group data by subject and activity and summarize with the mean
tidyData <- meanStdData %>%
 group_by(subject, activity) %>%
 summarise_each(funs(mean))

# Modify column names to better represent the new data
colnames(tidyData) <- gsub("meanVal", "AvgMeans", colnames(tidyData))
colnames(tidyData) <- gsub("stdVal", "AvgStd", colnames(tidyData))

# Write out the results
write.table(tidyData, file="tidyData.txt",row.names=FALSE)
