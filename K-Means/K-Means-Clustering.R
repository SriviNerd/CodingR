install.packages('arules',dependencies = TRUE)
install.packages('arulesViz',dependencies = TRUE)
#Pakages are collections of files
library(arules)
library(arulesViz)

gitemSets<-apriori(Groceries,parameter=list(minlen=1,maxlen=1,support=0.02,target="frequent itemsets"))
summary(gitemSets)
inspect(head(sort(gitemSets,by="support"),20))
#you can mix and match
grules<-apriori(Groceries,parameter=list(support=0.001,confidence = 0.6, target="rules"))
inspect(head(sort(grules,by="lift"),20))
plot(grules)