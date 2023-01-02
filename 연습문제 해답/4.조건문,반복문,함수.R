#01.
#(1)
sum(c(1:100)[1:100 %% 3 == 0])

#(2)
c(1:100)[1:100 %% 3 == 0 & 1:100 %% 4 == 0]

#(3)
for (n in 1:24) {
  if(24 %% n == 0){
    cat(n, " ", sep = "")
  }
}

#(4)
n <- 1
for (i in 2:10) {
  n <- n*i
}

cat(n, " ", sep = "")

#02.
for (i in 1:9) {
  cat(9, "x", i, "=", 9*i, sep = " ")
  cat("\n")
}

#03.
i <- 1
while (i <= 9) {
  cat(8, "x", i, "=", 8*i, sep = " ")
  cat("\n")
  i <- i + 1
}

#04.
for (i in 1:100) {
  if(i %% 3 == 0){
    cat("*", " ", sep = "")
  }else
  {
    cat(i, " ", sep = "")
  }
}
#05.
isPrime <- function(x){
  if(x == 2){
    return(TRUE)
  }
  for(i in 2:round(sqrt(x))){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}
for(n in 2:1000){
  if(isPrime(n)){
    cat(n, " ", sep = "")
  }
}

#06.
fib <- c(0,1)
for(i in 1:40){
  if(i == 1 | i == 2){
    cat(fib[i], " ", sep = "")
  }else{
    fib[(i-1) %% 3 + 1] <- fib[(i-2) %% 3 + 1] + fib[(i-3) %% 3 + 1]
    cat(fib[(i-1) %% 3 + 1], " ", sep = "")
  }
}

#07.
#(1)
rowSums(iris[, -5])
(2)
for(c in 1:4){
  cat(iris[which.max(iris[, c]),c], " ", sep = "")
}

#08.
#(1)
apply(X = mtcars, 2, sum)

#(2)
apply(X = mtcars, 2, max)

#(3)
apply(X = mtcars, 2, sd)

#09.
lgm <- function(a, b){
  if(b > a){
    t <- a
    a <- b
    b <- t
  }
  while(b != 0){
    t <- b
    b <- a %% b
    a <- t
  }
  return(a)
}
result <- lgm(10, 8)
result
result <- lgm(10, 20)
result

#10.
maxmin <- function(v){
  rst <- list(max = 0, min = 0)
  if (length(v) == 0) {
    return(rst)
  }
  rst$max <- v[1]
  rst$min <- v[1]
  if(length(v) == 1){
    return(rst)
  }
  for(i in 2:length(v)){
    if(v[i] > rst$max){
      rst$max <- v[i]
    }
    if(v[i] < rst$min){
      rst$min <- v[i]
    }
  }
  return(rst)
}
v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result$max ; result$min
result <- maxmin(iris[, 1])
result$max ; result$min

#11.
weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)
#(1)
which.max(weight)

#(2)
which.min(weight)

#(3)
which(weight >= 61 & weight <= 69)

#(4)
weight.2 <- weight[which(weight <= 60)]
weight.2

#12.
#(1)
iris[which.max(iris[, "Petal.Length"]), ]

#(2)
iris[which(iris[, "Petal.Width"] >= 0.3 & iris[, "Petal.Width"] <= 0.4),]
