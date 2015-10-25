#Merging test and training sets into a single data-set
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
data <- rbind(trainData,testData)

testLabel <- read.table("UCI HAR Dataset/test/y_test.txt")
trainLabel <- read.table("UCI HAR Dataset/train/y_train.txt")
label <- rbind(trainLabel,testLabel)

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(trainSubject,testSubject)
names(subject) <- "Subject"


#Extracting mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
meanAndStdRecords <- grep(pattern = "mean\\(\\)|std\\(\\)",features$V2)

data = data[,meanAndStdRecords]

#Tidying up column names
columnNames <- features[meanAndStdRecords,2]
columnNames <- gsub(pattern = "-", replacement = " ", columnNames)
columnNames <- gsub(pattern = "X", replacement = "X-Axis",columnNames)
columnNames <- gsub(pattern = "Y", replacement = "Y-Axis",columnNames)
columnNames <- gsub(pattern = "Z", replacement = "Z-Axis",columnNames)
columnNames <- gsub(pattern = "\\(\\)", replacement = "",columnNames)
columnNames <- gsub(pattern = "mean", replacement = "Mean", columnNames)
columnNames <- gsub(pattern = "std", replacement = "Std", columnNames)

names(data) <- columnNames

#Using descriptive activity names 
activity <- x <- read.table("UCI HAR Dataset/activity_labels.txt")

x$V2 <- gsub(pattern = "_", replacement = " ", x$V2)
activity$V2 <- gsub(pattern = "_", replacement = " ", activity$V2)

activity <- activity[label[,1],2]
label[,1] <- activity
names(label) <- "Activity"

#Merging Subject, Label and the data-set
finalData <- cbind(subject,label,data)

#Writing the merged data-set into a file
write.table(finalData,"final_data.txt", row.names = FALSE)


#Creating independent tidy data-set with the average of each variable for each activity and each subject
library(data.table)
finalDT <- data.table(finalData)
meanData<- finalDT[, lapply(.SD, mean), by=c("Subject", "Activity")]
write.table(meanData,"mean_data.txt", row.names = FALSE)
