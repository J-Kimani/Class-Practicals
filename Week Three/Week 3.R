library(dplyr)
library(ggplot2)


### Example 1: Logarithmic Transformation  
df <- read.csv("gapminder.csv")
hist(df$income)
hist(log(df$income))

# Cars dataset
cars = datasets::cars
head(cars$speed)
log(cars$speed) %>% head()
log1p(cars$speed) %>% head()

### Example 2: Square Root Transformation (CO₂ emissions)
df2 <- read.csv("global.csv")
hist(df2$Total)
hist(sqrt(df2$Total))


# Example 3: Reciprocal Transformation (Cars stopping distance)
ggplot(cars, aes(x = seq_along(dist), y = dist)) +
  geom_point(size = 2) + labs(title = "Stopping Distances")

ggplot(cars, aes(x = seq_along(dist), y = 1/dist)) +
  geom_point(size = 2) + labs(title = "Reciprocal Stopping Distances")

# Example 4: Outlier Handling (Titanic – Fare)
# Read and trim fares
df3 <- read.csv("titanic.csv")
Q1 <- quantile(df3$Fare, 0.25, na.rm = TRUE)
Q3 <- quantile(df3$Fare, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1
lower <- Q1 - 1.5 * IQR
upper <- Q3 + 1.5 * IQR
df_trim <- subset(df3, !is.na(Fare) & Fare >= lower & Fare <= upper)

# Counts
orig_n <- sum(!is.na(df3$Fare))
trim_n <- length(df_trim$Fare)
cat(sprintf("Original n = %d, Trimmed n = %d, Removed = %d\n", orig_n, trim_n, orig_n - trim_n))

# Summary statistics
cat("\nOriginal Data:\n")
print(summary(df3$Fare))
cat("\nTrimmed Data:\n")
print(summary(df_trim$Fare))

# Boxplots side-by-side with appropriate scaling
par(mfrow = c(1, 2), mar = c(4, 3, 4, 1))

# Original - auto scale
boxplot(df3$Fare, horizontal = TRUE, main = "Fare — Original", col = "lightblue",
        xlab = "Fare", las = 1)

# Trimmed - auto scale
boxplot(df_trim$Fare, horizontal = TRUE, main = "Fare — After trimming", col = "lightgreen",
        xlab = "Fare", las = 1)

par(mfrow = c(1, 1))


# Boxplots
boxplot(df3$Fare, main = "Original", col = "lightblue", ylab = "Fare")
boxplot(df_trim$Fare, main = "After trimming", col = "lightgreen", ylab = "Fare")

par(mfrow = c(1, 1))
