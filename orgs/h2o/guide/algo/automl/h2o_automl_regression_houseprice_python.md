# H2O AutoML Regression in Python #

H2O AutoML interface is designed to have as few parameters as possible so that all the user needs to do is point to their dataset, identify the response column and optionally specify a time constraint, a maximum number of models constraint, and early stopping parameters.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O AutoML Regression with House Price Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DeepLearning_Classification_titanic.ipynb)
  
## H2O AutoML Regression Sample Code in Python ##

###: Importing H2O Library
```python
import h2o
```

###: Initializing h2O
```python
h2o.init()
```

### : Getting H2O Cluster status
```python
h2o.cluster().show_status()
```

###: Importing Dataset
```python
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```

###: Understanding Dataset
```python
df.describe()
```

###: Understanding Dataset with pylab library
```python
import pylab as pl
pl.figure(figsize=(20,10))
df.as_data_frame().hist()
pl.show()
```

###: Getting a list of columns in our dataset
```python
df.col_names
```

###: Setting Response column
```python
response = "medv"
```

###: spliting the dataset into train and validation  
```python
train, valid = df.split_frame(ratios=[0.9])
print(train.shape)
print(valid.shape)
```

###: Setting all columns/features into a local variable
```python
features = df.col_names
```

###: Settings all features for model building
```python
features.remove(response)
print(features)
```

###: Importing H2O AutoML Library
```python
from h2o.automl import H2OAutoML
```

###: Setting H2O AutoML model configuration (default)
```python
house_price_automl = H2OAutoML(max_models= 100,
                           seed=1234,
                           max_runtime_secs=60, 
                           project_name= "House Price AutoML")
```

###: Training H2O AutoML 
```python
house_price_automl.train(x = features, y = response,training_frame=train,validation_frame=valid)
```

###: Getting the list of models created by AutoML in given time
```python
house_price_automl.leaderboard
```

###: Getting the best model or Leader model from the AutoML leader board
```python
house_price_leader = house_price_automl.leader
```

###: Understanding best Model (Leader Model) overall performance based on training data
```python
house_price_leader.model_performance(valid=True)
house_price_leader.model_performance(valid=True).r2()

###: Plotting AutoML Leader Model for its AUC metric 
```python
house_price_leader.plot(metric='AUTO')
```

###: Generating Variable Importance Plot for the Leader Model
```python
house_price_leader.varimp_plot()
```

###:  H2O AutoMLmodel varialbe Scoring History
```python
house_price_leader.score_history()
```

### PERFORMING PREDICTIONS USING a TEST DATA SET with Auto ML Leader model
```python
house_price_leader.predict(test)
```

###: Getting AUC metrics from the test data using AutoML Leader Model
```python
house_price_leader.model_performance(test_data=test).r2()
```
