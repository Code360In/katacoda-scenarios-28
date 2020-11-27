
## Prepare the environment

```
# train 0
clear
mkdir pipelines && cd pipelines
touch training.py
python training.py
```{{execute}}

## Fetch data from the taxi-fare kaggle dataset

```
# train 1
import pandas as pd
df = pd.read_csv('s3://wagon-public-datasets/taxi-fare-train.csv', nrows=100)


```{{copy}}

Note: nrows=100. The dataset is 5.1GB!  Avoiding to load it all in memory.


## Check data

```
# train 2
print("---dataframe----")
print(df.head().T)
print(df.describe().T)


```{{copy}}


## Get training and test data

How much is the car ride going to cost depending on :
- pickup point
- dropoff point
- number of passengers


=> train_test_split
- creating y to test predictions
- 10% of the data

```
# train 3
print("---splitting data----")
from sklearn.model_selection import train_test_split
X = df.drop('fare_amount', axis=1)
y = df['fare_amount']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.1, random_state=42)


```{{copy}}




## check shape of data

```
# train 4
print("---shape of data----")
print(df.shape)
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)


```{{copy}}


## Preprocessing


#### Minkowski Distance

Yesterday was **haversine** distance which takes into account curvature of the earth. Important for long distances like distance from NY to Los Angeles.
=> [Google maps](https://www.google.com/maps/@45.305025,-89.0979114,3.23z), zoom out, activate globe

With a taxi ride, the distance between pick up and drop off point remain relatively small.
=>
- straightline
- [Manhanttan on the map](https://www.google.com/maps/@40.7762803,-73.930264,12.1z)
- Why is it called manhattan?
![](https://static.packt-cdn.com/products/9781787121515/graphics/bd978c4c-8251-489d-bcda-5ce7b7b825dd.png)
- Manhattan distance illustrated
![](https://www.simsoup.info/SimSoup/Manhattan_Distance_Illustration.png)


#### Minkowski as a generalisation

![](https://prismoskills.appspot.com/lessons/2D_and_3D_Puzzles/imgs/Manhattan_and_Euclidean.png)
- p=2 => euclidian
- p=1 => manhattan

```
# train 5
def minkowski_distance(start,end, p):
    (x1, y1) = start
    (x2, y2) = end
    return ((abs(x2 - x1) ** p) + (abs(y2 - y1)) ** p) ** (1 / p)


```{{copy}}


### Creating new columns

Preprocess function takes the dataset as input and

```
# train 6
def preprocess(df):
    """add a column with the manhattan distance"""
    x1, y1 = df["pickup_longitude"], df["pickup_latitude"]
    x2, y2 = df["dropoff_longitude"], df["dropoff_latitude"]
    distance = minkowski_distance((x1, y1),(x2, y2), p=2)
    res = df.copy()
    res["distance"] = distance
    return res[["distance"]]


```{{copy}}

### Apply preprocessing

```
# train 7
print("---preprocess training set----")
X_train_preproc = preprocess(X_train)
print(X_train_preproc)


```{{copy}}

Only one column, distance.

Using this single feature to create a model.

### Training a model

Using _RandomForestRegressor_ and fitting it with x_train and y_train

```
# train 8
print("---random forest regressor----")
from sklearn.ensemble import RandomForestRegressor
reg = RandomForestRegressor()
reg.fit(X=X_train_preproc, y=y_train)
print(reg.estimators_)


```{{copy}}


## Saving the model to disk

joblib let you persist a model and save it to disk.

Saved the type of model and all the parameters defining the model.
=> can reuse it by simply loading the file

```
# train 9
import joblib
model_name = 'model.joblib'
joblib.dump(reg, model_name)
print("-- model saved to disk")


```{{copy}}

