---
title: "ReadMe"
author: "Guru"
date: "Sunday, March 22, 2015"
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

 #Read Me
 
run_analysis.R

It Performs The Following

->Merges the training and the test sets to create one data set.
->Extracts only the measurements on the mean and standard deviation for each measurement.
->Uses descriptive activity names to name the activities in the data set
->Appropriately labels the data set with descriptive activity names.
->Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 #Procedure
 
 ->For both the test and train datasets, produce an interim dataset:
        ->Extract the mean and standard deviation features (listed in CodeBook.md, section 'Extracted  Features'). This is the values table.
        -> Get the list of activities.
        ->Put the activity labels (not numbers) into the values table.
        ->Get the list of subjects.
        ->Put the subject IDs into the values table.
 ->Join the test and train interim datasets.
 ->Put each variable on its own row.
 ->Rejoin the entire table, keying on subject/activity pairs, applying the mean function to each vector          of values in each subject/activity pair.This is the clean dataset.
 ->Write the clean dataset to file.


 #Output

[run_analysis Result]  Getting and Cleaning Data Course Project 
[run_analysis Result]  Name: Guru 
[run_analysis Result]  ..... 
[run_analysis Result]  Beginning... 
[run_analysis Result]  Preparing for analysis. 
[run_analysis Result]  Reading datasets--- 
[run_analysis Result]  Getting dataset: D:/Data/R Work/UCI HAR Dataset/test 
[run_analysis Result]  reading features - 
[run_analysis Result]  reading activities - 
[run_analysis Result]  reading subjects... 
[run_analysis Result]  Getting dataset: D:/Data/R Work/UCI HAR Dataset/train 
[run_analysis Result]  reading features - 
[run_analysis Result]  reading activities - 
[run_analysis Result]  reading subjects... 
[run_analysis Result]  Joining datasets--- 
[run_analysis Result]  Melting. 
[run_analysis Result]  Dcasting. 
[run_analysis Result]  Saving clean data to file: D:/Data/R Work/UCI HAR Dataset/cleaned Data File.txt

 


