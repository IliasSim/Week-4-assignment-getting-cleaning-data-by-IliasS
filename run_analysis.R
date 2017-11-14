#download and unzip the file 
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./G&Cdata.zip",method = "curl")
unzip("G&Cdata.zip")

#loading the necessary packges
library(data.table)
library(tidyr)

#set the working directory
setwd("UCI HAR Dataset")

#read and combine the test data
testsubject<-read.table("./test/subject_test.txt")
testval<-read.table("./test/X_test.txt")
testlabel<-read.table("./test/y_test.txt")
testset<-cbind(testsubject,testlabel,testval)

#read and combine the train data
trainsubject<-read.table("./train/subject_train.txt")
trainval<-read.table("./train/X_train.txt")
trainlabel<-read.table("./train/y_train.txt")
trainset<-cbind(trainsubject,trainlabel,trainval)

#merges the train and test data sets
mergedset<-rbind(testset,trainset)

#read the features names and extracts only the mean and std measurements
featNames<-read.table("features.txt")
featmeanstd<-grep("mean\\(\\)|std\\(\\)",as.character(featNames$V2))
meanstddata<-mergedset[,c(1,2,featmeanstd+2)]

#gives names to the columns
colnames(meanstddata)<-c("id","activity",as.character(featNames[featmeanstd,2]))

#creates av independent tidy data set with the average of each variable
#for each activity and each subject
splitdataset<-split(meanstddata,list(meanstddata$id,meanstddata$activity))
colmeandata<-sapply(splitdataset,function(x) colMeans(x[,3:68]))

#reforms the data from sapply to a tidy data set
colmeandatadf<-as.data.frame(t(colmeandata))
colmeandatadf<-setDT(colmeandatadf,keep.rownames = TRUE)

#separates the first column of the colmeandatadf into the subject and the activities columns
tidydset<-separate(colmeandatadf,1,c("subject","activities"),extra = "merge")

#turns the activity variable into a factor
activitylabel<-read.table("activity_labels.txt")
tidydset$activities<-factor(tidydset$activities,labels=activitylabel$V2)

#write the tidy_dset ile
write.table(tidydset,file = "tidy_dset.txt",row.names = FALSE, col.names = TRUE)



