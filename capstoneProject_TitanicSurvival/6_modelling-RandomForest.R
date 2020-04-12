##########################
# Titanic Survival
# Step 4: Modelling
# RandomForest tree
#########################

rm(list = ls())


#############################
# Importing the data
############################

train_Featured <- read.csv(file.choose())
test_Featured <- read.csv(file.choose())

str(train_Featured)
str(test_Featured)

# Converting the data types
train_Featured$Name <- as.character(train$Name)
test_Featured$Name <- as.character(test$Name)

train_Featured$Ticket <- as.character(train$Ticket)
test_Featured$Ticket <- as.character(test$Ticket)


##################################
# Splitting the data
###############################

library(caret)

trainingIndexes <- createDataPartition(train_Featured$Survived,p=0.8,list = F)

train.data <- train_Featured[trainingIndexes,]
test.data <- train_Featured[-trainingIndexes,]

str(train.data)
str(test.data)

##################################################################################################################
#Titanic Survival Tutorial - Part 7 : # Build Random Forest Model
##################################################################################################################
set.seed(415)
library("randomForest")
fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child + Title + FamilySize,
                    data=train_Featured, importance=TRUE, ntree=2000)
# Look at variable importance
varImpPlot(fit)

# Now let's make a prediction and write a submission file
my_Prediction <- predict(fit, test_Featured)
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "Featuredfirstforest.csv", row.names = FALSE)


# Build condition inference tree Random Forest
library("caret")
#install.packages("party")
library("party")
set.seed(415)
tree <- cforest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child + Title + FamilySize,
                data = train_Featured, controls=cforest_unbiased(ntree=2000, mtry=3)) 

# Now let's make a prediction and write a submission file
my_Prediction <- predict(fit, test_Featured, OOB=TRUE, type = "response")
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "Featuredciforest.csv", row.names = FALSE)
