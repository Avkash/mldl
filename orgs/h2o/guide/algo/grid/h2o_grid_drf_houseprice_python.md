# H2O Grid (Hyperparameter) Search for Random Forest in Python #

Hyperparameter Optimization is the process of setting of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization. Learn more about gird search in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html).

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O Random Forest Regression with House Price Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GridSearch-DRF-HousePrice-Regression.ipynb)
  
## Random Forest Regression Grid Search Sample in Python ##

###: Loading H2O Library
```python
import h2o
```

###: Get H2O Version
```python
h2o.__version__
```

###: Initalizing H2O cluster
```python
h2o.init()
```

###: Importing both training and test dataset into H2O cluster memory
```python
train_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```

###: Understanding Training dataset
```python
train_df.describe()
```

###: Understanding Test dataset
```python
test_df.describe()
```

###: Training and test dataset - columns and rows details
```python
print(train_df.shape)
print(test_df.shape)
```

###: Training and Test Dataframes - columns names
```python
print(train_df.col_names)
print(test_df.col_names)
```

###: Settings response or target variable for supervised machine learning
```python
response = "medv"
features = train_df.col_names
print(features)
```

###: Creating a list of all features we will use for machine learning
```python
features.remove(response)
print(features)
```

###: Understanding response variable values as historgram in Training data
```python
train_df['medv'].hist()
```

###: Importing H2O Estimator to build Random Forest Model
```python
from h2o.estimators.random_forest import H2ORandomForestEstimator
```

###:Building Random Forest (RF) -  Regression model with cross validation
```python
drf_model_with_cv = H2ORandomForestEstimator(nfolds=5)
drf_model_with_cv.train(x = features, y = response, training_frame=train_df)
```

###: Model Performance:
```python
drf_model_with_cv.model_performance(valid=True,test_data=test_df).r2()
```


###:Building Random Forest -  Regression model with training and validation data now
###:  Setting key GBM parameters
```python
drf_model_cv_config = H2ORandomForestEstimator(
                                      ntrees=10,
                                      max_depth=3,
                                      min_rows=2,
                                      nfolds=5,
                                      keep_cross_validation_predictions=True,
                                      seed=1)
```

###: Training the DRF model
```python
drf_model_cv_config.train(x = features, y = response, 
                                            training_frame=train_df, 
                                           model_id = "drf_model_with_training_and_validtion_python")
```

###: Getting model performance based on test data
```python
drf_model_cv_config.model_performance(valid=True,test_data=test_df).r2()
```

###: Importing H2O Grid Search Library
```python
from h2o.grid import H2OGridSearch
```

###: Setting GBM specific Parameters
```python
drf_hyper_params = {
                "ntrees" : [10,25,50],
                "max_depth": [ 5, 7, 10],
                "sample_rate": [0.5, 0.75, 1.0]}
```

###: Setting GBM hyperparameter search criteria
```python
grid_search_criteria = {"strategy": "RandomDiscrete", 
                        "max_models": 100, 
                        "seed": 12345}
```

###: Finalizing the settings for GBM grid search
```python
house_price_drf_grid = H2OGridSearch(model=H2ORandomForestEstimator(
                                                        seed=1,
                                                        nfolds=5,
                                                        fold_assignment="Modulo",
                                                        keep_cross_validation_predictions=True),
                     hyper_params=drf_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="house_price_drf_grid")
```

###: Finally traning the GBM grid Search Model
```python
house_price_drf_grid.train(x=features, y=response, training_frame=train_df)
```

###: Getting the tital number of models built into H2O GBM Grid
```python
len(house_price_drf_grid)
```

###: Defining a function to find the best model from the grid based on r2 or auc
```python
def find_best_model_from_grid(h2o_grid, test_parameter):    
    model_list = []
    for grid_item in h2o_grid:
        if test_parameter is "r2":
            if not (grid_item.r2() == "NaN"):
                model_list.append(grid_item.r2())
            else:
                model_list.append(0.0)            
        elif test_parameter is "auc":
            if not (grid_item.auc() == "NaN"):
                model_list.append(grid_item.auc())
            else:
                model_list.append(0.0)            
    #print(model_list)        
    max_index = model_list.index(max(model_list))
    #print(max_index)
    best_model = h2o_grid[max_index]
    print("Model ID with best R2: " +  best_model.model_id)
    if test_parameter is "r2":
        print("Best R2: " +  str(best_model.r2()))
    elif test_parameter is "auc":
        print("Best AUC: " +  str(best_model.auc()))
    return best_model
```

###: Applying the function to get the best model from the grid
```python
best_drf_model = find_best_model_from_grid(house_price_drf_grid, "r2")
```

###: Getting the best model ID
```python
best_drf_model.model_id
```

###: Performing predictions with one of the above model
```python
drf_predictions = best_drf_model.predict(test_data=test_df)
```

###: Understanding/Validating predictions based on prediction results historgram
```python
drf_predictions.hist()
```

###: Getting Scorring History
```python
best_drf_model.score_history()
```


###: Getting DRF model variable importance 
```python
best_drf_model.varimp()
```

###: Getting DRF model variable importance PLOT
```python
best_drf_model.varimp_plot()
```

###: Plotting the model based on rmse
```python
best_drf_model.plot(metric="rmse")
```
