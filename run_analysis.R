library(plyr)

# 1 Downloading dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# 2 Merging the training and the test sets to create one data set:

# 2.1 Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# 2.2 Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 2.3 Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# 2.4 Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 3 Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# 4 Merging all data in one set:
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
mergedDataset <- rbind(mrg_train, mrg_test)

# 5 Extracting measurements on the mean and standard deviation for each measurement

# 5.1 Reading column names:
colNames <- colnames(mergedDataset)

# 5.2 Create vector for defining ID, mean and standard deviation:
mean_std <- (grepl("activityId" , colNames) | 
                         grepl("subjectId" , colNames) | 
                         grepl("mean.." , colNames) | 
                         grepl("std.." , colNames) 
)

# 5.3 Making subset from mergedDataset:
MeanStd <- mergedDataset[ , mean_std == TRUE]

# 6 Using descriptive activity names to name the activities in the dataset:
Activities <- merge(MeanStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# 7 Creating a tidy data set with the average of each variable for each activity and each subject:

# 7.1 Making second tidy dataset 
TidyDataset <- aggregate(. ~subjectId + activityId, Activities, mean)
TidyDataset <- TidyDataset[order(TidyDataset$subjectId, TidyDataset$activityId),]

# 7.2 Writing second tidy dataset into a text file
write.table(TidyDataset, "TidyDataset.txt", row.name=FALSE)