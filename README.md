# UCI_HAR

** Final test for Coursera Getting and Cleaning Data Course **

There is just one script called "run_analysis.R" that performs all the requests.
The file is commented in order to specify which commands are necessary to answr one of the four questions.
The final requests are simply called

df : the datasest that merges test and traing data
df1: the average datasest with regard the average vs "subject" and "activity"


PS : I considered experiemnatl variables the following:

1) body_acc_x 
2) body_acc_y
3) body_acc_z
4) body_gyro_x
5) body_gyro_y
6) body_gyro_z
7) total_acc_x
8) total_acc_y
9) total_acc_z

the variable X is considered derived from the previous and is included only in the global dataset (df)
and not in the average dataset (df1)
