###############################
# Data Manipulation
# Apply Family, Dplyr Package
################################

######### Apply family function #############

# apply functions are used to perform specific change to each col/row of a r object

# ------------------------apply

#it is used to apply the function to a matrix/dataframe and returns a vector/array object
# margin argument : 1 - row, 2- columns

apply(robject,1, function(x) sum(x))
apply(robject, 1, sum)

# -------------------------lapply

# it takes list as a data ad returns list
lapply(listobject,sum)

unlist(lapply(listobject,sum)) # return a vectors

# ------------------------sapply

# it is similar to lapply but is used to simply and returns a vectors
sapply(listobject,func)

# ------------------------vapply

# similar to sapplt but can specify the type of the return value
vapply(listobject, sum, FUN.VALUE = double(1))

# ------------------tapply

# it applies more on categorical variable/ it works on a vector and apply the function by grouping the factors
tapply(vector, factor/categorical variable, mean)

# -----------------mapply

# it is multivarient of sapply and the function takes firs arguemtn of object1 and second argument as first elem of second object
mapply(rep, 1:4,4:1)


############### Dplyr package ######################3

# All columns are called as variables and rows as observations

# select, filter - variables
# arrange, muate - obs
# group_by, summarise

install.packages('dplyr')
library(dplyr)

# to use this package more effiecient, convert the dataframe into table (tibble)
df_t <- tbl_df(dataframe)
glimpse(df_t)

# --------------------------------select

# it helps to extract/takes specific column
select(dataframe,col1,col2)

starts_with('x') - every name that starts with 'x'
ends_with('x') - every name lasts with 'x'
contains('x') - every name that contains x
matches('x') - x can be regular expression
one_of('x'), num_range('x')

select(df,col1,starts_with('name'),ends_with('name'))


#------------------------------mutate

# it creates new column with existing column
mutate(df,new_col=col1+col2)

#------------------------filter

# you can specify the conditions
filter(df,logicaltest/condition)

filter(df,col1>23,col2==2|col3==1)
filter(df,!is.na(col2))

#-------------------------------arrange

#it arrange your rows on the given col name
# default - ascending order
# desc() - descending order

arrange(df,desc(col1),col2)

#------------------------------summarise

# it collapse many values into one summary
summarise(dataframe,sum=sum(col1),mean=mean(colA))

#-----------------------pipe operator 

dataframe %>%
  filter() %>%
  select()

#----------------------group_by

# makes an ordered per
df %>%
  group_by(col1,col2) %>%
  summarise(count = n())

############### Date ############################
Sys.Date() # it returns today date


as.Date('2017-01-28'/'2017/01/28') # by defaulty it accepts - or /
as.Date('01/28/2017',format='%m/%d/%Y')

# %d - day of the month(01-31)
# %m - month(0-12)
# %y - year(00-99) - year without century
# %Y - year(0-9999) - year with century
# %b - abbreviate month name
# %B - Full month name

# extract the weekdays(), quartes(), month()