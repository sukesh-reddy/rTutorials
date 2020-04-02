###########################
# Data Preparation
##########################


# Step - 1 : Data Collection
# Step - 2 : Data Preparation
# step - 3 :

# We will be retriving iris data and titanic data from UCI machine learning repo and Kaggle

########### Iris Data #####################

#-------------------------------------------------- Data Collection

# Import Iris Data Set
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris <- read.csv(file.choose(),
                 header = F,
                 col.names = c('sepal.length','sepal.width','petal.length','petal.width','class'))

#-------------------------------------------------- Data Exploration



############### Titanice Data Set ##################

#-------------------------------------------------- Data Collection

# Import the data Set
df.titanic <- read.csv(file.choose(),
                       stringsAsFactors = F,
                       na.strings =c("",'NA'," ") )

#-------------------------------------------------- Data Exploration

#  Steps - * Dimensions and Columns, *Structure and summary, *Data Type Conversion, *Identify Missing Values,
# *Identify Outliers, *Univariate Anlaysis, *Bivariate Analysis

# Step-1 : list Dimensions and Column Names
