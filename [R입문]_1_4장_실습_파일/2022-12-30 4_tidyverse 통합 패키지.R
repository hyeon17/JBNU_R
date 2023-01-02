## Date: 2022-12-30
## Course: 2022학년도 동기 계절학기 - R입문
## Author: Park(silvermagnolia68@gmail.com)


######################################################################


## [Chapter 3] 프로그래밍 구조
## 3.4 R 패키지
#install.packages("tibble")
#install.packages(c("tibble", "readr"))

library(tibble)       # 설치된 패키지를 호출해야만 내장함수 사용 가능
library(readr)


######################################################################



## [Chapter 4] tidyverse 통합패키지
## 4.4 파이프 연산자
## [예제] 품종이 setosa인 데이터 개수 출력
#  iris 데이터프레임에 subset(), nrow() 함수를 순차적으로 적용
# 기존의 방법 - 함수를 중첩해서 사용
nrow(subset(iris, Species == "setosa"))

# tidyverse - 파이프 연산자 사용
iris %>% 
  subset(Species == "setosa") %>% 
  nrow()


iris %>% head()                 # head(iris)
iris %>% head(10)               # head(iris, n = 10)
"World!" %>% cat("Hello,", .)   # cat("Hello,", "World!")


# R version 4.1.0부터는 기본 파이프 연산자 |> 새롭게 추가됨
# 별도의 패키지 설치/호출 없이 사용 가능
iris |> head()
iris |> head(10)


## 4.5 tibble 패키지
library(nycflights13)
flights
flights %>% View()

# tibble 생성
mytbl <- tibble(
  x = 1:5,
  y = 1,
  z = x^2 + y,
  `^-  ^` = 10
)
mytbl

# tibble 또는 데이터프레임으로 변환
as_tibble(iris)
as.data.frame(flights)


# tibble에서 [] 결과값은 항상 tibble임
df <- data.frame(x = 1:3, y = 3:1, z = 4:6)
df
df[, 1:2] %>% class()
df[, 1] %>% class()

df[, 1] %>% is()
df[, 1] %>% is.vector()
df[, 1] %>% is.data.frame()

tbl <- tibble(x = 1:3, y = 3:1, z = 4:6)
tbl
tbl[, 1:2] %>% class()
tbl[, 1] %>% class()
tbl[, 1] %>% is.vector()


# tibble에서 [[]], $를 사용하여 열 벡터 추출 가능
tbl[[1]] %>% class()
tbl[["x"]] %>% class()
tbl$x %>% class()


## 4.6 readr 패키지
library(readr)
data <- read_csv("StudentSurvey.csv")
data                            # tibble 객체

