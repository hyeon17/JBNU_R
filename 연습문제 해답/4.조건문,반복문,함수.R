#01.
#(1)1~100사이의 정ㅅ중 3의 배수들의 합과 개수
sum.val <- 0
nums.val <- 0
for(i in 1:100){
  if(i%%3==0){
    sum.val <- sum.val+i
    nums.val <- nums.val+1
  }
}
sum.val
nums.val

#(2)101~200사이의 숫자 중 3과 4의 공배수
a <- 0
c(1:100)[1:100 %% 3 == 0 & 1:100 %% 4 == 0]
for(i in 101:200){
  if(i%% 3 == 0 & i%%4==0){
    print(i)
  }
}

#(3) 24의 약수 출력
for (n in 1:24) {
  if(24 %% n == 0){
    print(n)
  }
}

#(4) 10!을 출력
n <- 1
for (i in 2:10) {
  n <- n*i
}

print(n)

#02. 9단 출력
for (i in 1:9) {
  cat(9, "x", i, "=", 9*i, sep = " ")
  cat("\n")
}

#03.8단 출력
i <- 1
while (i <= 9) {
  cat(8, "x", i, "=", 8*i, sep = " ")
  cat("\n")
  i <- i + 1
}

#04.3의 배수에는 숫자대신 *을 출력
for (i in 1:100) {
  if(i %% 3 == 0){
    cat("*", " ", sep = "")
  }else
  {
    cat(i, " ", sep = "")
  }
}
#05. 소수 출력
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


#09. 최대공약수
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

#10.최대 최소 반환
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