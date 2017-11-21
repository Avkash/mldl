###: Importing H2O Library
library(h2o)


###: Initializing h2O
h2o.init()

###: Getting H2O Cluster status
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


###: spliting the dataset into train and validation  
df_split = h2o.splitFrame(df, ratios = c(0.9))
train = df_split[[1]]
valid = df_split[[2]]
print(nrow(train))
print(nrow(valid))


###: Setting all columns/features into a local variable
features = h2o.colnames(df)


###: Settings all features for model building
features = setdiff(features, response)
print(features)

###: Setting & Training H2O AutoML model configuration
house_price_automl = h2o.automl(max_models= 100,
                           seed=1234,
                           max_runtime_secs=60, 
                           project_name= "House Price AutoML",
                           x = features, y = response,training_frame=train,validation_frame=valid)


###: Getting the list of models created by AutoML in given time
house_price_automl@leaderboard

###: Getting the best model or Leader model from the AutoML leader board
house_price_leader = house_price_automl@leader

###: Understanding best Model (Leader Model) overall performance based on training data
h2o.performance(house_price_leader, valid = TRUE)
h2o.r2(house_price_leader, valid = TRUE)

###: Generating Variable Importance Plot for the Leader Model
h2o.varimp_plot(house_price_leader)

###:  H2O AutoMLmodel varialbe Scoring History
h2o.scoreHistory(house_price_leader)

### PERFORMING PREDICTIONS USING a TEST DATA SET with Auto ML Leader model
h2o.predict(house_price_leader, test)

###: Getting AUC metrics from the test data using AutoML Leader Model
h2o.performance(house_price_leader, newdata = test)
h2o.r2(house_price_leader)
