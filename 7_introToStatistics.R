########################
# Statistics
#########################

library(Hmisc)
describe(mtcars) #descriptive statistics

# frequency
table(mtcars$cyl)

# relative frequency
table(mtcars$cyl) / sum(table(mtcars$cyl))

################### Random Variable ################

# Event ouput is random variable
# rando var has 3 - characterstics: distribution, mean sd
# random var - discrete, continous
# discrete -