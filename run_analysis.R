
# run_analysis.R Written by Carmen DiMichele
# foR the Course Project OF the Coursera course,
# Getting and Cleaning Data

# This script operates on this dataset:
# ==================================================================
# Human Activity Recognition Using Smartphones Dataset
# Version 1.0
# ==================================================================
# Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
# Smartlab - Non Linear Complex Systems Laboratory
# DITEN - Università degli Studi di Genova.
# Via Opera Pia 11A, I-16145, Genoa, Italy.
# activityrecognition@smartlab.ws
# www.smartlab.ws
# ==================================================================
#
# ... and does the following with it:

# Download the dataset:
dataFile <- "UCI_HAR_Dataset.zip"

# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url = fileUrl, destfile = dataFile, method = "auto")
# dateDownloaded <- date()


# 1. Merges the training and the test sets to create one data set.

dat <- cbind(
  read.table(unz(dataFile, "UCI HAR Dataset/train/subject_train.txt")),
  read.table(unz(dataFile, "UCI HAR Dataset/train/y_train.txt")),
  read.table(unz(dataFile, "UCI HAR Dataset/train/X_train.txt"))
)

dat <- rbind(dat,
  cbind(
    read.table(unz(dataFile, "UCI HAR Dataset/test/subject_test.txt")),
    read.table(unz(dataFile, "UCI HAR Dataset/test/y_test.txt")),
    read.table(unz(dataFile, "UCI HAR Dataset/test/X_test.txt"))
  )             
)


# 4. Appropriately labels the data set with descriptive variable names.

names(dat)[1] <- "subject"
names(dat)[2] <- "activity"
names(dat)[3:563] = gsub(
  "(\\(|\\))*","",
  as.character(read.table(unz(dataFile, "UCI HAR Dataset/features.txt"))[,2])
)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

keep <- grepl("(-mean|-std)\\b",names(dat))
keep[1:2] <- TRUE
dat <- dat[,keep]


# 3. Uses descriptive activity names to name the activities in the data set

library(plyr)
dat$activity <- mapvalues(
  dat$activity,
  from = 1:6,
  to = as.character(read.table(unz(dataFile, "UCI HAR Dataset/activity_labels.txt"))[,2])
)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dat2 <- dcast(
  melt(dat,id.vars = c("subject","activity")), 
  subject + activity ~ variable,
  mean
)


# write the output data to a file

write.table(dat2, file = "dat2.txt", row.name = FALSE)


