
## Prepare the environment

```
# feature 0
clear
touch features.py
python features.py
```{{execute}}

```
# transformer 1.0
#--start:dependencies---------------
import pandas as pd

def minkowski_distance(start,end, p):
    (x1, y1) = start
    (x2, y2) = end
    return ((abs(x2 - x1) ** p) + (abs(y2 - y1)) ** p) ** (1 / p)

#--end:dependencies---------------
```{{copy}}

## Time features

```
# no copy/paste
def feat_eng_on_date(df, col):
    """create new feat based on date :
    day of week, month, weekend, median"""
    df['date'] = df[col].astype('datetime64[ns]')
    df['weekend'] = (df.date.dt.dayofweek // 5 == 1).astype(float)
    df['dow'] = df.date.dt.dayofweek
    df['year'] = df.date.dt.year
    df['month'] = df.date.dt.month
    df['day'] = df.date.dt.day
    df['month_end'] = df.date.dt.is_month_end.astype(float)
    df['month_begin'] = df.date.dt.is_month_start.astype(float)
    return df
```

## Geolocation

[Geohashing](http://geohash.gofreerange.com/)

![](https://miro.medium.com/max/1400/1*klMZxWeXGJCP1x1TVNYKuw.png)

![](https://miro.medium.com/max/1400/1*ubDJJQrnzqw4kQzvSGJkgg.png)

![](https://miro.medium.com/max/1400/1*Ztuopn00LqObHQb3v5r8aQ.png)


## Extracting a few features

```
# feature 2a
df = pd.read_csv('s3://wagon-public-datasets/taxi-fare-train.csv', nrows=100)
```{{copy}}

```
# feature 2b - time
df['pickup_datetime'] = df.pickup_datetime.apply(pd.to_datetime)
df['dow'] = df.pickup_datetime.dt.dayofweek
df['hour'] = df.pickup_datetime.dt.hour
```{{copy}}

```
# feature 2c - distance
x1, y1 = df["pickup_longitude"], df["pickup_latitude"]
x2, y2 = df["dropoff_longitude"], df["dropoff_latitude"]
df['distance'] = minkowski_distance((x1, y1),(x2, y2), p=1)
```{{copy}}



```
# feature 2d - features added
print("--columns--")
print(df.head().T)
print(df.describe().T)
```{{copy}}

## Dropping some columns

```
# feature 3
X_train = df.drop(['fare_amount', 'key', 'pickup_datetime'], axis=1)
y_train = df['fare_amount']
print("--shapes--")
print(X_train.shape)
print(y_train.shape)
print(df.head().T)
```{{copy}}


## Creating a basic pipeline

```
# feature 4a
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestRegressor
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler

pipe = Pipeline(steps=[
  ('imputer', SimpleImputer(strategy='median')),
  ('scaler', StandardScaler()),
  ('regressor', RandomForestRegressor())])
```{{copy}}

3 steps one after the other
- imputer to fill all the empty data
- scaler to normalize the data (only working with numbers)
- apply random forest regression

```
# feature 4b
print(pipe)
```{{copy}}


## Fitting it

Now fitting it with the data

```
# feature 5
# Train
pipe.fit(X_train, y_train)

# Pred
y_pred_train = pipe.predict(X_train)
print(y_pred_train)
```{{copy}}


Note : we applied the same transformations on all columns.

Usually, we want to apply different types and sequences of information on different columns.


##  Integrate custom steps

You have to use a class
- inheriting from BaseEstimator and TransformerMixin
- With a `fit` function and a `transform` function

```
# feature 6a
from sklearn.base import BaseEstimator, TransformerMixin

class TimeFeatures(BaseEstimator, TransformerMixin):

    def __init__(self, time_column, time_zone_name='America/Los_Angeles'):
        self.time_column = time_column
        self.time_zone_name = time_zone_name

    def fit(self, X, y=None):
        return self

    def transform(self, X, y=None):
        assert isinstance(X, pd.DataFrame)
        X.index = pd.to_datetime(X[self.time_column])
        X.index = X.index.tz_convert(self.time_zone_name)
        X["hour"] = X.index.hour
        return X[["hour"]].reset_index(drop=True)
```{{copy}}


If doing some scaling, we might need to capture some data during the fit (mean and variance for standardScaler), store them in the class,  reuse them in the transform.


Implementing a standard scaler => video 00:39:01-00:48:00


####  Implementing a custom feature

```
# feature 6b
feat_encoder = TimeFeatures(time_column='pickup_datetime', time_zone_name='America/Los_Angeles')
```{{copy}}

#### Instanciate the pipeline - Fit and Transform

```
# feature 6c
# Fit our pipeline (even if it does nothing here)
feat_encoder.fit(df)

# Transform
timeFeat = feat_encoder.transform(df)
print(timeFeat)
```{{copy}}

=> I can now apply different transformations on different columns
