# H2O Deep Learning - Linear Regression in R # 

H2O Deep Learning successfully perform linear regression when the response column/feature is numeric based on Neural Network mode. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [auto_mpg.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/auto_mpg.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code##
  - [H2O_Deep Learning Regression with Autompg Dataset R Code](https://github.com/Avkash/mldl/blob/master/code/R/H2O_DeepLearning_Regression_AutoMpg.R)
  
  
## Linear Regression Sample Code in R ##

###: Importing H2O Library
```
library(h2o)
```
###: Initializing h2O
```
h2o.init()
```
###: Getting Cluster Status
```
h2o.clusterStatus()
```
###: Importing Dataset
```
df = h2o.importFile(path = "https://raw.githubusercontent.com/Avkash/mldl/master/data/auto_mpg.csv")
df = h2o.importFile("/Users/avkashchauhan/src/github.com/avkash/mldl/data/auto_mpg.csv")
```
###: Understanding Dataset
```
h2o.summary(df)
```
###: Understanding Dataset
```
h2o.describe(df)
```
###: Getting the list of columns
```
h2o.colnames(df)
```
###: Getting the list of columns by their types
```
h2o.columns_by_type(df)
```
###: Setting Response column
```
response = "mpg"
```
###: understand the response column through histogram (apply to numeric column)
```
h2o.hist(df$mpg)
```
###: Getting the list of classes in the response column (Temporary factorizing response column)
```
h2o.levels(h2o.asfactor(df$mpg))
```
###: Settings all features for model building
```
features= h2o.colnames(df)
features = setdiff(features, response)
print(features)
```
###: Ignoring columns from test dataset
###: You can padd a list of column names you want to ignore during feature building
```
features = setdiff(features, c('name_a', 'name_b'))
print(features)
```
###: Training H2O Deep Learning Classification model with default configuration
```
dl_auto_basic = h2o.deeplearning(x = features,
                                    y = response,
                                    training_frame = df)
```
###: Understanding H2O Deep Learning Classification model details
```
dl_auto_basic
```

###: Getting H2O Deep Learning Classification model performance
```
h2o.performance(model = dl_auto_basic)
```

###: Getting H2O Deep Learning Classification model performance - r2
```
h2o.r2(dl_auto_basic)
h2o.rmse(dl_auto_basic)
h2o.mae(dl_auto_basic)
```


###: Training H2O Deep Learning Classification model with cross validation
```
dl_auto_cv = h2o.deeplearning(x = features,
                                 y = response,
                                 nfolds = 5,
                                 training_frame = df)
dl_auto_cv
```

###: Getting H2O Deep Learning Classification model performance on validation data
```
h2o.performance(model = dl_auto_cv, xval = TRUE)
```

###: Getting H2O Deep Learning Classification model performance - auc only for training and validation
```
h2o.r2(dl_auto_cv,xval = TRUE)
h2o.r2(dl_auto_cv,train = TRUE)
```


###: Plotting Variable Importance graph
```
h2o.varimp_plot(dl_auto_cv)
```

###: Generating Variable Importance Table
```
h2o.varimp(dl_auto_cv)
```

###: Generating Scoring History details per tree
```
h2o.scoreHistory(dl_auto_cv)
```

###: Training H2O Deep Learning Classification model with cross validation and tuned parameters for better accuracy
```
dl_auto_tuned = h2o.deeplearning(x = features,
                                    y = response,
                                    nfolds = 5,
                                    training_frame = df,
                                    hidden = c(30),
                                    epochs = 25,
                                    train_samples_per_iteration=20,
                                    score_training_samples=50,
                                    activation="Rectifier",
                                    adaptive_rate = FALSE,
                                    seed = 12345)

dl_auto_tuned
```

###: Getting H2O Deep Learning Classification model performance - auc only for training and validation
```
h2o.r2(dl_auto_tuned,xval = TRUE)
h2o.r2(dl_auto_tuned,train = TRUE)
```

###: Plotting Variable Importance graph
```
h2o.varimp_plot(dl_auto_tuned)
```

###: Generating Variable Importance Table
```
h2o.varimp(dl_auto_tuned)
```

###: Generating Scoring History details per tree
```
h2o.scoreHistory(dl_auto_tuned)
```


###: Compariving AUC between cross validation model with tuned model:
```
h2o.r2(dl_auto_cv,xval = TRUE)
h2o.r2(dl_auto_tuned,xval= TRUE)
```

### Performing Prediction ###

###: Getting first few rows of original data
```
h2o.head(df,2)
```

###: Creating a test data frame to perform prediction
###: One row
```
df_test = data.frame(cylinders = 10, displacement = 400, horsepower = 100, weight = 4000, acceleration = 12, modelyear = 90, 
                     origin = 1)
```

###: Multiple rows
```
df_test = data.frame(cylinders = c(10,20), displacement = c(400,600), horsepower = c(100,140), weight = c(4000,2500), 
                     acceleration = c(12,30), modelyear = c(90,120), 
                     origin = c(1,2))
```

###: Getting test data output
```
df_test
```

###: Getting test data type
```
class(df_test)
```

###: Converting R Data frame to H2O Dataframe
```
hdf_test = as.h2o(df_test)
```

###: Getting test data details
```
h2o.describe(hdf_test)
```

###: Performing prediction using GBM model we built earlier
```
pred_result = h2o.predict(dl_auto_tuned, hdf_test)
```

###: Checking Prediction Results
```
pred_result
```
