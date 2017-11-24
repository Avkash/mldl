# H2O Grid (Hyperparameter) Search for GLM in R #

Hyperparameter Optimization is the process of setting of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization. Learn more about gird search in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/grid-search.html).

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code ##
  - [H2O GLM Regression with House Price Dataset R Code](https://github.com/Avkash/mldl/blob/master/code/R/H2O-GridSearch-GLM-HousePrice.R)
  
## GLM Regression Grid Search Sample in R ##

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

###: Understanding response variable values as historgram in Training data
```python
h2o.hist(h2o.asnumeric(train_df[response]))
```

###:Training classification model with cross validation
```python
glm_model_with_cv = h2o.glm(nfolds=5, 
                            x = features, y = response, training_frame=train_df)
```

###: Getting model performance
```python
h2o.performance(glm_model_with_cv, xval = TRUE)
h2o.r2(glm_model_with_cv, xval = TRUE)
```

###:Training classification model with cross validation and key parameters configuration
```python
glm_model_cv_config = h2o.glm(nfolds=5,
                              keep_cross_validation_predictions=TRUE,
                              lambda_search = TRUE,
                              fold_assignment="Modulo",
                              alpha = 0.1,
                              seed=12345,
                              x = features, 
                              y = response, 
                              training_frame=train_df, 
                              model_id = "glm_model_with_training_and_validtion_R")
```

###: Getting GLM model performance on test data
```python
h2o.performance(glm_model_cv_config, xval = TRUE)
h2o.r2(glm_model_cv_config, xval = TRUE)
```

###: Settings GLM grid parameters
```python
glm_hyper_params = list('alpha' = c(0.01,0.1,0.3,0.5,0.7,0.9), 
                     'lambda'=  c(1e-1,1e-3,1e-5,1e-7,1e-9))
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
glm_grid = h2o.grid(
                     hyper_params=glm_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="houseprice_glm_grid_R",
                     algorithm = "glm"  ,
                     nfolds=5,
                     keep_cross_validation_predictions=TRUE,
                     lambda_search = TRUE,
                     fold_assignment="Modulo",
                     seed=12345,
                     x=features, y=response, training_frame=train_df
                    )
```

###: Finally getting the grid details based on AUC metric,  from ascending to descending sorted order
```python
result_grid = h2o.getGrid("titnaic_glm_grid_R", sort_by = "r2", decreasing = TRUE)
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
result_grid@summary_table['alpha']
result_grid@summary_table['lambda']
result_grid@summary_table['r2']
```

###: Getting max metric (auc) from the grid
```python
r2_list = result_grid@summary_table['r2'][[1]]
max(r2_list)
```

###: Getting Top 5 alpha values based on AUC sorted list, and then findings min and max of alpha from the top 5 AUC results
```python
alpha_values = result_grid@summary_table$alpha[1:5]
alpha_values
#Note: The alpha_values looks like -> "[0.1]"  "[0.3]"  "[0.01]" "[0.5]"  "[0.7]"  
#    : So we need to conver it to a numeric list s below
alpha_values = gsub("\\[|\\]", "", alpha_values)
min_alpha = as.numeric(min(alpha_values))
max_alpha = as.numeric(max(alpha_values))
```

###: Getting Top 5 Lambda values based on AUC sorted list, and then findings min and max of Lambda from the top 5 AUC results
```python
lambda_values = result_grid@summary_table$lambda[1:5]
lambda_values
#Note: The lambda_values looks like -> "[0.001]" "[0.001]" "[0.001]" "[0.001]" "[0.001]"  
#    : So we need to conver it to a numeric list as below
lambda_values = gsub("\\[|\\]", "", lambda_values)

min_lambda = as.numeric(min(lambda_values))
max_lambda = as.numeric(max(lambda_values))
```

###: Now we can retrain the model based on selected alpha and lambda values above
###: This is how you will set the updated GLM grid parameters based on grid search hyperparameter and retrain the grid
```python
glm_hyper_params = list(alpha = seq(min_alpha,max_alpha,1), 
                        lambda =  seq(min_lambda, max_lambda, 1))
```

###: Getting the 5 best model from the grid
```python
for (i in 1:5) {
  gbm_model = h2o.getModel(result_grid@model_ids[[i]])
  print(h2o.r2(h2o.performance(gbm_model, xval = TRUE)))
}
```

###: Getting the best model from the grid which is the first/top model from the AUC based sorted list 
```python
best_model = h2o.getModel(result_grid@model_ids[[1]])
```

###: Getting the best model performance on test data
```python
h2o.r2(best_model, xval = TRUE)
```

###: Performing predictions with one of the above model
```python
glm_predictions = h2o.predict(best_model, newdata = test_df)
glm_predictions
```

###: Understanding/Validating predictions based on prediction results historgram
```python
h2o.hist(h2o.asnumeric(glm_predictions['predict']))
```

###: Getting Scorring History
```python
h2o.scoreHistory(best_model)
```

###: Getting GBM model variable importance 
```python
h2o.varimp(best_model)
```

###: Getting model variable importance PLOT
```python
h2o.varimp_plot(best_model)
```

