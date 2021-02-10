# load in libraries needed # comment out when not needed
  library(dplyr)



# download the dataset # comment out when not needed
 url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 filename <- "fitnessdata.zip"
 download.file(url,filename)
 unzip(filename)


# read in the features doc to get column names
 columnnames <- readLines("UCI HAR Dataset/features.txt")
 columnnames <- sub("^[0-9]{1,3} ","",columnnames)


# read in the datasets
 dataset_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = columnnames)
 dataset_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = columnnames)
 labels_test <- read.table("UCI HAR Dataset/test/y_test.txt")
 labels_train <- read.table("UCI HAR Dataset/train/y_train.txt")
 subjectid_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
 subjectid_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


# merge the train and test datasets  (step 1 in the assignment)  and turn into a tibble 
 subjectids <- rbind(subjectid_test,subjectid_train); colnames(subjectids) <- "subjectid";
 activities <- rbind(labels_test,labels_train); colnames(activities) <- "activity";
 combineddatasets <-  tibble(rbind(dataset_test,dataset_train))



# extract only the mean and std for each measurement (step 2 in the assignment)
 df <- combineddatasets[grepl("mean[^F]|std", colnames(combineddatasets))]


# replace numbers with descriptive activity labels (step 3 in the assignment)
 activitylabels <- c("walking","Walkingupstairs","walkingdownstairs","sitting","standing","laying")
 for(i in 1:length(activitylabels)) {
   activities[activities == i] <- activitylabels[i]
 }

# add in the activity and subject column 
 largedf <- tibble(cbind(subjectids,activities,df))

# changes the variable names to be more descriptive (step 4 in the assignment)
 pattern <- c("^t","^f","Acc","Gyro","Mag","BodyBody","Body","Jerk","\\.")
 replacement <- c("time","frequency","acceleration","angularvelocity","magnitude","Body","body","jerk","")
 for(i in 1:length(pattern)) {
   names(largedf) <- gsub(pattern[i],replacement[i],names(largedf))
 }


# takes the average of the activity and subject variables and assigns to a new tidy dataset (step 5 in the assignment)
 tidydf <- largedf %>% group_by(subjectid,activity) %>% summarise(across(everything(),list(mean))) 
 names(tidydf) <- gsub("_1","",names(tidydf))

# writes the tidy dataset to a text file
 write.table(tidydf,"tidydataset.txt",row.names = FALSE)


