library(lattice)
my_data <- iris
head(my_data)
cloud(Sepal.Length ~ Sepal.Length * Petal.Width, 
      data = iris)
cloud(Sepal.Length ~ Sepal.Length * Petal.Width, 
      group = Species, data = iris,
      auto.key = TRUE)
