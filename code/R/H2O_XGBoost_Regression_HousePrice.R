###: Importing H2O Library
library(h2o)

###: Initializing h2O
h2o.init()

### : Getting H2O Cluster status
h2o.clusterStatus()

###: Importing Dataset
df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")

###: Understanding Dataset
h2o.describe(df)

###: Getting a list of columns in our dataset
h2o.colnames(df)

###: Setting Response column
response = "medv"

###: Creating Histogram of response column to understand its distribution
h2o.hist(h2o.asnumeric(df[response]))

###: spliting the dataset into train, test and validation  
df_split = h2o.splitFrame(df, ratios=c(0.9))
train = df_split[[1]]
valid = df_split[[2]]
print(nrow(train))
print(nrow(valid))
print(nrow(test))

###: Setting all columns/features into a local variable
features = h2o.colnames(df)

###: Settings all features for model building
features = setdiff(features, response)
print(features)

###: Using H2O XGBoost Library by setting XGBooost Parameters and Training H2O XGBoost model 
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

###: understanding the model metrics and various detials
house_price_xgb

###: understanding the model performance and various detials
h2o.performance(house_price_xgb, valid = TRUE)
h2o.r2(house_price_xgb,valid = TRUE)

###: Generating Variable Importance Plot for the XGBoost Model
h2o.varimp_plot(house_price_xgb)

###:  H2O XGBoost Scoring History
h2o.scoreHistory(house_price_xgb)

### PERFORMING PREDICTIONS USING a TEST DATA SET with XGBoost model
h2o.predict(house_price_xgb, newdata = test)

###: Getting AUC metrics from the test data using XGBoost Leader Model
h2o.performance(house_price_xgb,newdata = test)
h2o.r2(house_price_xgb)

