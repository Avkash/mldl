# H2O Grid (Hyperparameter) Search for Deep Learning in R #

Hyperparameter Optimization is the process of setting of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization. Learn more about gird search in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html).

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code ##
  - [H2O Deep Learning Regression with House Price Dataset R Code](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GridSearch-DeepLearning-HousePrice-Regression.ipynb)
  
## Deep Learning Regression Grid Search Sample in R ##

###: Loading H2O Library
```python
library(h2o)
```

###: Initalizing H2O cluster
```python
h2o.init()
```

###: Get H2O Version
```python
h2o.getVersion()
```

###: Importing both training and test dataset into H2O cluster memory
```python
train_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```

###: Listing all columns
```python
h2o.colnames(train_df)
```

###: Setting response variable
```python
response = "medv"
```

###: Settings all features for supervised machine learning
```python
features =  h2o.colnames(train_df)
print(features)
```

###: Creating a list of all features we will use for machine learning
```python
features = setdiff(features, response)
print(features)
```

###: Ignoring other features which are not needed for training
###: features = setdiff(features, c('list_of_columns_you_want_to_ignore'))
###: print(features)    
```

###: Understanding response variable values as historgram in Training data
```python
h2o.hist(h2o.asnumeric(train_df[response]))
```

###:Training classification model with cross validation
```python
dl_model_with_cv = h2o.deeplearning(nfolds=5, 
                            x = features, y = response, training_frame=train_df)
```

###: Getting model performance
```python
h2o.performance(dl_model_with_cv, xval = TRUE)
h2o.r2(dl_model_with_cv, xval = TRUE)
```

###:Training classification model with cross validation and key parameters configuration
```python
dl_model_cv_config = h2o.deeplearning(nfolds=5,
                              keep_cross_validation_predictions=TRUE,
                              fold_assignment="Modulo",
                              seed=12345,
                              hidden = c(10,10),
                              epochs = 20,
                              x = features, 
                              y = response, 
                              training_frame=train_df, 
                              model_id = "dl_model_with_training_and_validtion_R")
```

###: Getting DRF model performance on test data
```python
h2o.performance(dl_model_cv_config, xval = TRUE)
h2o.r2(dl_model_cv_config, xval = TRUE)
```

###: Settings GBM grid parameters
```python
dl_hyper_params = list(hidden =  c(5, 7, 10),
                       epochs = c(10, 20, 30),
                       score_training_samples = c(10,20,30),
                       train_samples_per_iteration = c(5,10,15))
```

###: Setting H2O Grid Search Criteria
```python
grid_search_criteria = list( 'strategy'= "RandomDiscrete", 
                    'seed'= 123,
                    'stopping_metric'= "AUTO", 
                    'stopping_tolerance'= 0.01,
                    'stopping_rounds' = 5 )
```

###: Training H2O Grid with data and H2O Grid searching settings
```python
dl_grid = h2o.grid(
                     hyper_params=dl_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="houseprice_dl_grid_R",
                     algorithm = "deeplearning"  ,
                     nfolds=5,
                     keep_cross_validation_predictions=TRUE,
                     fold_assignment="Modulo",
                     seed=12345,
                     x=features, y=response, training_frame=train_df
                    )
```

###: Finally getting the grid details based on AUC metric,  from ascending to descending sorted order
```python
result_grid = h2o.getGrid("houseprice_dl_grid_R", sort_by = "r2", decreasing = TRUE)
```

###: understanding grid
```python
result_grid
```

###: Getting Grid Rows and Columns
```python
print(nrow(result_grid@summary_table))
print(ncol(result_grid@summary_table))
```

###: Getting grid table header from the grid 
```python
names(result_grid@summary_table)
```

###: Getting specific column details  from the grid
```python
result_grid@summary_table['hidden']
result_grid@summary_table['epochs']
result_grid@summary_table['r2']
```

###: Getting max metric (auc) from the grid
```python
r2_list = result_grid@summary_table['r2'][[1]]
max(r2_list)
```

###: Getting Top 5 sample_rate values based on r2 sorted list, and then findings min and max of sample_rate from the top 5 r2 results
```python
hidden_values = result_grid@summary_table$hidden[1:5]
hidden_values
#Note: The hidden_values looks like -> "[20]"  "[20]"  "[20]" "[20]"  "[30]"  
#    : So we need to conver it to a numeric list s below
hidden_values = gsub("\\[|\\]", "", hidden_values)
min_hidden = as.numeric(min(hidden_values))
max_hidden = as.numeric(max(hidden_values))
```

###: Getting Top 5 max_depth values based on r2 sorted list, and then findings min and max of max_depth from the top 5 r2 results
```python
epochs_values = result_grid@summary_table$epochs[1:5]
epochs_values
min_epochs = as.numeric(min(epochs_values))
max_epochs = as.numeric(max(epochs_values))
```

###: Now we can retrain the model based on selected learn_rate and max_depth values above
###: This is how you will set the updated DRF grid parameters based on grid search hyperparameter and retrain the grid
```python
dl_hyper_params = list(learn_rate = seq(min_hidden,max_hidden,1), 
                        max_depth =  seq(min_epochs, max_epochs, 1))
```

###: Getting the 5 best model from the grid
```python
for (i in 1:5) {
  dl_model = h2o.getModel(result_grid@model_ids[[i]])
  print(h2o.r2(h2o.performance(dl_model, xval = TRUE)))
}
```

###: Getting the best model from the grid which is the first/top model from the R2 based sorted list 
```python
best_model = h2o.getModel(result_grid@model_ids[[1]])
```

###: Getting the best model performance on test data
```python
h2o.r2(best_model, xval = TRUE)
```

###: Performing predictions with one of the above model
```python
model_predictions = h2o.predict(best_model, newdata = test_df)
model_predictions
```

###: Understanding/Validating predictions based on prediction results historgram
```python
h2o.hist(model_predictions)
```

###: Getting Scorring History
```python
h2o.scoreHistory(best_model)
```

###: Getting model variable importance 
```python
h2o.varimp(best_model)
```

###: Getting model variable importance PLOT
```python
h2o.varimp_plot(best_model)
```
