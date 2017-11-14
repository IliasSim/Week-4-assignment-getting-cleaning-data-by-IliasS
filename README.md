# Week-4-getting-and-Cleaning-Data-assignment-IliasS
This repo was created for the assignment for week 4 of Getting and Cleaning Data Coursera course.
* First, download the data from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. and unzip them
* Second, download the R source code into your R working directory and execute it.

### Data description
In the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. In the data Y are the activity type from which each X data was recorded.

### Code explaination
The code combined training dataset and test dataset and extracts only the measurements on the mean and standard deviation for each measurement in rder to create another dataset with the averages of each variable for each activity.

### New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### The code was written based on the instruction of this assignment
You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
