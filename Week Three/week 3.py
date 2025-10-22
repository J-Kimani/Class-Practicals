# -*- coding: utf-8 -*-
"""
Created on Mon Oct 13 10:24:43 2025

@author: Kimani
"""

### Example 1: Logarithmic Transformation  
"""
**Datasets:**  
- **Income** (Gapminder)  
- **Horsepower** (Cars dataset)
"""
#### In Excel
"""
- **Logarithm:**  
    `=LN(cell)` for natural log  
- **Log1p (log(1+x)):**  
    `=LN(1+cell)`
    """
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Gapminder GDP
df = pd.read_csv("gapminder.csv")
income = df["income"]
sns.histplot(income, kde= True)
plt.show()
# log transformation
sns.histplot(np.log(income), kde= True)    
plt.show()

'''
### Example 2: Square Root Transformation (CO₂ Emissions)

#### By Hand
- Calculate \( \sqrt{x} \) for selected countries.
- Compare variance before and after transformation.

#### Excel
- Use: `=SQRT(cell)` for emissions values.

#### Python
'''
df2 = pd.read_csv("global.csv")    
emissions = df2["Total"]
sns.histplot(emissions, kde= True)
plt.show()
# histogram after transformation
sns.histplot(np.sqrt(emissions), kde= True)
plt.show()

### Example 3: Reciprocal Transformation (Cars Stopping Distance) 
'''
from sklearn.datasets import fetch_openml
cars = fetch_openml(name= "cars1", version= 1,
                    as_frame= True).frame
print(cars.head())

cars = cars.to_csv("cars.csv")
'''
cars = pd.read_csv("cars.csv") 

plt.scatter(range(len(cars["MPG"])), cars["MPG"]) 
plt.title("MPG")  
plt.show()

plt.scatter(range(len(cars["MPG"])),
            1/cars["MPG"])
plt.title("Reciprocal MPG")
plt.show()

### Example 4: Outlier Handling (Titanic – Fare)
df3 = pd.read_csv("titanic.csv")
q1, q3 = df3["Fare"].quantile([0.25, 0.75])
iqr = q3 - q1
lower, upper = q1 - 1.5*iqr, q3 + 1.5*iqr
trimmed = df3[(df3["Fare"] >= lower) & 
              (df3["Fare"] <= upper)]
print(f"Original n = {len(df3)},Trimmed 
      n = {len(trimmed)},Removed = {len(df3)
                            - len(trimmed)}")
fig, axes = plt.subplots(1, 2, figsize=(12, 5), 
                         sharey=True)
sns.boxplot(x=df3["Fare"], ax=axes[0],
            color="lightblue")
axes[0].set_title("Fare — Original")
axes[0].set_xlabel("Fare")

sns.boxplot(x=trimmed["Fare"], ax=axes[1],
            color="lightgreen")
axes[1].set_title("Fare — After trimmingoutliers")
axes[1].set_xlabel("Fare")

plt.tight_layout()
plt.show()
    
    
    
    
    
    
    
    
    
    
