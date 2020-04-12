#################################
# Multiple Liear Regression
################################

##################### Setting the working envoirnemnt/space ###################3

# clear all the envoirnment varialbes
rm(list = ls())

# Setting the working directory

# loading the packages

# reading the data
data("mtcars")
str(mtcars)

################# Modelling (Multiple Linear Regression) ###########################################
 
# Model 1
lm.out <- lm(mpg~.,data = mtcars)
lm.out
summary(lm.out)

# Model 2
lm.out2 <- lm(mpg~am+wt+hp+disp+cyl,data = mtcars)
lm.out2
summary(lm.out2)

# Model 3
lm.out3 <- lm(mpg~wt+hp,data = mtcars)
lm.out3
summary(lm.out3)


############################### Model Evaluation #######################

# Calculate Error
# 1.In-Sample Error
# 2.Out of sample Error

# 1.In sample Error
model <- lm(mpg~hp,mtcars[1:20,])

# Predict
predicted <- predict(model,mtcars[1:20,],type = 'response')

# Calculate RMSE
actual <- mtcars[1:20,'mpg']
actual
sqrt(mean((predicted-actual)^2))

# 2.Out - of- sample Error
model <- lm(mpg~hp,mtcars[1:20,])

# Predict
predicted <- predict(model,mtcars[21:32,],type = 'response')

# Calculate RMSE
actual <- mtcars[21:32,'mpg']
actual
sqrt(mean((predicted-actual)^2))

################# Cross Validation ##############################

# install.packages('caret')
library(caret)
set.seed(42)

# Fit the linear regression model
kfold.model <- train(mpg~hp,
               mtcars,
               methood = 'lm',
               trControl = trainControl(method = 'cv',
                                        number = 10,
                                        verboseIter = T)
               )
kfold.model
# predicting
predicted <- predict(kfold.model,mtcars[21:32,])

# Evaluate error
actual <- mtcars[21:32,'mpg']
sqrt(mean((predicted-actual)^2))

####################### correlation ############################
library(corrplot)
corrplot(cor(mtcars[,sapply(mtcar, is.numeric)]))

##################### VIF (multi-collinearity)#################
#install.package('car')
library(car)
# Remove multi-collinearity using VIF

# Step-1 Keeping all the var
model1 <- lm(mpg~.,data=mtcars)
vif(model1)

# Remove disp as it has highes vif

###################### Stepwise Regression ###########################
null = lm(mpg~1,data=mtcars)
extractAIC(null)
full = lm(mpg~.,data=mtcars)
extractAIC(full)

# Backward-elimination
stepAIC(full,direction='backward')

# forward elimination
stepAIC(null,scope = list(lower = null,upper = full),method='forward')

# from the above step wise algorithm we can see

# both
stepAIC(null,scope = list(lower = null, upper = full),direction = 'both')
extractAIC()