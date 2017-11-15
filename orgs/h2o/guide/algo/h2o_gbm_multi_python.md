# H2O GBM (Gradient Boosting Machine) - Multinomial Classification in Python #

When you pass response columns as categorical or enum and it has 3 or more classes, the h2O GBM algorithm builds Multinomial Classification Model. 

## Datasets ##
The dataset used in this example can be obtained from here:
 - [iris.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample Python Notebook ##
  - [H2O_GBM_Multinomial Classification with IRIS Dataset](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_GBM_IRIS_Multinomial_Classification.ipynb)
  

## Sample Code in Python ##

###: Importing H2O Library
```python
import h2o
```
### : Initializing h2O
```python
h2o.init()
```
###: Importing Dataset
```python
iris_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv", 
                          col_names=["sepal_length", "sepal_width", "petal_length", "petal_width", "iris_class"])
```
###: Understanding Dataset
```python
iris_df.describe()
```
###: Visualizing Dataset
```python
iris_df
```
###: Setting response columns as factor
```python
iris_df['iris_class'] = iris_df['iris_class'].asfactor()
```
###: Getting the list of classes in the response column
```python
iris_df['iris_class'].levels()
```
###: Setting Response column
```python
response = "iris_class"
```
###: Settings all features for model building
```python
features= iris_df.col_names
features.remove(response)
print(features)
```
###: Importing H2O GBM library
```python
from h2o.estimators.gbm import H2OGradientBoostingEstimator
```
###: Setting H2O GBM model configuration
```python
iris_gbm = H2OGradientBoostingEstimator(nfolds = 5,
                  distribution="AUTO",
                   ntrees=10,
                   max_depth=3,
                   min_rows=2,
                   learn_rate=0.2,
                   keep_cross_validation_predictions=True,
                   seed = 9090
)
```
###: Training H2O GBM Model
```python
iris_gbm.train(x = features, y = response, training_frame=iris_df)
```
###: Getting Model details
```python
iris_gbm
```
###: Getting model performance based on cross validation
```python
iris_gbm.model_performance(xval=True)
```
###: Creating a test data frame to perform prediction
```python
df_test = h2o.H2OFrame.from_python({"sepal_length":3.4, "sepal_width" : 3.2, "petal_length" : 1.4, "petal_width" : 3.2})

df_test
```

###: Performing prediction using GBM model we built earlier
```python
iris_gbm.predict(test_data=df_test)
iris_gbm.model_performance(xval=True)
```


###: Plotting Variable Importance graph
```python
iris_gbm.varimp_plot()
```

###: Generating Variable Importance Table
```python
iris_gbm.varimp()
```
###: Generating Training Scoring History Plot
```python
iris_gbm.plot()
```
###: Generating Scoring History details per tree
```python
iris_gbm.score_history()
```
###: Generating Scoring History details per tree
```python
iris_gbm.scoring_history()
```
