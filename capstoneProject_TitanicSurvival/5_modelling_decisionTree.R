##########################
# Titanic Survival
# Step 4: Modelling
# Decision tree
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

#####################################
# Modelling
# model -1 with only gender
######################################

#install.packages(c('rattle','rpart','rpart.plot','RColorBrewer'))

library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)

# model1 - With only Sex
dtree1 <- rpart(Survived~Sex,data = train,method = 'class')
rpart.plot(dtree1)
fancyRpartPlot(dtree1)

# predictions
my_Prediction <- predict(dtree1, test_Featured, type = "class")

# saving the solution
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree1.csv", row.names = FALSE)

# Model 2 - Deeper tree without feature Engineering
dtree2 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
                data=train,
                method="class")

rpart.plot(dtree2)
fancyRpartPlot(dtree2)


my_Prediction <- predict(dtree2, test, type = "class")

my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree2.csv", row.names = FALSE)

# Model 3 - Deeper Tree with Feature ENgineering
dtree3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child + FamilySize,
                data=train,
                method="class")

rpart.plot(dtree3)
fancyRpartPlot(dtree3)


my_Prediction <- predict(dtree3, test, type = "class")

my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree3.csv", row.names = FALSE)

# Model 4 - max depth of tree
dtree4 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child +Title + FamilySize,
                data=train,
                method="class", 
                control=rpart.control(minsplit=2, cp=0))

fancyRpartPlot(dtree4)
my_Prediction <- predict(dtree4, test_Featured, type = "class")
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree4.csv", row.names = FALSE)

# Lets handle the overfitting the problem
printcp(dtree4)

min(dtree4$cptable[,"xerror"])
which.min(dtree4$cptable[,"xerror"])
cpmin <- dtree4$cptable[3, "CP"]
cpmin

#Prune the tree by setting the CP parameter as =  cpmin
dtree5 = prune(dtree4, cp = cpmin)
rpart.plot(dtree5)
fancyRpartPlot(dtree5)

my_Prediction <- predict(dtree5, test_Featured, type = "class")
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree5.csv", row.names = FALSE)

#Alternative way of pruning tree
dtree5 <- prp(dtree4,snip=TRUE)$obj
fancyRpartPlot(dtree5)

my_Prediction <- predict(dtree5, test_Featured, type = "class")
my_solution <- data.frame(PassengerId = test_Featured$PassengerId, Survived = my_Prediction)
write.csv(my_solution, file = "dtree6.csv", row.names = FALSE)

######################################################################################