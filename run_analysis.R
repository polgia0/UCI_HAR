##
## Pre-work: collecting data
##
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Ucla_smatphone.zip")
unzip("Ucla_smatphone.zip")
file.remove("Ucla_smatphone.zip")
activity<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activity<-activity[,2]
features<-read.table("UCI HAR Dataset/features.txt", header = FALSE)
features<-features[,2]
##
## Task #1
## Merges the training and the test sets to create the whole data set.
##
rdir<-"UCI HAR Dataset/test"
## read file in txt format and store them in single data frames
S<-read.table(paste0(rdir,'/subject_test.txt'), header = FALSE)
y<-read.table(paste0(rdir,'/y_test.txt'), header = FALSE)
X<-read.table(paste0(rdir,'/X_test.txt'), header = FALSE)
## merge data frames with information about measurements
## data frame that collects test experiments is called "dfs"
dfs<-cbind(S,y,X)
## reassigning the name of the columns with meaniful names
names(dfs)<-c("subject","activity",features)
## read files with measurements in txt format and add them to the data frame 
rdir<-paste0(rdir,"/Inertial Signals")
lfile<-dir(rdir)
for (nfil in lfile){
    df<-read.table(paste0(rdir,'/',nfil), header = FALSE)
    names(df)<-paste(sub("_test.txt","",nfil),1:ncol(df),sep="_")
    dfs<-cbind(dfs,df)
}
## repeat more or less the same commands for the train part since the structure of 
## the directory is almost the same
rdir<-"UCI HAR Dataset/train"
## read file in txt format and store them in single data frames
S<-read.table(paste0(rdir,'/subject_train.txt'), header = FALSE)
y<-read.table(paste0(rdir,'/y_train.txt'), header = FALSE)
X<-read.table(paste0(rdir,'/X_train.txt'), header = FALSE)
## merge data frames with information about measurements
## data frame that collect trian experiments is called "dft"
dft<-cbind(S,y,X)
names(dft)<-c("subject","activity",features)
rdir<-paste0(rdir,"/Inertial Signals")
lfile<-dir(rdir)
for (nfil in lfile){
  df<-read.table(paste0(rdir,'/',nfil), header = FALSE)
  names(df)<-paste(sub("_train.txt","",nfil),1:ncol(df),sep="_")
  dft<-cbind(dft,df)
}
## all data are read. I combine the two data frames row-wise in : "df" = answer to task 1
df<-rbind(dfs,dft)
## delete working area of memory unnecessary objects
rm(S,X,y,dfs,dft)
##
## Task #2
## Extracts only the measurements on the mean and standard deviation for each measurement.
##
## extract variables that contain "-mean()" and "-std()" together with "subject" and "activity"
mean_std<-features[c(grep("mean\\(\\)",features),grep("std\\(\\)",features))]
df1<-df[,c("subject","activity",mean_std)]
##
## Task #3
## Uses descriptive activity names to name the activities in the data set
##
## the task is solved transforming in factor the activity column and reassigning the name of the levels
df1$activity<-as.factor(df1$activity)
levels(df1$activity)<-activity
##
## Task #4
## Appropriately labels the data set with descriptive variable names.
##
features<-names(df1)[3:ncol(df1)]
n<-length(features)
features_mean<-paste(sub("-mean\\(\\)","",features[1:(n/2)]),'mean',sep="_")
features_std<-paste(sub("-std\\(\\)","",features[((n/2)+1):n]),'std',sep="_")
names(df1)[3:ncol(df1)]<-c(features_mean,features_std)
##
## Task #5
## From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
##
## The new tibble is called df1. It has in the first two columns all the possible combinations
## of subject and activity. Then, there is the count of the samples that fall in the combination 
## (this variable is not requied but it is usefull to see if data have the same pupulation).
## Then, each column represents the mean of the variable that names the columns.
## Each column has one variable, each line has a single combination (tidy request).
##
# Data manipulation is better performed with the additional libraries:
library(tidyverse)
# the global data frame with all the measures is transformed in "tibble"
df1<-as_tibble(df1)
df2<-df1 %>% group_by(subject,activity) %>% dplyr::summarise(Count=n())
for (nvar in names(df1)[3:ncol(df1)]){
  df2<-cbind(df2,df1 %>% 
             group_by(subject,activity) %>% 
             dplyr::summarise(Mean=mean(get(nvar),na.rm=TRUE)) 
             %>% .["Mean"])
  names(df2)[ncol(df2)]<-nvar
}
# print the had of the new tibble
write.table(df2,"tidy_dataset.txt",row.names=FALSE)