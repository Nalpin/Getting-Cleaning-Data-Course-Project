# CodeBook

## The Data Set Input

* Full Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

* Subject: The subject of the analysis
* Activity: Activity name, see the 'activity_labels.txt' file.
* Features mean and std: Variable names from 'features.txt'

## Getting and Cleaning Data Process

* Before run the script, proceed to download and extract the Data Set to your working directory
* The packages "read.table" and "dplyr" are prerrequisites to run the script
* For each source set (Train or Test) the script reads the subject, X, y data sets.
* For X data sets extratcs only the mean and std variables
* Assign descriptive variable names obtained from features.txt
* Uses descriptive Activity names from activity_labels.txt instead of numeric values.
* Merges training and test sets
* Creates a tidy data grouping the merged data set by Activity and Subject and aplly the mean of the mean and std columns.
