# Part 1: Measuring Skewness
library(e1071)
data("diamonds", package="ggplot2")

# Pearson’s skewness
pearson_skew <- 3 * (mean(diamonds$price) - median(diamonds$price)) / sd(diamonds$price)

# Built-in
scipy_skew <- skewness(diamonds$price)

pearson_skew
scipy_skew

# Part 2: Measuring Kurtosis
kurtosis(diamonds$price)  # excess kurtosis

# Part 3: Visual Checks for Normality
# Histogram + KDE with mean/median/mode lines (Diamonds prices)
# R code: Histogram with mean, median, and mode lines (like Python example)
hist(diamonds$price, breaks = 50, col = "lightblue", main = "Diamond Prices Distribution", xlab = "Price")
abline(v = mean(diamonds$price), col = "red", lwd = 2, lty = 1)
abline(v = median(diamonds$price), col = "black", lwd = 2, lty = 2)
# Mode calculation for continuous data: use the most frequent value
mode_val <- as.numeric(names(sort(table(diamonds$price), decreasing = TRUE)[1]))
abline(v = mode_val, col = "orange", lwd = 2, lty = 3)
legend("topright", legend = c("Mean", "Median", "Mode"),
       col = c("red", "black", "orange"), lwd = 2, lty = 1:3)


# Part 4: Q-Q Plots and Boxplots
# R equivalent: Histogram, Q-Q plot, and boxplot for log-normal data

set.seed(1)
data <- rlnorm(1000, meanlog = 1, sdlog = 0.5)

# Histogram
hist(data, breaks = 20, col = "lightblue", border = "black", main = "Log-normal Sample", xlab = "Value")

# Q-Q plot
qqnorm(data, main = "Q-Q Plot")
qqline(data, col = "red", lwd = 2)

# Boxplot
boxplot(data, horizontal = TRUE, main = "Boxplot of Log-normal Sample", col = "lightgreen")

# Part 5: Statistical Tests for Normality
# Shapiro-Wilk
shapiro.test(data)

# Kolmogorov-Smirnov
ks.test(data, "pnorm")

# Part 6: Linearity
plot(iris$Sepal.Length, iris$Petal.Length)
abline(lm(Petal.Length ~ Sepal.Length, data=iris))

# Part 7: Homogeneity of Variance
df <- read.csv("data.csv")
library(car)
leveneTest(price ~ city, data = df, subset = city %in% c("Shoreline", "Seattle"))

# Part 8: Heteroscedasticity Tests (Regression Residuals)
# Breusch-Pagan Test for Heteroscedasticity
# Load required libraries
library(lmtest)

# Create the OLS model (equivalent to Python's sm.OLS)
model <- lm(price ~ sqft_living, data = df)

# Run the Breusch-Pagan test (equivalent to het_breuschpagan)
bptest(model)

# White Test for Heteroscedasticity
# Run White's test for heteroscedasticity
# R doesn't have a direct equivalent to Python's het_white() function in a single package
# Non-constant variance test (includes White test)
ncvTest(model)

