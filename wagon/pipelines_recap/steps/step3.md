
> Reuse transformations across projects.

## Prepare the environment

```
# pipeline 0a
clear
touch pipeline.py
python pipeline.py
```{{execute}}



## sklearn.pipeline overview

```
# no copy/paste
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor

pipe = Pipeline(steps=[('imputer', SimpleImputer(strategy='median')),
                      ('scaler', StandardScaler()),
                      ('regressor', RandomForestRegressor())])


pipe.fit(X_train, y_train)
y_pred = pipe.predict(X_test)
```

The pipeline does not behave quite the same way when doing the fit and the prediction

## What happens on a fit for a standard scaler

### Train and Test Data

```
# pipeline 1a
import numpy as np
train_data = np.array([[1, 10], [2, -1], [0, 22], [3, 15]])
test_data = np.array([[2, 1], [5, 1], [3, 55], [3, 1]])
```{{copy}}

```
# pipeline 1b
print("--train data--")
print(train_data, "\n")
print("--test data--")
print(test_data)
```{{copy}}

### Scaler

```
# pipeline 2a
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
scaler.fit(train_data)
# => StandardScaler(copy=True, with_mean=True, with_std=True)
```{{copy}}

When doing a fit, it takes into account the mean and the variance.
But it is computed only from the training set.
Then applied on the test set when making predictions.

(the training data are meant to correspond to population when the test data are only a random sample)

```
# pipeline 2b
print("--scaler--")
print(scaler.scale_)
```{{copy}}


### Variations between Train and Test Data

Mean of each columns is obviously different from training to test set

```
# pipeline 3
print(train_data.mean(axis=0), test_data.mean(axis=0))
```{{copy}}

### Scaling

```
# pipeline 4
print("--scaled_train_data--")
scaled_train_data = scaler.transform(train_data)
print(scaled_train_data)

print("--test--")
scaled_test_data = scaler.transform(test_data)
print(scaled_test_data)
```{{copy}}

=> Fitting data transformers with trained data
=> Applying transformers on test data.
