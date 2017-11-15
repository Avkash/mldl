# H2O GBM (Gradient Boosting Machine) - Multinomial Classification in R #

When you pass response columns as categorical or enum and it has 3 or more classes, the h2O GBM algorithm builds Multinomial Classification Model. 

## Datasets ##
The dataset used in this example can be obtained from here:
 - [iris.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample R Code ##
  - [H2O_GBM_Multinomial Classification with IRIS Dataset](https://github.com/Avkash/mldl/blob/master/code/R/H2O_GBM_Iris_Multinomial.R)
  

## Sample Code in R ##

###: Importing H2O Library
```
library(h2o)
```
### : Initializing h2O
```
h2o.init()
```

###: Importing Dataset
```
iris_df = h2o.importFile(path = "https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv", 
                        col.names =c("sepal_length", "sepal_width", "petal_length", "petal_width", "iris_class"))
```

###: Understanding Dataset
```
h2o.summary(iris_df)
```

###: Getting the list of columns
```
h2o.colnames(iris_df)
```

###: Setting response columns as factor
```
iris_df$iris_class = h2o.asfactor(iris_df$iris_class)
```

###: Getting the list of classes in the response column
```
h2o.levels(iris_df$iris_class)
```

###: Setting Response column
```
response = "iris_class"
```

###: Settings all features for model building
```
features= h2o.colnames(iris_df)
features = setdiff(features, response)
print(features)
```

###: Setting H2O GBM model configuration and then training model
```
iris_gbm = h2o.gbm(x = features, y = response, training_frame = iris_df, nfolds = 5,
                   distribution="AUTO",
                   ntrees=10,
                   max_depth=3,
                   min_rows=2,
                   learn_rate=0.2,
                   keep_cross_validation_predictions=TRUE,
                   seed=1)
```

###: Getting Model details
```
iris_gbm
```

###: Creating a test data frame to perform prediction
```
df_test = data.frame(sepal_length = c(3.4), sepal_width = c(3.2), petal_length = c(1.4), petal_width =  c(3.2))
```

###: Converting R Data frame to H2O Dataframe
```
hdf_test = as.h2o(df_test)
```

###: Performing prediction using GBM model we built earlier
```
df_pred = h2o.predict(iris_gbm, hdf_test)
```

###: Checking Prediction Results
```
df_pred
```

###: Getting model performance based on cross validation
```
h2o.performance(iris_gbm, xval=TRUE)
```

###: Plotting Variable Importance graph
```
h2o.varimp_plot(iris_gbm)
```

###: Generating Variable Importance Table
```
h2o.varimp(iris_gbm)
```

###: Generating Scoring History details per tree
```
h2o.scoreHistory(iris_gbm)
```
