##########################
# Titanic Survival
# Step 4: Modelling
# Logistic
#########################

rm(list = ls())


#############################
# Importing the data
############################

train <- read.csv(file.choose())
test <- read.csv(file.choose())

str(train)
str(test)

# Converting the data types
train$Name <- as.character(train$Name)
test$Name <- as.character(test$Name)

train$Ticket <- as.character(train$Ticket)
test$Ticket <- as.character(test$Ticket)


##################################
# Splitting the data
###############################

library(caret)

trainingIndexes <- createDataPartition(train$Survived,p=0.8,list = F)

train.data <- train[trainingIndexes,]
test.data <- train[-trainingIndexes,]
 
str(train.data)
str(test.data)

#########################################
# Training the Model
#######################################


# Model1 without future engineering
model1 <- glm(Survived~.,data = train.data[,-c(1,4,9,12,13,14)],family = binomial(link = 'logit'))
summary(model1) #AIC - 626.99

# Model2 with Feature Engineering
model2 <- glm(Survived~.,data = train.data[,-c(1,4,9,13)],family = binomial(link = 'logit'))
summary(model2)  #AIC - 609

anova(model1,model2,test = 'Chisq') 

anova(model2,test='Chisq')

###############################################
# Prediction
##########################################

fitted.results <- predict(model2,newdata=test.data,type = 'response')

fitted.results <- ifelse(fitted.results>0.5,1,0)

###########################################
# Model Evaluation
########################################

cm <- confusionMatrix(table(test.data$Survived,fitted.results))
cm

library(ROCR)
ROCRPred <- prediction(fitted.results, test.data$Survived)
ROCRPerf <- performance(ROCRPred, measure ="tpr", x.measure ="fpr")

par(mfrow = c(1, 1))
plot(ROCRPerf, colorize = TRUE, print.cutoffs.at = seq(0.1,by=0.1),main = "ROC CURVE")
abline(a=0, b=1)

auc <- performance(ROCRPred, measure = "auc")
auc <- auc@y.values[[1]]
auc <- round(auc, 4)
legend (.6,.4,auc, title = "AUC", cex =1)

################################################
# prediction on real test data
#################################################

my_prediction <- predict(model2,newdata = test,type = 'response')

my_prediction <- ifelse(my_prediction>0.5,1,0)

my_sol <- data.frame(PassengerId = test$PassengerId,Survived = my_prediction)

###############################################
# Exporting the Solution
##############################################

setwd('D:\\github\\dataSets\\udemy_datascience\\titanic_kaggle\\solution')
write.csv(my_sol,'my_sol_logit.csv',row.names = F)
