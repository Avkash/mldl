# Regression with H2O XGBoost in R #

XGBoost is an optimized distributed gradient boosting library designed to be highly efficient, flexible, and portable. XGBoost provides parallel tree boosting (also known as GBDT, GBM) that solves many data science problems in a fast and accurate way.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the R Source Code ##
  - [H2O XGBoost Regression with House Price Dataset in R ](https://github.com/Avkash/mldl/blob/master/code/R/H2O_XGBoost_Regression_HousePrice.R)
  
## Regression with H2O XGBoost in R ##

###: Importing H2O Library
```python
library(h2o)
```

###: Initializing h2O
```python
h2o.init()
```

### : Getting H2O Cluster status
```python
h2o.clusterStatus()
```

###: Importing Dataset
```python
df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```

###: Understanding Dataset
```python
h2o.describe(df)
```

###: Getting a list of columns in our dataset
```python
h2o.colnames(df)
```

###: Setting Response column
```python
response = "medv"
```

###: Creating Histogram of response column to understand its distribution
```python
h2o.hist(h2o.asnumeric(df[response]))
```

###: spliting the dataset into train, test and validation  
```python
df_split = h2o.splitFrame(df, ratios=c(0.9))
train = df_split[[1]]
valid = df_split[[2]]
print(nrow(train))
print(nrow(valid))
print(nrow(test))
```

###: Setting all columns/features into a local variable
```python
features = h2o.colnames(df)
```

###: Settings all features for model building
```python
features = setdiff(features, response)
print(features)
```

###: Using H2O XGBoost Library by setting XGBooost Parameters and Training H2O XGBoost model 
```python
house_price_xgb = h2o.xgboost(ntrees = 100
                      , max_depth = 10
                      , learn_rate = 0.01
                      , sample_rate = 0.9
                      , col_sample_rate_per_tree = 0.9
                      , min_rows = 5
                      , seed = 4241
                      , score_tree_interval= 100,
                      x = features, 
                      y = response, 
                      training_frame = train, 
                      validation_frame = valid)
```

###: understanding the model metrics and various detials
```python
house_price_xgb
```


###: understanding the model performance
```python
h2o.performance(house_price_xgb, valid = TRUE)
h2o.r2(house_price_xgb,valid = TRUE)
```

###: Generating Variable Importance Plot for the XGBoost Model
```python
h2o.varimp_plot(house_price_xgb)
```

###:  H2O XGBoost Scoring History
```python
h2o.scoreHistory(house_price_xgb)
```

###: PERFORMING PREDICTIONS USING a TEST DATA SET with Auto ML Leader model
```python
h2o.predict(house_price_xgb, newdata = test)
```

###: Getting AUC metrics from the test data using XGBoost Leader Model
```python
h2o.performance(house_price_xgb,newdata = test)
h2o.r2(house_price_xgb)
```

