# Example 1: Simple Linear Regression
df <- read.csv("cars.csv")
head(df)

model <- lm(dist~speed, data= df)
summary(model)

# Example 2: Multiple Linear Regression
df2 <- read.csv("mtcars.csv")
head(df2)
model2 <- lm(mpg ~ horsepower + weight, data= df2)
summary(model2)

# Example 3: Visualizing Model Fit
plot(df2$horsepower, df2$mpg, main= "Regression Fit", 
     xlab= "", ylab= "MPG")
abline(lm(mpg ~ horsepower, data= df2), col= "red")