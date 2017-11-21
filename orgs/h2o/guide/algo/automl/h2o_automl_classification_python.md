# H2O AutoML Classification in Python #

H2O AutoML interface is designed to have as few parameters as possible so that all the user needs to do is point to their dataset, identify the response column and optionally specify a time constraint, a maximum number of models constraint, and early stopping parameters.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O AutoML Classification with Titanic Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_AutoML_Classification_titanic.ipynb)
  
## H2O AutoML Binomial Classification Sample Code in Python ##

###: Importing H2O Library
```python
import h2o
```
###: Initializing h2O
```python
h2o.init()
```
###: Getting H2O Cluster status
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
###: Importing H2O AutoML Library
```python
from h2o.automl import H2OAutoML
```
###: Setting H2O AutoML model configuration (default)
```python
titanic_automl = H2OAutoML(max_models= 100,
                           seed=1234,
                           max_runtime_secs=60, 
                           project_name= "Titanic AutoML")
```
###: Training H2O AutoML 
```python
titanic_automl.train(x = features, y = response,training_frame=train,validation_frame=valid)
```
###: Getting the list of models created by AutoML in given time
```python
titanic_automl.leaderboard
```
###: Getting the best model or Leader model from the AutoML leader board
```python
titanic_leader = titanic_automl.leader
```
###: Understanding best Model (Leader Model) overall performance based on training data
```python
titanic_leader.model_performance(valid=True)
titanic_leader.model_performance(valid=True).auc()
```
###: Plotting AutoML Leader Model for its AUC metric 
```python
titanic_leader.plot(metric='auc')
```
###: Generating Variable Importance Plot for the Leader Model
```python
titanic_leader.varimp_plot()
```
###:  H2O AutoMLmodel varialbe Scoring History
```python
titanic_leader.score_history()
```
###: PERFORMING PREDICTIONS USING a TEST DATA SET with Auto ML Leader model
```python
titanic_leader.predict(test)
```
###: Getting AUC metrics from the test data using AutoML Leader Model
```python
titanic_leader.model_performance(test_data=test).auc()
```

