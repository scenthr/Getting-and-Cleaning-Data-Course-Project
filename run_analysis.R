##This is the file wich hold the code for perfomring the analysis for
##Course Project on "Getting and Cleaning Data"
##by Jeff Leek, PhD, Brian Caffo, PhD, Roger D. Peng, PhD

#Here we create a local directory if it doesnt exists and download the needed
#data file
if(!file.exists("./data")){dir.create("./data")}
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data/CourseProjectData.zip",method="auto")
unzip("./data/CourseProjectData.zip",exdir="./data")

###Step 1 - Merging the training and the test sets to create one data set.

#Loading names of the variables for naming purposes
activitylabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

##Merging Train dataset first

#Starting from Train data and reading data to local variables
subjecttrainx <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
ytrainx <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

###Step 3 and 4 - Using descriptive activity names to name the activities in the 
###               data set and appropriately labeling the data set with 
###               descriptive variable names. 

#Naming the testx dataset columns
colnames(trainx) <- features$V2
ytrainx <- factor(ytrainx$V1)
levels(ytrainx) <- activitylabels$V2

#Merging new data columns to the main dataset
subjecttrainx <- cbind(subjecttrainx,ytrainx)
trainx <- cbind(subjecttrainx,trainx)
colnames(trainx)[1] <- "Subject"
colnames(trainx)[2] <- "Activity"

##Folowing is the merging of Test dataset

#Test data - reading data to local variables
subjecttestx <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
ytestx <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

###Step 3 and 4 - Using descriptive activity names to name the activities in the 
###               data set and appropriately labeling the data set with 
###               descriptive variable names. 

#Naming the testx dataset columns
colnames(testx) <- features$V2
ytestx <- factor(ytestx$V1)
levels(ytestx) <- activitylabels$V2

#Merging new data columns to the main dataset
subjecttestx <- cbind(subjecttestx,ytestx)
testx <- cbind(subjecttestx,testx)
colnames(testx)[1] <- "Subject"
colnames(testx)[2] <- "Activity"

##Finally merging the trainx and testx into one dataset
data <- rbind(trainx,testx)

###Step 2 - Extracts only the measurements on the mean and standard deviation 
###         for each measurement.
ismeanorstd <- grep("[Mm]ean|[Ss]td",colnames(data))
datafiltered <- data[,ismeanorstd]
write.table(datafiltered,"./data/UCI HAR Dataset/FilteredData.csv",
            sep=",",
            row.names=FALSE)

###Step 5 - Creates a second, independent tidy data set with the average of each 
###         variable for each activity and each subject. 
agg <- aggregate(. ~ Activity + Subject,
                 data=datafilterd,
                 FUN=mean,
                 na.action=na.omit)

write.table(agg,"./data/UCI HAR Dataset/TidyDataSet.csv",
            sep=",",
            row.names=FALSE)