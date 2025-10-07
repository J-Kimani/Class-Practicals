   # Example 1 — Classifying Variables (Gapminder)
df <- read.csv("gapminder.csv")
#structure of dataset
str(df)

# Example 2 — Descriptive Summary (Iris: Sepal.Length)
df2 <- read.csv("iris.csv")

# all elements
x <- df2$SepalLengthCm
mean(x); median(x)
# mode in base R:
as.numeric(names(sort(table(x),decreasing=TRUE)[1]))
var(x)  # sample variance (n-1)
sd(x)
quantile(x, probs=c(0.25,0.5,0.75))
range(x)[2]-range(x)[1]


x <- df2$SepalLengthCm[1:10]   # first 10 elements

mean(x); median(x)
# mode in base R:
as.numeric(names(sort(table(x), decreasing = TRUE)[1]))
var(x)  # sample variance (n-1)
sd(x)
quantile(x, probs = c(0.25, 0.5, 0.75))
diff(range(x))  # range max - min

# Example 3 — Probability Distributions (Bernoulli / Binomial / Poisson / Normal)
# 3A — Bernoulli (simple)
# Scenario: Probability a student attends class = p = 0.7.

# Exact probability (P(X=1) when n=1, p=0.7)
dbinom(1, size = 1, prob = 0.7)
# Equivalent Bernoulli logic using p directly
p <- 0.7
p  # P(X=1)

# Expectation and variance for Bernoulli(p)
E <- p
Var <- p * (1 - p)
E; Var

# 3B — Binomial

# Scenario: 10 students take a test, passing prob p=0.6. Find P(X=7).
dbinom(7,size=10,prob=0.6)

# 3C — Poisson

# Scenario: On average 5 arrivals per 10 minutes (λ=5). Find
# 𝑃(X) = 3

dpois(3, lambda=5)

# 3D — Normal (z-score)

# Scenario: Heights are distributed as  N(170, 10^2).  
# Find P(X > 180).

1 - pnorm(180, mean=170, sd=10)
