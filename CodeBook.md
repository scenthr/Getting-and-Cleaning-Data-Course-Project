##This is a Code Book for Getting and Cleaning Data course project      

...that describes the variables, the data, and any transformations that were performed to clean up the data

##Data Source
Data was taken from the Coursera web site in .zip format. More info on this
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ) 

##Transformations

### Data directories
Data was downloaded from the Courser web site. In the current R working directory new folder ./data was created if one is not already existing. 
Downloaded file is stored as "CourseProjectData.zip" in the ./data folder and unzipped in the same folder. The new folder name is ./data/UCI HAR Dataset and this folder holds all the files used in farther transformation.
Data is split into train and test folders.

###Data transformation
From the train folder are taken 3 files, loaded into R and merged together. And the same is done for the 3 files in the test folder. Files from folders "Inertial Signals" were not merged. Then the data from test and train folders was merged into one final data frame. Proper names were added to the columns, values of the Activity column. On the final data frame the requested transformations were performed so that a new tidy data set with the average of each variable for each activity and each subject was created. This tidy data is finally exported to a file named "TidyDataSet.csv" on path ./data/UCI HAR Dataset/. 

##Variables:
fileURL - contains the path of the file which contains data for the course
project
activitylabels - contains Activity labels
subjecttrainx - contains data from file "./data/UCI HAR Dataset/train/subject_train.txt"
ytrainx - contains data from file "./data/UCI HAR Dataset/train/y_train.txt"
trainx <- contains data from file "./data/UCI HAR Dataset/train/X_train.txt"
subjecttestx - contains date from file "./data/UCI HAR Dataset/test/subject_test.txt"
ytestx - contains data from file "./data/UCI HAR Dataset/test/y_test.txt"
testx - contains data from file "./data/UCI HAR Dataset/test/X_test.txt"
data - final combined data set (testx+trainx)
datafiltered - filtered dataset
agg - final aggregated data set which forms the file "TidyDataSet.csv"

