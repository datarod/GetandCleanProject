## Coursera Getting and Working with Data - Project
# location for code
whereisit<-"/Users/rod/github/datascience/Coursera-R/GetandCleanData-CourseProject"
#location for data
# This script works as long as all of the data is in the directory
# Original source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Note-from the download, spaces were replaced with _ in the filenames

datadir<-"/Users/rod/github/datascience/Coursera-R/GetandCleanData-CourseProject/UCI_HAR_Dataset"
setwd(datadir)
DF=NULL
#get label data
DF$activity_labels<- read.delim(
        file = "./activity_labels.txt", header = FALSE)
DF$features<- read.delim(
        file = "./features.txt", header = FALSE)
DF$features<- read.delim(
        file = "./features.txt", header = FALSE)
#get test data
DF$X_testX<- read.delim(
        file = "./test/X_test.txt", header = FALSE)
DF$X_testy<- read.delim(
        file = "./test/y_test.txt", header = FALSE)
DF$X_subject_test<- read.delim(
        file = "./test/subject_test.txt", header = FALSE)
#get train data
DF$X_trainX<- read.delim(
        file = "./train/X_train.txt", header = FALSE)
DF$X_trainy<- read.delim(
        file = "./train/Y_train.txt", header = FALSE)
DF$X_subject_train<- read.delim(
        file = "./train/subject_train.txt", header = FALSE)
save(DF,file="UCI_dataset.txt")