#Final test for Coursera Getting and Cleaning Data Course


1. raw data are downloaded and and unzip in a sub directory called "UCI HAR Dataset"

1. test and train datasets are read from the directory and subdirectory and merged in a single data.frame (**df**) (assignement of Task1). All the original variables are collected and ordered.

1. a second data.frame (**df1**) is created by extracting only the variables that measure mean and average by a name selection. Then the activity of the is changed from numeral to literal and the variable name is simplyfied and ordered. This covers Task 2 and 3

1. by using a dplyr pipeline a third data.frame (**df2**) is build from the previous one. The process groups and summarizes by average all the variables vs all possible combinations of subject-activity 
