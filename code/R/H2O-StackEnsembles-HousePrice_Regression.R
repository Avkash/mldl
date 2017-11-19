###: Loading important libraries 
library(h2o)


###: Initializing H2O
h2o.init()


###:Importing training and test data
###: Local
train = h2o.importFile("/Users/avkashchauhan/src/github.com/avkash/mldl/data/house_price_train.csv")
test = h2o.importFile("/Users/avkashchauhan/src/github.com/avkash/mldl/data/house_price_test.csv")


###: Understanding the size of training and test dataset
print(nrow(train))
print(ncol(train))
print(nrow(test))
print(ncol(test))

###: Understanding the training dataset
h2o.summary(train)
h2o.summary(test)

h2o.describe(train)
h2o.describe(test)


###: Listing columns in training dataset
h2o.colnames(train)

###: Setting response column to "medv" <- Median house value
response = "medv"


###: Setting all the columns as features which will be used in training
features = h2o.colnames(train)
print(features)
features = setdiff(features, c(response))
print(features)

###: We will be using cross validation in traning so setting Number of CV folds 
nfolds = 5


###: You can create ensemble models in few given ways:
###: 1. First Train individual models and pass as list to ensemble
###: 2. Train a grid of models
###: 3. Train several grids of models

###: Note: All base models must have the same cross-validation folds and
###: the cross-validated predicted values must be kept using keep_cross_validation_predictions set to TRUE.


###: Ensemble 1. 
###: First Train individual models and pass as list to ensemble
###: We will generate a 3-model ensemble using GBM + RF + Deep Learning model types


###: Training and cross-validating a GBM Regression Model and R2 metrics will be used as main metric

house_price_gbm = h2o.gbm(distribution="AUTO",
                                      ntrees=10,
                                      max_depth=3,
                                      min_rows=2,
                                      learn_rate=0.2,
                                      nfolds=nfolds,
                                      fold_assignment="Modulo",
                                      keep_cross_validation_predictions=TRUE,
                                      seed=1,
                                      model_id ="House_Price_GBM_Regression_Model",
                                      x=features, 
                                      y=response, 
                                      training_frame=train)


###: Training and cross-validating a Random Forest Regression Model and R2 metrics will be used as main metric
house_price_rf = h2o.randomForest(ntrees=10,
                                 nfolds=nfolds,
                                 fold_assignment="Modulo",
                                 keep_cross_validation_predictions=TRUE,
                                 seed=1,
                                 model_id = "House_Price_RF_Regression_Model",
                                 x=features, 
                                 y=response, 
                                 training_frame=train)

###: Training and cross-validating a Deep Learning Regression Model and R2 metrics will be used as main metric
house_price_dl = h2o.deeplearning(
                                 nfolds=nfolds,
                                 fold_assignment="Modulo",
                                 keep_cross_validation_predictions=TRUE,
                                 hidden = c(10,10),
                                 epochs = 25,
                                 train_samples_per_iteration=10,
                                 score_training_samples=20,
                                 activation="Rectifier",
                                 adaptive_rate = FALSE,
                                 seed=1,
                                 model_id = "House_Price_DL_Regression_Model",
                                 x=features, 
                                 y=response, 
                                 training_frame=train)


###: Getting Model ID of each model we have built
print(house_price_gbm@model_id)
print(house_price_rf@model_id)
print(house_price_dl@model_id)

###: Getting Model performance based cross validation using R2 metric for each model
h2o.r2(house_price_gbm, xval=TRUE)
h2o.r2(house_price_rf, xval=TRUE)
h2o.r2(house_price_dl, xval=TRUE)


###: Generating an ensemble model using all 3 previously created GBM, RD and DL models

# Train a stacked ensemble using the GBM and GLM above
ensemble = h2o.stackedEnsemble(model_id="house_price_ensemble_model",
                                       base_models=list(house_price_gbm@model_id, 
                                                    house_price_rf@model_id,
                                                    house_price_dl@model_id),
                                  x=features, 
                                  y=response, 
                                  training_frame=train)

###: Evaluating ensemble performance using test data
perf_stack_test = h2o.performance(ensemble, newdata = test)


###: Comparing Base Learner performance using test set for GBM, RF and Deep Learning Model:
perf_gbm_test = h2o.performance(house_price_gbm, newdata =test)
perf_rf_test = h2o.performance(house_price_rf, newdata = test)
perf_dl_test =h2o.performance(house_price_dl,  newdata =  test)
baselearner_best_r2_test = max(h2o.r2(perf_gbm_test), h2o.r2(perf_rf_test), h2o.r2(perf_dl_test))
print(sprintf("Best Base-learner Test R2 (R^2):  %s" , baselearner_best_r2_test))


###: Getting Stack Ensemble Models performance using test set:
stack_r2_test = h2o.r2(perf_stack_test)
print(sprintf("Ensemble Test R2 (R^2):  %s", stack_r2_test))


###: Printing Original Modelperformance using test data for comparision
print(sprintf("Original GBM Model Test R2 (r^2):  %s", h2o.r2(perf_gbm_test) ))
print(sprintf("Original RF Model Test R2 (r^2): %s", h2o.r2(perf_rf_test)))
print(sprintf("Original Deep Learning Model Test R2 (r^2):  %s", h2o.r2(perf_dl_test)))

###: Stack Ensemble model is like any other model in H2O 
###: So you sure can perform predictions using test set as needed
pred = h2o.predict(ensemble, newdata =  test)
pred

###: Ensemble 2. 
###: First We will generate a random Grid of model selecting GBM as main algorithm
###: Secondany we will stack all of grid model together

###: Let's specify GBM hyperparameters for the grid search
gbm_hyper_params = list(learn_rate = c(0.01, 0.05, 0.1, 0.2, 0.5, 1.0),
                max_depth = c(5, 7, 10),
                sample_rate =  c(0.5, 0.75, 1.0),
                col_sample_rate = c(0.5, 0.6, 0.7, 0.8))

###: Now we will setup the Grid Search criteria and other parameter to fine tune it:
grid_search_criteria = list(strategy= "RandomDiscrete", 
                   max_models = 100, 
                   seed = 12345)

###: Now we will build the H2O GBM model based on Gird Search criteria and GBM hyperparameters setting:
house_price_gbm_grid = h2o.grid(algo = "gbm",
                                ntrees=50,
                                seed=1,
                                nfolds=nfolds,
                                fold_assignment="Modulo",
                                keep_cross_validation_predictions=TRUE,
                               hyper_params=gbm_hyper_params,
                               search_criteria=grid_search_criteria,
                               grid_id="house_price_gbm_grid",
                               x=features, y=response, training_frame=train)

###: Lets see the count of all models we built during grid search
length(house_price_gbm_grid@model_ids)

###: Now we will train a stacked ensemble model by passing the GBM grid models
house_price_grid_ensemble = h2o.stackedEnsemble(model_id="house_price_gbm_grid_ensemble",
                                       base_models=house_price_gbm_grid@model_ids,
                                       x=features, y=response, training_frame=train)

###: Let's evaluate the stacked ensemble model performance based on test data
perf_stack_test = h2o.performance(house_price_grid_ensemble, newdata = test)

###: Creating a local function to get R2 and AUC (as needed) from a list of H2O models
.getauc <- function(mm) h2o.r2(h2o.performance(h2o.getModel(mm), newdata = test))
.getr2 <- function(mm) h2o.r2(h2o.performance(h2o.getModel(mm), newdata = test))

###: Now we can compare base learner performance with stacked ensemble model using test data
baselearner_all_r2 <- sapply(house_price_gbm_grid@model_ids, .getr2)
baselearner_best_r2_test <- max(baselearner_all_r2)
stacked_ensemble_r2_test = h2o.r2(perf_stack_test)
print(sprintf("Best Base-learner model R2:  %s", baselearner_best_r2_test))
print(sprintf("Ensemble Model R2:  %s", stack_r2_test))

###:  Stack Ensemble model is like any other model in H2O 
###: So you sure can perform predictions using test set as needed
pred =  h2o.predict(house_price_grid_ensemble, newdata = test)
pred

###: Ensemble 3. 
###: First We will generate a random Grid of model selecting Deep Learning as main algorithm
###: Secondany we will stack Previously created GBM and recently created Deep Learning model together

###: Let's specify Deep Learning hyperparameters for the grid search
dl_hyper_params = list(hidden =  c(1, 5,10),
                     train_samples_per_iteration = c(5, 10),
                     score_training_samples = c(10, 20))

###: Now we will setup the Grid Search criteria and other parameter to fine tune it:
grid_search_criteria = list(strategy = "RandomDiscrete", max_models =  100, seed =  12345)

###: Now we will build H2O Deep Learning models based on Gird Search criteria and GBM hyperparameters setting:
house_price_dl_grid = h2o.grid(algorithm = "deeplearning",
                      epochs=10,
                      seed=1,
                      nfolds=nfolds,
                      fold_assignment="Modulo",
                      keep_cross_validation_predictions=TRUE,
                      hyper_params=dl_hyper_params,
                      search_criteria=grid_search_criteria,
                      grid_id="house_price_dl_grid",
                      x=features, y=response, training_frame=train)

###: Lets see the count of all models we built during grid search
length(house_price_dl_grid@model_ids)

###: Now we will train a stacked ensemble model by passing the GBM and Deep Learning grid models
all_ids = append(house_price_dl_grid@model_ids, house_price_gbm_grid@model_ids)
length(all_ids)

house_price_gbm_dl_grid_ensemble = h2o.stackedEnsemble(model_id="house_price_gbm_dl_grid_ensemble_33",
                                       base_models=all_ids,
                                       x=features, y=response, training_frame=train)

###: Let's evaluate the stacked ensemble model performance based on test data
perf_gbm_dl_stack_test = h2o.performance(house_price_gbm_dl_grid_ensemble, newdata = test)

###: Now we can compare base learner performance with stacked ensemble model using test data
baselearner_gbm_dl_all_r2 <- sapply(all_ids, .getr2)
baselearner_gbm_dl_best_r2_test <- max(baselearner_gbm_dl_all_r2)

stacked_ensemble_r2_test = h2o.r2(perf_gbm_dl_stack_test)
print(sprintf("Best Base-learner model R2:  %s", baselearner_gbm_dl_best_r2_test))
print(sprintf("Ensemble Model R2:  %s", stacked_ensemble_r2_test))
