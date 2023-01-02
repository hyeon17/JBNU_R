## Date: 2022-12-23
## Course: 2022학년도 동기 계절학기 - R입문
## Author: Park(silvermagnolia68@gmail.com)


######################################################################


## [Chapter 1] R 소개 및 기초
## 1.2 R 기초
## 1.2.1 산술연산
1 + 2                       # 덧셈
3 - 2                       # 뺄셈
4 * 2                       # 곱셈
5 / 2                       # 나눗셈
7 %% 2                      # 나눗셈의 나머지
8 ^ 2                       # 제곱


## 1.2.4 산술연산 함수
log(10)                     # 자연로그
sqrt(16)                    # 제곱근
abs(-7)                     # 절대값
factorial(3)                # 계승(factorial)
sin(pi/2)                   # sin 함수


## 1.2.5 변수
var1 = 10
var2 <- 20
total <- var1 + var2


## 1.2.6 자료형
num <- 2.5                  # 숫자형
cha <- "Hello"              # 문자형
logi.T <- T                 # 논리형
logi.F <- F                 # 논리형
NULL                        # 특수값 - 정의되지 않음을 의미
NA                          # 특수값 - 결측값(missing value)
NaN                         # 특수값 - 수학적으로 정의가 불가능한 값

var3 <- "2.5"
print(var3)                 # 문자형

var1 + var3                 # error! 숫자와 문자는 더할 수 없음

var3 <- as.numeric(var3)    # 문자형을 숫자형으로 변환
print(var3)                 # 숫자형

