##20221230
#3.4 R패키지
#참고
#install.packages("tibble") #방법 1
#install.packages(c("tibble","readr")) #방법2

library(tidyverse) #tidyverse 실행, R을 켤때마다 실행시켜 줘야함

## chpater4 tidyverse통합패키지
#4.4 파이프 연산자
#iris데이터 프레임에 subset(), nrow()함수를 순차적으로 적용
#[예제] 품종이 setosa인 데이터 개수
nrow(subset(iris,Species=="setosa"))

# 파이프 연산자 사용
iris %>% 
  subset(Species=="setosa") %>% 
  nrow()
  
iris %>% head()  #head(iris)
iris %>% head(10)  #head(iris,n=10)

cat("Hello","world!")  #Hello world!
"world!" %>% cat("Hello,", .)  #Hello world!

iris|>head()   #head(iris)
iris|>head(10)   #head(iris,n=10)

# 4.5 tibble 패키지
library(nycflights13)
flights
flights %>% view()

mytbl <- tibble(
  x=1:5,
  y=1,
  z=x^2+y,
  `^-^`=10
)
mytbl

as_tibble(iris)
as.data.frame(flights)

df <- data.frame(x = 1:3, y = 3:1, z = 4:6)
df
df[, 1:2] %>% class()
df[,1] %>% class()

df[,1] %>% is()
df[,1] %>% is.vector()
df[,1] %>% is.data.frame()

tbl <- tibble(x = 1:3, y = 3:1, z = 4:6)
tbl
tbl[, 1:2] %>% class()
tbl[, 1] %>% class()
tbl[,1] %>% is.vector()

tbl[[1]] %>% class()
tbl$x %>% class()

# 4.6 readr 패키지
library(readr)
data <- read_csv("studentSurvey.csv")
data