# Memoization

Persist information about the result for a (@memoized) function call and its parameters.
If there is later another call to the function with the exact same paramters, it will return the stored result without attempting to run the function again.

If any parameter is different, it will run the function and persist the association between function with parameters and result

```
ipython
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
```{{copy}}

Créons une première instance de la classe
```
car = Car()
```{{copy}}

```
print('non memoized calls differ:')
print(car.get_random_value())
print(car.get_random_value())
```{{copy}}

Créons une seconde instance de la classe

```
car2 = Car()
```{{copy}}

```
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
ipython
```{{execute}}


```
from memoized_property import memoized_property

import mlflow
from mlflow.tracking import MlflowClient

class Trainer():

  MLFLOW_URI = "https://user:PASSWORD@mlflow-dev.herokuapp.com/"

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

trainer = Trainer("[BE][bruxelles] DE D3 model_experiment 6")
trainer.train()

```{{copy}}

