# 

library(read.table)
library(dplyr)

## Previous Steps
## ---------------
## Download the Data Set from the Url:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Extract the content of the file to the path of the run_analysis.R script
## resulting in the creation of the "UCI HAR Dataset folder"
## Set the working directory to the path of run_analysis.R script


# Obtain the mean and std features



alabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
# Features indices of mean and std features
mean_std <- grep("mean|std", features[,2])
# Features labels
features <- features[,2][mean_std]

# Test Data
# subject_test: Subject ids
# X_test :      Features data 
# y_test :      Activity data

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "Subject"

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_test <- X_test[, mean_std]
names(X_test) <- features

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_test <- 
	y_test %>% 
	mutate(Activity = alabels[V1,2]) %>%
	select(Activity)

test_set <-
	cbind(subject_test, y_test, X_test) %>%
	mutate(Source = "Test")

# Train Data
# subject_train: Subject ids
# X_train :      Features data 
# y_train :      Activity data

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "Subject"

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_train <- X_train[, mean_std]
names(X_train) <- features

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_train <- 
	y_train %>% 
	mutate(Activity = alabels[V1,2]) %>%
	select(Activity)

train_set <-
	cbind(subject_train, y_train, X_train) %>%
	mutate(Source = "Train")

## Merges training and test sets

data_set <- rbind(test_set, train_set)

## 

tidy_data <- 
	data_set %>%
	group_by(Subject, Activity) %>%
	summarise_each(funs(mean), -Source)


write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)