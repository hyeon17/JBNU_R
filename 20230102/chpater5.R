## chapter5 데이터 전처리
#5.1 dplyr 패키지
#5.1.1 dplyr 패키지 소개

library(tidyverse)
library(nycflights13)
flights
flights %>% glimpse()  #glimpse(flights)와 같음

# 5.1.2 행 관련 함수
# 5.1.2.1  filter() 함수
flights %>% filter(arr_delay >= 120)                    # 120분 이상 연착한 항공편
flights %>% filter(month == 1 & day == 1)               # 1월 1일에 출발한 항공편
flights %>% filter(month == 3 |month == 5 | month == 8)
flights %>% filter(month %in% c(3,5,8))                 # 3,5,8월에 출발한 항공편

# arrange() 함수
flights %>% arrange(arr_delay) %>% glimpse()
flights %>% arrange(desc(arr_delay)) %>% glimpse()
flights %>% arrange(year, month, day, dep_time)

# 대략 정시에 출발한 항공편 중에서 가장 늦게 도착한 항공편 확인
flights %>% filter(dep_delay <= 10 & dep_dalay >= -10) %>% arrange(desc(arr_delay))           

# 5.1.3 열 관련 함수
# 5.1.3.1 select() 함수
flights %>% select(year, month, day)                  # 출발 연월일 변수 추출
flights %>% select(year:day)
flights %>% select(-(year:day))                       # 출발 연월일 변수 제외
flights %>% select(dep.time = dep_time, arr.time = arr_time)    # 변수명 변경
flights %>% select(starts_with("sched"))              # 변수명 "sched"로 시작하는 경우
flights %>% select(ends_with("time"))                 # 변수명 "time"으로 끝나는 경우
flights %>% select(contains("arr"))                  # 변수명 "arr"를 포함하는 경우
flights %>% select(contains("arr"),-carrier)                  # 변수명 "arr"를 포함하면서 "carrier"는 제외하는 경우

# 5.1.3.2 rename() 함수
flights %>% rename(dtime = dep_time, atime = arr_time) %>% glimpse()

# 5.1.3.3 mutate() 함수
# gain = 출발 지연 시간 - 도착 지연 시간
flights %>% mutate(gain = dep_delay - arr_delay) %>% glimpse()
flights %>% mutate(speed = distance / (air_time/60), .before = 1) %>% glimpse()    # 첫번째 변수 앞에 추가
flights %>% mutate(speed = distance / (air_time/60), .after = distance) %>% glimpse()    # distance변수 뒤에 추가

# 5.1.3.4 relocate() 함수
flights %>% arrange(arr_delay) %>% relocate(arr_delay)
flights %>% relocate(air_time, distance)
flights %>% relocate(carrier:dest,.after = day)

# 5.1.4 그룹 관련 함수
# 5.1.4.1 summarise() 함수
summary(iris)
flights %>% 
  summarise(mean=mean(air_time, na.rm = TRUE),
            std_dev=sd(air_time, na.rm = TRUE),
            min=min(air_time, na.rm = TRUE),
            max=max(air_time, na.rm = TRUE))
# na.rm = TRUE는 결측값 제거

# 5.1.4.2 group_by() 함수
flights
flights %>% group_by(month)                           # 데이터 변화 x, 그룹화되어 있음
flights %>% group_by(month) %>% summarise(delay = mean(dep_delay, na.rm = TRUE), n = n()) # 월별 평균 출발 지연 시간, 그룹 크기
myflights <- flights %>% group_by(month)
myflights %>% ungroup() # 그룹화 제거