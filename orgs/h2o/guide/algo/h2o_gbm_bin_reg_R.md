# H2O GBM (Gradient Boosting Machine) - Classification Model in R #

If the response column is numeric or string and set as enum or categorical, then GBM will build a classification model. For the 2 classes in response, it will be "Binomial Classification" and classes more then 2 will be "Multinomial Classification". If the response column is real or integer number the GBM will build "Linear Regression" model.

To build Classification Model with GBM, make sure your response column is set to enum or categorical.

## Datasets ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample File ##
  - [H2O_GBM_Prostate_Classification.R](https://github.com/Avkash/mldl/blob/master/code/R/H2O_GBM_Prostate_Classification.R)

## Sample Code in R ##

#: Loading H2O Library
```
library(h2o)
```
#: Initalizing H2O cluster
```
h2o.init()
```

#: Importing both training and test dataset into H2O cluster memory
```
## Local file
train_df = h2o.importFile("/Users/avkashchauhan/examples/regression/prostate.csv")

## Web URL
train_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")
```
#: Training dataset - columns
```
ncol(train_df)
```
#: Training dataset - rows
```
nrow(train_df)
```
#: Training datasets - summary
```
h2o.summary(train_df)
```
#: Training  Dataframes - columns names
```
h2o.colnames(train_df)
```
#: Training dataframes - columns by their type i.e. numeric, string, categorical(enum)
```
h2o.columns_by_type(train_df)
```
#: Training  dataframes - columns type as strings
```
h2o.columns_by_type(train_df, "string")
```
#: Training dataframes - columns type as numberic
```
h2o.columns_by_type(train_df, "numeric")
```
#: Training  dataframes - columns type as categorical or enum
```
h2o.columns_by_type(train_df, "categorical")
```
#: Making sure response column has either 0/1 binomial values or 2-class categoricals for H2O GLM logistic regression
```
train_df$CAPSULE = h2o.asfactor(train_df$CAPSULE)
h2o.levels(train_df$CAPSULE)
```

#: Settings response or target variable for supervised machine learning
```
response = "CAPSULE"
```
#: Creating a list of all features we will use for machine learning
```
features = h2o.colnames(train_df)
features
features = setdiff(features, response)
features
```
#: Understanding response variable values as historgram in Training data
```
h2o.hist(train_df$medv)
```
#: Understanding object types
```
class(train_df)
class(train_df['medv'])
class(train_df$medv)
```
#: Building Gradient Boosting Machine (GBM) Regression Model only with training dataframe
```
gbm_model_with_training_only =  h2o.gbm(x = features, y = response, training_frame = train_df)
gbm_model_with_training_only

```
#: Building Gradient Boosting Machine (GBM) Regression Model  with cross validation
```
gbm_model_with_training_and_cv = h2o.gbm(x = features, y = response, training_frame = train_df, nfolds = 5)
gbm_model_with_training_and_cv
```
#: Building Gradient Boosting Machine (GBM) Regression Model  with training, validation and test data and for that reason we need to split training dataset 
```
prostate_data_splits = h2o.splitFrame(train_df, ratios = c(0.8,0.1), destination_frames = c("df_prostate_train", "df_prostate_valid", "df_prostate_test"))
```
#: understanding the total splits lists 
```
length(prostate_data_splits)
```
#: Displaying split object
```
prostate_data_splits[1]
```
#: Displaying split object
```
prostate_data_splits[[1]]
```
#: Understanding types of split object
```
class(prostate_data_splits[1])
class(prostate_data_splits[[1]])
```
#: setting split object to proper dataframes for further usages
```
df_prostate_train = prostate_data_splits[[1]]
df_prostate_valid = prostate_data_splits[[2]]
df_prostate_test = prostate_data_splits[[3]]
```
#: understanding the row count into original andsplit object
```
nrow(train_df)
nrow(df_prostate_train)
nrow(df_prostate_test)
```
#: Building Gradient Boosting Machine (GBM) Regression Model  with training and validation data now
```
gbm_model_with_training_and_validtion = h2o.gbm(x = features, y = response, training_frame = df_prostate_train, validation_frame = df_prostate_valid,model_id = "gbm_model_with_training_and_validtion_R")
gbm_model_with_training_and_validtion
```
#: Building Gradient Boosting Machine (GBM) Regression Model with cross validation and other GBM configuration
```
gbm_model_with_training_cv_config = h2o.gbm(x = features, y = response, training_frame = train_df, nfolds = 5,
                                            distribution="AUTO",
                                            ntrees=10,
                                            max_depth=3,
                                            min_rows=2,
                                            learn_rate=0.2,
                                            keep_cross_validation_predictions=TRUE,
                                            seed=1)
gbm_model_with_training_cv_config
```
#: Here we can select the best model based on accuracy among all of above models we have created
#: AUC and R^2 Error
```
h2o.auc(gbm_model_with_training_only,train = TRUE)
h2o.auc(gbm_model_with_training_and_cv, xval = TRUE)
h2o.auc(gbm_model_with_training_and_validtion,valid = TRUE)
h2o.r2(gbm_model_with_training_cv_config,train = TRUE) ## We will not use it 
h2o.r2(gbm_model_with_training_cv_config, xval = TRUE)
h2o.r2(gbm_model_with_training_cv_config,valid = TRUE)
```
#: MSE (Mean Square) Error
```
h2o.mse(gbm_model_with_training_and_cv, xval = TRUE)
h2o.mse(gbm_model_with_training_and_validtion,valid = TRUE)
```

#: RMSE (Root Mean Square) Error
```
h2o.rmse(gbm_model_with_training_and_cv, xval = TRUE)
h2o.rmse(gbm_model_with_training_and_validtion,valid = TRUE)
```
#: Performing predictions with one of the above model 
```
gbm_predictions = h2o.predict(gbm_model_with_training_and_validtion,newdata =  df_prostate_test)
gbm_predictions
```
#: Understanding/Validating predictions based on prediction results historgram 
```
h2o.hist(gbm_predictions)
```
#: Looking again at the test dataframe target columns values historgram 
```
h2o.hist(df_prostate_test$medv)
```
#: Understanding model performance based on various types of dataframe used while building models
```
h2o.performance(gbm_model_with_training_and_validtion)
h2o.performance(gbm_model_with_training_only,train = TRUE)
h2o.performance(gbm_model_with_training_and_validtion,train = TRUE)
h2o.performance(gbm_model_with_training_and_validtion,valid = TRUE)
h2o.performance(gbm_model_with_training_and_cv,xval = TRUE)
```
#: Understanding various model metrics from models 
```
h2o.r2(gbm_model_with_training_and_validtion)
h2o.mse(gbm_model_with_training_and_cv)
h2o.auc(gbm_model_with_training_and_validtion)
```
#: Getting cross validation prediction details from the model with cross-validation
#: (If cross validation prediction save is not set to TRUE, you will get error message)
```
h2o.cross_validation_predictions(object = gbm_model_with_training_and_cv)
h2o.cross_validation_models(gbm_model_with_training_and_cv)
```
#: Getting variable importance from a GBM model
```
h2o.varimp(gbm_model_with_training_and_cv)
h2o.varimp_plot(gbm_model_with_training_and_cv)
```
#: Scoring History
```
h2o.scoreHistory(gbm_model_with_training_cv_config)
```
#: Gains and List Table
```
h2o.gainsLift(gbm_model_with_training_cv_config)
```
#: Building a GBM model with cross validation and saving cross validation predictions
```
gbm_model_with_training_and_cv = h2o.gbm(x = features, y = response, training_frame = train_df, nfolds = 5, keep_cross_validation_predictions = TRUE)
```
#: Getting cross validation prediction details from the model with cross-validation
```
h2o.cross_validation_predictions(gbm_model_with_training_and_cv)
all_cv_predictions = h2o.cross_validation_predictions(gbm_model_with_training_and_cv)
```
#: Looking at cross validation predictions for all CV models
```
length(all_cv_predictions)
all_cv_predictions[[1]]
all_cv_predictions[[2]]
```
#: Getting model ID from an H2O Model
```
gbm_model_with_training_and_cv['model_id']
```
