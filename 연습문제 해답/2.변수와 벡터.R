#3
pi <- 3.14
r <- c(10,12,15)
area <- pi*r*r
print(area)

#4
x <- c(6,8,10)
y <- 2*x*x+5*x+10
print(y)

#5
val.a <- 10
val.b <- 0 #val.b에 값을 할당
sum.ab <- val.a+val.b

#6
vc.1 <- c(95,86,47,55,68)
print(vc.1)

#7
vc.2 <- seq(100, 200, 2)
print(vc.2)

#8
vc.3 <- rep(TRUE,times=20)
print(vc.3)

#9
d <- seq(100,200,1)
#9-1
d

#9-2
d[10]

#9-3
d[(length(d)-10):length(d)]

#9-4
d[d%%2 == 1]

#9-5
d[d%%3 == 0]

#9-6
d.20 <- d[1:20]
d.20

#9-7
d.20[-5]

#9-8
d.20[-c(5,7,9)]

#10
absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)
names(absent) <- c("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC")
#10-1
absent

#10-2
absent[5]

#10-3
absent[c(7,9)]

#10-4
sum(absent[1:6])

#10-5
mean(absent[7:12])

#11
d1 <- 1:50
d2 <- 51:100
#11-1
d1
d2

#11-2
length(d2)

#11-3
d1+d2
d2-d1
d1*d2
d2/d1

#11-4
sum(d1)
sum(d2)

#11-5
sum(c(d1,d2))

#11-6
min(d2)
max(d2)

#11-7
mean(d2)
mean(d1)
mean(d2) - mean(d1)

#11-8
sort(x = d1, decreasing = TRUE)

#11-9
sort(x = d1, decreasing = FALSE)
sort(x = d2, decreasing = FALSE)
d3 <- c(d1[1:10], d2[1:10])

#12
v1 <- 51:90
#12-1
v1[v1<60]

#12-2
length(v1[v1<70])

#12-3
sum(v1[v1>65])

#(4)
v1[v1>60 & v1<73]

#(5)
v1[v1<65 | v1>80]

#(6)
v1[v1%%7 == 3]

#(7)
v1[v1%%7 == 0] <- 0

#(8)
sum(v1[v1%%2 == 0])

#(9)
v1[v1%%2 == 1 | v1 > 80]

#(10)
v1[v1 %% 3 == 0 & v1 %% 5 == 0]

#(11)
v1[v1 %% 2 == 0] <- v1[v1 %% 2 == 0] * 2

#(12)
v1 <- v1[v1 %% 7 != 0]
v1