#R Assignment - XLRI DS Program 
#Author@@@--Srividhya Balasubramaniam---
#Date @@@@--May21-2016

#************QUESTION#1*************#
#BEGIN
#Write a function, called myFunction(), which takes a single argument n, an implements the following:
  #Simulate n independent numbers, denoted by x = x1, x2, x3,.. xn  from the N(0,1) distribution.
  #Calculate the mean, xmean.
  #If xmean >= 0, then simulate n independent numbers denoted by y = y1, y2, y3,.. yn from the exponential density with the mean xmean.
  #If  xmean < 0, then simulate n independent numbers denoted by z = z1, z2, z3,.. zn from the exponential density with the mean -xmean.
  #Set y = -z
  #Calculate k which is the number of j with |y_j |  > |x_j |
  # Return the list of x, y and k with the names xVec, yVec and count respectively.
#SOLUTION

rexp(5, rate=1/30)
rexp(5, rate=1)
rexp(5, rate=1/5)
rnorm(5)

myFunction <- function(n) 
{ 
  #Normal Distribution with mean 0 and SD 1 generates n observations of random numbers
  xVec <- rnorm(n,0,1) 
  #Gives the mean of the vector xVec
  xMean <- mean(xVec) 
  #We use rexp to generate the exponential density with 1/mean
  #Then based on conditions we get the sign of value and re-apply
  yVec <- sign(xMean)*rexp(n, rate=abs(1/xMean)) 
  #Get the total number of values where unsigned y is > unsigned x eg: sum(4:3>2)
  count <- sum( abs(yVec) > abs(xVec) ) 
  #returns a list of the above vectors
  return(list(xVec=xVec, yVec=yVec, count=count))
}
n=5
myFunction(n)

#************QUESTION#2*************#
