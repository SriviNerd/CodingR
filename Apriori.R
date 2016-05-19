#Market Basket Analysis in R
# We need to to install some pakages for additional formulaa
install.packages('arules',dependencies = TRUE)
install.packages('arulesViz',dependencies = TRUE)
#Pakages are collections of files
library(arules)
library(arulesViz)

#Prepare the data -Original TansData was not in the format that R requires so make it true and fales n denormalize
#Refer to the excel sheet for the complete understanding
#Folowing file has the sales transaction data
#File Handling
getwd() # Get Working Directory
list.files() # List the files in the directory
setwd("C:/RPractice/Data") #Sets current working directory
transData <- read.csv("Transactions.csv")
head(transData,10)
length(transData)
Transaction<-as(transData,"transactions")Transaction<-as(transData,"transactions")

class(Transaction)
summary(Transaction)

Transaction@data[,1]
Transaction@data[,1:2]
paste("Hey", "How are you")
paste("Hey", "Hello", 9)
x<- "Hello"
paste(Transaction@data[,1],x)
Transaction@itemInfo

paste(Transaction@itemInfo[Transaction@data[,1],"labels"])
paste(Transaction@itemInfo[Transaction@data[,1],"labels"],collapse=",")

#We need to format the output hence use lable and separate with , whereever true we get the lables back
for(i in 1:20){
  print(paste(Transaction@itemInfo[Transaction@data[,i],"labels"],collapse=",") )
}
#We will now ue the apply function to do this to all columns

apply(Transaction@data[,1:10],2, function(r) paste(Transaction@itemInfo[r,"labels"],collapse=","))

#Apriori Algorithm
#We get the minumum support threshold to 0.02 and do it for one product combination
itemSets<-apriori(Transaction,parameter=list(minlen=1,maxlen=1,support=0.02,target="frequent itemsets"))
summary(itemSets)
inspect(head(sort(itemSets,by="support"),20))
#We get the minumum support threshold to 0.02 and do it for 2 product combination
itemSets<-apriori(Transaction,parameter=list(minlen=1,maxlen=2,support=0.02,target="frequent itemsets"))
summary(itemSets)
inspect(head(sort(itemSets,by="support"),20))
#We get the minumum support threshold to 0.02 and do it for 3 product combination
itemSets<-apriori(Transaction,parameter=list(minlen=1,maxlen=3,support=0.02,target="frequent itemsets"))
summary(itemSets)
inspect(head(sort(itemSets,by="support"),20))
#How to infer results
#Highersupport means higher% of occurance - Support(x) is count(x in the dataset)/Total counts of data set
#Higher confience means the Rules are positively co-related but cannot gurantee -
#Confidence of a rule {x} -> {y} is Support (x^y) / Support(x)
#Confidence might not gurantee co-relation
#Lift is Confidence / support(y) - If lift is >1 then it is useful and positively co-related, = 1 has no significance
#lift < 1 means they are negatively co-related if items are statistically independant
#Leverage also says if a rule is really related or a conincidence
#leverage = support(x^y) - support(x)*support(y) if the value is > 0 there is usefulness to the rule and they are positively co-related

