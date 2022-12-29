## 20221229
## 3.2 반복문
## 3.2.1 for문

# [예제] *을 5번 출력
for(i in 1:5){
  print("*")
}

# cat 사용법
a <- 4
cat("a에 저장된 값은",a,"입니다.")

# [예제] 구구단 2단 출력
for(i in 1:9) {
  cat("2 *", i, "=", 2*i, "\n")
}

# [예제] 1~20 사이의 숫자 중 짝수만 출력
for(i in 1:20) {
  if(i%%2 == 0) {
    print(i)
  }
}

# [예제] 1~20 사이의 숫자 중 짝수만 벡터로 저장
# method1
tmp <- c()

for(i in 1:20) {
  if(i%%2 == 0) {
    tmp <- c(tmp,i)
  }
}

print(tmp)

#method2
values <- 1:20
values.new <- values[values%%2==0]
print(values.new)

# [예제] 1~100 사이의 숫자의 합계 출력
#초기값, sum=0
#i=1,sum=0+1=1
#i=2, sum=0+1+2=3
#i=3, sum=0+1+2+3=6
#i=100, sum=0+1+2+3+...+99+100
sum <- 0

for(i in 100) {
  sum <- sum + i
}

print(sum)

# [실습] iris 데이터셋에 대하여 꽃잎의 길이(Petal.Length)가 1.6 이하이면 Low, 5.1 이상이면 High, 나머지는 Middle로 분류
Group <- c()

for(i in 1:length(iris$Petal.Length)){
  if(iris$Petal.Length[i]<=1.6){
    Group[i] <- "Low"
  } else if(iris$Petal.Length[i]>=5.1) {
    Group[i] <- "High"
  } else {
    Group[i] <- "Middle"
  }
}

print(Group)

#꽃잎의 길이와 분류된 그룹 함께 출력
myiris <- iris
head(myiris)
myiris.new <- cbind(myiris,Group)
head(myiris.new)

#3.2.2 while문

# [예제] 1~100 사이의 숫자의 합계 출력
#초기값, sum=0
#i=1,sum=0+1=1
#i=2, sum=0+1+2=3
#i=3, sum=0+1+2+3=6
#i=100, sum=0+1+2+3+...+99+100
sum <- 0
i <- 1

while(i <= 100) {
  sum <- sum + i
  i <- i + 1
}

print(sum)

# 3.2.3 break와 next
# 1~5 사이의 값의 합계 출력
#초기값, sum=0
#i=1, if(FALSE)=>sum=1
#i=2, if(FALSE)=>sum=3
#i=3, if(FALSE)=>sum=6
#i=4, if(FALSE)=>sum=10
#i=5, if(FALSE)=>sum=15, break
sum <- 0

for(i in 1:10) {
  sum <- sum + i
  if(i >= 5) break
}

print(sum)                    

# 1~10 사이의 숫자 중 홀수의 합계 출력
#method1
#초기값, sum=0
#i=1, if(FALSE)=>sum=0+1=1
#i=2, if(TRUE)=>next
#i=3, if(FALSE)=>sum=0+1+3=4
#i=4, if(TRUE)=>next
#i=5, if(FALSE)=>sum=0+1+3+5=9
#...
#i=10, if(FALSE)=>sum=25
sum <- 0

for(i in 1:10) {
  if (i%%2 == 0) next
  sum <- sum + i
}

print(sum)                   

#method2
odd <- seq(1,10,2)
odd

sum <- 0
for(i in odd){
  sum <- sum+i
}
print(sum)

#3.3 사용자 정의 함수
# *을 n번 출력하는 함수
print.star <- function(n){
  for(i in 1:n){
    print("*")
  }
}

print.star(3)

# [예제] 두 개의 값을 입력받아 둘 중 큰 수를 결과 값으로 반환하는 함수
mymax <- function(x, y) {
  if (x > y) {
    max.value <- x
  } else {
    max.value <- y
  }
  return(max.value)
}

mymax(10, 20)
mymax(20, 10)  # 결과는 동일

# [예제] 매개변수 x, y를 입력 받아 x/y 값을 반환하는 함수(단, y의 초기값은 2)
mydiv <- function(x, y=2) {
  return(x / y)
}

mydiv(12, 3)                            # 매개변수 값만 입력
mydiv(12)                               # x에 대한 값만 입력(y 값 생략)

# [예제] 매개변수 x, y를 입력 받아 두 변수의 합계와 곱을 리스트로 반환하는 함수
myfunc <- function(x, y) {
  sum.value <- x + y
  mul.value <- x * y
  return(list(sum = sum.value, mul = mul.value)) 
}

myfunc(5, 8)
result <- myfunc(5, 8)
result$sum                              # 5, 8의 합계
result$mul                              # 5, 8의 곱

## [실습]
# 1인치 = 0.0254미터
# 1파운드 = 0.453592킬로그램
women
mydata <- data.frame(height=women$height*0.0254,weight=women$weight*0.453592)
mydata

# (1) 키, 몸무게를 입력받아 BMI, Group을 반환하는 함수
bmi.func <- function(height,weight){
  BMI <- weight/(height^2)
  if(BMI<18.5){
    Group <- "저체중"
  } else if(BMI<23.0){
    Group <- "정상체중"
  } else if(BMI<25.0){
    Group <- "과체중"
  } else if(BMI<30.0){
    Group <- "경도비만"
  } else if(BMI<35.0){
    Group <- "중증도비만"
  } else {
    Group <- "고도비만"
  }
  return(list(BMI=BMI,Group=Group))
}
bmi.func(1.75,85)

# (2) mydata에 대해 BMI, Group 변수 추가
for(i in 1:nrow(mydata)){
  result <- bmi.func(mydata$height[i],mydata$weight[i])
  mydata$BMI[i] <- result$BMI
  mydata$Group[i] <- result$Group
}
mydata