#fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL,"./accelerometer.zip", method="curl")

##set the file URL 
fileURL <-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##download the file 
download.file(fileURL,"./accelerometer.zip")

##unzip the file 
unzip("./accelerometer.zip")

##features
features<-read.table("./UCI HAR Dataset/features.txt")

##get test data
test_X<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_Y<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_Subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")

##replacing numbers with proper activity details
names(test_X) <-features$V2
names(test_Y) <- "activity"
names(test_Subject) <-"subject"

##build testing data 
testing_data<-test_X
testing_data[,562] <-test_Y
testing_data[,563] <-test_Subject



##get training data 
train_X<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_Y<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_Subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

##replacing numbers with proper activity details
names(train_X) <-features$V2
names(train_Y) <- "activity"
names(train_Subject) <-"subject"

##build training data 
training_data <-train_X
training_data[,562] <-train_Y
training_data[,563] <- train_Subject

##merging data 
merge_data <-merge(training_data, testing_data, all=TRUE)


##activity labels
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Appropriately labels the data set with descriptive variable names
merge_data$activity <-factor(merge_data$activity,activity[[1]],activity[[2]])


## mean and standard deviation measurements 
measurements <-grepl("std()|mean()",colnames(merge_data))
mean_standard_data<-merge_data[measurements]

## write mean, standard data to a file
write.table(mean_standard_data,"mean_standard_data.txt")

##independent tidy data set with the average of each variable for each activity and each subject

tidy_data<-aggregate(merge_data,by = list(merge_data$activity,merge_data$subject),mean)
write.table(tidy_data,"tidy_data.txt")







#https://github.com/sachinks84/run_analysis.R/blob/master/run_analysis.R#L21