#-------------------DATA------------------------------------------------------------

movies <- read.csv(file.choose())
movies

head(movies)

colnames(movies) <- c("Films", "Genre", "crirticRating", "AudianceRating", "BudgetMillions", "Year") 
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)

#---------------------AESTHETICS-----------------------------------------------------

library(ggplot2)

ggplot(data=movies, aes(x=crirticRating, y=AudianceRating)) 

#add geometry
ggplot(data=movies, aes(x=crirticRating, y=AudianceRating)) + 
  geom_point()

#add color
ggplot(data=movies, aes(x=crirticRating, y=AudianceRating, 
                        color=Genre)) + 
  geom_point()

#size
ggplot(data=movies, aes(x=crirticRating, y=AudianceRating, 
                        color=Genre, size=BudgetMillions)) + 
  geom_point()

#-------------------------------------------------------------------------------------


#------------------------plotting with layers--------------------------------------

p <- ggplot(data=movies, aes(x=crirticRating, y=AudianceRating, 
                             color=Genre, size=BudgetMillions))

# point
p + geom_point()

# lines
p + geom_line()

# multi-layers example
p + geom_line() + geom_point()

#----------------overriding Aesthetics------------------------------------------
q <- ggplot(data=movies, aes(x=crirticRating, y=AudianceRating, 
                             color=Genre, size=BudgetMillions))

# add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=crirticRating))

#ex2
q + geom_point(aes(color=BudgetMillions))

#q remains same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget millions $$")

# reduce line size
q + geom_line(size=1) + geom_point()


#--------------mapping vs setting--------------------------------------------
r <- ggplot(data=movies, aes(x=crirticRating, y=AudianceRating)) 
r + geom_point()

# add color
#1. Mapping:
r + geom_point(aes(color=Genre))

#2. setting:
r + geom_point(color = "darkgreen")

# ERROR :
# r + geom_point(aes(color = "darkgreen"))

#add size
#1. Mapping:
r + geom_point(aes(size=BudgetMillions))

#2. Setting:
r + geom_point(size=10)

# ERROR:
# r + geom_point(aes(size=10))

#-----------------Histograms and Density charts-------------------------------

s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add color
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add borders
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#sometimes you may need desity charts:
s + geom_density(aes(fill=Genre), position = "stack")


#---------------Starting layer Tips-----------------------------------------

t <- ggplot(data = movies, aes())
t + geom_histogram(binwidth = 10, fill="white", color="blue")                   

# another way:
t <- ggplot(data = movies)
t + geom_histogram( binwidth = 10,
                    aes(x=crirticRating),
                    fill="white", color="blue")


#-------------------Statistical Transformation-------------------------------

?geom_smooth

u <- ggplot(data = movies, aes(x=crirticRating, y=AudianceRating, 
                               color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data = movies, aes(x=Genre, y=AudianceRating, 
                               color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()

# tip/ hack
u + geom_boxplot(size=1.2) + geom_jitter()

# another way
u + geom_jitter() +geom_boxplot(size=1.2, alpha=0.5) 

#------------------------- Using Facets--------------------------------------

v <- ggplot(data = movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="black")
# facets 
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="black") +
  facet_grid(Genre~., scales = "free")

# scatterplots: 
w <- ggplot(data = movies, aes(x=crirticRating, y=AudianceRating, 
                               color=Genre))
w + geom_point(size=3)

#facets:
w + geom_point(size=3) +
  facet_grid(Genre~.) 

w + geom_point(size=3) +
  facet_grid(.~Year) 

w + geom_point(size=3) +
  facet_grid(Genre~Year) 

w + geom_point(size=3) +
  facet_grid(Genre~Year) + geom_smooth()

w + geom_point(aes (size=BudgetMillions)) +
  facet_grid(Genre~Year) + geom_smooth()

#-------------Coordinates-----------------------------------------------

# limits 
# zoom

m <- ggplot(data = movies, aes(x=crirticRating, y=AudianceRating, 
                          size=BudgetMillions,
                          color=Genre))
m + geom_point()

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)
# wont work well always
n <- ggplot(data = movies, aes(x=BudgetMillions)) 
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
  ylim(0,50)


# instead use zoom:
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
  coord_cartesian(ylim=c(0,50))


# improve the previous chart:
w + geom_point(aes (size=BudgetMillions)) +
  facet_grid(Genre~Year) + geom_smooth() +
  coord_cartesian(ylim = c(0,100))


#-----------------theme----------------------------------------------

o <- ggplot(data = movies, aes(x=BudgetMillions)) 
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

h

# axes label formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") +
theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
      axis.title.y = element_text(color = "red", size = 30))


# tick mark formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30), 
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))

  

# legend formatting

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30), 
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 30),
        legend.position = c(1,1),
        legend.justification = c(1,1))

# Title

h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30), 
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 30),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "navyblue", 
                                  size = 40,
                                  family = "Courier"))






