## Prepare the environment

```
# predict 0.1
clear
touch validation.py
python validation.py
```{{execute}}


### Load the model from disk


```
# predict 1a
import joblib
model_name = 'model.joblib'
loaded_model = joblib.load(model_name)
```{{copy}}

```
# predict 1b
print("\n\n","---model loaded from disk----")
print(loaded_model.estimators_)
```{{copy}}


### Attempt a prediction

```
# predict 2a
import pandas as pd
df = pd.read_csv('s3://wagon-public-datasets/taxi-fare-train.csv', nrows=100)
from sklearn.model_selection import train_test_split
X = df.drop('fare_amount', axis=1)
y = df['fare_amount']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.1, random_state=42)
```{{copy}}


```
# predict 2b
y_pred = loaded_model.predict(X_test)
print("\n\n",y_pred)


```{{copy}}

### Error because the data have not been preprocessed

UhOh. Beginner error
> ValueError: could not convert string to float: '2013-07-08 21:24:00.00000048'

We did not apply the same preprocessing steps!


```
# predict 3a
def minkowski_distance(start,end, p):
    (x1, y1) = start
    (x2, y2) = end
    return ((abs(x2 - x1) ** p) + (abs(y2 - y1)) ** p) ** (1 / p)

def preprocess(df):
    """add a column with the manhattan distance"""
    x1, y1 = df["pickup_longitude"], df["pickup_latitude"]
    x2, y2 = df["dropoff_longitude"], df["dropoff_latitude"]
    distance = minkowski_distance((x1, y1),(x2, y2), p=2)
    res = df.copy()
    res["distance"] = distance
    return res[["distance"]]
```{{copy}}


```
# predict 3b

X_test_preproc = preprocess(X_test)
y_pred = loaded_model.predict(X_test_preproc)
print("\n\n",y_pred)
```{{copy}}

=> We have a prediction

```
[13.4124  4.5555  5.981  11.477   5.344  13.75    5.11    8.472   6.547
  5.11  ]
```


### Model Evaluation

We did a lot of copy/paste of the code.

Running a prediction over a model should look something like that

```
# -- preprocess --
X = preprocess(df)

# -- load model --
import joblib
model = joblib.load('model.joblib')

# -- predict --
predictedFare = model.predict(X)
print("\n\n",predictedFare)
```{{copy}}

Somehow, different pipelines

```
|=> preprocess data  |
                     |=> predict       |
|=> loadModel        |
```
