#Week 4 proactice code
#Author Srividhya Balasubramaniam
#Refer to the diet_data zip file.
getwd() # Get Working Directory
list.files() # List the files in the directory
setwd("C:/RPractice/DietData") #Sets current working directory
filesL <- list.files()
filesL

#Create one big data frame with everyone’s data in it (Andy, David, John, Mike, Steve). 
BigDiet <- data.frame()
for (i in 1:5) {
  BigDiet <- rbind(BigDiet, read.csv(filesL[i]))
}
str(BigDiet)
BigDiet

#Check the first 10 records and the last 10 records.
head(BigDiet,10)
tail(BigDiet,10)
#Find out the median weight.
median(BigDiet$Weight[which(BigDiet$Day==30)],na.rm=TRUE)

#Write a function which will return the median weight on a specified day.

meanWeight <- function(inpDataFrame,iDay) {
 return(median(inpDataFrame$Weight[which(inpDataFrame$Day==iDay)],na.rm=TRUE)) 
  }
meanWeight(BigDiet,30)
# You can add more usability to the code by creating a function athat inputs the data frame and then returns the median with parameters

#Create the following vectors
#a)	(1,2,3,…19,20)
v1to20 <- seq(1:20)
v1to20
#b)	(20,19,18,…2,1)

v1to20desc <- rev(seq(20:1))
v1to20desc
#c)	(1,2,3,…19,20, 19,18,…2,1)
v3 <- c(v1to20,rev(seq(19:1)))
v3
#d)	(4,6,3) and assign it to the name tmp.
v4<-c(4,6,3)
v4
#e)	(4,6,3,4,6,3………..4,6,3) where there are 10 occurrences of 4
v5<-rep(v4,4)
v5
#f)	(4,6,3,4,6,3………..4,6,3,4) ) where there are 11 occurrences of 4, 10 occurrences of 6 and 10 occurrences of 3
V6<-rep(v4,10,len=31)
V6
#a)	(4,4,…4,6,6,…6,3,3…3) where there are 10 occurrences of 4, 20 occurrences of 6 and 30 occurrences of 3.
V7<-rep(v4,c(10,20,30))
V7
#Create a vector of the values of ex cos(x) at x = 3, 3.1, 3.2, … 6.
t<-seq(3,5,by=0.1)
t
exp(t)*seq(t)
#Use the function paste to create the following character vectors of length 30:
#(a) ("label 1", "label 2", ....., "label 30").
#Note that there is a single space between label and the number following.
v8a<-paste("label",1:30,sep=" ")
v8a
#(b) ("fn1", "fn2", ..., "fn30").
#In this case, there is no space between fn and the number following.
v8b<-paste("fn",1:30,sep="")
v8b
class(v8b)


#typical way of doing this is as follows
s=0
for (i in 1:20) {
  for (j in 1:5) {
    s<-s + (i^4 / (3+j))
    }
}
s
#using sum function we can achieve the above. Outer function is used to apply an opertator on a sequence
sum(outer((1:20)^4,4:8,"/")) #we use 4:8 because we add 3 to the sequence
#∑_(i=1)^20▒∑_(j=1)^5▒i^4/(3+i.j)
sum( (1:20)^4 / (3 + outer(1:20,1:5,"*")))

#Write functions fn1() and fn2() such that if myVec is the vector(x1, x2, x3,.. xn), then fn1(myVec) 
#returns the vector (x12, x22, x33,.. xnn) and fn2(myVec) returns the vector (x1, x22/2, x33/3,.. xnn/n).

v<-seq(1:20)
v
length(v)
v^(1:length(v))
   
fn1<-function(myVec)
{
  z<-myVec^(1:length(myVec))
  return(z)
}

fn1(v)

fn2<-function(myVec)
{
  z<-myVec^(1:length(myVec))/(1:length(myVec))
  return(z)
}
fn2(v)

#Write a function movingaveragefn() such that if myVec is the vector (x1, x2, x3,.. xn) 
#then movingaveragefn(myVec) returns the vector of moving averages:
#(x1 + x2 + x3)/3, (x2 + x3 + x4)/3, … , (xn-2 + xn-1 + xn)/3

movingaveragefn<-function(myVec)
{
n<-length(myVec)
z<-myVec[c(1:(n-2))]/3 + myVec[c(2:(n-1))]/3 + myVec[c(3:n)]/3
return(z)
}
v<-seq(1:5)
movingaveragefn(v)

