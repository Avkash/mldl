###: Importing H2O Library
library(h2o)

###: Initializing h2O
h2o.init()

### : Getting H2O Cluster status
h2o.clusterStatus()

###: Importing Dataset
df = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")

###: Understanding Dataset
h2o.describe(df)

###: Getting a list of columns in our dataset
h2o.colnames(df)

###: Setting Response column
response = "CAPSULE"

###: Setting Response column to factor so we can get unique values in it
h2o.levels(h2o.asfactor(df[response]))

###: Setting Response column to factor so we can build classification model
df[response] = h2o.asfactor(df[response])

###: Verifying Response column as factor 
h2o.describe(df[response])

###: spliting the dataset into train, test and validation  
df_split = h2o.splitFrame(df, ratios = c(0.8,0.1))
train = df_split[[1]]
valid = df_split[[2]]
test = df_split[[3]]
print(nrow(train))
print(nrow(valid))
print(nrow(test))

###: Setting all columns/features into a local variable
features =h2o.colnames(df)

###: Settings all features for model building
features = setdiff(features, response)
print(features)

###: Ignoring list of features which are not required for model building
ignore_list = c('ID')
features = setdiff(features, ignore_list)
print(features)

###: Using H2O XGBoost Library and setting proper Parameters and Training H2O XGBoost model 
prostate_xgb = h2o.xgboost(ntrees = 100
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
prostate_xgb

###: understanding the model performance & metrics
h2o.performance(prostate_xgb, valid = TRUE)
h2o.auc(prostate_xgb, valid = TRUE)

###: Generating Variable Importance Plot for the XGBoost Model
h2o.varimp_plot(prostate_xgb)

###:  H2O XGBoost Scoring History
h2o.scoreHistory(prostate_xgb)

### PERFORMING PREDICTIONS USING a TEST DATA SET with XGBoost model
h2o.predict(prostate_xgb, newdata =  test)

###: Getting AUC metrics from the test data using XGBoost Model
h2o.performance(prostate_xgb, newdata = test)
h2o.auc(prostate_xgb)

###: Downloading XGBoost MOJO Model to local disk
prostate_xgb.download_mojo("/Users/avkashchauhan/Downloads/prostate_xgb.zip", get_genmodel_jar=True)
