

myplot <- function(data, rows=1:10){
  data <- data[rows,, drop=F]
  
  matplot(t(data), type= "b", pch = 15:18, col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4,6), pch = 15:18, horiz = F)
  
}

myplot(MinutesPlayed /Games, 3)
