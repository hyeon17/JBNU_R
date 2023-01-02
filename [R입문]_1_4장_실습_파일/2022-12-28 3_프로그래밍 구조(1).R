## Date: 2022-12-28
## Course: 2022학년도 동기 계절학기 - R입문
## Author: Park(silvermagnolia68@gmail.com)


######################################################################


## [Chapter 2] 데이터 객체
## 2.4 외부 파일 읽기 및 쓰기
## 2.4.1 작업폴더 설정
# setwd("D:/jbnu-R")


## 2.4.2 외부 파일 읽기
data <- read.csv("StudentSurvey.csv", header = TRUE)


# 기본 정보 확인
head(data)
str(data)


# Award 변수를 팩터로 변환
mydata <- data
mydata$Award <- factor(mydata$Award)
str(mydata)


# 흡연자(Smoke=="Yes") 추출
smoking <- subset(mydata, Smoke == "Yes")


## 2.4.3 외부 파일 쓰기 
write.csv(smoking, "smoking.csv", row.names = FALSE)


######################################################################


## [Chapter 3] 프로그래밍 구조
## 3.1 조건문
## 3.1.1 if-else 문
# [예제] 시험 점수가 80점 이상이면 합격(Pass),
#        80점 미만이면 불합격(Fail)으로 판단
# method1
score <- 60

if(score >= 80) {
  result <- "Pass"
  a <- 100
} else {
  result <- "Fail"
  a <- 0
}

print(result)
print(a)


# method2
score <- 60

result <- "Pass"
if(score < 80) {
  result <- "Fail"
}

print(result)


# ifelse() 함수
score <- 60
result <- ifelse(score >= 80, "Pass", "Fail")
print(result)


## 3.1.2 다중 if-else 문
score <- 85

if(score >= 90) {
  grade <- "A"
} else if(score >= 80) {
  grade <- "B"
} else if(score >= 70) {
  grade <- "C"
} else if(score >=60) {
  grade <- "D"
} else {
  grade <- "F"
}

if(score <= 59) {
  grade <- "F"
} else if(score <= 69) {
  grade <- "D"
} else if(score <= 79) {
  grade <- "C"
} else if(score <= 89) {
  grade <- "B"
} else {
  grade <- "A"
}

print(grade)


## 3.1.3 조건문에서 논리연산자 사용
# [예제] 고혈압 분류
sbp <- 125                      # 수축기 혈압(systolic blood pressure)
dbp <- 93                       # 이완기 혈압(diastoic blood pressure)

if(sbp < 120 & dbp < 80) {
  bp.type <- "정상 혈압"
} else if((sbp >= 120 & sbp <= 139) | (dbp >= 80 & dbp <= 89)) {
  bp.type <- "고혈압 전단계"
} else if((sbp >= 140 & sbp <= 159) | (dbp >= 90 & dbp <= 99)) {
  bp.type <- "1단계 고혈압"
} else if(sbp >= 160 | dbp >= 100) {
  bp.type <- "2단계 고혈압"
}

print(bp.type)                  # 고혈압 전단계, wrong!

if(sbp >= 160 | dbp >= 100) {
  bp.type <- "2단계 고혈압"
} else if((sbp >= 140 & sbp <= 159) | (dbp >= 90 & dbp <= 99)) {
  bp.type <- "1단계 고혈압"
} else if((sbp >= 120 & sbp <= 139) | (dbp >= 80 & dbp <= 89)) {
  bp.type <- "고혈압 전단계"
} else if(sbp < 120 & dbp < 80) {
  bp.type <- "정상 혈압"
}

print(bp.type)                  # 1단계 고혈압


## [실습] 신체질량지수 BMI(Body Mass Index)에 따른 비만도 구분
#  BMI = kg / (m^2)
#  BMI 18.5 미만 : 저체중
#  BMI 18.5 이상 23.0 미만 : 정상체중
#  BMI 23.0 이상 25.0 미만 : 과체중
#  BMI 25.0 이상 30.0 미만 : 경도비만
#  BMI 30.0 이상 35.0 미만 : 중등도비만
#  BMI 35.0 이상 : 고도비만
weight <- 70
height <- 1.75

BMI <- weight / (height^2)
if(BMI < 18.5) {
  type <- "저체중"
} else if(BMI < 23.0) {
  type <- "정상체중"
} else if(BMI < 25.0) {
  type <- "과체중"
} else if(BMI < 30.0) {
  type <- "경도비만"
} else if(BMI < 35.0) {
  type <- "중등도비만"
} else {
  type <- "고도비만"
}

print(BMI)
print(type)

