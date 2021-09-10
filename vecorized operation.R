

n <- 100
a <- rnorm(n)
b <- rnorm(n)


# vectorized approach (specific to R-program) 

c <- a * b

# de-vectorized approach

d <- rep(NA, n)
for (i in 1:n){
  d[i] <- a[i] * b[i]
}
