## Date: 2022-12-23
## Author: Jang_Hyeon_Jun

## Chapter 1. R기초
## 1.2.1 산술연산
1 + 2
3 - 2
4 * 2
5 / 23
7 %% 2      # 나눗셈의 나머지
8 ^ 2       # 제곱

## 1.2.4 산술연산 함수
log(10)   #자연로그
sqrt(16)
abs(-7)
factorial(3)
sin(pi/2)

## 변수
var1 = 10     # var1 더블클릭 후 ctrl + enter하면 var1의 값이 console창에 표시됨
var2 <- 20
total <- var1 + var2       # <- 단축키: alt + "-"

## 자료형
num <- 2.5
cha <- "Hello"
logi.T <- TRUE
logi.F <- FALSE
NULL
NA
NaN

var3 <- "2.5"
print(var3)   # 자료형은 문자열로 출력됨

var1 + var3   # 숫자형 + 문자형 더하면 error남
var1 + as.numeric(var3)   # 문자형을 숫자형으로 바꾸기

var3 <- as.numeric(var3)
print(var3)   # 숫자형으로 출력됨


## 시험 채점시 코드 실행은 무조건 위에서 아래로만 간다는 가정하에 채점함
## 절대 왔다갔다 안함
## 완료