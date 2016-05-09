# Practice Week 3 questions.
#Create a vector called "x1" consisting of the numbers 1,3,5 and 7
x1 <- c(1,3,5,7)
x1
#Create a vector called "x2" consisting of the numbers 2,4,6 and 8
x2 <- c(2,4,6,8)
x2
#Subtract x1 from x2
x2-x1
#Create a new vector called "x3" by multiplying vector x1 by vector x2
x3 <- x1*x2
x3
#Create a new vector called "x4" by taking the square root of each member of x3
x4 <- sqrt(x3)
x4
#Calculate the arithmetic mean of the numbers in vector x4
mean(x4)
#Delete the objects x1, x2, x3, x4.
rm(x1,x2,x3,x4)
#Create a new vector called "V1" consisting of the following numbers 1,3,5,7,9,11
V1 <- c(1,3,5,7,8,11)
V1
#Create a matrix called "mat1" using the following function: mat1<-matrix(V1, nrow=2)
mat1 <- matrix(V1,nrow=2)
#Create a matrix called "mat2" using the same function but add an extra argument byrow=TRUE
mat2 <- matrix(V1,nrow=2,byrow=TRUE)
mat1
mat2
#Compare the two matrices
#The data is arranged by rows and columns default property of arrangement is changed.

#Use a subscript to find out the value of the 3rd number in vector x1
x1 <- c(1,3,5,7)
x1
x1[3]
#Use a subscript to find out the value of the numbers in vector x2 that aren't in the 3rd position
x2 <- c(2,4,6,8)
x2
x2[-3]
#Add the 1st number in vector x3 to the 4th number in vector x4
#Create a new vector called "x3" by multiplying vector x1 by vector x2
x3 <- x1*x2
x3
#Create a new vector called "x4" by taking the square root of each member of x3
x4 <- sqrt(x3)
x4
x3[1] + x4[4]
#Create a new vector called "In" which consists of the numbers 1 and 4
In <- c(1,4)
#Use subscripts and the "In" vector to create a new vector, x5, 
#which consists of the sums of the 1st and the 4th numbers of x3 and x4
x5 <- c(x3[In[1]] + x4[In[2]])
x5
#Calculate the sum of all the numbers in x2 that are less than 7
x2[x2< 7]
sum(x2[x2<7])
#Calculate the mean of all the numbers in x1 that are greater than or equal to 3
mean(x1[x1>=3])
#Multiply the second value in the first row of mat1 by the third value in the second row of mat2
mat1[1,2] * mat1[2,3]
#Create a new vector called "V2" which consists of the numbers in the first row of mat1 
#added to the numbers in the second row of mat2
V2 <- mat1[1,]*mat1[2,]
V2
#Create a new vector called "V3" which consists of the numbers in the second 
#column of mat2 multiplied by the mean of the numbers in the second row of mat1
mat2[,2]
mean(mat1[2,])
V3<-mat2[,2] * mean(mat1[2,])
V3
#Create a new matrix called "mat3" which consists of the first row of mat1 as the first column and 
#then the first row of mat2 as the second column
mat1
mat2
x <- t(mat1)
y <- t(mat2)
x
y
mat3 <- cbind(x[,1],y[,1])
mat3
mat1
mat2

#Create a vector of the first 6 prime numbers.
V4 <- c(2, 3, 5, 7, 11, 13)
V4
# Find the number of elements in the vector.
length(V4)
# Look at the fourth element.
V4[4]
# Look at the 4th, 5th and 6th element.
V4[4:6]
# Find out the prime numbers in the vector which are less than 7.
V4[V4 < 7]
# Create another vector with all the elements multiplied by 2.
V5 <- V4 * 2
V5
#***********************
#FILE BASED PROBLEMS
#***********************

getwd() # Get Working Directory
list.files() # List the files in the directory
setwd("C:/RPractice/DietData") #Sets current working directory
list.files()
#Read the Andy.csv file and display the first 6 rows of the data.
Andy <- read.csv("Andy.csv")#reads file to memory
head(Andy, 6)
#Check the number of records.
length(readLines("Andy.csv"))
# If the file is huge without going into memory issues you will use the folowing
# 
#   testcon <- file("xyzfile.csv",open="r")
# readsizeof <- 20000
# nooflines <- 0
# ( while((linesread <- length(readLines(testcon,readsizeof))) > 0 ) 
#   nooflines <- nooflines+linesread )
# close(testcon)
# nooflines
# you may also use countLines() in the R.utils package
#tmp <- readChar(pathToFilename, file.info(pathToFilename)$size)
#length(gregexpr("\n",tmp)[[1L]])
# the above is 3* faster than count lines
#***
#Use the str() and the summary() functions on the data.
str(Andy)
summary(Andy)
#Display the names of the columns.
names(Andy)
#Find Andy's weight on Day 1 and Day 30. Do it at first with the which function and then with the subset function.
