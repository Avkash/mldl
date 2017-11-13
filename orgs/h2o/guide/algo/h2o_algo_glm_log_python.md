# H2O GLM (Generialized Linear Regression) - Logistic Regression in Python # 

H2O GLM successfully perform logistic regression when the response feature has either 0/1 binary values or only 2-class categorical values. You just need to set GLM Family to "Binomial" to build the logistic regression model. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample Python Notebook ##
  - [H2O_GLM_Prostate notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GLM-Prosate-Logistic-Regression.ipynb)
  
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
train_df = h2o.import_file("/Users/avkashchauhan/examples/regression/prostate.csv")

## Web URL
train_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")
```
#: Understanding Training dataset
```
train_df.describe()
```
#: Training and Test Dataframes - columns names
```
print(train_df.col_names)
## OR
print(train_df.columns)
```
#: Defining response variable
```
response = "CAPSULE"
```
#: Understading Response feature for logistic regression with H2O GLM
```
train_df[response].levels() # You will not get all unique values without converting the feature as factor or enum
train_df[response].asfactor().levels()
```

#: Creating a list of all features we will use for machine learning
```
features = train_df.col_names
print(features)
features.remove(response)
print(features)
```

#: Importing H2O H2OGeneralizedLinearEstimator to build GLM Model
```
from h2o.estimators.glm import H2OGeneralizedLinearEstimator
```
#: Building linear regression model (GLM) only with training dataframe
```
glm_model_with_training_only = H2OGeneralizedLinearEstimator(family = "Binomial")
glm_model_with_training_only.train(x= features, y = response, training_frame= train_df)
glm_model_with_training_only
```
#: Building linear regression model (GLM)  with cross validation
```
glm_model_with_training_and_cv = H2OGeneralizedLinearEstimator(nfolds=5, family = "Binomial")
glm_model_with_training_and_cv.train(x = features, y = response, training_frame=train_df)
glm_model_with_training_and_cv
```

#: RMSE (Root Mean Square) Error
```
print(glm_model_with_training_and_cv.model_performance(train=True).auc())
print(glm_model_with_training_and_cv.model_performance(xval=True).auc())
```
#: Understanding model performance based on various types of dataframe used while building models
```
print(glm_model_with_training_and_cv.model_performance(train=True))
print(glm_model_with_training_and_cv.model_performance(valid=True))
print(glm_model_with_training_and_cv.model_performance(train=True).auc())
print(glm_model_with_training_and_cv.model_performance(valid=True).auc())
```
#: Getting variable importance from a GLM mode (It will plot the coefficient table)
```
glm_model_with_training_only.varimp()
glm_model_with_training_and_cv.varimp()
```
#: Building a GLM model with cross validation and saving cross validation predictions
```
glm_model_with_training_and_cv = H2OGeneralizedLinearEstimator(keep_cross_validation_predictions = True, nfolds=5, family = "Binomial")
glm_model_with_training_and_cv.train(x = features, y = response, training_frame= train_df)
```
#: Getting cross validation prediction details from the model with cross-validation
```
glm_model_with_training_and_cv.cross_validation_predictions()
```
