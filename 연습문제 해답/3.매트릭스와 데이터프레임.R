#01.
#(1)
m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m, f)
score

#(2)
colnames(score) <- c("male", "female")

#(3)
score[2,]

#(4)
score[,"female"]

#(5)
score[3,2]

#02.
#(1)
st <- data.frame(state.x77)

#(2)
st

#(3)
colnames(st)

#(4)
rownames(st)

#(5)
dim(st)

#(6)
str(st)

#(7)
rowSums(st)
mean(rowSums(st))

#(8)
colSums(st)
mean(colSums(st))

#(9)Florida주의 모든 정보 출력
st["Florida", ]

#(10) 50개 주의 수입 정보 출력
st[, "Income"]

#(11) Texas주의 면적을 출력
st["Texas", "Area"]

#(12)Ohio주의 인구와 수입을 출력
st["Ohio", c("Population", "Income")]

#(13) 인구가 5000이상인 주의 데이터만 출력
st[st[,"Population"] > 5000,]
subset(x=st, Population>=5000)

#(14) 수입이 4500이상인 주의 인구, 수입, 면적을 출력
st[st[,"Income"] > 4500, c("Population", "Income", "Area")]
subset(x=st, Income>=4500, c("Population", "Income", "Area"))

#(15) 수입이 4500이상인 주의 개수
nrow(st[st[,"Income"] > 4500,])
nrow(subset(x=st, Income>=4500))

#(16) 전체면적이 100,000 이상이고 결빙일수가 120이상인 주
st[st[, "Area"] > 100000 & st[, "Frost"] > 120,]
subset(x = st, Area > 100000 & Frost > 120)

#(17) 인구가 2,000미만이고 범죄율이 12미만인 주
st[st[, "Population"] < 2000 & st[, "Murder"] < 12,]
subset(x = st, Population < 2000, Murder < 12)

#(18)문맹률이 2.0이상인 주의 평균수입
mean(st[st[, "Illiteracy"] >= 2.0, "Income"])

#(19)문맹률이 2.0미만인 주와 2.0이상인 주의 평균 수입의 차이
mean(st[st[, "Illiteracy"] < 2.0, "Income"]) - mean(st[st[, "Illiteracy"] >= 2.0, "Income"])

#(20)기대수명이 가장 높은 주
rownames(st[st[,"Life.Exp"] == max(st[, "Life.Exp"]), ])
rownames(subset(x = st, Life.Exp == max(st[, "Life.Exp"])))

#(21) Pennsylvania주보다 수입이 높은 주
rownames(st[st[,"Income"] > st["Pennsylvania", "Income"], ])
rownames(subset(x = st, Income > st["Pennsylvania", "Income"]))

#03.
#(1)
class(mtcars)

#(2)
dim(mtcars)

#(3)
typeof(colnames(mtcars))

#(4)
help(mtcars)

# mpg : 연비,  cyl : 실린더 개수,  dsip : 배기량,  hp : 마력,  drat : 차축비,  wt : 무게
# qsec : 1/4 mile time - 초기 가속도를 의미함, vs : 엔진 형태, am : 수동, 자동
# gear : 전방 기어 개수, # carb : 카뷰레터의 개수
#(5)
rownames(mtcars[ mtcars[, "mpg"] == max(mtcars[, "mpg"]), ])

#(6)
rownames(subset(x = mtcars, gear == 4 & mpg == min(subset(x = mtcars, gear == 4)[, "mpg"])))
rownames(mtcars[mtcars[,"gear"] == 4,][order(mtcars[mtcars[,"gear"] == 4,]$mpg, decreasing = FALSE),])[1]

#(7)
mtcars["Honda Civic", c("mpg", "gear")]

#(8)
rownames(mtcars[mtcars[, "mpg"] > mtcars["Pontiac Firebird", "mpg"], ])

#(9)
mean(mtcars[, "mpg"])

#(10)
length(unique(mtcars[,"gear"]))

#4
#(1)
class(airquality)

#(2)
head(airquality)

#(3)
airquality[airquality[, "Temp"] == min(airquality[, "Temp"]), c("Month", "Day")]

#(4)
max(airquality[airquality[,"Month"] == 6, "Wind"])

#(5)
mean(airquality[airquality[, "Month"] == 7, "Temp"])

#(6)
mean(na.omit(subset(x = airquality, Month == 5)[, "Ozone"]))

#(7)
nrow(na.omit(airquality[airquality[, "Ozone"] > 100, ]))

#5
#(1)
str(swiss)

#(2)
rownames(swiss[swiss[, "Agriculture"] == max(swiss[, "Agriculture"]), ])

#(3)
swiss[order(swiss$Agriculture, decreasing = TRUE),]

#(4)
subset(x = swiss, Catholic > 80.0)[, "Agriculture"]

#(5)
subset(x = swiss, Examination < 20.0 & Agriculture < 50.0)[, c("Examination", "Agriculture")]

#6
#(1) 수입이 5000이상인 주의 데이터에서 수입,인구,면적 열의 값들만 추출하여 rich_state.csv에 저장
write.csv(x = subset( x = data.frame(state.x77), Income > 5000 )[, c("Income", "Population", "Area")], file = "rich_state.csv", row.names = TRUE)
#subset은 data.frame 형태의 값이 아니면 조건을 인지하지 못함

#(2)
ds <- read.csv(file = "rich_state.csv", row.names = 1)
ds