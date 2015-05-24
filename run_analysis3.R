run_analysis <- function(directory, id = 1:332) {
	## read data from UCI HAR Dataset on human activity recognition from SmartPhone data set.
## read two separate datasets from thirty subjects randomly separated into two groups - TEST and TRAIN.
## read data from six activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
##

library("dplyr")
library("tidyr")

dtXtest<-read.table("./test/X_test.txt",sep="\t",fill=FALSE)
dtsubjecttest<-read.table("./test/subject_test.txt",sep="\t",fill=FALSE)
dtytest<-read.table("./test/y_test.txt",sep="\t",fill=FALSE)
bodyaccxtest<-read.table("./test/Inertial Signals/body_acc_x_test.txt",sep="\t",fill=FALSE)
bodyaccytest<-read.table("./test/Inertial Signals/body_acc_y_test.txt",sep="\t",fill=FALSE)
bodyaccztest<-read.table("./test/Inertial Signals/body_acc_z_test.txt",sep="\t",fill=FALSE)
bodygyroxtest<-read.table("./test/Inertial Signals/body_gyro_x_test.txt",sep="\t",fill=FALSE)
bodygyroytest<-read.table("./test/Inertial Signals/body_gyro_y_test.txt",sep="\t",fill=FALSE)
bodygyroztest<-read.table("./test/Inertial Signals/body_gyro_z_test.txt",sep="\t",fill=FALSE)
totalaccxtest<-read.table("./test/Inertial Signals/total_acc_x_test.txt",sep="\t",fill=FALSE)
totalaccytest<-read.table("./test/Inertial Signals/total_acc_y_test.txt",sep="\t",fill=FALSE)
totalaccztest<-read.table("./test/Inertial Signals/total_acc_z_test.txt",sep="\t",fill=FALSE)

dtXtrain<-read.table("./train/X_train.txt",sep="\t",fill=FALSE)
dtsubjecttrain<-read.table("./train/subject_train.txt",sep="\t",fill=FALSE)
dtytrain<-read.table("./train/y_train.txt",sep="\t",fill=FALSE)
bodyaccxtrain<-read.table("./train/Inertial Signals/body_acc_x_train.txt",sep="\t",fill=FALSE)
bodyaccytrain<-read.table("./train/Inertial Signals/body_acc_y_train.txt",sep="\t",fill=FALSE)
bodyaccztrain<-read.table("./train/Inertial Signals/body_acc_z_train.txt",sep="\t",fill=FALSE)
bodygyroxtrain<-read.table("./train/Inertial Signals/body_gyro_x_train.txt",sep="\t",fill=FALSE)
bodygyroytrain<-read.table("./train/Inertial Signals/body_gyro_y_train.txt",sep="\t",fill=FALSE)
bodygyroztrain<-read.table("./train/Inertial Signals/body_gyro_z_train.txt",sep="\t",fill=FALSE)
totalaccxtrain<-read.table("./train/Inertial Signals/total_acc_x_train.txt",sep="\t",fill=FALSE)
totalaccytrain<-read.table("./train/Inertial Signals/total_acc_y_train.txt",sep="\t",fill=FALSE)
totalaccztrain<-read.table("./train/Inertial Signals/total_acc_z_train.txt",sep="\t",fill=FALSE)

dtactivitylabels<-read.table("activity_labels.txt",sep="\t",fill=FALSE)
dtfeatures<-read.table("features.txt",sep="\t",fill=FALSE)

alltest<-cbind(dtsubjecttest,dtytest,dtXtest)
alltrain<-cbind(dtsubjecttrain,dtytrain,dtXtrain)
alltestexpand<-cbind(dtsubjecttest,dtytest,dtXtest,bodyaccxtest,bodyaccytest,bodyaccztest,bodygyroxtest,bodygyroytest,bodygyroztest,totalaccxtest,totalaccytest,totalaccztest)
alltrainexpand<-cbind(dtsubjecttrain,dtytrain,dtXtrain,bodyaccxtrain,bodyaccytrain,bodyaccztrain,bodygyroxtrain,bodygyroytrain,bodygyroztrain,totalaccxtrain,totalaccytrain,totalaccztrain)

colnames(alltest)<-c("subject","activity","measures")
colnames(alltrain)<-c("subject","activity","measures")
colnames(alltestexpand)<-c("subject","activity","measures","X accel","Y accel","Z accel","X gyro","Y gryo","Z gyro","total X accel","total Y accel","total Z accel")
colnames(alltrainexpand)<-c("subject","activity","measures","X accel","Y accel","Z accel","X gyro","Y gryo","Z gyro","total X accel","total Y accel","total Z accel")
alldata<-rbind(alltrain,alltest)
expanddata<-rbind(alltrainexpand,alltestexpand)

alldatanum<-transform(alldata,measures=as.numeric(measures))
##expanddatanum<-transform(expanddata,X accel=as.numeric(measures))
groupalldatanum<-group_by(alldatanum,subject)
orderalldatanum<-alldatanum[order(alldatanum$subject,alldatanum$activity),]
orderexpanddata<-expanddata[order(expanddata$subject,expanddata$activity),]

alldatamean<-group_by(orderalldatanum, subject, activity) %>% summarise_each(funs(mean))
alldatastdev<-group_by(orderalldatanum, subject, activity) %>% summarise_each(funs(sd))
##alldatave<-group_by(orderalldatanum, subject, activity) %>% summarise_each(funs(ave))
##expanddatave<-group_by(orderexpanddatanum, subject, activity) %>% summarise_each(funs(ave))
##expanddataave<-group_by(orderexpanddata, subject, activity) %>% summarise_each(funs(ave))

i<-1
j<-1
k<-1
meandata<-data.frame()
stdevdata<-data.frame()
obscount <- dim(alldatanum[1])
activityrange<-range(orderalldatanum$activity)
activitycount<-activityrange[2]
measuresmean<-data.frame()
measuressd<-data.frame()
chardtactivitylabels<-as.character(dtactivitylabels)

for (i in 1:obscount[1]) {
##   activitynum<-alldatamean$activity[i]
	if (alldatamean$activity[i] == 1)
	    alldatamean$activity[i]<-c("WALKING")
	if (alldatamean$activity[i] == 2)
	    alldatamean$activity[i]<-c("WALKING_UPSTAIRS")
	if (alldatamean$activity[i] == 3)
	    alldatamean$activity[i]<-c("WALKING_DOWNSTAIRS")
	if (alldatamean$activity[i] == 4)
	    alldatamean$activity[i]<-c("SITTING")
	if (alldatamean$activity[i] == 5)
	    alldatamean$activity[i]<-c("STANDING")
	 if (alldatamean$activity[i] == 6)
	    alldatamean$activity[i]<-c("LAYING")
	 
	i<-i+1
}
for (i in 1:obscount[1]) {
##    activitynum<-expanddata$activity[i]
	if (orderexpanddata$activity[i] == 1)
	    orderexpanddata$activity[i]<-c("WALKING")
	if (orderexpanddata$activity[i] == 2)
	    orderexpanddata$activity[i]<-c("WALKING_UPSTAIRS")
	if (orderexpanddata$activity[i] == 3)
	    orderexpanddata$activity[i]<-c("WALKING_DOWNSTAIRS")
	if (orderexpanddata$activity[i] == 4)
	    orderexpanddata$activity[i]<-c("SITTING")
	if (orderexpanddata$activity[i] == 5)
	    orderexpanddata$activity[i]<-c("STANDING")
	 if (orderexpanddata$activity[i] == 6)
	    orderexpanddata$activity[i]<-c("LAYING")
	 
	i<-i+1
}

alldatameanstdev<-cbind(alldatamean,alldatastdev[3])
colnames(alldatameanstdev)<-c("subject","activity","mean","std dev")

write.table(alldatameanstdev,file="HARUS-tidy.txt",sep= "  ",row.name=FALSE)

write.table(orderexpanddata,file="Expanded HARUS-tidy.txt",sep= "  ",row.name=FALSE)

}