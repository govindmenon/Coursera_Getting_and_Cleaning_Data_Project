# Coursera Getting and Cleaning Data Project
Week 3 Peer Assignment for Getting and Cleaning Data

###This repository has the following files:
* README.md
* run_analysis.R
* codebook.md
* final_data.txt
* mean_data.txt

###Steps for running the code:
* Clone the repository
* Download data-set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , extract and copy to the cloned git directory
* Open R/R-Studio and set directory to the cloned git directory
* Execute the run_analysis.R script using source('run_analysis.R')

###The output is present in:
* final_data.txt
* mean_data.txt

###run_analysis.R does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
