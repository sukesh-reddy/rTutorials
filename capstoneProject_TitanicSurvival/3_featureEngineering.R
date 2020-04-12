########################################
# Titanic Survival
# step4: Feature Engineering
######################################

rm(list = ls())

########################### Importing the Data #####################
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

############################################
# Engineered Variable 1: Child
# Engineered Variable 1: Title
# Engineered Variable 1: Family Size
#############################################


# Child
full <- rbind(train,test)
full$Child <- 0
full$Child[full$Age<18] <- 1

ggplot(data = full) +
  geom_bar(aes(x=Child))

# Title
full$Title <- sapply(full$Name,function(x){
  strsplit(x,'[,.]')[[1]][2]
})
table(full$Title)
head(full)

full$Title[full$Title %in% c('Mme','Mlle')] <- 'Mlle'
full$Title[full$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Sir'
full$Title[full$Title %in% c('Dona', 'Lady', 'the Countess', 'Jonkheer')] <- 'Lady'

# Convert to a factor
full$Title <- factor(full$Title)
table(full$Title)
ggplot(full) + geom_bar(aes(x=Title))

# Engineered variable 3: Family size
full$FamilySize <- full$SibSp + full$Parch + 1
table(full$FamilySize)
ggplot(full) + geom_bar(aes(x=FamilySize))


# Split back into test and train sets
train_Featured <- full[1:891,]
test_Featured <- full[892:1309,]

train_Featured$Survived <- as.factor(train_Featured$Survived)
train_Featured$Sex <- as.factor(train_Featured$Sex)
train_Featured$Embarked <- as.factor(train_Featured$Embarked)

test_Featured$Sex <- as.factor(test_Featured$Sex)
test_Featured$Embarked <- as.factor(test_Featured$Embarked)

############################# Export your Solution ###################################

getwd()
setwd('D:\\github\\dataSets\\udemy_datascience\\titanic_kaggle\\data')

write.csv(train_Featured,'train_cleaned.csv',row.names = F)

write.csv(test_Featured,'test_cleaned.csv',row.names = F)
