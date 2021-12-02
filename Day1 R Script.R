#Reading csv into R for manipulation
library(readr)
day1<-read_csv("C:\\Users\\Sam_P\\OneDrive\\Desktop\\Code Advent\\Day1\\day1.csv")
day1

#Create a Boolean vector for when observations are increasing over previous
x=c()
for (i in 1:nrow(day1)){
x[i]=day1[i+1,]>day1[i,]}
Sol1<- length(which(x=="TRUE"))
print(Sol1)

#Create an intermediary vector summing nearby depths
y=c()
for (i in 3:nrow(day1)){
  y[i-2]=day1[i,]+day1[i-1,]+day1[i-2,]
}
print(y)

#Create a final vector to analyze when observations are increasing
z=c()
for (i in 2:length(y)){
  z[i-1]=y[[i]][1]>y[[i-1]][1]
  }
Sol2<-length(which(z=="TRUE"))
print(Sol2)
