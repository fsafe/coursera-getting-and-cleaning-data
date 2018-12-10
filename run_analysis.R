##############################################################################################
#                   golbal variables used in the script                                      #
##############################################################################################

downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloadDirectory <- paste0(getwd(),"/download")
downloadFileName <- "data.zip"

dataFilesList <- list(activityFile = 'activity_labels.txt',featuresFile = 'features.txt',subjTrainFile = 'subject_train.txt',
                   xTrainFile = 'X_train.txt',yTrainFile = 'y_train.txt',subjTestFile = 'subject_test.txt',
                   xTestFile = 'X_test.txt',yTestFile = 'y_test.txt')

##############################################################################################
#    create download directory (if needed), set working directory, download and unzip file   # 
##############################################################################################

if(!file.exists(downloadDirectory))  {
  dir.create(downloadDirectory)
}

setwd(downloadDirectory)

if(!file.exists(downloadFileName))  {
  download.file(downloadUrl,downloadFileName,method = "curl")
}
unzip(downloadFileName)

#######################################################################################################
#   Part 1. Merge the training and the test sets to create one data set.                              #
#######################################################################################################

# create list containing relative the paths of all required files.
requiredFilesPettern <- paste0("^(",paste(dataFilesList,collapse = '|'),")$")
rawDataFilePaths <- list.files(pattern = requiredFilesPettern,full.names = TRUE,recursive = TRUE)

# load test set data into separate dataframes. Use filename to seatch for correct pathname
xTest <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$xTestFile,"$"),rawDataFilePaths)],
                    header = FALSE, sep = "", colClasses = "numeric")
yTest <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$yTestFile,"$"),rawDataFilePaths)],
                    header = FALSE, sep = "", colClasses = "integer")
subjectTest <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$subjTestFile,"$"),rawDataFilePaths)],
                          header = FALSE, sep = "", colClasses = "integer")

# load training set data into separate dataframes. Use filename to seatch for correct pathname
xTrain <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$xTrainFile,"$"),rawDataFilePaths)],
                     header = FALSE, sep = "", colClasses = "numeric")
yTrain <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$yTrainFile,"$"),rawDataFilePaths)],
                     header = FALSE, sep = "", colClasses = "integer")
subjectTrain <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$subjTrainFile,"$"),rawDataFilePaths)],
                           header = FALSE, sep = "", colClasses = "integer")

# combine test set and training set into one dataframe : df
df <- cbind(rbind(xTrain,xTest),rbind(subjectTrain,subjectTest),rbind(yTrain,yTest))

#######################################################################################################  
#   Part 2. Extracts only the measurements on the mean and standard deviation for each measurement.   #
#######################################################################################################


# load feature index numbers and feature names into a two column dataframe: header
features <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$featuresFile,"$"),rawDataFilePaths)],
                     header = FALSE, sep = " ", stringsAsFactors = FALSE)

# store vector of indcies of features dataframe which contain the phrase   
# "mean()" or "std()" and append index of subject ID and activity in df to same vector : idx
idx <- c(grep("mean\\(\\)|std\\(\\)",features[,2]),length(df)-1,length(df))

# extract columns of df and features using indices in idx vector.
# we need to exlcude from features last two indices of idx because
# features does not have subject ID and activity 
df <- df[,idx]
features <- features[head(idx,n=-2),]

# add sujectId and actiityLabel to features and store the result in a vector: features
features <- c(features[,2],"subjectId","activityLabel")

# assign features to column names of df
colnames(df) <- features

################################################################################################
#   Part 3. Uses descriptive activity names to name the activities in the data set             #
################################################################################################

# load table of activity labels and descriptions (without header) into dataframe: activity
activity <- read.table(rawDataFilePaths[grepl(paste0(dataFilesList$activityFile,"$"),rawDataFilePaths)], header = FALSE, 
                       sep = " ", col.names = c('activityLabel','activityDescription'))

# merge df and activity data frames and assign back to df
# drop activityLabel column
df <- merge(df,activity, all.x = TRUE)
df <- subset(df, select=-activityLabel)

###############################################################################################
#   Part 4. Appropriately label the data set with descriptive variable names.                 #
###############################################################################################

# column names need to be retrieved again because merge changed the order
features <- colnames(df)

# remove extra characters from header names
features <- gsub("[()-]","",features)

# replce first "t" in header names with "time"
features <- gsub("^t","time",features)

# replce first "f" in header names with "frequency"
features <- gsub("^f","frequency",features)

# capatalizing first letter of "mean" and "std" in order to convert to 
# lowerCamelCase as "mean" and "std" always appear in the middle of the column name
features <- gsub("mean","Mean",features)
features <- gsub("std","Std",features)

# some column names have the word Body repeated in them
# this needs to be removed
features <- gsub("BodyBody","Body",features)

# assign header to column names of df
colnames(df) <- features

###########################################################################################
#     Part 5. From the data set in step 4, create a second, independent tidy data set     #
#             with the average of each variable for each activity and each subject.       #                                                                             #
###########################################################################################

df2 <- aggregate(x = list(df[,head(colnames(df),n=-2)]),by = list(df$activityDescription,df$subjectId),mean)
colnames(df2)[1] <- "activity"
colnames(df2)[2] <- "subjectId"