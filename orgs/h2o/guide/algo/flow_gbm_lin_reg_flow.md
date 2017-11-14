# H2O GBM (Gradient Boosting Machine) - Linear Regression in FLOW #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

### Make sure you have both the above datasets loaded into FLOW ###
Looking at the "getFrames" command in FLOW cell should show you the following dataframes loaded into H2O memory:
 - house_price_train.csv
 - house_price_test.csv

~[](https://github.com/Avkash/mldl/blob/master/images/flow_house_train_test.png?raw=true)

### Building GBM model with training and cross validation in FLOW ###
~[](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_model.png?raw=true)

### GBM Logistics Regression model in FLOW ###
~[](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_details.png?raw=true)

### Prediction with GBM Logistics Regression model in FLOW ###
~[](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_lin_pred.png?raw=true)
