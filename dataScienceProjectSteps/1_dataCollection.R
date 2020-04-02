###############################
# Machine learning Life-Cycle
# Data Sourcing/Collection, Data Exploration, Data Preparation, Feature Engineering, Model Building, Model deployment
###############################

#######################################################################################################
# We will be retriving df.titanic data and titanic data from UCI machine learning repo and Kaggle

########### Iris Data #####################

# Step - 1 : Data Collection
#-------------------------------------------------- Data Collection

# Import Iris Data Set
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris <- read.csv(file.choose(),
                 header = F,
                 col.names = c('sepal.length','sepal.width','petal.length','petal.width','class'))
##############################################################################################################


##########################################################################################################
# Step - 2 : Data Explorarion
#-------------------------------------------------- Data Exploration

#  Steps - * Dimensions and Columns, *Structure and summary, *Data Type Conversion, *Identify Missing Values,
# *Identify Outliers, *Univariate Anlaysis, *Bivariate Analysis

# 1) List dimensions & Columns

dim(iris) #see dimensions

nrow(iris) #see row number
ncol(iris) # see column number

colnames(iris) # see column names

head(iris) # see the first few data

# 2.) Strucutre & Summary 

str(iris) # structre of the data (dim, names, data types, head)

summary(iris) # fiveNumber Summary + mean

# 3.) Identify the variable

# predVar,tarVar - Understand what is target var(output), predictors(input)
# char,num,factors - daa types
# categorical, continous

# 4.) Data Type Conversion

############### Titanice Data Set ##################

#-------------------------------------------------- Data Collection

# Import the data Set
df.titanic <- read.csv(file.choose(),
                       stringsAsFactors = F,
                       na.strings =c("",'NA'," ") )

##########################################################################################################
# Step - 2 : Data Explorarion
#-------------------------------------------------- Data Exploration

#  Steps - * Dimensions and Columns, *Structure and summary, *Data Type Conversion, *Identify Missing Values,
# *Identify Outliers, *Univariate Anlaysis, *Bivariate Analysis

# ------------------1) List dimensions & Columns

dim(df.titanic) #see dimensions

nrow(df.titanic) #see row number
ncol(df.titanic) # see column number

colnames(df.titanic) # see column names

head(df.titanic) # see the first few data

# --------------------2.) Strucutre & Summary 

str(df.titanic) # structre of the data (dim, names, data types, head)

summary(df.titanic) # fiveNumber Summary + mean

# --------------------3.) Identify the variable

# predVar,tarVar - Understand what is target var(output), predictors(input)
# char,num,factors - daa types
# categorical, continous

# ------------------4.) Data Type Conversion

df.titanic$Survived <- as.factor(df.titanic$Survived)
df.titanic$Pclass <- as.factor(df.titanic$Pclass)

str(df.titanic)

# --------------------5.) Identify Missing Values(NA, Blank(''))

# NA count of all
table(is.na(df.titanic))

# NA count Column Wise

apply(df.titanic, 2,function(x) sum(is.na(x)))

# Percentage ratio - col wise

round((colSums(is.na(df.titanic))) / nrow(df.titanic)*100,3)

# Blank Values 
apply(df.titanic, 2,function(x) sum(x %in% c(""," ",NA),na.rm = T))
 
# visulization the NA values

# install.packages('Amelia')
library(Amelia)
missmap(df.titanic,main = 'Missing Map')
AmeliaView()    

# -------------------------------- Impute Missing values (Data preparation / Missing Value Treatment)

# For Age Column
(sum(is.na(df.titanic$Age)) / nrow(df.titanic)) *100
df.titanic$Age[is.na(df.titanic$Age)] <- mean(df.titanic$Age,na.rm = T)
(sum(is.na(df.titanic$Age)) / nrow(df.titanic)) *100

# For Embarked column
table(df.titanic$Embarked,useNA = 'always')
df.titanic$Embarked[is.na(df.titanic$Embarked)] <- 'S'
table(df.titanic$Embarked,useNA = 'always')

# ----------------------------------------6.) Identify Outliers

# ----------------------------------------7.) 