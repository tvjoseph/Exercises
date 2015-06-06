
## Step 1
## download data from the net using the download command

setwd("D:/R/")
setInternet2(T) ## This command is required to set the internet2 environment variable in windows for R
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "20dataset.zip"

download.file(fileurl,destfile = filename)

## Step 2 - Read the features and labels data and store in a table

features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Step 3

## Reading all Training related data into various tables
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
bodyacc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
bodyacc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
bodyacc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
bodygyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
bodygyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
bodygyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
totalacc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
totalacc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
totalacc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

## Step 4
## Reading all the test related data into a table
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
bodyacc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
bodyacc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
bodyacc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
bodygyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
bodygyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
bodygyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
totalacc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
totalacc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
totalacc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

## Step 5

## Cleaning the Training related data by adding the required activity labels and varible names

## Applying activity labels to the y_train data

for (i in 1:7352) {
  if(y_train$V1[i] == 1) {y_train$V1[i] <- paste("WALKING")}
  else if(y_train$V1[i] == 2) {y_train$V1[i] <- paste("WALKING_UPSTAIRS")}
  else if(y_train$V1[i] == 3) {y_train$V1[i] <- paste("WALKING_DOWNSTAIRS")}
  else if(y_train$V1[i] == 4) {y_train$V1[i] <- paste("SITTING")}
  else if(y_train$V1[i] == 5) {y_train$V1[i] <- paste("STANDING")}
  else  {y_train$V1[i] <- paste("LAYING")}
}

## Naming the x_train data with the features dataframe
y <- names(X_train)
for (i in 1:561) { y[i] <- paste(features[i,2])}
names(X_train) <- c(y)


## Combining y_train with X_train to get the labels on to the training data
names(subject_train) <- c("subject")
names(y_train) <- c("Activity")
new_x_train <- cbind(y_train,subject_train,X_train)

## Step 6

## Cleaning the Test related data by adding the required activity labels and varible names

## Applying labels to the y_test data which has 2947 rows

for (i in 1:2947) {
  if(y_test$V1[i] == 1) {y_test$V1[i] <- paste("WALKING")}
  else if(y_test$V1[i] == 2) {y_test$V1[i] <- paste("WALKING_UPSTAIRS")}
  else if(y_test$V1[i] == 3) {y_test$V1[i] <- paste("WALKING_DOWNSTAIRS")}
  else if(y_test$V1[i] == 4) {y_test$V1[i] <- paste("SITTING")}
  else if(y_test$V1[i] == 5) {y_test$V1[i] <- paste("STANDING")}
  else  {y_test$V1[i] <- paste("LAYING")}
}

## Naming the x_test data with the features dataframe. This step adds descriptive names to the test data frame
z <- names(X_test)
for (i in 1:561) { z[i] <- paste(features[i,2])}
names(X_test) <- c(z)


## Combining y_test with X_test & Subject data  to associate the activity labels & Subjects on to the test data
names(subject_test) <- c("subject") ## This step renames the subject column variable
names(y_test) <- c("Activity")
new_x_test <- cbind(y_test,subject_test,X_test)

## Step 7

## Combining the training data and test data to form one dataset

new_combined <- rbind(new_x_train,new_x_test)

## Step 8

## selecting the data based on mean & SD. The below mentioned columns are the ones which are related either to a mean value of a SD value

newcombinedata <- new_combined[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,426,427,428,429,430,431,505,506,518,519,531,532,544,545)]

## Change the names of the variables. This step is to give valid names to the selected variables
temp <- names(newcombinedata)
temp1 <- make.names(temp)
names(newcombinedata) <- c(temp1)

##Step 9

## Finding the means of each measurement, activity wise and subject wise using the "aggregate" command

All_data_mean <- aggregate(newcombinedata[,!names(newcombinedata) %in% c("Activity", "subject")],by=list(Activity=newcombinedata$Activity,subject=newcombinedata$subject),FUN=mean)

##Step 10

Saving the data into a text file using the write.table command

write.table(All_data_mean,file = "./Clean_data.txt",sep= ";", row.names = F)
