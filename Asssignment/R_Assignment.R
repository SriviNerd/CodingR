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
n=6
myFunction(n)

#************QUESTION#2*************#
#Write a function colMeans which will accept a data frame as an input and find out the 
#mean of the data of each column of the dataframe. If the column is a non-numeric field, 
#then the function must display an appropriate message. Use this function on the cricData dataframe 
#that we have created in class.

#Solution
#Load the CricData DataFrame
setwd("C:/RPractice/RProjects/CodingR/Asssignment") #Sets current working directory
list.files()
cricdata <- read.csv("CricData.csv")#reads file to memory
cricdata # display the data

#Trying it manually without functions
nums<-sapply(cricdata, is.numeric)
nums
numCric<-cricdata[ , nums]
numCric
MeansCric<-apply(numCric,MARGIN=2,FUN=mean)
MeansCric

#Try this with Functions
colMeans <- function(d)
{
  nums<-sapply(d, is.numeric)
  numd<-d[ , nums]
  Meansd<-apply(numd,MARGIN=2,FUN=mean)
  return(Meansd)
}
colMeans(cricdata)

#Need help -incomplete need to show custom messages - could not show msg when it is non numeric


#**************QUESTION 3************************

#Q3. Write a function primefn() which will accept a integer parameter, n and return the first n prime numbers. 
#Sieve of Eratosthenes
#From 2 to N iteratively mark the non prime numbers. whichever is marked non prime iterate
#While any non prime left do the loop and then exit all the prime numbers
#Assuming n is an integer and n is not too large
#Iteration need not exceed square root of N

#Pseudo Code (from- wikipidia)
#Input: an integer n > 1

#Let A be an array of Boolean values, indexed by integers 2 to n,
#initially all set to true.

#for i = 2, 3, 4, ..., not exceeding √n:
 # if A[i] is true:
#  for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n :
 # A[j] := false

#Output: all i such that A[i] is true.


PrimeSeive <- function(n)
{
  n <- as.integer(n)
  if(n > 1e8) stop("n too large")
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  lp <- 2
  intsqrtn <- floor(sqrt(n))
  while (lp <= intsqrtn)
  {
    #returns the multiples from 2*lastprime to n by multiples of lp
    primes[seq.int(2*lp, n, lp)] <- FALSE
    #get all the sets of values after lp till sqrt+1 for next iteration
    sel <- which(primes[(lp+1):(intsqrtn+1)])
    #check if any of the vectors are TRUE
    if(any(sel)){
      #Set iteration variable to last plus next
      lp <- lp + min(sel)
    }else lp <- intsqrtn+1
  }
  #after looping return the position of primes that are TRUE
  which(primes)
}

PrimeSeive(100000)



#******************QUESTION4*****************


#Q4. Read the contents of the yearly_sales files into a dataframe.
setwd("C:/RPractice/RProjects/CodingR/Asssignment") #Sets current working directory
list.files()
YearlySales <- read.csv("yearly_sales_assignment 2.csv")#reads file to memory
str(YearlySales)
head(YearlySales,10) # display the data
#Find out the number of records.
nrow(YearlySales)
#Extract the third column of the data frame.
trdcol <- YearlySales[,3]
trdcol
#Extract the gender column of the data frame
g<-YearlySales$gender
g
#Retrieve the 1st and the 2nd rows of the data frame
fs <- YearlySales[1:2,]
fs
#Retrieve the first, third and the fourth columns
ftf <- YearlySales[,c(1,3,4)]
ftf
#Retrieve all the records whose gender is female.
subset(YearlySales,gender=='F')
#Categorize sales_totals into three groups, small (<100), medium (100 – 500) and big (>500).
SALEGRP <- vector(mode ="character", length = length(YearlySales$sales_total))
SALEGRP[YearlySales$sales_total<100] <- "SMALL"
SALEGRP[YearlySales$sales_total>=100 & YearlySales$sales_total<500] <- "MEDIUM"
SALEGRP[YearlySales$sales_total>=500] <- "BIG"

SALEGRP
#Create a new ordered factor with levels, small, medium and big.\

F_SALEGRP <- factor(SALEGRP, levels=c("SMALL","MEDIUM","BIG"),ordered = TRUE)
F_SALEGRP
#Add the ordered factor to the data frame.

SALES <- cbind(YearlySales,F_SALEGRP)
SALES

#Look the summary of the data frame using the summary function.
summary(SALES)
#Find the following:
#a)	Correlation between sales_total and num_of_orders
cor(SALES$sales_total,SALES$num_of_orders)
#b)	Covariance between sales_total and num_of_orders
cov(SALES$sales_total,SALES$num_of_orders)
#c)	Mean of sales_total
mean(SALES$sales_total)
#d)	Median of sales_total
median(SALES$sales_total)
#e)	Range of sales_total
range(SALES$sales_total)
#f)	Standard deviation and variance of sales_total
sd(SALES$sales_total)
var(SALES$sales_total)
#g)	Find out the standard deviation of the first three columns of the data frame using only one function.
apply(SALES[1:3], 2, FUN =  function(cl) sds=sd(cl,na.rm=TRUE))




#***************QUESTION 5 **************************
#Q5. Download and install the “vcd” package. Use the Arthritis data set for the following problems

#install the package
install.packages('vcd')

#Load the libraries
#Visualizing Categorical Data

library(MASS)
library(grid)
library(vcd)

#Looking at the firt 10 records
head(Arthritis,10)
summary(Arthritis)
class(Arthritis)
#Draw a vertical bar plot and a horizontal bar plot on the number of “None”, “Some” and “Marked”. 
improvedCnt <- table(Arthritis$Improved)
improvedCnt
class(improvedCnt)

barplot(improvedCnt)
barplot(improvedCnt,horiz=TRUE)

#Give a title and label the axes.
barplot(improvedCnt, main="Vertical Bar Plot", xlab = "Improvement",ylab = "Frequency")
barplot(improvedCnt, main="Horizontal Bar Plot", xlab = "Improvement",ylab = "Frequency",horiz=TRUE)

#Consider the cross tabulation of treatment type and improvement status.
data("Arthritis")
names(Arthritis)
table(Arthritis$Treatment, Arthritis$Improved)

#Draw the graph as a stacked bar plot and a grouped bar plot.
barplot(as.matrix(improvedCnt))


barplot(improvedCnt, main="Arthritis improved grouped bar plot",
        xlab="x axis", col=c("darkblue","red", "green"),
        legend = rownames(improvedCnt), beside=TRUE)

improvedCnt

#Draw bar plots for sorted mean and median values.
summary(Arthritis)

ageMean<-aggregate(Arthritis[, 4], list(Arthritis$Improved), mean)
ageMean
ageMedian<-aggregate(Arthritis[, 4], list(Arthritis$Improved), median)
ageMedian
class(ageMean)
class(ageMedian)

barplot(as.vector(ageMean$x))
barplot(as.vector(ageMedian$x))

#Draw a spinogram.

treatment <- factor(rep(c(1, 2), c(43, 41)), levels = c(1, 2),
                    labels = c("placebo", "treated"))
improved <- factor(rep(c(1, 2, 3, 1, 2, 3), c(29, 7, 7, 13, 7, 21)),
                   levels = c(1, 2, 3),
                   labels = c("none", "some", "marked"))

treatment
improved
(spineplot(improved ~ treatment))
#***************QUESTION 6 **************************
#Q6. Create a vector of values – 10, 12, 4, 16, 8. Let us assume that these are the 
#number of gold medals won by the countries US, UK, Australia, China and France in a particular competition.

vvalues <- c(10,12,4,16,8)
vvalues
#Draw a simple pie chart, pie chart with percentages

labelsss <- c("US", "UK", "Australia", "Germany", "France")
pie(vvalues, labels = labelsss, main="Pie Chart of Countries")

#a 3D pie chart based on the above.
install.packages('plotrix')
library(plotrix)
pie3D(vvalues,labels=labelsss,explode=0.1,
      main="Pie Chart of Countries ")

#Draw a fan plot based on the above data. 

iucn.df<-data.frame(area=c("Africa","Asia","Europe","N&C America",
                           "S America","Oceania"),threatened=c(5994,7737,1987,4716,5097,2093))
fan.plot(vvalues,max.span=pi,
         labels=paste(labelsss,vvalues,sep="-"),
         main="Fan plot won by country",ticks=276)

#***************QUESTION 7 **************************

install.packages("ggplot2")
library(ggplot2)
#Q7. Load the mtcars data
mtcars
names(mtcars)
#Draw a simple histogram.


qplot(mtcars$mpg,
      geom="histogram", 
      binwidth = 0.5)

#Draw another histogram with 12 bins of red color.

qplot(mtcars$mpg,
      geom="histogram",
      binwidth = 12,  
      main = "Histogram for mpg", 
      xlab = "mpg",  
      fill=I("red")
)

summary(mtcars)

ggplot(data=mtcars, aes(mtcars$mpg)) + 
  geom_histogram(breaks=seq(20, 50, by = 2), 
                 col="black", 
                 fill="red", 
                 alpha = .2) + 
  labs(title="Histogram for Mpg") +
  labs(x="Mpg", y="Count") + 
  xlim(c(20,30)) + 
  ylim(c(0,6))


#Draw another histogram with rug plot and frame.
mtcars
ggplot(mtcars,aes(mpg,qsec))  + geom_point() + geom_rug(col="blue",alpha=.1)

#Draw the fourth histogram with normal curve.

gg <- ggplot(mtcars, aes(x=mpg)) 
gg <- gg + geom_histogram(binwidth=2, colour="black", aes(y=..density.., fill=..count..))
gg <- gg + scale_fill_gradient("Count", low="#DCDCDC", high="#7C7C7C")
gg <- gg + stat_function(fun=dnorm,
                         color="red",
                         args=list(mean=mean(mtcars$mpg), 
                                   sd=sd(mtcars$mpg)))

gg
class(gg)
#Draw a kernel density plot

ggplot(mtcars, aes(x=mpg)) + geom_density()

ggplot(mtcars, aes(x=mpg)) + geom_density(aes(group=vs, colour=vs, fill = vs))
 

#Draw a box plot, and then draw a parallel box plot to compare these three groups: four, six and eight cylinders. 
ggplot(mtcars, aes(x=cyl, y = vs)) + geom_boxplot(aes(group=vs, colour=vs, fill = vs))
--incomlete...

#***************QUESTION 8 **************************


#Q8. Refer to the BankSalaries.csv file. Read the data in a dataframe. 
#Write a function which will accept the dataframe and return the following 
#analysis in the format shown below:

setwd("C:/RPractice/RProjects/CodingR/Asssignment") #Sets current working directory
list.files()
BankSal <- read.csv("BankSalaries_assignment2.csv")#reads file to memory
str(BankSal)
BankSal
summary(BankSal)

head(BankSal)

subtable1 <- round(prop.table(table(BankSal$JobGrade,BankSal$Gender),2) * 100,2)
subtable1
class(subtable1)
Totals <- round(prop.table(table(BankSal$JobGrade)) * 100,2)
Totals
class(Totals)
FinalTable <- cbind(subtable1,Totals)
dFinal <- as.data.frame(FinalTable)
#dFinal$JobGrade <- seq(1:6)
print(dFinal)
#unable to format.
dFinal$Female = paste(dFinal$Female,"%")
dFinal$Male = paste(dFinal$Male,"%")
dFinal$Totals = paste(dFinal$Totals,"%")
print(dFinal)
