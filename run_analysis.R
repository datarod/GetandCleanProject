## Coursera Getting and Working with Data - Project
#Get and Clean project
#Get libraries and set wd
library(reshape2)
datadir<-"/Users/rod/github/datascience-Coursera/GetandCleanData/GetandCleanData-CourseProject"
setwd(datadir)

# read in x, y and subjects
train <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="",header=F)
test <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="",header=F)
train[,562] <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="",header=F)
test[,562] <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="",header=F)
train[,563] <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",header=F)
test[,563] <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",header=F)
# read activity labels and features
Activity=read.csv("./UCI HAR Dataset/activity_labels.txt",sep="",header=F)
Features=read.csv("./UCI HAR Dataset/features.txt",sep="",header=F)

#merge it all together
Data_All<-rbind(train,test)

# Now pick to the columns that we want (Mean and Std)
Pick_Columns<- grep(".Mean.*|.*Std.*" ,Features[,2], ignore.case=T)
Features<-Features[Pick_Columns,]
Pick_Columns_All<-c(Pick_Columns,562,563)

# now select the picked columns and added columns from the data, then add names

Data<-Data_All[,Pick_Columns_All]
colnames(Data)<-c(Features$V2,"Activity","Subject")

#put the activity labels into the data
curact=1
for (curactlabel in Activity$V2){
        Data$Activity<-gsub(curact,curactlabel,Data$Activity)
        curact=curact+1
}

# set the activities to be factors
Data$Activity<-as.factor(Data$Activity)
Data$Subject<-as.factor(Data$Subject)

#make the tidy data set
tidyM<-melt(Data,id=c("Subject","Activity"))

tidy<-aggregate(Data,by=list(Activity=Data$Activity,Subject=Data$Subject),mean)

write.table(x=tidy,file="./tidy.txt",row.names=T,col.names=T,sep="\t")
write.table(x=tidy,file="./tidyM.txt",row.names=T,col.names=T,sep="\t")


# now do the mean and std dev part
colnames(Features)<-c("FId","featurename")
Features_keep<-subset(Features,grep("mean|std",Features))[,2]
write.table(x=Features_keep,file="./tidyM.txt",row.names=T,col.names=T,sep="\t")
