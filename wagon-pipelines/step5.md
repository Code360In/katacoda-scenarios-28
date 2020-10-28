
## Prepare the environment

```
# feature 0
clear
touch transformer.py
python transformer.py
```{{execute}}



## Applied to the whole dataframe

```
# transformer 1.0
#--start:dependencies---------------
import pandas as pd
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.model_selection import train_test_split

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

def minkowski_distance(start,end, p):
    (x1, y1) = start
    (x2, y2) = end
    return ((abs(x2 - x1) ** p) + (abs(y2 - y1)) ** p) ** (1 / p)

#--end:dependencies---------------
```{{copy}}

This will extract a single from the whole dataset feature to be used for training.

```
# transformer 1a
custom_pipe = Pipeline(steps=[
    ('time_features', TimeFeatures( time_column='pickup_datetime',
                                    time_zone_name='America/Los_Angeles')),
    ('scaler', StandardScaler()),
    ('regressor', RandomForestRegressor())])
```{{copy}}

```
# transformer 1b
df = pd.read_csv('s3://wagon-public-datasets/taxi-fare-train.csv', nrows=100)
X = df.drop('fare_amount', axis=1)
y = df['fare_amount']
```{{copy}}

```
# transformer 1c
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.1, random_state=42)
custom_pipe.fit(X_train, y_train)
custom_pipe.predict(X_test)
```{{copy}}

## Applied only to certain columns

```
# transformer 2a
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
        return X[[
                'hour',
            ]].reset_index(drop=True)
```{{copy}}

```
# transformer 2b
class DistanceTransformer(BaseEstimator, TransformerMixin):

    def __init__(self):
        pass

    def fit(self, X, y=None):
        return self

    def transform(self, X, y=None):
        assert isinstance(X, pd.DataFrame)
        x1, y1 = X["pickup_longitude"], X["pickup_latitude"]
        x2, y2 = X["dropoff_longitude"], X["dropoff_latitude"]
        X['distance'] = minkowski_distance((x1, y1),(x2, y2), p=1)
        return X[[
                'distance',
            ]]
```{{copy}}


```
# transformer 2c
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import RobustScaler
```{{copy}}


I can now create a number of new features derived from my dataset, here time and distance.

```
# transformer 2d - feat engineering
from sklearn.pipeline import make_pipeline
pipe_time = make_pipeline(TimeFeatures(time_column='pickup_datetime'), StandardScaler())
pipe_distance = make_pipeline(DistanceTransformer(), RobustScaler())

dist_cols = ['pickup_latitude', 'pickup_longitude', 'dropoff_latitude', 'dropoff_longitude']
time_cols = ['pickup_datetime']

# two pipelines
feat_eng_bloc = ColumnTransformer([
  ('time', pipe_time, time_cols),
  ('distance', pipe_distance, dist_cols)])
# remainder='passthrough'
# This would keep the other columns
```{{copy}}

**Note**

```
pipe_time = make_pipeline(
  TimeFeatures(time_column='pickup_datetime'),
  StandardScaler())
# is exactly the same as
pipe_time = Pipeline(steps=[
  ('time_features', TimeFeatures( time_column='pickup_datetime'),
  ('scaler', StandardScaler())])
# The first is just more ocmpact
```

The pipeline takes the whole dataset as an input and produces a new feature (column) as an output.



```
# transformer 2e - workflow
pipe_cols = Pipeline(steps=[
  ('feat_eng_bloc', feat_eng_bloc),
  ('scaler', StandardScaler()), # should it be there?
  ('regressor', RandomForestRegressor())])

pipe_cols.fit(X_train, y_train)

Y = pipe_cols.predict(X_train)
print(Y)
```{{copy}}


