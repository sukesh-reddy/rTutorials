###########################################
# Import/Export With R
# csv,text file, excel file, database, web
###########################################

###### Import with csv #################

df.train <- read.csv(file.choose(),stringsAsFactors = F)

read.csv(file = path)

library(readr)
df.tita <- read_csv()


######### Import the Text data ############
df <- read.table(path,sep = '\t',header = T)

####### Importing the Excel file ##############
library(readxl)

excel_sheets('filename/path')
df <- read_excel('filename/path',sheet = 1)
df.2 <- read_excel('',sheet = 2)
pop_df <- list(df,df.2)

############# Import from a data base #################

# From a database, you have to establish a connection and from the connection you have to authenticate,authorize

install.packages(c('RMySQL','RPostgresSQL','ROracle'))
library(RMySQL)

con <- dbConnect(RMySQL::MySQL(),
                 dbname='compnay',
                 host='',
                 port=3306,
                 user=,
                 password=)
dbListTables(con)
dbReadTable(con,'tablename')

############# Import from json #####################
install.packages('jsonlite')
library(jsonlite)

fromJSON('path/file ')
###################  Importing Data from Statistical Tools ################

install.packages('haven')
library(haven)

# for sas - read_sas()
# for stata - read_stata()
# for SPSS - read_spss()


################  Exporting Data ###############
write.table(mydata,'path',sep='\t')

library(xlsx)
write.xlsx(mydata,'path')

library(writexl)
write_xlsx(mydata,path)

write.csv(mydata,'path') 