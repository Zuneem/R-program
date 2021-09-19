
#------------------import data---------------------------------------

#Method 1: Select The file Manually

stats <- read.csv(file.choose())
stats

#Method 2: Set WD(working directory) and read data
getwd()

#Windows:
setwd("C:\\Users\\zuneemtamrakar\\Desktop\\R-program")

#MAC:

setwd("/Users/zuneemtamrakar/Desktop")
getwd()
stats <- read.csv("P2-Demographic-Data.csv")



#-----------EXPLORE DATA-------------------------------------------------------
stats

#number of rows:
nrow(stats)

#number of columns:
ncol(stats)

# top 6 rows: (can specify the # of rows)
head(stats)
head(stats, n = 10)

# bottom 6 rows:
tail(stats)
tail(stats, n = 8)

# structure of data
str(stats)

# breakdown of every single col
summary(stats)

#-------------------USING $------------------------------------------------

stats
stats[3,3]
stats[3, "Country.Code"]
stats$Country.Name
stats$Country.Name[2]
stats[,"Internet.users"]
levels(stats$Income.Group)


#----------------Basic Operations with a Data Frame------------------
stats[1:10,] #subsetting
stats[2:5,]
stats[c(3,50,100),]

# remember how [ ] works:

is.data.frame(stats[1,]) #no need for drop=F
is.data.frame(stats[,1,drop=F])

# muliply columns

stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users


# ADD COLUMNS:

stats$new.column <- stats$Birth.rate * stats$Internet.users
stats

# REMOVE COLUMNS:

stats$new.column <- NULL
stats


#-------------------- FILTER DATA------------------------------------

filter <- stats$Birth.rate > 30 
stats[filter,]

stats[stats$Internet.users < 2,]
stats[stats$Internet.users < 2 & stats$Birth.rate > 30 ,]
stats[stats$Income.Group == "High income", ]


head(stats)

stats[stats$Country.Name == "Malta",]


#------------------ Qplot---------------------------------------------

#install.packages("ggplot2")
library(ggplot2)

qplot(data=stats, x = Internet.users)


qplot(data=stats, x = Internet.users, y = Income.Group)
qplot(data=stats, x = Income.Group, y = Birth.rate, size =I(3),
      color = I("blue"))
qplot(data=stats, x = Income.Group, y = Birth.rate, geom = "boxplot")


#-----------------------visualizing what we need-----------------------

qplot(data=stats, x = Internet.users, y = Birth.rate, size = I(4),
      color = I("red"))

qplot(data=stats, x = Internet.users, y = Birth.rate, size = I(4),
      color = Income.Group)


#----------------------- creating Data Frames----------------

mydf <- data.frame(code = Codes_2012_Dataset, country = Countries_2012_Dataset,
                   region = Regions_2012_Dataset)
head(mydf)

summary(mydf)



#----------------------- Merging Data Frames----------------

head(mydf)
head(stats)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "code")
head(merged)

merged$country <- NULL
head(merged)

#----------------------- visualizing with new split----------------
qplot(data = merged, x=Internet.users, y=Birth.rate, color=region)

# 1. shape
qplot(data = merged, x=Internet.users, y=Birth.rate, color=region, size=I(4), shape=I(17))

# 2. transparancy
qplot(data = merged, x=Internet.users, y=Birth.rate, color=region, size=I(4), shape=I(17), 
      alpha=I(.5))

# 3. add title
qplot(data = merged, x=Internet.users, y=Birth.rate, color=region, size=I(4), shape=I(17), 
      alpha=I(.5), main = "Birth Rate VS. Internet Users")
