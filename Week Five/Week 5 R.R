# Example 1: Simple Linear Regression

data(cars)
model <- lm(dist ~ speed, data= cars)
summary(model)


# Example 2: Multiple Linear Regression

data(mtcars)
model <- lm(mpg ~ hp + wt, data = mtcars)
summary(model)

