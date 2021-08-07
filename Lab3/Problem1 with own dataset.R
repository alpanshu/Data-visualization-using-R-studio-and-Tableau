datasets::iris
library(lattice)
#defining ses.f to be a factor variable
iris$Species.f = factor(iris$Species, labels=c("setosa", "versicolor", "virginica"))
#histograms
histogram(~Petal.Width, iris)
histogram(~Petal.Width | Species.f, iris)
densityplot(~Petal.Length, iris)
densityplot(~Petal.Length | Species.f, iris)
qqmath(~Petal.Length, iris)
bwplot(~Sepal.Length, iris)
bwplot(Species.f~Sepal.Length, iris)
xyplot(Sepal.Length~Sepal.Width, iris)
xyplot(Sepal.Length~Sepal.Width | Species.f, iris)
subset <- iris[ , 3:4]
splom(~subset[ , 1:2])
reg <- lm(Sepal.Length~Petal.Length+Petal.Width+Species.f, iris)
par(mfrow=c(3,2))
plot(reg, which=1:2)
plot(reg, which=3:4)
plot(reg, which=5:6)
