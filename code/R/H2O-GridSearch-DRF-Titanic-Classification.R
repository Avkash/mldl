###: Loading H2O Library
library(h2o)

###: Initalizing H2O cluster
h2o.init()

###: Get H2O Version
h2o.getVersion()

###: Importing both training and test dataset into H2O cluster memory
df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")

### Understanding the dataset
h2o.describe(df)

###: Listing all columns
h2o.colnames(df)

###: Setting response variable
response = "survived"

###: Setting response variable to enum or categorical so we can build a classification model
df[response] = h2o.asfactor(df[response])

###: Spliting the dataset into train and test 
df_split_frames = h2o.splitFrame(df, ratios = c(0.9))
train_df = df_split_frames[[1]]
test_df = df_split_frames[[2]]
print(nrow(train_df))
print(nrow(test_df))

###: Settings all features for supervised machine learning
features =  h2o.colnames(train_df)
print(features)

###: Creating a list of all features we will use for machine learning
features = setdiff(features, response)
print(features)

###: Ignoring other features which are not needed for training
features = setdiff(features, c('name', 'ticket', 'home.dest'))
print(features)    

###: Understanding response variable values as historgram in Training data
h2o.hist(h2o.asnumeric(train_df[response]))

###:Training classification model with cross validation
drf_model_with_cv = h2o.randomForest(nfolds=5, x = features, y = response, training_frame=train_df)

###: Getting model performance
h2o.performance(drf_model_with_cv, xval = TRUE)
h2o.auc(drf_model_with_cv, xval = TRUE)

###:Training classification model with cross validation and key parameters configuration
drf_model_cv_config = h2o.randomForest(nfolds=5,
                              keep_cross_validation_predictions=TRUE,
                              fold_assignment="Modulo",
                              ntrees = 50,
                              sample_rate = 0.9,
                              max_depth = 10,
                              x = features, 
                              y = response, 
                              training_frame=train_df, 
                              model_id = "drf_model_with_training_and_cross_validtion_R")

###: Getting GLM model performance on test data
h2o.performance(drf_model_cv_config, xval = TRUE)
h2o.auc(drf_model_cv_config, xval = TRUE)

###: Settings GLM grid parameters
drf_hyper_params = list(max_depth =  c(5, 7, 10),
                        sample_rate = c(0.5, 0.75, 1.0),
                        ntrees = c(10,15,20))

###: Setting H2O Grid Search Criteria
grid_search_criteria = list( strategy = "RandomDiscrete", 
                     seed = 123,
                     stopping_metric = "AUTO", 
                     stopping_tolerance = 0.01,
                     stopping_rounds = 5 )

###: Training H2O Grid with data and H2O Grid searching settings
drf_grid = h2o.grid(
                     hyper_params=drf_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="titnaic_drf_grid_R",
                     algorithm = "randomForest"  ,
                     nfolds=5,
                     keep_cross_validation_predictions=TRUE,
                     fold_assignment="Modulo",
                     seed=12345,
                     x=features, y=response, training_frame=train_df
                    )

###: Finally getting the grid details based on AUC metric,  from ascending to descending sorted order
result_grid = h2o.getGrid("titnaic_drf_grid_R", sort_by = "auc", decreasing = TRUE)

###: understanding grid
result_grid

###: Getting Grid Rows and Columns
print(nrow(result_grid@summary_table))
print(ncol(result_grid@summary_table))

###: Getting grid table header from the grid 
names(result_grid@summary_table)

###: Getting specific column details  from the grid
result_grid@summary_table['max_depth']
result_grid@summary_table['ntrees']
result_grid@summary_table['auc']

###: Getting max metric (auc) from the grid
auc_list = result_grid@summary_table['auc'][[1]]
max(auc_list)

###: Getting Top 5 ntrees values based on AUC sorted list, and then findings min and max of ntrees from the top 5 AUC results
ntrees_values = result_grid@summary_table$ntrees[1:5]
ntrees_values
min_ntrees = as.numeric(min(ntrees_values))
max_ntrees = as.numeric(max(ntrees_values))

###: Getting Top 5 max_depth values based on AUC sorted list, and then findings min and max of max_depth from the top 5 AUC results
max_depth_values = result_grid@summary_table$max_depth[1:5]
max_depth_values
min_max_depth = as.numeric(min(max_depth_values))
max_max_depth = as.numeric(max(max_depth_values))

###: Now we can retrain the model based on selected alpha and lambda values above
###: This is how you will set the updated GLM grid parameters based on grid search hyperparameter and retrain the grid
glm_hyper_params = list(nrees = seq(min_ntrees,max_ntrees,1), 
                        max_depth =  seq(min_max_depth, max_max_depth, 1))

###: Getting the 5 best model from the grid
for (i in 1:5) {
  drf_model = h2o.getModel(result_grid@model_ids[[i]])
  print(h2o.auc(h2o.performance(drf_model, xval = TRUE)))
}

###: Getting the best model from the grid which is the first/top model from the AUC based sorted list 
best_model = h2o.getModel(result_grid@model_ids[[1]])
best_model

###: Getting the best model performance on test data
h2o.auc(best_model, xval = TRUE)

###: Performing predictions with one of the above model
model_predictions = h2o.predict(best_model, newdata = test_df)
model_predictions

###: Understanding/Validating predictions based on prediction results historgram
h2o.hist(h2o.asnumeric(model_predictions['predict']))

###: Getting Scorring History
h2o.scoreHistory(best_model)

###: Getting GBM model variable importance 
h2o.varimp(best_model)

###: Getting model variable importance PLOT
h2o.varimp_plot(best_model)
