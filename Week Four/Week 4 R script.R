# Example 1: Creating Variables from Existing Ones
df <- read.csv("gapminder.csv")
df$GDP <- df$income * df$population
df$income_group <- cut(df$income, breaks=c(0,5,29,Inf),
                       labels=c("Low","Mid","High"))
head(df)

# Example 2: Generating Ratios and Indices
# using mtcars dataset
data(mtcars)
mtcars$power_to_weight <- mtcars$hp / mtcars$wt
mtcars$power_to_weight_scaled <- (mtcars$power_to_weight - min(mtcars$power_to_weight)) /
  (max(mtcars$power_to_weight) - min(mtcars$power_to_weight))
head(mtcars)
write.csv(mtcars, "mtcars_dataset.csv", row.names = FALSE)

#using mpg_dataset
df2 <- read.csv("mpg_dataset.csv")
df2$power_to_weight <- df2$horsepower / df2$weight

# Add na.rm = TRUE to handle NA values
df2$power_to_weight_scaled <- (df2$power_to_weight - min(df2$power_to_weight, na.rm = TRUE)) /
  (max(df2$power_to_weight, na.rm = TRUE) - min(df2$power_to_weight, na.rm = TRUE))

head(df2)
