#subsetting

x <- c(1,2,3,4,5)
x
x[c(1,5)]
x[1]

Games
Games[c("KobeBryant","DwayneWade"),c("2008","2009","2013")]
Games[c("LeBronJames","ChrisBosh"),]


Games[1,] #only gives vector since its only 1 row
Games[1,,drop=F] # turns the 1 row into matrix 
