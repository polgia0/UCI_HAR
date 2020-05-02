Source Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
documents original data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data stored in repository under directory: UCI HAR Dataset
The data directory is created at the beginning after data download.

* Raw variables *

subject : taken from files subject_test.txt and subject_train.txt
activity: taken from files y_test.txt and y_train.txt

Measurements Variables: 

561 variables with names in features.txt and values in files: X_test.txt and X_train.txt

 9  variables with names : body_acc_x body_acc_y body_acc_z
                           body_gyro_x body_gyro_y body_gyro_z
                           total_acc_x total_acc_y total_acc_z
    located in single file in Internal Signals directories
    
* Complete DataSet *

df  achieved by row-wise merging test and train set, dimension: 10299 obs. of 175 variables

* Extracted DaSet with only meand and sds *

df1 achieved by selection variables with "-mean()" or "-std()" in the name, dimension: 10299 of 68 variables

    then:
    
    1) replaced code in variable activity with the literal definition in file activity_labels.txt
    2) appropriately labeled the variables with new names
    
    Names of variables in the extracted dataset:
    
 [1] "subject"                   "activity"                  "tBodyAcc-X_mean"           "tBodyAcc-Y_mean"          
 [5] "tBodyAcc-Z_mean"           "tGravityAcc-X_mean"        "tGravityAcc-Y_mean"        "tGravityAcc-Z_mean"       
 [9] "tBodyAccJerk-X_mean"       "tBodyAccJerk-Y_mean"       "tBodyAccJerk-Z_mean"       "tBodyGyro-X_mean"         
[13] "tBodyGyro-Y_mean"          "tBodyGyro-Z_mean"          "tBodyGyroJerk-X_mean"      "tBodyGyroJerk-Y_mean"     
[17] "tBodyGyroJerk-Z_mean"      "tBodyAccMag_mean"          "tGravityAccMag_mean"       "tBodyAccJerkMag_mean"     
[21] "tBodyGyroMag_mean"         "tBodyGyroJerkMag_mean"     "fBodyAcc-X_mean"           "fBodyAcc-Y_mean"          
[25] "fBodyAcc-Z_mean"           "fBodyAccJerk-X_mean"       "fBodyAccJerk-Y_mean"       "fBodyAccJerk-Z_mean"      
[29] "fBodyGyro-X_mean"          "fBodyGyro-Y_mean"          "fBodyGyro-Z_mean"          "fBodyAccMag_mean"         
[33] "fBodyBodyAccJerkMag_mean"  "fBodyBodyGyroMag_mean"     "fBodyBodyGyroJerkMag_mean" "tBodyAcc-X_std"           
[37] "tBodyAcc-Y_std"            "tBodyAcc-Z_std"            "tGravityAcc-X_std"         "tGravityAcc-Y_std"        
[41] "tGravityAcc-Z_std"         "tBodyAccJerk-X_std"        "tBodyAccJerk-Y_std"        "tBodyAccJerk-Z_std"       
[45] "tBodyGyro-X_std"           "tBodyGyro-Y_std"           "tBodyGyro-Z_std"           "tBodyGyroJerk-X_std"      
[49] "tBodyGyroJerk-Y_std"       "tBodyGyroJerk-Z_std"       "tBodyAccMag_std"           "tGravityAccMag_std"       
[53] "tBodyAccJerkMag_std"       "tBodyGyroMag_std"          "tBodyGyroJerkMag_std"      "fBodyAcc-X_std"           
[57] "fBodyAcc-Y_std"            "fBodyAcc-Z_std"            "fBodyAccJerk-X_std"        "fBodyAccJerk-Y_std"       
[61] "fBodyAccJerk-Z_std"        "fBodyGyro-X_std"           "fBodyGyro-Y_std"           "fBodyGyro-Z_std"          
[65] "fBodyAccMag_std"           "fBodyBodyAccJerkMag_std"   "fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_std" 

average values and standard deviation end with "_mean" and "_std" ends.
subject is the number of observation 
activity is a factor with its letteral definition

* Second Independent Dataset 

df2 build with pipeline of dplyr has in the first two columns (subject activity) all the possible combinations the
    levels and the other variables are averaged in each combination sebset.

 