#### run_analysis.R does the following. 

### 1.  Merges the training and the test sets to create one data set.
# The following libraries are used for this process.
library(dplyr)
library(data.table)

setwd("C:/PersonalFiles/DataScience/Coursera/Data Cleaning/Project")
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject_merged <- rbind(subject_train, subject_test)

names(subject_merged) <- "Subject"
names(subject_merged)

X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
X_merged  <- rbind(X_train, X_test)
names(X_merged) <- "Features"

y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y_merged  <- rbind(y_train, y_test)
names(y_merged) <- "Activity"

subjectDS <- subject_merged
X_DS <- X_merged
Y_DS <- y_merged


### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, col.names=c('id', 'name'))
feature_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)

filtered_dataset <- X_DS[, feature_selected_columns]
names(filtered_dataset) <- features[features$id %in% feature_selected_columns, 2]
X_filtered_dataset <- filtered_dataset


### 3. Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))


### 4. Appropriately labels the data set with descriptive variable names.
Y_DS[, 1] = activity_labels[Y_DS[, 1], 2]


### 5. From the data set in step 4, creates a second, independent tidy data set with the average 
###    of each variable for each activity and each subject.
total_DS <- cbind(subjectDS, Y_DS, X_filtered_dataset)
write.table(total_DS, "./UCI HAR Dataset/output/total_DS_with_activity_names.csv")

measurements <- total_DS[, 3:dim(total_DS)[2]]
tidY_DS <- aggregate(measurements, list(total_DS$Subject, total_DS$Activity), mean)
names(tidY_DS)[1:2] <- c('Subject', 'Activity')
write.csv(tidY_DS, "./UCI HAR Dataset/output/tidy_DS.csv")
write.table(tidY_DS, "./UCI HAR Dataset/output/tidy_DS.txt")

