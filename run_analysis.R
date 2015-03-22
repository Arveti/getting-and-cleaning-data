library("reshape2")
cleandatafile<-"cleaned Data File.txt"
extractedfeatures<-c(1,2,3,4,5,6,
41, 42, 43, 44, 45, 46, 81, 82, 83, 
84, 85, 86, 121, 122, 123, 124, 125, 
126, 161,162, 163, 164, 165, 166, 201,
202, 214,215, 227, 228, 240, 241, 253,
254, 266,267, 268, 269, 270, 271, 345,
346, 347,348, 349, 350, 424, 425, 426, 
427, 428,429, 503, 504, 516, 517, 529, 530, 542, 543)
efnames<-c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
"tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", 
"tGravityAcc-mean()-Y","tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", 
"tGravityAcc-std()-Z","tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
"tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", 
"tBodyGyro-mean()-Y","tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", 
"tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z",
"tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()",
"tBodyAccMag-std()","tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()",
"tBodyAccJerkMag-std()","tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", 
"tBodyGyroJerkMag-std()","fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
"fBodyAcc-std()-X","fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", 
"fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y",
"fBodyAccJerk-std()-Z","fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", 
"fBodyGyro-std()-X","fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", 
"fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", 
"fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", 
"fBodyBodyGyroJerkMag-std()")
activities<-c(1, 2, 3, 4, 5, 6)
activitynames <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
helpfunconsole<- function(...) {
cat("[run_analysis Result]", ...,"\n")
}
featuresfile <-function(name){
paste("X_", name, ".txt", sep = "")
}
activitiesfile<-function(name){
paste("Y_", name, ".txt", sep = "")
}
subjectsfile <- function(name){
paste("subject_", name, ".txt", sep = "")
}
getdata <-function(dir, name){

realdir<- file.path(dir, name)
featuresname <-file.path(realdir, featuresfile(name))
activitiesname <- file.path(realdir, activitiesfile(name))
subjectsname <- file.path(realdir, subjectsfile(name))
helpfunconsole("Getting dataset:", realdir)
helpfunconsole(" reading features -")
featurestest <- read.table(featuresname)[extractedfeatures]
names(featurestest) <- efnames
cleandata <- featurestest
helpfunconsole(" reading activities -")
activitiestest <- read.table(activitiesname)
names(activitiestest) <- c("activity")
activitiestest$activity <- factor(activitiestest$activity, levels = activities, labels = activitynames)
cleandata <- cbind(cleandata, activity = activitiestest$activity)
helpfunconsole(" reading subjects...")
subjectstest <- read.table(subjectsname)
names(subjectstest) <- c("subject")
cleandata <- cbind(cleandata, subject = subjectstest$subject)
cleandata
}

runanalysis <- function(dir) {
helpfunconsole("Getting and Cleaning Data Course Project")
helpfunconsole("Name: Guru")
helpfunconsole(".....")
helpfunconsole("Beginning...")
helpfunconsole("Preparing for analysis.")
helpfunconsole("Reading datasets---")
test<-getdata(dir, "test")
train <-getdata(dir, "train")
helpfunconsole("Joining datasets---")
fulldata <- rbind(test, train)
helpfunconsole("Melting.")
longfulldata <- melt(fulldata, id = c("subject", "activity"))
helpfunconsole("Dcasting.")
widefulldata<- dcast(longfulldata, subject + activity ~ variable, mean)
cleanedfulldata <- widefulldata
cleanfilename <- file.path(dir, cleandatafile)
helpfunconsole("Saving clean data to file:", cleanfilename)
write.table(cleanedfulldata, cleanfilename, row.names = FALSE, quote = FALSE)
}
runanalysis("D:/Data/R Work/UCI HAR Dataset")