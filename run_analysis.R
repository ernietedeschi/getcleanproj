# run_analysis.R
### This script downloads the Human Activity Recognition Using Smartphones dataset, 
### merges the test and train datasets, extracts measures of the mean and standard deviation,
### tidys the data, and creates a summary dataset with only the means by subject id, activity,
### and measure.

library(plyr)
library(tidyr)

### STEP 1: Download and unzip the dataset.

file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
name <- "temp.zip"
download.file(file, name)
unzip(name)
setwd("./UCI HAR Dataset")

### STEP 2: Extract the labels to be used for variable names and activity. 

features <- read.table("features.txt")
act_labels <- read.table("activity_labels.txt")
colnames(act_labels) <- c("actnum", "activity")

### STEP 3: Create data sets from the test and train data.

test <- read.table("test/X_test.txt") 
colnames(test) <- features$V2
test$id <- read.table("test/subject_test.txt")$V1
test$actnum <- read.table("test/Y_test.txt")$V1
test$dataset <- "test"

train <- read.table("train/X_train.txt")
colnames(train) <- features$V2
train$id <- read.table("train/subject_train.txt")$V1
train$actnum <- read.table("train/Y_train.txt")$V1
train$dataset <- "train"

### STEP 4: Merge test and train into a new data set called all, and remove test and train.

all <- rbind(train, test)
rm(train, test)
all <-merge(all, act_labels, by = "actnum", all = TRUE)

### STEP 5: Extract only the variable names that include "mean" and "std"

all <- all[, (names(all) == "id" | names(all) == "activity" | names(all) == "dataset" | grepl("mean()", names(all)) | grepl("std()", names(all)))]

### STEP 6: Tidy the data set.

all <- gather(all, measure, value, c(-id, -activity, -dataset))

### STEP 7: Create a summary data set that only includes means, and export.

all_summary <- summarize(group_by(all, id, activity, measure), mean(value))
write.table(all_summary, "all_summary.txt")
