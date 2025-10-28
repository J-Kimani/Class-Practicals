# -*- coding: utf-8 -*-
"""
Created on Mon Oct 27 11:52:51 2025

@author: Kimani
"""

# Import Libraries
import pandas as pd
import statsmodels.api as sm

cars = pd.read_csv("cars.csv")
cars.head()

# Simple Linear regression Model
X = sm.add_constant(cars["speed"])
model = sm.OLS(cars["dist"], X).fit()
print(model.summary())


# ## Example 2 — Multiple Linear Regression
df = pd.read_csv("mtcars.csv")
df.head()

# multiple linear reg
import statsmodels.formula.api as smf

model2 = smf.ols("mpg ~ horsepower + weight", 
                 data= df).fit()
print(model2.summary())

# Example 3
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression

# Load data
mtcars = pd.read_csv('mtcars.csv')

# Create the plot
plt.figure(figsize=(8, 6))
plt.scatter(mtcars['horsepower'], mtcars['mpg'], alpha=0.6)

# Fit linear regression
model = LinearRegression()
X = mtcars[['horsepower']].dropna()
y = mtcars.loc[X.index, 'mpg']
model.fit(X, y)

# Plot regression line
x_line = np.linspace(mtcars['horsepower'].min(), mtcars['horsepower'].max(), 100)
y_line = model.predict(x_line.reshape(-1, 1))
plt.plot(x_line, y_line, color='red', linewidth=2)

plt.title('Regression Fit')
plt.xlabel('Horsepower')
plt.ylabel('MPG')
plt.show()

# Email to send by 9.00 pm
joshua.k.karanja@gmail.comz






