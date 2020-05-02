# Data Source

Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Documents:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data stored in repository under directory: **UCI HAR Dataset**
The data directory is created at the beginning after data download.

# Raw variables

Classification Variables:

* **subject** : taken from files *subject_test.txt* and *subject_train.txt*
* **activity**: taken from files *y_test.txt* and *y_train.txt*

Measurements Variables: 

* **561 variables** with names in *features.txt* and values in files: *X_test.txt* and *X_train.txt*

* **9  variables** with names : *body_acc_x, body_acc_y, body_acc_z, body_gyro_x, body_gyro_y, body_gyro_z, total_acc_x, total_acc_y, total_acc_z* located in single files in *Internal Signals* directories
    
# Complete DataSet

**df**  achieved by row-wise merging test and train set, dimension: 10299 obs. of 175 variables

# Extracted Dataset with only mean and std

**df1** achieved by selection variables with "-mean()" or "-std()" in the name, dimension: 10299 of 68 variables. Then:
    
1. replaced code in variable activity with the literal definition in file *activity_labels.txt*
1. appropriately labeled the variables with new names
    
Names of variables in the extracted dataset:
Number|Name|Number|Name|Number|Name|
------|----|------|----|------|----|    
1 |subject|18|tBodyAccMag_mean|35|fBodyBodyGyroJerkMag_mean|52|tGravityAccMag_std|
2|activity|19|tGravityAccMag_mean|36|tBodyAcc-X_std|53|tBodyAccJerkMag_std|
3|tBodyAcc-X_mean|20|tBodyAccJerkMag_mean|37|tBodyAcc-Y_std|54|tBodyGyroMag_std|
4|tBodyAcc-Y_mean|21|tBodyGyroMag_mean|38|tBodyAcc-Z_std|55|tBodyGyroJerkMag_std|
5|tBodyAcc-Z_mean|22|tBodyGyroJerkMag_mean|39|tGravityAcc-X_std|56|fBodyAcc-X_std|
6|tGravityAcc-X_mean|23|fBodyAcc-X_mean|40|tGravityAcc-Y_std|57|fBodyAcc-Y_std|
7|tGravityAcc-Y_mean|24|fBodyAcc-Y_mean|41|tGravityAcc-Z_std58|fBodyAcc-Z_std|
8|tGravityAcc-Z_mean|25|fBodyAcc-Z_mean|42|tBodyAccJerk-X_std|59|fBodyAccJerk-X_std|
9|tBodyAccJerk-X_mean|26|fBodyAccJerk-X_mean|43|tBodyAccJerk-Y_std|60|fBodyAccJerk-Y_std|
10|tBodyAccJerk-Y_mean|27|fBodyAccJerk-Y_mean|44|tBodyAccJerk-Z_std|61|fBodyAccJerk-Z_std|
11|tBodyAccJerk-Z_mean|28|fBodyAccJerk-Z_mean|45|tBodyGyro-X_std|62|fBodyGyro-X_std|
12|"tBodyGyro-X_mean|29|fBodyGyro-X_mean|46|tBodyGyro-Y_std|63|fBodyGyro-Y_std|
13|tBodyGyro-Y_mean|30|fBodyGyro-Y_mean|47|tBodyGyro-Z_std|64|fBodyGyro-Z_std|
14|tBodyGyro-Z_mean|31|fBodyGyro-Z_mean|48|tBodyGyroJerk-X_std|65|fBodyAccMag_std|
15|tBodyGyroJerk-X_mean|32|fBodyAccMag_mean|49|tBodyGyroJerk-Y_std|66|fBodyBodyAccJerkMag_std|
16|tBodyGyroJerk-Y_mean|33|fBodyBodyAccJerkMag_mean|50|tBodyGyroJerk-Z_std|67|fBodyBodyGyroMag_std|
17|tBodyGyroJerk-Z_mean|34|fBodyBodyGyroMag_mean|51|tBodyAccMag_std|68|fBodyBodyGyroJerkMag_std|

average values and standard deviation end with "_mean" and "_std" ends.
*subject* is the number of observation 
*activity* is a factor with its letteral definition

# Second Independent Dataset 

**df2** build with pipeline of dplyr has in the first two columns (subject activity) all the possible combinations the levels and the other variables are averaged in each combination sebset. Dimension 180 combinations of 69 variables (*count* variable is not requested but it is added to control that the average is valid)

 