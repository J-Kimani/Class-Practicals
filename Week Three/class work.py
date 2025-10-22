# -*- coding: utf-8 -*-
"""
Created on Mon Oct 13 10:00:44 2025

@author: Kimani
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Gapminder GDP
df = pd.read_csv("gapminder.csv")
income = df["income"]
sns.histplot(income, kde=True); plt.show()
sns.histplot(np.log(income), kde=True); plt.show()

# Cars dataset
from sklearn.datasets import fetch_openml
cars = fetch_openml(name="cars1", version=1, as_frame=True).frame
print(cars["horsepower"].head())
print(np.log(cars["horsepower"].head()))
print(np.log1p(cars["horsepower"].head()))
