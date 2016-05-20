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

meanWeight <- function(dirPath, inpDay)
