# H2O GBM (Gradient Boosting Machine) - Classification Model in FLOW #

If the response column is numeric or string and set as enum or categorical, then GBM will build a classification model. For the 2 classes in response, it will be "Binomial Classification" and classes more then 2 will be "Multinomial Classification". If the response column is real or integer number the GBM will build "Linear Regression" model.

To build Classification Model with GBM, make sure your response column is set to enum or categorical.

## Datasets ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

### Make sure you have above datasets loaded into FLOW ###
Looking at the "getFrames" command in FLOW cell should show you the following dataframes loaded into H2O memory:
 - prostate.csv

Your response column also set to be enum or categorical to build a classification model. 
![](https://github.com/Avkash/mldl/blob/master/images/flow_prostate_enum.png?raw=true)

### Building GBM model with training and cross validation in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_classification.png?raw=true)

### GBM classification model in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_bin_info.png?raw=true)

### Prediction with GBM classification model in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_gbm_prostate_pred.png?raw=true)
