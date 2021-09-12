
# subsetting players 1,2,3
data <- MinutesPlayed[1:3,]

matplot(t(data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1:3], col = c(1:4,6), pch = 15:18, horiz = F)

#subsetting only the first player (kobe)

data <- MinutesPlayed[1,, drop=F]

matplot(t(data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1], col = c(1:4,6), pch = 15:18, horiz = F)
