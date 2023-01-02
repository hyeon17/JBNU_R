## Date: 2022-12-26
## Course: 2022학년도 동기 계절학기 - R입문
## Author: Park(silvermagnolia68@gmail.com)


######################################################################


## [Chapter 2] 데이터 객체
## 2.2 벡터
## 2.2.1 벡터 이해
v1 <- c(1, 2, 3, 4, 5)                # 숫자형 벡터
v2 <- c("a", "b", "c", "d")           # 문자형 벡터
v3 <- c(T, F, F, F, T, T)             # 논리형 벡터
v4 <- c(1, 2, 3, "a", "b", "c")       # 문자형 벡터

print(v1)
print(v2)
print(v3)
print(v4)

v5 <- c(6, 7, 8, 9, 10)
v6 <- c(v5, v1)


# 연속적인 숫자로 이루어진 벡터
v7 <- 1:100                           # 1~100 사이의 정수 값
print(v7)


# 일정한 간격의 숫자로 이루어진 벡터
v8 <- seq(1, 100, 2)                  # 1~100 사이의 홀수 값
print(v8)

v9 <- seq(to = 100, by = 2, from = 1) # 1~100 사이의 홀수 값
print(v9)


# 반복된 숫자로 이루어진 벡터
# 1,2,3을 3번 반복
# 결과? 1,2,3,1,2,3,1,2,3 --> 매개변수 times = 3 설정
# 결과? 1,1,1,2,2,2,3,3,3 --> 매개변수 each = 3 설정
v10 <- rep(1:3, times = 3)
v11 <- rep(1:3, each = 3)


## 2.2.2 인덱스
v <- c(6, 8, 1, 9, 7)
v[1]
v[6]
v[c(1,3,5)]
v[1:3]
v[seq(2, 5, 2)]
v[rep(1, 10)]
v[rep(c(1,3,4), each = 10)]

v[c(1,2,3,5)]
v12 <- 1:100
length(v12)

# 32번째, 86번째 값을 제외
v13 <- v12[-c(32, 86)]
length(v13)


## 2.2.4 벡터 산술연산
v14 <- c(3, 7, 6)
v14 + 2             # 5, 9, 8
v14 - 2
v14 * 2
v14 / 2

v15 <- c(4, 2, 8)
v14 + v15           # 7, 9, 14
v14 - v15           # -1, 5, -2
v14 * v15           # 12, 14, 48
v14 / v15           # 0.75, 3.50, 0.75

v16 <- 1:5
v15 + v16           # warning! 두 벡터의 길이(개수)가 같아야 함


# 벡터에 적용 가능한 함수
sum(1:100)          # 합계
mean(1:100)         # 평균
median(1:100)       # 중앙값
max(1:100)          # 최대값
min(1:100)          # 최소값
var(1:100)          # 분산(variance)
sd(1:100)           # 표준편차(standard deviation)
sqrt(var(1:100))
length(1:100)       # 벡터의 길이


## 2.2.5 논리연산자
a <- 2
b <- 5

a > b                # a가 b보다 큰가? FALSE
a < b                # a가 b보다 작은가? TRUE
a >= b               # a가 b보다 크거나 같은가? FALSE
a <= b               # a가 b보다 작거나 같은가? TRUE
a == b               # a와 b가 같은가? FALSE
a != b               # a와 b가 다른가? TRUE

v17 <- 1:20
v17 > 10             # 벡터 v17이 10보다 큰가?
v17[v17 > 10]        # v17에서 10보다 큰 값 출력

table(v17 > 10)
sum(v17 > 10)        # v17에서 10보다 큰 값의 개수
sum(v17[v17 > 10])   # v17에서 10보다 큰 값의 합계


### 2.2.6 리스트
myinfo <- list(name = "Kim",
               age = 25,
               smoking = TRUE,
               score = c(70, 85, 90))
myinfo
myinfo$age
myinfo[[2]]


## 2.2.7 팩터
season <- c("spring", "fall", "winter", "summer", "summer", "spring")
table(season)

season.new <- factor(season)                    # 팩터로 변환
print(season)                                   # 문자형 벡터
print(season.new)                               # 팩터(factor)
levels(season.new)
table(season.new)                               # 빈도표
barplot(table(season.new))                      # 막대그래프

# 팩터의 levels 순서 지정
season.new2 <- factor(season, levels = c("spring", "summer", "fall", "winter"))
print(season.new2)
barplot(table(season.new2))

length(season.new2)                             # 벡터의 길이(데이터 개수)
#season.new2 <- c(season.new2, "summmer")
season.new2[7] <- "summer"                      # 새로운 값 "summer" 추가
season.new2[8] <- "ABO"                         # warning! 사전에 정의된 값만 입력 가능
season.new2                                     # season.new2[8] 값은 NA(결측값)

