##########################################
# Titanic Survival
# Step-2: Data Cleaning and Preparation
# Step-3; Data Exploration
##########################################

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

###############################################################
# Data Preparation
#################################################

# Combining the train and test data for Data Cleaning
test$Survived <- 0
full <- rbind(train,test)

# strucutre of the full data
str(full)
summary(full)

# Survival Rates
table(full$Survived)

# Survival Rate in proporation
prop.table(table(full$Survived))

########################### Data type conversion #####################3

str(full)

full$Pclass <- as.factor(full$Pclass)

#################### Null Values #################################

# Null count

colSums(is.na(full)) 

sapply(full, function(df){
  sum(is.na(df)) / length(df)
})

# Visulizing the null count
library(Amelia)
missmap(full)

# Imputing Missing Value - Age
full$Age[is.na(full$Age)] <- mean(full$Age,na.rm = T)

# Impute Missing Value - Embarked

table(full$Embarked)
full$Embarked[is.na(full$Embarked)] <- 'S'
table(full$Embarked,useNA = 'always')

# Imputation Missing Value - Fare
full$Fare[is.na(full$Fare)] <- mean(full$Fare,na.rm = T)

# Dropping the cabin column
full <- full[-11]

# Checking the null values
sapply(full, function(df){
  sum(is.na(df)) / length(df)
})

# Spltting back
train_cleaned <- full[1:891,]
test_cleaned <- full[892:1309,]

############################################## 
# Data Exploration
############################################


##univariate EDA
##bivariate EDA
##multivariate EDA
##################################################################################################################

##univariate EDA
library(ggplot2)

#categorical variables
xtabs(~Survived,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Survived))
ggplot(train_cleaned) + geom_bar(aes(x=Sex))
ggplot(train_cleaned) + geom_bar(aes(x=Pclass))

#numerical variables
ggplot(train_cleaned) + geom_histogram(aes(x=Fare),fill = "white", colour = "black")
ggplot(train_cleaned) + geom_boxplot(aes(x=factor(0),y=Fare)) + coord_flip()
ggplot(train_cleaned) + geom_histogram(aes(x=Age),fill = "white", colour = "black")
ggplot(train_cleaned) + geom_boxplot(aes(x=factor(0),y=Age)) + coord_flip()

#####################################################################################
##bivariate EDA
#Cat-Cat relationships
xtabs(~Survived+Sex,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Sex, fill=factor(Survived)))

xtabs(~Survived+Pclass,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Pclass, fill=factor(Survived)) )

xtabs(~Survived+Embarked,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Embarked, fill=factor(Survived)) )

#Num-Cat relationships
ggplot(train_cleaned) + geom_boxplot(aes(x = factor(Survived), y = Age))
ggplot(train_cleaned) + geom_histogram(aes(x = Age),fill = "white", colour = "black") + facet_grid(factor(Survived) ~ .)

ggplot(train_cleaned) + geom_boxplot(aes(x = factor(Survived), y = Fare))
ggplot(train_cleaned) + geom_histogram(aes(x = Fare),fill = "white", colour = "black") + facet_grid(factor(Survived) ~ .)

#####################################################################################
##multivariate EDA
xtabs(~factor(Survived)+Pclass+Sex,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Sex, fill=factor(Survived))) + facet_grid(Pclass ~ .)


xtabs(~Survived+Embarked+Sex,train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x=Sex, fill=factor(Survived))) + facet_grid(Embarked ~ .)
#####################################################################################


########################## Exporting results #####################################
