# H2O GLM (Generialized Linear Regression) - Linear Regression in Python #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample Python Notebook ##
  - [H2O_GLM_house_price notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GLM-TX-House-Price-all-regression.ipynb)
  

## Sample Code in Python ##

#: Loading H2O Library
```
import h2o
```
#: Get H2O Version 
```
h2o.__version__
```
#: Initalizing H2O cluster
```
h2o.init()
```

#: Importing both training and test dataset into H2O cluster memory
```
## Local file
train_df = h2o.import_file("/Users/avkashchauhan/examples/regression/house_price_train.csv")
test_df = h2o.import_file("/Users/avkashchauhan/examples/regression/house_price_test.csv")

## Web URL
train_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```
#: Understanding Training dataset
```
train_df.describe()
```
#: Understanding Test dataset
```
test_df.describe()
```

#: Training and test dataset - columns and rows details
```
print(train_df.shape)
print(test_df.shape)
```
#: Training and Test Dataframes - columns names
```
print(train_df.col_names)
print(test_df.col_names)
## OR
print(train_df.columns)
print(test_df.columns)
```
#: Training and Test dataframes - columns by their type i.e. numeric, string, categorical(enum)
```
print(train_df.columns_by_type())
print(test_df.columns_by_type())
```
#: Training and Test dataframes - columns type as strings
```
print(train_df.columns_by_type("string"))
print(test_df.columns_by_type("string"))
```
#: Training and Test dataframes - columns type as numberic
```
print(train_df.columns_by_type("numeric"))
print(test_df.columns_by_type("numeric"))
```
#: Training and Test dataframes - columns type as categorical or enum
```
print(train_df.columns_by_type("categorical"))
print(test_df.columns_by_type("categorical"))
```
#: Settings response or target variable for supervised machine learning
```
response = "medv"
```
#: Creating a list of all features we will use for machine learning
```
response = "medv"
features = train_df.col_names
print(features)
features.remove(response)
print(features)
```
#: Understanding response variable values as historgram in Training data
```
train_df['medv'].hist()
```
#: Understanding response variable values as historgram in Test data
```
test_df['medv'].hist()
```
#: Understanding object types
```
type(train_df)
type(train_df['medv'])
```
#: Importing H2O H2OGeneralizedLinearEstimator to build GLM Model
```
from h2o.estimators.glm import H2OGeneralizedLinearEstimator
```
#: Building linear regression model (GLM) only with training dataframe
```
glm_model_with_training_only = H2OGeneralizedLinearEstimator()
glm_model_with_training_only.train(x= features, y = response, training_frame= train_df)
glm_model_with_training_only
```
#: Building linear regression model (GLM)  with cross validation
```
glm_model_with_training_and_cv = H2OGeneralizedLinearEstimator(nfolds=5)
glm_model_with_training_and_cv.train(x = features, y = response, training_frame=train_df)
glm_model_with_training_and_cv
```
#: Building linear regression model (GLM)  with training and validation data and for that reason we need to split training dataset 
```
df_house_train, df_house_valid = train_df.split_frame(ratios=[0.9])
```
#: Displaying split object
```
df_house_train
```
#: Displaying split object
```
df_house_valid
```
#: Understanding types of split object
```
type(df_house_train)
type(df_house_valid)
```
#: understanding the row count into original andsplit object
```
print(train_df.shape)
print(df_house_train.shape)
print(df_house_valid.shape)
```
#: Building linear regression model (GLM)  with training and validation data now
```
glm_model_with_training_and_validtion = H2OGeneralizedLinearEstimator()
glm_model_with_training_and_validtion.train(x = features, y = response, 
                                            training_frame=df_house_train, 
                                            validation_frame=df_house_valid,
                                           model_id = "glm_model_with_training_and_validtion_python")
glm_model_with_training_and_validtion                                           
```
#: Performing predictions with one of the above model 
```
glm_predictions = glm_model_with_training_and_validtion.predict(test_df)
print(glm_predictions)
print(type(glm_predictions))
```
#: Understanding/Validating predictions based on prediction results historgram 
```
glm_predictions.hist()
```
#: Looking again at the test dataframe target columns values historgram 
```
test_df['medv'].hist()
```

#: Here we can select the best model based on accuracy among all of above models we have created
#: R^2 Error
```
glm_model_with_training_and_cv.model_performance(train=True) ## We will not use it 
glm_model_with_training_and_cv.model_performance(train=True).r2()
```
#: MSE (Mean Square) Error
```
print(glm_model_with_training_and_cv.model_performance(train=True).mse())
print(glm_model_with_training_and_cv.model_performance(xval=True).mse())
```

#: RMSE (Root Mean Square) Error
```
print(glm_model_with_training_and_cv.model_performance(train=True).rmse())
print(glm_model_with_training_and_cv.model_performance(xval=True).rmse())
```
#: Understanding model performance based on various types of dataframe used while building models
```
print(glm_model_with_training_and_validtion.model_performance(train=True))
print(glm_model_with_training_and_validtion.model_performance(valid=True))
print(glm_model_with_training_and_validtion.model_performance(train=True).r2())
print(glm_model_with_training_and_validtion.model_performance(valid=True).r2())
```
#: Understanding various model metrics from models 
```
print(glm_model_with_training_and_validtion.model_performance(valid=True).r2)
print(glm_model_with_training_and_validtion.model_performance(valid=True).mse)
print(glm_model_with_training_and_validtion.model_performance(valid=True).auc) ## Linear model dont have AUC metrics
```
#: Because we have built the GLM mode, getting coefficients from the model
```
glm_model_with_training_and_cv.coef()
```
#: Getting cross validation prediction details from the model with cross-validation
#: (If cross validation prediction save is not set to TRUE, you will get error message)
```
# Normalized Coefiecients ? multinomial? Shoule be used for logistics regression? 
glm_model_with_training_and_cv.coef_norm()
glm_model_with_training_and_cv.cross_validation_metrics_summary()
```
#: Getting variable importance from a GLM mode (It will plot the coefficient table)
```
glm_model_with_training_and_validtion.varimp()
glm_model_with_training_and_cv.varimp()
```
#: Building a GLM model with cross validation and saving cross validation predictions
```
glm_model_with_training_and_cv = H2OGeneralizedLinearEstimator(keep_cross_validation_predictions = True, nfolds=5)
glm_model_with_training_and_cv.train(x = features, y = response, training_frame= train_df)
```
#: Getting cross validation prediction details from the model with cross-validation
```
glm_model_with_training_and_cv.cross_validation_predictions()
```
#: Looking at cross validation predictions for all CV models
```
len(glm_model_with_training_and_cv.cross_validation_predictions())
glm_model_with_training_and_cv.cross_validation_predictions()[0]
glm_model_with_training_and_cv.cross_validation_predictions()[1]
## You can use index 0 to n depending on the length of CV results array
```
#: Getting model ID from an H2O Model
```
glm_model_with_training_and_validtion.model_id
```
#: List of H2O objects (all in memory)
```
h2o.ls()
```
#: Getting the ID of an H2O Object
```
glm_model_with_training_and_cv.model_id
```
#: Finding the type of an H2O Object
```
type(glm_model_with_training_and_cv)
```
#: Getting the model object in Python,by passing the H2O model ID
```
## For example the id of a model trained into FLOW is - glm_model_with_training_and_validtion_in_flow
glm_model_from_R_or_FLOW = h2o.get_model("glm_model_with_training_and_validtion_in_flow")
glm_model_from_R_or_FLOW
```
#: Getting model metrics from a local python object as H2O Model
```
glm_model_from_R_or_FLOW.model_performance().r2()
```
#: Accessing H2O Model details from JSON 
```
# Full H2O Model JSON data 
glm_model_with_training_and_validtion._model_json
#  Coefficients Table from model JSON
glm_model_with_training_and_validtion._model_json['output']['coefficients_table']
# All the feature names from the model JSON
glm_model_with_training_and_validtion._model_json['output']['names']
# If mode has CV then look for cross validation predictions (This model does not have)
glm_model_with_training_and_validtion._model_json['output']['cross_validation_predictions']
# If mode has CV then look for cross validation predictions (This model has CV)
glm_model_with_training_and_cv._model_json['output']['cross_validation_predictions']
# Model training metrics from JSON
glm_model_with_training_and_cv._model_json['output']['training_metrics']
# Specific MSE metric from the MODEL JSON
glm_model_with_training_and_cv._model_json['output']['training_metrics']['MSE']
# Specific R2 or r^2 metric from the MODEL JSON
glm_model_with_training_and_cv._model_json['output']['training_metrics']['R^2']
```


That's it!!
