

#matrix()
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A

B <- matrix(my.data, 4, 5, byrow = TRUE)
B

#rbind()

r1 <- c("hey", "whats", "up")
r2 <- c("good", "weather", "today")
r3 <- c(1,2,3)

C <- rbind(r1, r2, r3)
C

#cbind()
c1 <- c(1,5,7)
c2 <- c(6,8,9)
c3 <- c(9,4,3)

D <- cbind(c1, c2, c3)
D
