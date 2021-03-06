# Getting-and-Cleaning-Data-Course-Project

#run_analysis.R

##As per the assignment this script performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Download the original data

This script assumes that you have already downloaded and unzipped the original Samsung data in a folder called UCI HAR Dataset. If this is not the case, you must first run the script called download_corpus.R. In your R enviroment, load it:

```
source('download_corpus.R')
```

This will download the corpus and unzip it. Now everything is ready for the analysis.

#How to run the analysis

In your R enviroment (in the same folder where the data files are), load the script:

```
source('run_analysis.R')
```

The end result will be a file called tidy_DS.txt' in the output folder.

```
$ ls output/
-rw-rw-r--  225125 final_tidy_dataset.csv
-rw-rw-r--  225122 final_tidy_dataset.txt
-rw-rw-r-- 8338031 total_DS_with_activity_names.csv
```

tidy_DS.csv mirrors the .txt file in .csv format for your convenience. total_DS_with_activity_names.csv is an intermediate file used during the analysis.
 
##Final tidy dataset

Each row in the final, clean dataset contains Subject, Activity, and measures for all required features (i.e., mean or standard deviation).
