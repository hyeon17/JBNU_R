## Date: 2022-12-27
## Course: 2022학년도 동기 계절학기 - R입문
## Author: Park(silvermagnolia68@gmail.com)


######################################################################


## [Chapter 2] 데이터 객체
## 2.3 행렬과 데이터프레임
## 2.3.1 행렬 이해
# 특정 위치의 값 추출
m1 <- matrix(1:20, nrow = 4, byrow = TRUE)
m1

m1[2, 4]              # 2행 4열에 위치한 값인 9 출력
m1[3, ]               # 3행에 있는 모든 값 출력
m1[, 5]               # 5열에 있는 모든 값 출력

m1[, c(1,2,4)]        # 1, 2, 4열에 있는 모든 값 출력
m1[,]                 # 모든 행, 모든 열에 있는 값 출력, m1과 같음


# 벡터 또는 행렬 결합
m2 <- matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)    # 4x3 행렬
m3 <- matrix(13:18, nrow = 2, ncol = 3)                 # 2x3 행렬
m4 <- rbind(m2, m3)                                     # 행 결합, 6x3 행렬

v <- 1:6
cbind(m4, v)          # 열 결합, 6x5 행렬


# 행 이름, 열 이름 지정
score <- matrix(c(80, 67, 74,
                  82, 95, 88,
                  75, 84, 82), nrow = 3, byrow = TRUE)  # 3x3 행렬
score                                                   # 행 이름, 열 이름 모두 없음
rownames(score) <- c("Kim", "Lee", "Park")              # 행 이름 지정
score                                                   # 행 이름만 있음
colnames(score) <- c("Kor", "Eng", "Math")              # 열 이름 지정
score                                                   # 행 이름, 열 이름 모두 있음

rownames(score)       # 행 이름
colnames(score)       # 열 이름


## 2.3.2 데이터프레임 이해
df1 <- data.frame(name = c("Kim", "Lee", "Park", "Choi"),
                  age = c(24, 25, 22, 27),
                  btype = factor(c("A", "B", "O", "B")),
                  religion = c(TRUE, FALSE, TRUE, TRUE))
df1
rownames(df1)
colnames(df1)


# 특정 위치의 값 추출
df1[1, 2]
df1[1, ]
df1[, 3]

df1$btype

# 벡터 또는 데이터프레임 결합
df2 <- cbind(df1, c("dog", "cat", "bird", "dog"))
df2


# 열 이름 지정
colnames(df2)
colnames(df2)[5] <- "pet"
df2

# another method
cbind(df1, pet = c("dog", "cat", "bird", "dog"))


## 2.3.3 행렬과 데이터프레임 다루기
## 2.3.3.1 기본 정보 확인
iris
dim(iris)             # 행과 열의 개수

dim(iris)[1]          # 행의 개수
nrow(iris)            # 행의 개수

dim(iris)[2]          # 열의 개수
ncol(iris)            # 열의 개수

rownames(iris)        # 행 이름
colnames(iris)        # 열 이름

head(iris)            # 데이터셋 앞부분 일부 출력
tail(iris)            # 데이터셋 뒷부분 일부 출력

str(iris)             # 데이터셋 요약 정보 보기

levels(iris$Species)  # 품종(Species)의 종류
unique(iris[, 5])

table(iris$Species)   # 빈도표

iris$Species
iris[, "Species"]

iris[, 1:2]
iris[, c("Sepal.Length", "Sepal.Width")]


## 2.3.3.2 원소값 추출
iris.new1 <- subset(iris, Species == "setosa")
iris.new2 <- subset(iris, Sepal.Length>5.0 & Sepal.Width>4.0)

iris.new3 <- subset(iris,
                    subset = Petal.Length > 3.758,
                    select = c("Petal.Length",
                               "Petal.Width",
                               "Species"))


## 2.3.3.3 행렬 및 데이터프레임 산술연산
m5 <- matrix(1:20, nrow = 4, ncol = 5)
m6 <- matrix(21:40, nrow = 4, ncol = 5)

m1 + 2
m1 - 10
m1 * 5
m1 / 2

m5 + m6
m5 - m6
m5 * m6
m5 / m6

m7 <- matrix(1:6, nrow = 2, ncol = 3)    # 2x3 행렬
m8 <- matrix(1:12, nrow = 3, ncol = 4)   # 3x4 행렬
m7 %*% m8                                # 행렬의 곱, 2x4 행렬

t(m7)                                    # 전치행렬, 3x2 행렬


# 행별, 열별 합계 및 평균
score <- matrix(c(80, 67, 74,
                  82, 95, 88,
                  75, 84, 82),
                nrow = 3, byrow = TRUE)
rownames(score) <- c("Kim", "Lee", "Park")
colnames(score) <- c("Kor", "Eng", "Math")

rowMeans(score)       # 행별 평균, rowSums(score) / ncol(score)
rowSums(score)        # 행별 합계

colMeans(score)       # 열별 평균
colSums(score)        # 열별 합계

rowMeans(iris[, -5])
colMeans(iris[, -5])

