Churn_data <- read.csv(file.choose())

str(Churn_data)

Churn_data$Churn <- factor(Churn_data$Churn)
str(Churn_data)

#In sample prediction
logit_model <- glm(Churn ~ ., data = Churn_data, family = "binomial")

#Predict Churn column
Churn_data$Churn_Predicted <- predict(logit_model, data = Churn_data, type = "response")

#Change probabilities to class (0 or 1/Yes or No)
Churn_data$Churn_Predicted <- ifelse(Churn_data$Churn_Predicted > 0.5,1,0)

#Confusion Matrix
table(Churn_data$Churn,Churn_data$Churn_Predicted)
misClassError <- mean(Churn_data$Churn_Predicted != Churn_data$Churn)

#Accurancy
print(paste('Accuracy =',1-misClassError))

###################################################################################
#Out of sample error
Churn_data <- read.csv(file.choose())

str(Churn_data)

Churn_data$Churn <- factor(Churn_data$Churn)
str(Churn_data)

# Step 1:Split data in train and test data
#install.packages("caTools")
library(caTools)
set.seed(390)
split <- sample.split(Churn_data, SplitRatio = 0.7)
split

train <- subset(Churn_data, split== "TRUE")
test <- subset(Churn_data, split== "FALSE")
str(train)
str(test)

# Step 2:Train model with logistics regression using glm function
logit_model <- glm(Churn ~ ., data = train, family = "binomial")
logit_model
vif(logit_model)

summary(logit_model)

################################ Removing multi collinearity & Variable Selection (My analysis) ############################
logit_model <- glm(Churn ~ ., data = train, family = "binomial")
logit_model
vif(logit_model)

logit_model <- glm(Churn ~ .-MonthlyCharge, data = train, family = "binomial")
logit_model
vif(logit_model)

logit_model <- glm(Churn ~ .-MonthlyCharge - DataUsage, data = train, family = "binomial")
logit_model
vif(logit_model)

summary(logit_model)

logit_model <- glm(Churn ~ .-MonthlyCharge - DataUsage-AccountWeeks-DayCalls, data = train, family = "binomial")
summary(logit_model)
####################################################################################

logit_model <- glm(Churn ~ ContractRenewal + CustServCalls + RoamMins , data = train, family = binomial)
summary(logit_model)
# Null Deviance = (fit dependent variable only with intercept)
# Residual Deviance = (fit dependent variable with all the independent variable)
# AIC (lesser the better, used for comparing different models)


# Step 3:Predict test data based on trained model -logit_model
fitted.results <- predict(logit_model, test, type = "response")

fitted.results # Predicted Result
test$Churn   # Actual Result


fitted.results.new <- fitted.results
# Step 4: Change probabilities to class (0 or 1/Yes or No)
# If prob > 0.5 then 1, else 0. Threshold can be set for better results
#fitted.results <- ifelse(fitted.results > 0.5,1,0)
fitted.results.new <- ifelse(fitted.results.new > 0.8,1,0)
#fitted.results <- ifelse(fitted.results > 0.25,1,0)

fitted.results.new # Predicted Result
test$Churn    # Actual Result


# Step 5: Evauate Model Accuracy using Confusion matrix
table(test$Churn, fitted.results.new)
misClassError <- mean(fitted.results.new != test$Churn  )
print(paste('Accuracy =',1-misClassError))

#Model evaluation using confusion matrix function
library(caret)
confusionMatrix(table(test$Churn, fitted.results.new))

# ROC-AUC Curve
#install.packages("ROCR")
library(ROCR)
ROCRPred <- prediction(fitted.results.new, test$Churn  )
ROCRPerf <- performance(ROCRPred, measure ="tpr", x.measure ="fpr")
plot(ROCRPerf)
plot(ROCRPerf, colorize = TRUE)
plot(ROCRPerf, colorize = TRUE, print.cutoffs.at = seq(0.1,by=0.1))
plot(ROCRPerf, colorize = TRUE, print.cutoffs.at = seq(0.1,by=0.1),main = "ROC CURVE")
abline(a=0, b=1)

auc <- performance(ROCRPred, measure = "auc")
auc <- auc@y.values[[1]]
auc
auc <- round(auc, 4)
legend (.5,.4,auc, title = "AUC", cex =1)
#################################################################################
