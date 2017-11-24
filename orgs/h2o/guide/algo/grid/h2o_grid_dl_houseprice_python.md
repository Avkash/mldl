# H2O Grid (Hyperparameter) Search for Deep Learning in Python #

Hyperparameter Optimization is the process of setting of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization. Learn more about gird search in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html).

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O Deep Learning Regression with House Price Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GridSearch-DeepLearning-HousePrice-Regression.ipynb)
  
## Deep Learning Regression Grid Search Sample in Python ##

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

###: Importing H2O H2OGeneralizedLinearEstimator to build GLM Model
```python
from h2o.estimators.deeplearning import H2ODeepLearningEstimator
```

###: Building Deep Learning -  Regression model with cross validation
```python
drf_model_with_cv = H2ODeepLearningEstimator(nfolds=5)
drf_model_with_cv.train(x = features, y = response, training_frame=train_df)
```

###: Model Performance
```python
dl_model_with_cv.model_performance(valid=True,test_data=test_df).r2()
```

###: Building Deep Learning  Regression model with training and validation data now
###:  Setting key Deep Learning parameters
```python
dl_model_with_cv = H2ODeepLearningEstimator(distribution="AUTO",
                                 nfolds=5,
                                 fold_assignment="Modulo",
                                 keep_cross_validation_predictions=True,
                                 hidden = [10,10],
                                 epochs = 25,
                                 score_training_samples=20,
                                 activation="Rectifier",
                                 adaptive_rate = False,
                                 train_samples_per_iteration=10,
                                 seed=1)
```

###: Training the Deep Learning model
```python
dl_model_with_cv.train(x = features, y = response, 
                                            training_frame=train_df, 
                                           model_id = "dl_model_with_training_and_validtion_python")
```

###: Getting model performance based on test data
```python
dl_model_with_cv.model_performance(valid=True,test_data=test_df).r2()
```

###: Importing H2O Grid Search Library
```python
from h2o.grid import H2OGridSearch
```

###: Setting Deep Learning specific Parameters
```python
dl_hyper_params = {"hidden": [10,20,30],
                "epochs": [ 10, 15, 20],
                "score_training_samples": [10, 20, 30],
                "train_samples_per_iteration": [5,10,20]}
```

###: Setting hyperparameter search criteria
```python
grid_search_criteria = {"strategy": "RandomDiscrete", 
                        "max_models": 100, 
                        "seed": 12345}
```

###: Finalizing the settings for Deep Learning grid search
```python
house_price_dl_grid = H2OGridSearch(model=H2ODeepLearningEstimator(
                                                        seed=1,
                                                        nfolds=5,
                                                        fold_assignment="Modulo",
                                                        keep_cross_validation_predictions=True),
                     hyper_params=gbm_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="house_price_dl_grid")
```

###: Finally traning the Deep Learning grid Search Model
```python
house_price_dl_grid.train(x=features, y=response, training_frame=train_df)
```

###: Getting the tital number of models built into H2O Grid
```python
len(house_price_dl_grid)
```

###: Definiting a function to find the best model from the grid based on r2 or auc
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
best_dl_model = find_best_model_from_grid(house_price_dl_grid, "r2")
```

###: Performing predictions with one of the above model
```python
dl_predictions = best_dl_model.predict(test_data=test_df)
```

###: Understanding/Validating predictions based on prediction results historgram
```python
dl_predictions.hist()
```

#: Getting Scorring History
```python
best_dl_model.score_history()
```

#: Getting DL model variable importance 
```python
best_dl_model.varimp()
```

#: Getting DL model variable importance PLOT
```python
best_dl_model.varimp_plot()
```

###: Plotting the model based on rmse
```python
best_dl_model.plot(metric="rmse")
```
