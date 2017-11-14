# H2O GBM (Gradient Boosting Machine) - Linear Regression in R #

If the response column is numeric or string and set as enum or categorical, then GBM will build a classification model. For the 2 classes in response, it will be "Binomial Classification" and classes more then 2 will be "Multinomial Classification". If the response column is real or integer number the GBM will build "Linear Regression" model.

To build Linear Regression model with GBM, make sure your response column is either interger or real number.

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample File ##
  - [H2O_GBM_house_prise_Reg.R](https://github.com/Avkash/mldl/blob/master/code/R/H2O_GBM_House_Price_Reg.R)
  
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
train_df = h2o.importFile("/Users/avkashchauhan/examples/regression/house_price_train.csv")
test_df = h2o.importFile("/Users/avkashchauhan/examples/regression/house_price_test.csv")

## Web URL
train_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```
#: Training and test dataset - columns
```
ncol(train_df)
ncol(test_df)
```
#: Training and Test dataset - rows
```
nrow(train_df)
nrow(test_df)
```
#: Training and Test datasets - summary
```
h2o.summary(train_df)
h2o.summary(test_df)
```
#: Training and Test Dataframes - columns names
```
h2o.colnames(train_df)
h2o.colnames(test_df)
```
#: Training and Test dataframes - columns by their type i.e. numeric, string, categorical(enum)
```
h2o.columns_by_type(train_df)
h2o.columns_by_type(test_df)
```
#: Training and Test dataframes - columns type as strings
```
h2o.columns_by_type(train_df, "string")
h2o.columns_by_type(test_df, "string")
```
#: Training and Test dataframes - columns type as numberic
```
h2o.columns_by_type(train_df, "numeric")
h2o.columns_by_type(test_df, "numeric")
```
#: Training and Test dataframes - columns type as categorical or enum
```
h2o.columns_by_type(train_df, "categorical")
h2o.columns_by_type(test_df, "categorical")
```
#: Settings response or target variable for supervised machine learning
```
response = "medv"
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
#: Understanding response variable values as historgram in Test data
```
h2o.hist(test_df$medv)
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
#: Building Gradient Boosting Machine (GBM) Regression Model  with training and validation data and for that reason we need to split training dataset 
```
house_data_splits = h2o.splitFrame(train_df, ratios = c(0.9), destination_frames = c("df_house_train", "df_house_valid"))
```
#: understanding the total splits lists 
```
length(house_data_splits)
```
#: Displaying split object
```
house_data_splits[1]
```
#: Displaying split object
```
house_data_splits[[1]]
```
#: Understanding types of split object
```
class(house_data_splits[1])
class(house_data_splits[[1]])
```
#: setting split object to proper dataframes for further usages
```
df_house_train = house_data_splits[[1]]
df_house_valid = house_data_splits[[2]]
```
#: understanding the row count into original andsplit object
```
nrow(train_df)
nrow(df_house_train)
nrow(df_house_valid)
```
#: Building Gradient Boosting Machine (GBM) Regression Model  with training and validation data now
```
gbm_model_with_training_and_validtion = h2o.gbm(x = features, y = response, training_frame = df_house_train, validation_frame = df_house_valid,model_id = "gbm_model_with_training_and_validtion_R")
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
#: R^2 Error
```
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
gbm_predictions = h2o.predict(gbm_model_with_training_and_validtion,newdata =  test_df)
gbm_predictions
```
#: Understanding/Validating predictions based on prediction results historgram 
```
h2o.hist(gbm_predictions)
```
#: Looking again at the test dataframe target columns values historgram 
```
h2o.hist(test_df$medv)
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

