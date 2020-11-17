# Iterations

## Prerequisites

```
pip install mlflow
pip install category_encoders
pip install pygeohash
pip install memoized_property
clear
```{{execute}}

# 1. Running it on localhost

```
mkdir mlflow && cd mlflow
touch localhost.py
python localhost.py
```{{execute}}


```
mlflow ui
```{{execute}}

=> problem accessing localhost in Kataconda.

- run `mlflow ui` on my laptop's command line.
- Tunnel it to a public address.

```
./ngrok http 5000
```

# console

```
[2020-06-06 10:46:51 +0200][4980] [INFO] Starting gunicorn 20.0.4
[2020-06-06 10:46:51 +0200][4980] [INFO] Listening at: http://127.0.0.1:5000 (4980)
[2020-06-06 10:46:51 +0200][4980] [INFO] Using worker: sync
[2020-06-06 10:46:51 +0200][4983] [INFO] Booting worker with pid: 4983
```

In order to see the results of the tracking, go to http://127.0.0.1:5000

Render port 8500: https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/

```python



import mlflow
from mlflow.tracking import MlflowClient

# MLFLOW_URI = "http://35.210.166.253:5000"
# MLFLOW_URI = "http://127.0.0.1:5000"
MLFLOW_URI = "http://f510c1729635.ngrok.io"

myname="widged"
EXPERIMENT_NAME = f"TaxifareModel_{myname}"
mlflow.set_tracking_uri(MLFLOW_URI)
mlflow_client= MlflowClient()

experiment_id = 0
# Create the resource.
# If exception is raised because a resource of that name already exists
#      mlflow.exceptions.RestException: RESOURCE_ALREADY_EXISTS: Experiment 'TaxifareModel_widged' already exists.
# recover the id of the experiment of that name
try:
    experiment_id = mlflow_client.create_experiment(EXPERIMENT_NAME)
except BaseException:
    experiment_id = mlflow_client.get_experiment_by_name(EXPERIMENT_NAME).experiment_id

print(experiment_id)

for model in ["linear", "Randomforest"]:
    run = mlflow_client.create_run(experiment_id)
    mlflow_client.log_metric(run.info.run_id, "rmse", 1.5)
    mlflow_client.log_param(run.info.run_id, "model", model)

```{{copy}}





# 2. Running it on a shared host

```
touch sharedhost.py
python sharedhost.py
```{{execute}}

MLflow server: [https://mlflow.lewagon.co/](https://mlflow.lewagon.co/)


```python

mlflow.set_tracking_uri("https://mlflow.lewagon.co/")
EXPERIMENT_NAME = "[BE] [Belgium] [widged] TaxifareModel_0.01"
mlflow_client= MlflowClient()

```{{copy}}


# Class Trainer

Simply creating the class doing nothing for now.

```
touch trainer.py
python trainer.py
```{{execute}}


```python
class Trainer(object):

    def __init__(self, X, y, **kwargs):
        self.pipeline = None
        self.kwargs = kwargs
        self.dist = self.kwargs.get("distance_type", "euclidian")
        self.X_train, self.X_val, self.y_train, self.y_val = \
            train_test_split(X, y, test_size=0.15)
        self.nrows = self.X_train.shape[0]

    def get_estimator(self):
        estimator = self.kwargs.get("estimator", "RandomForest")
        if estimator == "RandomForest":
            model = RandomForestRegressor()
        return model

    def set_pipeline(self):
        # Define feature engineering pipeline blocks here
        pipe_tf = make_pipeline(TimeEncoder(),
                                OneHotEncoder())
        pipe_dist = make_pipeline(DistTransformer(distance_type=self.dist),
                                      StandardScaler())
        pipe_d2center = make_pipeline(DistToCenter(),
                                      StandardScaler())

        # Define default feature engineering blocs
        distance_columns = list(DIST_ARGS.values())
        feateng_blocks = [
            ('distance', pipe_dist, distance_columns),
            ('time_features', pipe_tf, ['pickup_datetime']),
            ('distance_to_center', pipe_d2center, distance_columns)]

        features_encoder = ColumnTransformer(feateng_blocks,
                                             n_jobs=None,
                                             remainder="drop")

        regressor = self.get_estimator()

        self.pipeline = Pipeline(steps=[
                    ('features', features_encoder),
                    ('rgs', regressor)])

    def train(self):
        self.set_pipeline()
        self.pipeline.fit(self.X_train, self.y_train)

    def evaluate(self):
        rmse_train = self.compute_rmse(self.X_train, self.y_train)
        rmse_val = self.compute_rmse(self.X_val, self.y_val, show=True)
        output_print = f"rmse train: {rmse_train} || rmse val: {rmse_val}"
        print(colored(output_print, "blue"))

    def compute_rmse(self, X_test, y_test, show=False):
        y_pred = self.pipeline.predict(X_test)
        rmse = compute_rmse(y_pred, y_test)
        return round(rmse, 3)

    def save_model(self):
        """Save the model into a .joblib format"""
        joblib.dump(self.pipeline, 'model.joblib')
        print(colored("model.joblib saved locally", "green"))

    ## Params
    params = dict(
        estimator='RandomForest',
        distance_type='haversine',
    )

    trainer = Trainer(X, y, **params)
    trainer.train()
    trainer.evaluate()
    trainer.save_model()

```{{copy}}

# Memoization

Persist information about the result for a (@memoized) function call and its parameters.
If there is later another call to the function with the exact same paramters, it will return the stored result without attempting to run the function again.

If any parameter is different, it will run the function and persist the association between function with parameters and result

```
touch memoized.py
python memoized.py
```{{execute}}


```python
pip install memoized_property
```{{execute}}

## Non memoized car

```

from memoized_property import memoized_property
from random import random

class Car():
    def get_random_value(self):
        return random()

print('----NOT memoized----')
car = Car()
print('non memoized calls differ:')
print(car.get_random_value())
print(car.get_random_value())

car2 = Car()
print('non memoized calls differ:')
print(car2.get_random_value())
print(car2.get_random_value())

```{{copy}}

## Memoized car


```

from memoized_property import memoized_property
from random import random


class MemoizedCar():
    @memoized_property
    def get_random_value(self):
        return random()

print('----memoized----')
car = MemoizedCar()
print('memoized property return the same value:')
print(car.get_random_value)
print(car.get_random_value)

car2 = MemoizedCar()
print('memoized property return the same value:')
print(car2.get_random_value)
print(car2.get_random_value)

```{{copy}}

## Manually  persisting value across calls

Singleton Pattern

```
class SingletonCar():

    def __init__(self):
        self.random = None

    def get_random_value(self):
        #if not hasattr(self, 'random'):
        if self.random == None:
            self.random = random()
        return self.random

print('----singleton pattern----')
car = SingletonCar()
print('all calls return the same value:')
print(car.get_random_value())
print(car.get_random_value())

car2 = SingletonCar()
print('all calls return the same value:')
print(car2.get_random_value())
print(car2.get_random_value())
```{{copy}}


## All together! Memoized trainer

```
touch memoized_trainer.py
python memoized_trainer.py
```{{execute}}


```
from memoized_property import memoized_property

import mlflow
from mlflow.tracking import MlflowClient

class Trainer():

    MLFLOW_URI = "https://mlflow.lewagon.co/"

    def __init__(self, experiment_name):
        self.experiment_name = experiment_name

    @memoized_property
    def mlflow_client(self):
        mlflow.set_tracking_uri(self.MLFLOW_URI)
        return MlflowClient()

    @memoized_property
    def mlflow_experiment_id(self):
        try:
            return self.mlflow_client \
                .create_experiment(self.experiment_name)
        except BaseException:
            return self.mlflow_client \
                .get_experiment_by_name(self.experiment_name).experiment_id

    def mlflow_create_run(self):
        self.mlflow_run = self.mlflow_client \
            .create_run(self.mlflow_experiment_id)

    def mlflow_log_param(self, key, value):
        self.mlflow_client \
            .log_param(self.mlflow_run.info.run_id, key, value)

    def mlflow_log_metric(self, key, value):
        self.mlflow_client \
            .log_metric(self.mlflow_run.info.run_id, key, value)

    def train(self):

        for model in ["linear", "Randomforest"]:
            self.mlflow_create_run()
            self.mlflow_log_metric("rmse", 4.5)
            self.mlflow_log_param("model", model)

trainer = Trainer("[BE][bruxelles] [widged] DE D3 model_experiment 6")
trainer.train()

```{{copy}}

