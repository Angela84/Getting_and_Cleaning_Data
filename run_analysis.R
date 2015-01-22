library(plyr)

## Read train inputs:

x_train <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_train <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/train/subject_train.txt", quote="\"")

## Read test inputs

x_test <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_test <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/test/subject_test.txt", quote="\"")

## Merge x
x <- rbind(x_train,x_test)
##print(x)

## Merge y
y <- rbind(y_train,y_test)
##print(y)

## Merge subject
subject <- rbind(subject_train,subject_test)
##print(subject)

##Read the measurements
measure <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/features.txt")
activity <- read.table("C:/Users/Angela/Desktop/Coursera/UCI HAR Dataset/activity_labels.txt")

##Get the measurements on the mean and standard deviation
meanstd_measure <- grep("-(mean|std)\\(\\)", measure[, 2])

##Subset x
subset_x <- x[,meanstd_measure]

##Name subset_x
names(subset_x) <- measure[meanstd_measure, 2]
##print(names(subset_x))

##Match the activities with the y set
subset_y <- activity[match(y$V1,activity[,1]),2]

##Create one data_set
dataset <- cbind(subject, subset_x, subset_y)

##Cleaning names
var <- names(dataset)
var <- gsub("\\(\\)","",var)
var <- gsub("-","",var)
var <- gsub("f","frequency",var)
var <- gsub("t","time",var)
names(dataset) <- var

##Name columns
names(dataset)[1] <- "subject"
names(dataset)[68] <- "activity"

##Calculate average for each subject and activity
average_dataset <- ddply(dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

##Saving the resulting file as .txt
write.table(average_dataset, "average_data.txt", row.name=FALSE)



