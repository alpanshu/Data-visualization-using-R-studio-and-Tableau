require("datasets")
data("iris") 
str(iris)
summary(iris)
head(iris)
iris.new<- iris[,c(1,2,3,4)]
iris.class<- iris[,"Species"]
head(iris.new)
head(iris.class)
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)
head(iris.new)
result<- kmeans(iris.new,3)
result$size # gives no. of records in each cluster
result$centers # gives value of cluster center datapoint value(3 centers for k=3)
result$cluster #gives cluster vector showing the cluster where each record falls
par(mfrow=c(2,2), mar=c(5,4,2,2))
plot(iris.new[c(1,2)], col=result$cluster)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed in clusters
plot(iris.new[c(1,2)], col=iris.class)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed originally as per "class" attribute in dataset
plot(iris.new[c(3,4)], col=result$cluster)# Plot to see how Petal.Length and Petal.Width data points have been distributed in clusters
plot(iris.new[c(3,4)], col=iris.class)
result$cluster <- as.factor(result$cluster)
library(ggplot2)
ggplot(iris.new, aes(Petal.Length, Petal.Width, color = result$cluster)) + geom_point()
plot(iris.new[c("Sepal.Length", "Sepal.Width")], col=result$cluster)
ggplot(iris.new, aes(Petal.Length, Petal.Width, color = result$cluster)) + geom_point()
plot(iris.new[,], col=result$cluster)
table(result$cluster,iris.class) # Result of table shows that Cluster 1 corresponds to Virginica, Cluster 2corresponds to Versicolor and Cluster 3 to Setosa.
library(animation)
km1<-kmeans.ani(iris.new,3)