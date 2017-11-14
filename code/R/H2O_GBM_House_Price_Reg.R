#:---------------------------------------
#: Loading H2O Library
#:---------------------------------------
library(h2o)

#:---------------------------------------
#: Initalizing H2O cluster
#:---------------------------------------
h2o.init()

#:---------------------------------------
#: Importing both training and test dataset into H2O cluster memory
#:---------------------------------------
## Local file
train_df = h2o.importFile("/Users/avkashchauhan/src/github.com/h2o_training_2017_10/examples/regression/house_price_train.csv")
test_df = h2o.importFile("/Users/avkashchauhan/src/github.com/h2o_training_2017_10/examples/regression/house_price_test.csv")

## Web URL
train_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")

#:---------------------------------------
#: Settings response or target variable for supervised machine learning
#:---------------------------------------
response = "medv"

#:---------------------------------------
#: Creating a list of all features we will use for machine learning
#:---------------------------------------
features = h2o.colnames(train_df)
features = setdiff(features, response)
features


#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model only with training dataframe
#:---------------------------------------
gbm_model_with_training_only =  h2o.gbm(x = features, y = response, training_frame = train_df)
gbm_model_with_training_only


#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model  with cross validation
#:---------------------------------------
gbm_model_with_training_and_cv = h2o.gbm(x = features, y = response, training_frame = train_df, nfolds = 5)
gbm_model_with_training_and_cv


#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model  with training and validation data and for that reason we need to split training dataset 
#:---------------------------------------
house_data_splits = h2o.splitFrame(train_df, ratios = c(0.9), destination_frames = c("df_house_train", "df_house_valid"))
df_house_train = house_data_splits[[1]]
df_house_valid = house_data_splits[[2]]

#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model   with training and validation data now
#:---------------------------------------
gbm_model_with_training_and_validtion = h2o.gbm(x = features, y = response, training_frame = df_house_train, validation_frame = df_house_valid, 
                                                model_id = "gbm_model_with_training_and_validtion_R")
gbm_model_with_training_and_validtion


#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model with cross validation and other GBM configuration
#:---------------------------------------
gbm_model_with_training_cv_config = h2o.gbm(x = features, y = response, training_frame = train_df, nfolds = 5,
                                            distribution="AUTO",
                                            ntrees=10,
                                            max_depth=3,
                                            min_rows=2,
                                            learn_rate=0.2,
                                            keep_cross_validation_predictions=TRUE,
                                            seed=1)
gbm_model_with_training_cv_config

#:---------------------------------------
#: Understanding various model metrics from GBM Regression models 
#:---------------------------------------
h2o.r2(gbm_model_with_training_only,train = TRUE)
h2o.r2(gbm_model_with_training_and_cv, xval = TRUE)
h2o.r2(gbm_model_with_training_and_validtion,valid = TRUE)

#:---------------------------------------
#: Using cross validation and GBM config model for prediction
#:---------------------------------------
gbm_predictions_a = h2o.predict(gbm_model_with_training_cv_config,newdata =  test_df)
gbm_predictions_a

#:---------------------------------------
#: Understanding prediction
#:---------------------------------------
h2o.hist(gbm_predictions_a)

#:---------------------------------------
#: Using training and validation  model for prediction
#:---------------------------------------
gbm_predictions_b = h2o.predict(gbm_model_with_training_and_validtion,newdata =  test_df)
gbm_predictions_b

#:---------------------------------------
#: Understanding prediction
#:---------------------------------------
h2o.hist(gbm_predictions_b)

#:---------------------------------------
#: Variable Importance
#:---------------------------------------
h2o.varimp(gbm_model_with_training_and_validtion)


#:---------------------------------------
#: Variable Importance PLOT
#:---------------------------------------
h2o.varimp_plot(gbm_model_with_training_and_validtion)

#:---------------------------------------
#: Scoring History
#:---------------------------------------
h2o.scoreHistory(gbm_model_with_training_and_validtion)


#:---------------------------------------
#: Specific model metrics 
#:---------------------------------------
h2o.r2(gbm_model_with_training_and_validtion)
