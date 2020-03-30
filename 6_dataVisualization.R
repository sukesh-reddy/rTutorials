##################################
# Data Visulization 
# base package, ggplot2
# grid graphics, lattice graphic - optional
###################################

######### Base Package #####################

# -----------------------------Scatter Plot

#  It helps in visulization data easily and find the linear relationship
# B/W 2 continuos variables

plot(mtcars$hp,mtcars$mpg)
# arguments - type='p'(points),'l'(line),o(both points and line)
plot(mtcars$hp
     ,mtcars$mpg,
     type='p',xlab = 'Horsepower',
     ylab='miles per gallon',
     main = 'HPvsMPG',
     xlim = c(0,max(mtcars$hp)),
     ylim = c(0,max(mtcars$mpg)))

# ---------------------------------Par() function

# par() - mfrow - return all the arguments that you can change in a plot

par(mfrow=c(2,2))

# par()- pch - it specify the symbols to use when plotting the points
# you can specify another column/factor var to pch (or) a  number
plot(mtcars$hp,mtcars$mpg,type='n')
points(mtcars$hp,mtcars$mpg,pch='15')

# par() - text() - to specify the font in the plot
text(mtcars$hp,mtcars$mpg,
    adj=-0.2,
    cex=1.2,
    font=4)

# par() = legend()
legend('topright',pch = c(1,2,3),
       legend = c('4','6','8'))

# par() - color(
colors()


# ---------------------------Line chart

# It is commonly used to analyze a trend spread over a time period
par(mfrow=c(1,1))
plot(c(7,12,28,3,41),type = 'o',
     main='Line chart',xlab = 'Month',
     ylab = 'date',
     col='red')
lines(c(1,2,3,4,5,6,10,20),type ='o',col='blue')

# -----------------------bar plot

# It is suitable for showing comparision between categorical variable 
counts <- table(mtcars$gear)
counts <- table(mtcars$vs,mtcars$gear)

barplot(counts,legend=names(counts),col=c('red','yellow','green'))
barplot(counts,horiz = T,names.arg = c('3 gears','4 gears','5 gears'),beside = T)

# -----------------------histogram
hist(mtcars$disp,col = rainbow(7),breaks = 10)

# ------------------------boxplot
boxplot(mtcars$mpg~mtcars$cyl,col=c('red','green','yellow'))

# ------------------------mosaic plot

# for comparison between 3 categorical variables
data("HairEyeColor")
HairEyeColor
mosaicplot(HairEyeColor)


# -------------------------------Correlation Plot
library(corrplot)
corrplot(cor(mtcars),method = 'ellipse')
?corrplot

corrplot(cor(mtcars),method = 'color',
         type = 'lower',addCoef.col = 'black',
         diag = F,order = 'hclust') 

# ----------------------------------Word cloud

install.packages(c('wordcloud','RColorBrewer'))
library(wordcloud)
library(RColorBrewer)
counts <-table(rownames(mtcars))
wordcloud(words = names(counts),
          freq = as.numeric(counts),
          scale = c(1.25,0.25),
          min.freq = 1)
###################### GGplot 2 #######################3

# grammer/frame work of ggplot2

# FIRST LAYER - Data - { variables of interest}

# SECOND LAYER - asthetic - the scales on which we map our data - {x-axis,y-axis,color,fill,size,shape,labels,alpha,,line width, line shape}

# THIRD LAYER - GEOMETRY - visual layer(boxplot,hist) - {point, line, histogram, bar, boxplot}

# FOURTH LAYER - FACETS - plotting small multiples - {columns, rows}

# FIVTH LAYER - STATISTICS - {descriptive, inferential, bining, smoothing}

# SIXTH LAYER - COORDIANTES - aspectration, coord_flip() - {cartesian, fixed, polar, limits}

# SEVENTH LAYER - THEMES - All non-data link - { non-data link}

#---------------------------framework
library(ggplot2)
ggplot(data = mtcars,aes(x=,y=,shape=,col,size,lables)) +
  geom_point() +
  facet_grid(.~am) +
  stat_smooth(method = lm,col='red') +
  scale_x_continuous('mpg',limits = c(),expand = ) +
  coord_flip()

#------------------------------example

# Scatter plot - size, col, shape
ggplot(data = mtcars,aes(x=wt,y=mpg,col=factor(cyl),size=disp,shape=factor(am))) +
  geom_point()

# Bar plot
ggplot(data = mtcars,aes(x=factor(cyl),fill=factor(am)))+
  geom_bar()

# Histogram
ggplot(data=mtcars, aes(x=mpg)) +
  geom_histogram(bins = 6,color='black',fill='blue')

# Density plot
ggplot(data=mtcars, aes(x=mpg)) +
  geom_density(color='black',fill='blue')

# Boxplot
ggplot(mtcars,aes(x=factor(cyl),y=mpg)) +
  geom_boxplot(fill='lightblue')

# Facet layer
ggplot(mtcars,aes(x=factor(cyl),y=mpg,fill=factor(am))) +
  geom_boxplot() +
  facet_grid(.~factor(am))

ggplot(mtcars,aes(x=factor(cyl),y=mpg,fill=factor(am))) +
  geom_boxplot() +
  facet_grid(factor(am)~.)

# Stat Layer
ggplot(data = mtcars,aes(x=wt,y=mpg)) +
  geom_point() +
  stat_smooth(method = lm,col='red')

ggplot(data = mtcars,aes(x=wt,y=mpg)) +
  geom_point() +
  geom_smooth(method = lm,col='red',se=F)

ggplot(data = mtcars,aes(x=wt,y=mpg,col=factor(cyl))) +
  geom_point() +
  stat_smooth(method = 'lm',se=F)

# Coordinate Layer  
ggplot(data = mtcars,aes(x=wt,y=mpg,col=factor(cyl))) +
  geom_point() +
  geom_smooth() +
  coord_cartesian(xlim = c(3,6))

# Theme layer - element_text, element_line, elelment_rect
ggplot(data = mtcars,aes(x=wt,y=mpg)) +
  geom_point() +
  facet_grid(.~cyl) +
  theme(plot.background = element_rect(fill = 'darkgrey'))
 