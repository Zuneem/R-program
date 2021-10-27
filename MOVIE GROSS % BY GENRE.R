
# ----------------- MOVIES GROSS $$ IN U.S. ACCORDING TO CERTAIN GENRE----------------------------

# import data
mov <- read.csv(file.choose())
mov

#explore data
head(mov)
str(mov)
summary(mov)
#activate ggplot2
library(ggplot2)

# filter the dataset (use either method)
#method 1
filt <- (mov$Genre=="action") | (mov$Genre=="adnemture") | (mov$Genre=="animation") | 
  (mov$Genre=="comedy") | (mov$Genre=="drama")

#method 2
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

#create new dataset with filtered data
mov2 <- mov[filt & filt2,]
mov2

z <- ggplot(data=,mov2, aes(x=Genre, y=Gross...US))

#add geomerty
a <- z + geom_jitter(aes(size=Budget...mill., color=Studio)) + 
  geom_boxplot(alpha=0.6, outlier.colour = NA)

#non data ink

a <- a +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
a

# theme

a <- a +
  theme(
    axis.title.x = element_text(color="Blue", size=30),
    axis.title.y = element_text(color="blue", size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    
    plot.title = element_text(size=40),
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=20),
    
    text = element_text(family = "Comic Sans MS")
    
  )
a

# final touchup

a$labels$size <- "Budget $M"

a


