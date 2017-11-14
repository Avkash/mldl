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
train_df = h2o.importFile("/Users/avkashchauhan/examples/regression/prostate.csv")

## Web URL
train_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")

#:---------------------------------------
#: Making sure response column has either 0/1 binomial values or 2-class categoricals for H2O GLM logistic regression
#:---------------------------------------
train_df$CAPSULE = h2o.asfactor(train_df$CAPSULE)
h2o.levels(train_df$CAPSULE)

#:---------------------------------------
#: Settings response or target variable for supervised machine learning
#:---------------------------------------
response = "CAPSULE"

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
prostate_data_splits = h2o.splitFrame(train_df, ratios = c(0.8,0.1), destination_frames = c("df_prostate_train", "df_prostate_valid", "df_prostate_test"))
df_prostate_train = prostate_data_splits[[1]]
df_prostate_valid = prostate_data_splits[[2]]
df_prostate_test = prostate_data_splits[[3]]

#:---------------------------------------
#: Building Gradient Boosting Machine (GBM) Regression Model   with training and validation data now
#:---------------------------------------
gbm_model_with_training_and_validtion = h2o.gbm(x = features, y = response, training_frame = df_prostate_train, validation_frame = df_prostate_valid, 
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
h2o.auc(gbm_model_with_training_only,train = TRUE)
h2o.auc(gbm_model_with_training_and_cv, xval = TRUE)
h2o.auc(gbm_model_with_training_and_validtion,valid = TRUE)
h2o.r2(gbm_model_with_training_only,train = TRUE)
h2o.r2(gbm_model_with_training_and_cv, xval = TRUE)
h2o.r2(gbm_model_with_training_and_validtion,valid = TRUE)

#:---------------------------------------
#: Using cross validation and GBM config model for prediction
#:---------------------------------------
gbm_predictions_a = h2o.predict(gbm_model_with_training_cv_config,newdata =  df_prostate_test)
gbm_predictions_a

#:---------------------------------------
#: Understanding prediction
#:---------------------------------------
h2o.hist(gbm_predictions_a)

#:---------------------------------------
#: Using training and validation  model for prediction
#:---------------------------------------
gbm_predictions_b = h2o.predict(gbm_model_with_training_and_validtion,newdata =  df_prostate_test)
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
h2o.scoreHistory(gbm_model_with_training_cv_config)

#:---------------------------------------
#: Gains and List Table
#:---------------------------------------
h2o.gainsLift(gbm_model_with_training_cv_config)

#:---------------------------------------
#: Specific model metrics 
#:---------------------------------------
h2o.auc(gbm_model_with_training_and_validtion)
