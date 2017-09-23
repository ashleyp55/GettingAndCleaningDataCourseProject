# GettingAndCleaningDataCourseProject

Project Specifications:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. This repository includes:
    1) README.md which provides a project and data overview
    2) run_analysis.R which is the R script that was used to create the data set
    3) tidy_data.txt which is the required tidy data set output
    4) CodeBook.md which is a code book that describes the variables, the data, and any transformations that were performed 

Description of Raw Data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones:
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

High Level Script Design (run_analysis.R in this repository):
The following steps were taken to create the final tidy data set
    1) Download data to local machine and set working directory
    2) Import dplyr package
    3) Read in training and test data and merge into one data set
    4) Extracts only mean and standard deviation measurements
    5) Replace raw column names with more descriptive column names
    6) Creates separate tidy data set that averages each variable by subject and activity
    7) Saves new tidy data set in a text file (tidy_data.txt in this repository)
