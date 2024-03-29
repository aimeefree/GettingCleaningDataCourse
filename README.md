# GettingCleaningDataCourse
This repository contains R code and related files required for the final project in the Coursera Getting and Cleaning Data course. The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set by preparing a tidy data that can be used for later analyses. It contains: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

# Files
CodeBook.md includes a full description of the project and the definitions for activity codes included in the final/tidy dataset (called "TidyDataset").   

run_analysis.R contains all the code to perform the steps needed to create the final TidyDataset with each step fully described within the code. 

TidyDataset.txt is the output of the final/tidy dataset.

# Steps followed to create the final tidy dataset are listed below and clearly labeled within the R code.

1. Downloading required datasets
2. Merging the training and the test sets to create one data set
3. Assigning column names
4. Merging all data in one set
5. Extracting measurements on the mean and standard deviation for each measurement
6.  Using descriptive activity names to name the activities in the dataset
7. Creating a tidy data set with the average of each variable for each activity and each subject

