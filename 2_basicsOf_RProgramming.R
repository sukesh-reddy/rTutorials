########## Assignment Operators #################

# Left and Right Assignemnt

a <- 5 # left (preferrable)
6 -> a # right
a = 5 # optional

# Assigning a Value to the Variable

my_apples <- 5
my_apples

################ Math and Logical Operators ############ 
a <- 8
b <- 2
c <- a+b
c <- a-b # subtract
c <- a*b #multiiply
c <- a^b #square
c <- a/b #divison
c <- a %% b #modulous operator
c <- a %/%b #integer division/ quotient 

####### Clear the console ################
# ctrl + l

########## Relation and Logical Operators ###################

# < , > , >=, <=, ==, !=

# combine Function - c()

# a <- c(1,2,3)

# Sequrnce Function - :

# a <- 1 : 20

#################### Logical Operator #################

# &-and, |-or, !-not
# && , || -examines only first element

##################### Consitional statement #############

#if(condition)
#{
#  logic
#}else if(){
  
#}else{
#}

#ifelse(condition,if,else)

###################### Loops ######################

# fr, while, repeat

# for loop
#for(i in vec)
#{
#  print(i)
#}

# while loop
#track
#while(consition){
#  increment
#}

# break, next statemetn statement

############### Function #####################

# Commonly Used Functions

#------------------------------------numeric func
# sqrt, ceiling, floor, exp, log

#append
a <- 1:5
a <- append(a,7)

#identical() - test if two objects are identical
#length() - returns the length of a vector
#ls() - returns all the objects in the envoirnemnt
# ls(), ls('package:stats')
# range()
# rep(x,n) - repeat x bu n times
# rev(c(1,2,5,7)) - reverse function
# seq(x,y,n) - generated x-y space by n
#unique() - return unique elements 

# -------------------------------------Stat functions

#mean, median, sum, sd, range, min, max

# -----------------------Character Function
# tolower() 
# toupper()
# substr(x,start = ,end=) - extracts specific part of a string
# grep(pattern = ,x,ignore.case = False) - search for a pattern in string , returns indexes/positions
# sub(pattern = ,x=,replacement=,ignore.case = False ) - replaces it only first place with specific
# gsub(pattern = ,x=,replacement=,ignore.case = False ) - replaces in all places
# paste(input,sep='')



############## Write your own function ##########################
# triple <- function(x=1){
#   return(x*3)
# }
# triple(3)
