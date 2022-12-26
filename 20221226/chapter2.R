## chapter 2 데이터 객체

v1 <- c(1, 2, 3, 4, 5)                    # 숫자형 벡터
v2 <- c("a,", "b", "c")                   # 문자형 벡터
v3 <- c(TRUE, FALSE, FALSE)               # 논리형 벡터
v4 <- c(1, 2, 3, "a", "b,", "c")          # 문자형 벡터

print(v1)
print(v2)
print(v3)
print(v4)

v5 <- c(6,7,8,9,10)
v6 <- c(v5,v1)

v7 <- 1:100 #연속적인 숫자로 이루어진 벡터
print(v7)

v8 <- seq(1,100,2) #일정한 간격의 숫자로 이루어진 벡터
print(v8)

v9 <- seq(to=100,by=2,from=1)
print(v9)

# 반복된 숫자로 이루어진 벡터
#1,2,3을 3번 반복
# 결과1: 1,2,3,1,2,3,1,2,3
# 걀과2: 1,1,1,2,2,2,3,3,3
v10 <- rep(1:3,times=3) #결과1
v11 <- rep(1:3,each=3) #결과2

#2.2.2 인덱스
v <- c(6,8,1,9,7)
v[1]
v[6]
v[c(1,3,5)] #벡터에 저장된 1,3,5번째 인덱스 출력력
v[1:3]
v[seq(2,5,2)]
v[rep(1,10)] #인덱스1에 들어있는 값 10번 반복하여 출력
v[rep(c(1,3,4),each=10)] #벡터에 저장된 1,3,4번째 인덱스 각각 10번 반복하여 출력

v[c(1,2,3,5)]
v12 <- 1:100

#32번째,86번째 값을 제외
v13 <- v12[-c(32,86)]
length(v13)

#2.2.4 벡터 산술 연산
v14 <- c(3,7,6)
v14+2
v14-2
v14*2
v14/2

v15 <- c(4,2,8)
v14+v15
v14-v15
v14*v15
v14/v15

v16 <- 1:5
#1+4, 2+2, 3+8, 4+4, 5+2
tmp <- v15+v16 #warning!


# 벡터에 적용 가능한 함수
sum(1:100) #합계
mean(1:100) #평균
median(1:100) #중앙값
max(1:100) #최대값
min(1:100) #최소값
var(1:100) #분산(variance)
sd(1:100) #표준편차(standard deviation)
sqrt(var(1:100))
length(1:100) #벡터의 길이

#2.2.5 논리연산자
a <- 2
b <- 5
a>b #a가 b보다 큰가?
a<b #a가 b보다 작은가?
a>=b #a가 b보다 크거나 같은가?
a<=b #a가 b보다 작거나 같은가?
a==b #a와 b가 같은가?
a!=b #a와 b가 다른가?

v17 <- 1:20
v17 > 10 #벡터 v17이 10보다 큰가?
v17[v17>10] #v17에서 10보다 큰 값 출력

table(v17>10)
sum(v17>10) #v17에서 10보다 큰 값의 개수
sum(v17[v17>10]) #v17에서 10보다 큰 값의 합계

#2.2.6 리스트
myinfo <- list(name="kim",
               age=25,
               smoking=TRUE,
               score=c(70,85,90))
myinfo$age
myinfo[[2]]

# 2.2.7 factor
season <- c("spring", "fall", "winter", "summer", "summer", "spring")
table(season)
print(season)
season.new <-factor(season)
print(season)
print(season.new)
levels(season.new)
table(season.new)
barplot(table(season.new))

season.new2 <-factor(season,levels = c("spring","summer","fall","winter")) #레벨의 순서를 지정
print(season.new2)
barplot(table(season.new2))

length(season.new2)
#summer 데이터 추가하기
season.new2 <- c(season.new2,"summer") #방법1
season.new2[7] <- "summer" #방법2
season.new2[8] <- "ABO" #에러