# H2O GLM (Generialized Linear Regression) - Logistic Regression in R # 

H2O GLM successfully perform logistic regression when the response feature has either 0/1 binary values or only 2-class categorical values. You just need to set GLM Family to "Binomial" to build the logistic regression model. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample R Notebook ##
  - [H2O_GLM_Logistic_Prostate.R](https://github.com/Avkash/mldl/blob/master/code/R/H2O-GLM-Logistic-Prostate.R)
  
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
#: Building linear regression model (GLM) only with training dataframe
```
glm_model_with_training_only =  h2o.glm(x = features, y = response, training_frame = train_df, family = "binomial")
glm_model_with_training_only
```
#: Building linear regression model (GLM)  with cross validation
```
glm_model_with_training_and_cv = h2o.glm(x = features, y = response, training_frame = train_df, nfolds = 5, family = "binomial")
glm_model_with_training_and_cv
```
##: Here we can select the best model based on accuracy among all of above models we have created
##:  AUC
```
h2o.auc(glm_model_with_training_only)
h2o.auc(glm_model_with_training_only,train = TRUE) ## We will not use it 
h2o.auc(glm_model_with_training_and_cv, xval = TRUE)
```

Note: Please visit [H2O GLM Linear Regression Sample](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_r.md) for very details code example as well. 
