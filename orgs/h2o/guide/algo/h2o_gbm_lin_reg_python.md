# H2O GBM (Gradient Boosting Machine) - Linear Regression in Python #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample Python Notebook ##
  - [H2O_GBM_House_Price_Regression Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-GBM-House-Price-Regression.ipynb)
  

## Sample Code in Python ##

Importing H2O library and initializing H2O:
```
import h2o
h2o.init()
```
Loading Training and Test Dataset:
```
train_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv")
test_df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv")
```
Defining response and features for machine learning:
```
response = "medv"
features = train_df.col_names
features.remove(response)
print(features)
```
Importing GBM specific library function from H2O:
```
from h2o.estimators.gbm import H2OGradientBoostingEstimator
```
Building GBM model only with training Data:
```
gbm_model_with_training_only = H2OGradientBoostingEstimator()
gbm_model_with_training_only.train(x= features, y = response, training_frame= train_df)
```
Building GBM model only with training Data and cross validation:
```
gbm_model_with_training_and_cv = H2OGradientBoostingEstimator(nfolds=5)
gbm_model_with_training_and_cv.train(x = features, y = response, training_frame=train_df)
```
Splitting dataset into multiple subsets for training and validation:
```
df_gbm_train, df_gbm_valid, df_gbm_test = train_df.split_frame(ratios=[0.8,0.1])
```
Building GBM model only with training Data and validation data:
```
gbm_model_with_training_and_validtion = H2OGradientBoostingEstimator()
gbm_model_with_training_and_validtion.train(x = features, y = response, 
                                            training_frame=df_gbm_train, 
                                            validation_frame=df_gbm_valid,
                                           model_id = "glm_model_with_training_and_validtion_python")
```
Building GBM model only configured parameters and training with cross-validation:
```
gbm_model_with_training_cv_config = H2OGradientBoostingEstimator(distribution="AUTO",
                                      ntrees=10,
                                      max_depth=3,
                                      min_rows=2,
                                      learn_rate=0.2,
                                      nfolds=5,
                                      keep_cross_validation_predictions=True,
                                      seed=1)
gbm_model_with_training_cv_config.train(x = features, y = response, 
                                            training_frame=df_gbm_train, 
                                           model_id = "glm_model_with_training_and_validtion_python")
```                                           
Performing Predictions with GBM model:
```
gbm_predictions = gbm_model_with_training_cv_config.predict(df_gbm_test)
```
Printing GBM Model metrics:
```
print(gbm_model_with_training_and_validtion.model_performance(train=True).r2())
print(gbm_model_with_training_and_validtion.model_performance(valid=True).r2())
print(gbm_model_with_training_and_cv.model_performance(train=True).rmse())
print(gbm_model_with_training_and_cv.model_performance(xval=True).rmse())
```
Building GBM model only with training Data, cross validation and keeping cross-validation predictions:
```
gbm_model_with_training_and_cv = H2OGradientBoostingEstimator(keep_cross_validation_predictions = True, nfolds=5)
gbm_model_with_training_and_cv.train(x = features, y = response, training_frame= train_df)
len(gbm_model_with_training_and_cv.cross_validation_predictions())
gbm_model_with_training_and_cv.cross_validation_predictions()[0]
gbm_model_with_training_and_cv.cross_validation_predictions()[1]
```
Printing GBM model scoring history:
```
gbm_model_with_training_and_cv.score_history()
```
Printing GBM model variable importance table:
```
gbm_model_with_training_and_cv.varimp()
```
Printing GBM model variable importance plot:
```
gbm_model_with_training_and_cv.varimp_plot()
```
Printing GBM model scoring plot:
```
gbm_model_with_training_and_cv.plot()
```
