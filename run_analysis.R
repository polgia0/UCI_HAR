## Dataset are stored in the subdirectory "data" as received.
## The working directory is never changed

## Task #1
## Merges the training and the test sets to create the whole data set.
##
rdir<-"data/test"
# read file in txt format and store them in single data frames
S<-read.table(paste0(rdir,'/subject_test.txt'), header = FALSE, dec = ".")
y<-read.table(paste0(rdir,'/y_test.txt'), header = FALSE, dec = ".")
X<-read.table(paste0(rdir,'/X_test.txt'), header = FALSE, dec = ".")
# merge data frames with information about measurements
# data frame that collects test experiments is called "dfs"
dfs<-cbind(S,y,X)
# reassigning the name of the columns with meaniful names
names(dfs)<-c("subject","activity",paste0("x",1:ncol(X)))
# read files with measurements in txt format and add them to the data frame 
rdir<-paste0(rdir,"/Inertial Signals")
lfile<-dir(rdir)
for (nfil in lfile){
    df<-read.table(paste0(rdir,'/',nfil), header = FALSE, dec = ".")
    names(df)<-paste(sub("_test.txt","",nfil),1:ncol(df),sep="_")
    dfs<-cbind(dfs,df)
}
# repeat more or less the same commands for the train part since the structure of 
## the directory is almost the same
rdir<-"data/train"
# read file in txt format and store them in single data frames
S<-read.table(paste0(rdir,'/subject_train.txt'), header = FALSE, dec = ".")
y<-read.table(paste0(rdir,'/y_train.txt'), header = FALSE, dec = ".")
X<-read.table(paste0(rdir,'/X_train.txt'), header = FALSE, dec = ".")
# merge data frames with information about measurements
# data frame that collect trian experiments is called "dft"
dft<-cbind(S,y,X)
names(dft)<-c("subject","activity",paste0("x",1:ncol(X)))
rdir<-paste0(rdir,"/Inertial Signals")
lfile<-dir(rdir)
for (nfil in lfile){
  df<-read.table(paste0(rdir,'/',nfil), header = FALSE, dec = ".")
  names(df)<-paste(sub("_train.txt","",nfil),1:ncol(df),sep="_")
  dft<-cbind(dft,df)
}
# all data are read. I combine the two data frames row-wise in : "df" = answer to task 1
df<-rbind(dfs,dft)
# delete working area of memory unnecessary objects
rm(S,X,y,dfs,dft)
##
## Task #2
## Extracts only the measurements on the mean and standard deviation for each measurement.
##
# Data manipulation is better performed with the additional libraries:
library(tidyverse)
library(matrixStats)
# the global data frame with all the measures is transformed in "tibble"
df<-as_tibble(df)
# Average and standard deviation of each sub-set of variables is done with dplyr
# for standard deviation the function rowSds is used from matrixStats
df<-df %>% mutate(x_mean = rowMeans(select(.,starts_with("x")), na.rm = TRUE))
df<-df %>% mutate(x_sds = rowSds(as.matrix(select(.,starts_with("x"))), na.rm = TRUE))
lvar<-paste(sub("_train.txt","",lfile))
for (nvar in lvar){
  # names of the average and sds columns are built adding the additional definition to the variable names
  df[paste(nvar,'mean',sep='_')]<-rowMeans(select(df,starts_with(nvar)), na.rm = TRUE)
  df[paste(nvar,'sds',sep='_')]<-rowSds(as.matrix(select(df,starts_with(nvar))), na.rm = TRUE)
}
# the df data frame has variables mean and sds as its rightmost columns
# print the had of the global tibble
head(df,1)
##
## Task #3
## Uses descriptive activity names to name the activities in the data set
##
## the task is solved transforming in factor the activity column and reassigning the name of the levels
df$activity<-as.factor(df$activity)
activity<-read.table("data/activity_labels.txt", header = FALSE, dec = ".")
levels(df$activity)<-activity$V2
##
## Task #3
## Appropriately labels the data set with descriptive variable names.
##
## the task was almost solved in task 2: each variables is identified by its name followed 
## by "_mean" or "_sds". I reduced the dimensions of the tibble to the most important variables 
## I put first the averages of each measured followed by the sds
df<-df %>% select( subject,activity,ends_with("_mean"),ends_with("_sds"))
##
## Task #4
## From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
##
## The new tibble is called df1. It has in the first two columns all the possible combinations
## of subject and activity. Then, there is the count of the samples that fall in the combination 
## (this variable is not requied but it is usefull to see if data have the same pupulation).
## Then, each column represents the mean of the variable that names the columns.
## Each column has one variable, each line has a single combination (tidy request).
##
df1<-df %>% group_by(subject,activity) %>% dplyr::summarise(Count=n())
for (nvar in lvar){
  df1<-cbind(df1,df %>% group_by(subject,activity) %>% dplyr::summarise(Mean=mean(get(paste0(nvar,"_mean")),na.rm=TRUE)) %>% .["Mean"])
  names(df1)[ncol(df1)]<-nvar
}
# print the had of the new tibble
head(df1)