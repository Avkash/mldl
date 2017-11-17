# H2O Distributed Random Forest - Binomial Classification in R # 

H2O Distributed Random Forest successfully perform binomial classification when the response column/feature is categorical or enum based on Random Forest Algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code ##
  - [H2O Random Forest Classification with Titanic Dataset in R](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DeepLearning_Classification_titanic.ipynb)
  
## Binomial Classification Sample Code in R ##


###: Importing H2O Library
```
library(h2o)
```
### : Initializing h2O
```
h2o.init()
```


### : Getting Cluster Status
```
h2o.clusterStatus()
```

###: Importing Dataset
```
df = h2o.importFile(path = "https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
df = h2o.importFile("/Users/avkashchauhan/src/github.com/avkash/mldl/data/titanic_list.csv")
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

###: Setting response columns as factor
```
df$survived = h2o.asfactor(df$survived)
```

###: Getting the list of classes in the response column
```
h2o.levels(df$survived)
```

###: Setting Response column
```
response = "survived"
```

###: Settings all features for model building
```
features= h2o.colnames(df)
features = setdiff(features, response)
print(features)
```

## Ignoring columns from test dataset
```
features = setdiff(features, c('name', 'ticket', 'home.dest'))
print(features)
```


###: Training H2O Distributed Random Forest Classification model with default configuration
```
drf_titanic_basic = h2o.randomForest(x = features,
                                    y = response,
                                    training_frame = df)
```

###: Understanding H2O Distributed Random Forest Classification model details
```
drf_titanic_basic
```

###: Getting H2O Distributed Random Forest Classification model performance
```
h2o.performance(model = drf_titanic_basic)
```

###: Getting H2O Distributed Random Forest Classification model performance - auc only
```
h2o.auc(drf_titanic_basic)
```


###: Training H2O Distributed Random Forest Classification model with cross validation
```
drf_titanic_cv = h2o.randomForest(x = features,
                                 y = response,
                                 nfolds = 5,
                                 training_frame = df)
drf_titanic_cv
```

###: Getting H2O Distributed Random Forest Classification model performance on validation data
```
h2o.performance(model = drf_titanic_cv, xval = TRUE)
```

###: Getting H2O Distributed Random Forest Classification model performance - auc only for training and validation
```
h2o.auc(drf_titanic_cv,xval = TRUE)
h2o.auc(drf_titanic_cv,train = TRUE)
```


###: Plotting Variable Importance graph
```
h2o.varimp_plot(drf_titanic_cv)
```

###: Generating Variable Importance Table
```
h2o.varimp(drf_titanic_cv)
```

###: Generating Scoring History details per tree
```
h2o.scoreHistory(drf_titanic_cv)
```

###: Training H2O Distributed Random Forest Classification model with cross validation and tuned parameters for better 
accuracy
```
drf_titanic_tuned = h2o.randomForest(x = features,
                                    y = response,
                                    training_frame = df,
                                    nfolds = 5,
                                    ntrees=10,
                                    max_depth=3,
                                    min_rows=2,
                                    keep_cross_validation_predictions=TRUE,
                                    seed = 12345)

drf_titanic_tuned
```

###: Getting H2O Distributed Random Forest Classification model performance - auc only for training and validation
```
h2o.auc(drf_titanic_tuned,xval = TRUE)
h2o.auc(drf_titanic_tuned,train = TRUE)
```

###: Plotting Variable Importance graph
```
h2o.varimp_plot(drf_titanic_tuned)
```

###: Generating Variable Importance Table
```
h2o.varimp(drf_titanic_tuned)
```

###: Generating Scoring History details per tree
```
h2o.scoreHistory(drf_titanic_tuned)
```


###: Compariving AUC between cross validation model with tuned model:
```
h2o.auc(drf_titanic_cv,xval = TRUE)
h2o.auc(drf_titanic_tuned,xval= TRUE)
```


###: Creating a test data frame to perform prediction
```
df_test = data.frame(pclass = 2, sex = 'male', age = 28, sibsp = 1, parch = 2, fare = 321.9, 
                     boat = 2, body = 123, embarked = 'S', cabin = "B5")

df_test = data.frame(pclass = c(2,1), sex = c('male','female'), age = c(28,45), sibsp = c(1,3), parch = c(2,2), fare = c(21.9,10.3), 
                     boat = c(0,0), body = c(123, 145), embarked = c('S','B'), cabin = c("B5", "B5"))

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
pred_result = h2o.predict(drf_titanic_tuned, hdf_test)
```

###: Checking Prediction Results
```
pred_result
```
