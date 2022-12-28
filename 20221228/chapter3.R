## chapter3 프로그래밍 구조
## 3.1 조건문
##3.1.1 if-else문
score <- 60

if(score >= 80) {
  result <- "Pass"
} else {
  result <- "Fail"
}

print(result)


#method2
score <- 60

result <- "Pass"
if(score < 80) {
  result <- "Fail"
}

print(result)


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

#ifelse() 함수
score <- 85
result <- ifelse(score >= 80, "Pass", "Fail")
print(result)

#3.1.2 다중 if-else 문
score <- 85 

if(score >= 90) {
  grade <- "A"
} else if(score >= 80) {
  grade <- "B"
} else if(score >= 70) { 
  grade <- "C"
} else if(score >= 60) { 
  grade <- "D"
} else { 
  grade <- "F"
}

print(grade)

#3.1.3 조건문에서 논리연산자 사용
sbp <- 125                    # 수축기 혈압(systolic blood pressure)
dbp <- 93                     # 이완기 혈압(diastoic blood pressure)

if(sbp < 120 & dbp < 80) {
  bp.type <- "정상 혈압"
} else if((sbp >= 120 & sbp <= 139) | (dbp >= 80 & dbp <= 89)) {
  bp.type <- "고혈압 전단계"
} else if((sbp >= 140 & sbp <= 159) | (dbp >= 90 & dbp <= 99)) {
  bp.type <- "1단계 고혈압"
} else if(sbp >= 160 | dbp >= 100) {
  bp.type <- "2단계 고혈압"
}
print(bp.type)             

# 거꾸로
if(score<=59){
  grade <- "F"
} else if(score<=69){
  grade <- "D"
} else if(score>=79){
  grade <- "C"
} else if(score<=89){
  grade <- "B"
} else{
  grade <- "A"
}
  


if(sbp >=160 | dbp >= 100) {
  bp.type <- "2단계 고혈압"
} else if((sbp >= 140 & sbp <= 159) | (dbp >= 90 & dbp <= 99)) {
  bp.type <- "1단계 고혈압"
} else if((sbp >= 120 & sbp <= 139) | (dbp >= 80 & dbp <= 89)) {
  bp.type <- "고혈압 전단계"
} else if(sbp < 120 & dbp < 80) {
  bp.type <- "정상 혈압"
}
print(bp.type)  #1단계 고혈압

## 실습
## BMI: 비만도를 나타내는 지표
## BMI: kg/(m^2)
## BMI 18.5 미만: 저체중
## BMI 18.5 이상 23.0 미만: 정상체중
## BMI 23.0 이상 25.0 미만: 과체중
## BMI 25.0 이상 30.0 미만: 경도비만
## BMI 30.0 이상 35.5 미만: 중등도비만
## BMI 35.0 이상 : 고도비만

height <- 1.75
weight <- 70
BMI <- weight/(height^2)

if(BMI<18.5){
  type <- "저체중"
} else if(BMI<23.0){
  type <- "정상체중"
} else if(BMI<25.0){
  type <- "과체중"
} else if(BMI<30.0){
  type <- "경도비만만"
} else if(BMI<35.0){
  type <- "중증도비만"
} else {
  type <- "고도비만"
}
print(BMI)
print(type)