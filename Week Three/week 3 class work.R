### Example 1: Logarithmic Transformation
df <- read.csv("gapminder.csv")
hist(df$income)
hist(log(df$income))

# Example 2: Square Root Transformation (CO₂ emissions)
df2 <- read.csv("global.csv")
hist(df2$Total)
hist(sqrt(df2$Total))

# Example 3
library(dplyr)
library(ggplot2)
ggplot(cars, aes(x= seq_along(dist), y= dist)) + 
  geom_point(size = 2) + 
  labs(title= "Stopping Distances")
ggplot(cars, aes(x= seq_along(dist), y= 1/dist)) + 
  geom_point(size = 2) + 
  labs(title= "Reciprocal Stopping Distances")
