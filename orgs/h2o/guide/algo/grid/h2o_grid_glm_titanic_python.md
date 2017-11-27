# H2O Grid (Hyperparameter) Search for GLM in Python #

Hyperparameter Optimization is the process of setting of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization. Learn more about gird search in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html).

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O GLM Classification with Titanic Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GridSearch-GLM-Titanic-Classification.ipynb)
  
## GLM Binomial Classification Grid Search Sample in Python ##

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
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
```

###: Understanding the dataset
```python
df.describe()
```

###: Listing all columns
```python
df.col_names
```

###: Setting response variable
```python
response = "survived"
```

###: Setting response variable to enum or categorical so we can build a classification model
```python
df[response] = df[response].asfactor()
```


###: Spliting the dataset into train and test 
```python
train_df, test_df = df.split_frame(ratios=[0.9])
print(train_df.shape)
print(test_df.shape)
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

###: Settings all features for supervised machine learning
```python
features = train_df.col_names
print(features)
```

###: Creating a list of all features we will use for machine learning
```python
features.remove(response)
print(features)
```

###: Ignoring other features which are not needed for training
```python
for feature_name in ['name', 'ticket', 'home.dest']:
    features.remove(feature_name)
print(features)    
```

###: Understanding response variable values as historgram in Training data
```python
train_df[response].asnumeric().hist()
```

###: Importing H2O H2OGeneralizedLinearEstimator to build GLM Model
```python
from h2o.estimators.glm import H2OGeneralizedLinearEstimator
```

###:Building Gradient Boosting (GBM) -  Regression model with cross validation
```python
glm_model_with_cv = H2OGeneralizedLinearEstimator(nfolds=5, 
                                                  family = "Binomial")
```

###: Training the model
```python
glm_model_with_cv.train(x = features, y = response, training_frame=train_df)
```

###: Getting model performance
```python
glm_model_with_cv.model_performance(valid=True,test_data=test_df).auc()
```

###:Building GLM -  Regression model with cross validation and key GLM parameters configuration
```python
glm_model_cv_config = H2OGeneralizedLinearEstimator(nfolds=5,
                                                    family = "binomial",
                                                    keep_cross_validation_predictions=True,
                                                    lambda_search = True,
                                                    fold_assignment="auto",
                                                    alpha = 0.1,
                                                    seed=12345)
```

###: Training GLM Model
```python
glm_model_cv_config.train(x = features, y = response, 
                                            training_frame=train_df, 
                                           model_id = "glm_model_with_training_and_validtion_python")
```

###: Getting GLM model performance on test data
```python
glm_model_cv_config.model_performance(valid=True,test_data=test_df).auc()
```

###: Importing H2O Grid Library
```python
from h2o.grid import H2OGridSearch
```

###: Settings GLM grid parameters
```python
glm_hyper_params = { 'alpha': [0.01,0.1,0.3,0.5,0.7,0.9], 
                     'lambda': [1e-1,1e-3,1e-5,1e-7,1e-9] }
```

###: Setting H2O Grid Search Criteria
```python
grid_search_criteria = { 'strategy': "RandomDiscrete", 
                    'seed': 123,
                    'stopping_metric': "AUTO", 
                    'stopping_tolerance': 0.01,
                    'stopping_rounds': 5 }
```

###: Finalzing the H2O Grid searching settings
```python
glm_grid = H2OGridSearch(model=H2OGeneralizedLinearEstimator(
                                                    nfolds=5,
                                                    family = "binomial",
                                                    keep_cross_validation_predictions=True,
                                                    lambda_search = True,
                                                    fold_assignment="auto",
                                                    seed=12345),
                     hyper_params=glm_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="titnaic_glm_grid")
```

###: Finally training H2O Grid with data 
```python
glm_grid.train(x=features, y=response, training_frame=train_df)
```

###: Finally getting total count of GLM models
```python
len(glm_grid)
```

###: Looking at the GLM grid
```
glm_grid
```

###: Getting H2O Grid from the grid ID Object ()
```
grid_object = h2o.get_grid(grid_id="titnaic_glm_grid_python")
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
best_model = find_best_model_from_grid(glm_grid, "auc")
```

###: Getting the best model performance on test data
```python
best_model.model_performance(valid=True,test_data=test_df).auc()
```

###: Performing predictions with one of the above model
```python
glm_predictions = best_model.predict(test_df)
glm_predictions
```

###: Understanding/Validating predictions based on prediction results historgram
```python
glm_predictions['predict'].asnumeric().hist()
```

###: Getting Scorring History
```python
best_model.scoring_history()
```

###: Getting GBM model variable importance 
```python
best_model.varimp()
```

###: Getting model variable importance PLOT
```python
best_model.varimp_plot()
```

