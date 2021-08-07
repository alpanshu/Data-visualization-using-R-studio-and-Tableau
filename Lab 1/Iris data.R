rm(list=ls())

library(MASS)
library(ggplot2)
newdata<- na.omit(iris)

ggplot(data=newdata,mapping=aes(x=Species,fill=Species))+geom_bar()+ggtitle("Diff types of species")


hist(iris$Sepal.Width, freq=NULL, density=NULL, breaks=12,xlab="Sepal Width", ylab="Frequency", main="Histogram of Sepal Width")

set.seed(1234)
iris1 <- iris[sample(1:nrow(iris), 110), ]
pie <- ggplot(iris1, aes(x=factor(1), fill=Species)) +geom_bar( width=1, color="White") + labs(x="", y="")+theme_void()
pie + coord_polar(theta="y")

scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 
scatter + geom_point(aes(color=Species, shape=Species)) +xlab("Sepal Length") +  ylab("Sepal Width") +ggtitle("Sepal Length-Width")


boxplot(Sepal.Length~Species,data=iris, xlab="Species", ylab="Sepal Length", main="Iris Boxplot")