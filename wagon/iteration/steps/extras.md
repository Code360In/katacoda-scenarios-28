````
pip install category_encoders
pip install pygeohash
pip install memoized_property
clear
````

```
mkdir mlflow && cd mlflow
touch localhost.py
python localhost.py
```{{execute}}

```python
import mlflow
from  mlflow.tracking import MlflowClient
mlflow.set_tracking_uri("{mlflow_server}")
EXPERIMENT_NAME = "[team_identifier] [login] problem name + version"
```{{copy}}

```python
client = MlflowClient()
experiment_id = client.create_experiment(EXPERIMENT_NAME)

run_ids =  dict()
for model in ["linear", "Randomforest"]:
  run = client.create_run(experiment_id)
  run_ids[model] = run.info.run_id

client.log_param(run_ids["linear"], "model", "linear")
client.log_metric(run_ids["linear"], "rmse", 4.5)
```


---

```python
import mlflow
from mlflow.tracking import MlflowClient

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

MLflow server: [ngrok](ngrok)


```python

mlflow.set_tracking_uri("{ngrokurl}")
EXPERIMENT_NAME = "[BE] [Belgium] [widged] TaxifareModel_0.01"
mlflow_client= MlflowClient()

```{{copy}}


-----

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

