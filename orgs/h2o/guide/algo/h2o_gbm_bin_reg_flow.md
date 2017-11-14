# H2O GBM (Gradient Boosting Machine) - Classification  in FLOW #

If the response column is numeric or string and set as enum or categorical, then GBM will build a classification model. For the 2 classes in response, it will be "Binomial Classification" and classes more then 2 will be "Multinomial Classification". If the response column is real or integer number the GBM will build "Linear Regression" model.

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

### Make sure you have both the above datasets loaded into FLOW ###
Looking at the "getFrames" command in FLOW cell should show you the following dataframes loaded into H2O memory:
 - house_price_train.csv
 - house_price_test.csv

![](https://github.com/Avkash/mldl/blob/master/images/flow_house_train_test.png?raw=true)

### Building GBM model with training and cross validation in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_model.png?raw=true)

### GBM Logistics Regression model in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_details.png?raw=true)

### Prediction with GBM Logistics Regression model in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_pred.png?raw=true)
