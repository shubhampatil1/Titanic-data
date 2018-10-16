library(dplyr)
library(caret)
library(gains)
setwd("E://data science//predictive analysis//T2 logistic regression//all")
data=read.csv("train.csv") #importing train data set
dim(data) #dimention chech
names(data) #number of varibles present
summary(data) #summary statistics to understand data better
colSums(is.na(data)) #NA values check and we found that Age variable has 177 NA's
data$Name=as.character(data$Name) #converting name class to charecter for NA imputation
data$Title <- gsub('(.*, )|(\\..*)', '', data$Name) #extracting specific strings and deriving new variable for NA imputation purpose
data$Title[data$Title == 'Ms']          <- 'Miss'

#NA imputation using NAME variable
data$Age[data$Title == 'Dr' & is.na(data$Age)==TRUE]<- mean(data$Age[data$Title == 'Dr' & is.na(data$Age)==FALSE]) 
data$Age[data$Title == 'Master'& is.na(data$Age)==TRUE]<- mean(data$Age[data$Title == 'Master' & is.na(data$Age)==FALSE])
data$Age[data$Title == 'Miss'& is.na(data$Age)==TRUE]<- mean(data$Age[data$Title == 'Miss' & is.na(data$Age)==FALSE])
data$Age[data$Title == 'Mr'& is.na(data$Age)==TRUE]<- mean(data$Age[data$Title == 'Mr' & is.na(data$Age)==FALSE])
data$Age[data$Title == 'Mrs'& is.na(data$Age)==TRUE]<- mean(data$Age[data$Title == 'Mrs' & is.na(data$Age)==FALSE])
summary(data$Age)

#Removing unwanted data and deriving new variable Family
data=data[,c(-1,-4,-9,-11,-12,-13)]
data$family=data$SibSp+data$Parch
data=data[,c(-5,-6)]
summary(data)

#Creating sample of train and test data
set.seed(100)
ind=sample(nrow(data),0.70*nrow(data),replace=F)
tr=data[ind,]
ts=data[-ind,]
dim(ts)

# model building using logistic regression
mod1=glm(Survived~.,family="binomial",data = tr)
summary(mod1)
mod2=glm(Survived~Pclass+Sex+Age+family,family="binomial",data = tr)
summary(mod2)
step(mod2,direction="both")
table(data$Survived)

# model accuracy check
pred<-predict(mod2,type="response",newdata =ts)
head(pred)
table(data$Survived)/nrow(data)
pred2<-ifelse(pred>=0.3838384,1,0)
pred2<-as.factor(pred2)
ts$Survived=as.factor(ts$Survived)
confusionMatrix(pred2,ts$Survived,positive="1")
ts$Survived=as.numeric(ts$Survived)
pred2=as.numeric(pred2)
x=gains(ts$Survived,predict(mod2,type="response",newdata =ts),groups = 10)
x
plot.gains(x,position_dodge(x))

#model accuracy 82.09%

#applying model on test data set
t=read.csv("test.csv")
t$Name=as.character(t$Name)
t$Title <- gsub('(.*, )|(\\..*)', '', t$Name)
t$Title[t$Title == 'Ms']          <- 'Miss'
t$Age[t$Title == 'Dr' & is.na(t$Age)==TRUE]<- mean(t$Age[t$Title == 'Dr' & is.na(t$Age)==FALSE])
t$Age[t$Title == 'Master'& is.na(t$Age)==TRUE]<- mean(t$Age[t$Title == 'Master' & is.na(t$Age)==FALSE])
t$Age[t$Title == 'Miss'& is.na(t$Age)==TRUE]<- mean(t$Age[t$Title == 'Miss' & is.na(t$Age)==FALSE])
t$Age[t$Title == 'Mr'& is.na(t$Age)==TRUE]<- mean(t$Age[t$Title == 'Mr' & is.na(t$Age)==FALSE])
t$Age[t$Title == 'Mrs'& is.na(t$Age)==TRUE]<- mean(t$Age[t$Title == 'Mrs' & is.na(t$Age)==FALSE])
names(t)
t$family=t$SibSp+t$Parch
t=t[,c(-3,-6,-7,-8,-10,-11,-12)]
t$Pclass=as.numeric(t$Pclass)

pred<-predict(mod2,type="response",newdata =t)
head(pred)
pred2<-ifelse(pred>=0.3838384,1,0)
head(pred2)
pred2
Survived=pred2
result_test=data.frame(t$PassengerId,Survived)
write.csv(result_test,"result_test.csv",row.names = F)

