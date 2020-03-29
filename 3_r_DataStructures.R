# ##################################################
# # R - Data Strucutres
# # Vectors, matrices, arrays, data frames , list
# ##################################################
# 
# ########## Vector ##############
# a <- c(1,2,3,45)
# a <- c(1:5)
# 
# #acessing elements
# a[1]
# a[c(1,3)]
# 
# # matrices ############
# a <- matrix(1:4,nrow = 2, ncol=2,byrow = T)
# 
# # Acessing elements
# a[1,]
# a[,2]
# a[1,2]
# 
# ############ array ##############
# a <- array(1:27,dim = c(3,3,3))
# 
# #Accessing elements
# a[1,1,1]
# 
# ########## data frame#############
# num <- 1:3
# char <- c('q','w','r')
# logi <- c(T,F,T)
# 
# df <- data.frame(num,char,logi)
# 
# #inbuilt dataframe
# mtcars
# 
# ----------------------------------------- function used on top of a data frame
# head(mtcars,4) - to see first several rows
# tail(mtcars,3) - to see last several rows
# str(mtcars) - return structure of a data set
# mtcars[1:2,1:4]
# summary(mtcars) - it gives descriptive stats 
# mtcars$mpg - access a particular 
# mtcars[,-3] - drops a column
# mtcars[,-c(1,2)] - drops a column
# subset(mtcars,hp>50) - subseeting with condition
# mtcars[mtcars$hp>50,] - subsetting with conition
# df1 <- mtcars[1:20,]
# df2 <- mtcars[21;31,]
# rbind(d1,df2) - combines two data frames with same number of coulmns and result will increase in row length(
# cbind() - combines a data frame with column wise, result will increase in column length
# 
# ########### factor ############
# # in a data frame a character vector is automatically cnverted into factors and number of levels will define by that
# mtcars$cyl <- as.factor(mtcars$cyl)
# 
# gender_vector <- as.factor(c('Male',"Female",'Male','Male','male','female','male','Female','female'))
# levels(gender_vector) <- c('Male','Female','male','female')
# 
# 
# #################### List #########################
# vect <- 1:3
# my_mat <- matrix(1:9, nrow = 3, ncol = 3)
# my_df <- mtcars[1:3,1:3]
# my_list <- list(vect,my_mat,my_df)
# my_list
# names(my_list) <- c('vect','matric','dataframe')
