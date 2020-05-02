# UCI_HAR

** Final test for Coursera Getting and Cleaning Data Course **


1) raw data are downloaded and and unzip in a sub directory called "UCI HAR Dataset"

2) test and train datasets are read from the directory and subdirectory and merged in a single data.frame df (assignement of Task1). All the original variables are collected and ordered.

3) a second data.frame (df1) is created by extracting only the variables that measure mean and average by a name selection. Then the activity of the is changed from numeral to literal description and the variable name is simplyfied and ordered. This covers Task 2 and 3

4) by using a dplyr pipeline a new data.frame (df2) is build by the previous one. The process group and summarize by average all the variables vs the possible combination of subject and activity 
