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
h2o.hist(h2o.asnumeric(train_df[response].asnumeric())


###:Training classification model with cross validation
gbm_model_with_cv = h2o.gbm(nfolds=5, 
                            x = features, y = response, training_frame=train_df)


###: Getting model performance
h2o.performance(gbm_model_with_cv, xval = TRUE)
h2o.auc(gbm_model_with_cv, xval = TRUE)


###:Training classification model with cross validation and key parameters configuration
gbm_model_cv_config = h2o.gbm(nfolds=5,
                              keep_cross_validation_predictions=TRUE,
                              fold_assignment="Modulo",
                              ntrees = 50,
                              col_sample_rate = 0.9,
                              sample_rate = 0.9,
                              max_depth = 10,
                              x = features, 
                              y = response, 
                              training_frame=train_df, 
                              model_id = "gbm_model_with_training_and_cross_validtion_R")


###: Getting GLM model performance on test data
h2o.performance(gbm_model_cv_config, xval = TRUE)
h2o.auc(gbm_model_cv_config, xval = TRUE)


###: Settings GLM grid parameters
gbm_hyper_params = list(learn_rate = c(0.01, 0.05, 0.1, 0.2, 0.5, 1.0),
                        max_depth =  c(5, 7, 10),
                        sample_rate = c(0.5, 0.75, 1.0),
                        col_sample_rate = c(0.5, 0.6, 0.7, 0.8),
                        ntrees = c(10,15,20))


###: Setting H2O Grid Search Criteria
grid_search_criteria = list( strategy = "RandomDiscrete", 
                     seed = 123,
                     stopping_metric = "AUTO", 
                     stopping_tolerance = 0.01,
                     stopping_rounds = 5 )


###: Training H2O Grid with data and H2O Grid searching settings
gbm_grid = h2o.grid(
                     hyper_params=gbm_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="titnaic_gbm_grid",
                     algorithm = "gbm"  ,
                     nfolds=5,
                     keep_cross_validation_predictions=TRUE,
                     fold_assignment="Modulo",
                     seed=12345,
                     x=features, y=response, training_frame=train_df
                    )


###: Finally getting the grid details based on AUC metric,  from ascending to descending sorted order
result_grid = h2o.getGrid("titnaic_gbm_grid", sort_by = "auc", decreasing = TRUE)


###: understanding grid
result_grid


###: Getting Grid Rows and Columns
print(nrow(result_grid@summary_table))
print(ncol(result_grid@summary_table))


###: Getting grid table header from the grid 
names(result_grid@summary_table)


###: Getting specific column details  from the grid
result_grid@summary_table['learn_rate']
result_grid@summary_table['max_depth']
result_grid@summary_table['auc']


###: Getting max metric (auc) from the grid
auc_list = result_grid@summary_table['auc'][[1]]
max(auc_list)


###: Getting Top 5 alpha values based on AUC sorted list, and then findings min and max of alpha from the top 5 AUC results
learn_rate_values = result_grid@summary_table$learn_rate[1:5]
learn_rate_values

min_learn_rate = as.numeric(min(learn_rate_values))
max_learn_rate = as.numeric(max(learn_rate_values))


###: Getting Top 5 Lambda values based on AUC sorted list, and then findings min and max of Lambda from the top 5 AUC results
max_depth_values = result_grid@summary_table$max_depth[1:5]
max_depth_values

min_max_depth = as.numeric(min(max_depth_values))
max_max_depth = as.numeric(max(max_depth_values))


###: Now we can retrain the model based on selected alpha and lambda values above
###: This is how you will set the updated GLM grid parameters based on grid search hyperparameter and retrain the grid
glm_hyper_params = list(alpha = seq(min_learn_rate,max_learn_rate,1), 
                        lambda =  seq(min_max_depth, max_max_depth, 1))


###: Getting the 5 best model from the grid
for (i in 1:5) {
  gbm_model = h2o.getModel(result_grid@model_ids[[i]])
  print(h2o.auc(h2o.performance(gbm_model, xval = TRUE)))
}


###: Getting the best model from the grid which is the first/top model from the AUC based sorted list 
best_model = h2o.getModel(result_grid@model_ids[[1]])


###: Getting the best model performance on test data
h2o.auc(best_model, xval = TRUE)


###: Performing predictions with one of the above model
glm_predictions = h2o.predict(best_model, newdata = test_df)
glm_predictions


###: Understanding/Validating predictions based on prediction results historgram
h2o.hist(h2o.asnumeric(glm_predictions['predict']))


###: Getting Scorring History
h2o.scoreHistory(best_model)


###: Getting GBM model variable importance 
h2o.varimp(best_model)


###: Getting model variable importance PLOT
h2o.varimp_plot(best_model)


