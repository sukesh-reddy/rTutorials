#################################
# Titanic Survival
# Step1 - First Prediction Model
##################################

# Titanic DataSet
# Importing the Data
train <- read.csv(file.choose(),stringsAsFactors = F, na.strings = c("","?"," ","NA"))
test <- read.csv(file.choose(),stringsAsFactors = F, na.strings = c("","?"," ","NA"))

head(train)
head(test)

str(train)
str(test)

summary(train)
summary(test)


#################### First Prediction Model with only Gender  ###################################

# Lazy Model
# Using Gender column

table(train$Sex,train$Survived)
prop.table(table(train$Sex,train$Survived))

# Copy of the test
test_one <- test
test_one$Survived <- 0

# Using logic
test_one$Survived[test_one$Sex=='female'] <-  1

# my-solution 
my.sol.lazy <- data.frame(PassengerId = test_one$PassengerId,Survived=test_one$Survived)

########################## Lazy Predictor ###########################

# lazy model
table(train$Survived)

test_one$Survived <- 0

my.sol <- data.frame(PassengerId = test_one$PassengerId,Survived=test_one$Survived)


############################# Export your Solution ###################################

getwd()
setwd('D:\\github\\dataSets\\udemy_datascience\\titanic_kaggle')

write.csv(train_cleaned,'train_cleaned.csv',row.names = F)

write.csv(test_cleaned,'test_cleaned.csv',row.names = F)



