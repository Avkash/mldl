# Classification with H2O XGBoost in Python #

XGBoost is an optimized distributed gradient boosting library designed to be highly efficient, flexible, and portable. XGBoost provides parallel tree boosting (also known as GBDT, GBM) that solves many data science problems in a fast and accurate way.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Scala Source Code ##
  - [H2O XGBoost Classification with Titanic Dataset Python Notebook](https://github.com/Avkash/mldl/blob/master/code/scala/H2O_AutoML_Titanic.scala)
  
## Classification with H2O XGBoost in Python ##

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
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
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
response = "survived"
```

###: Setting Response column to factor so we can get unique values in it
```python
df['survived'].asfactor().levels()
```

###: Setting Response column to factor so we can build classification model
```python
df[response] = df[response].asfactor()
```

###: Verifying Response column as factor 
```python
df[response].describe()
```

###: spliting the dataset into train, test and validation  
```python
train, valid, test = df.split_frame(ratios=[0.8,0.1])
print(train.shape)
print(valid.shape)
print(test.shape)
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

###: Ignoring list of features which are not required for model building
```python
ignore_list = ['name', 'ticket', 'home.dest']
for x in ignore_list:
    features.remove(x)
print(features)    
```

###: Importing H2O XGBoost Library
```python
from h2o.estimators.xgboost import H2OXGBoostEstimator
```

###: Setting XGBooost Parameters
```python
param = {
      "ntrees" : 100
    , "max_depth" : 10
    , "learn_rate" : 0.02
    , "sample_rate" : 0.7
    , "col_sample_rate_per_tree" : 0.9
    , "min_rows" : 5
    , "seed": 4241
    , "score_tree_interval": 100
}
```

###: Setting H2O XGBoost model configuration (default)
```python
titanic_xgb = H2OXGBoostEstimator(**param)
```

###: Training H2O XGBoost model 
```python
titanic_xgb.train(x = features, y = response, training_frame = train, validation_frame = valid)
```

###: understanding the model metrics and various detials
```python
titanic_xgb
```

###: XGBoost model performance on validation data
```python
titanic_xgb.model_performance(valid=True)
titanic_xgb.model_performance(valid=True).auc()
```

###: Plotting XGBoost  Model for its AUC metric 
```python
titanic_xgb.plot(metric='auc')
```

###: Generating Variable Importance Plot for the XGBoost Model
```python
titanic_xgb.varimp_plot()
```

###:  H2O XGBoost Scoring History
```python
titanic_xgb.score_history()
```

###: PERFORMING PREDICTIONS USING a TEST DATA SET with XGBoost model
```python
titanic_xgb.predict(test)
```

###: Getting AUC metrics from the test data using XGBoost Leader Model
```python
titanic_xgb.model_performance(test_data=test).auc()
```
