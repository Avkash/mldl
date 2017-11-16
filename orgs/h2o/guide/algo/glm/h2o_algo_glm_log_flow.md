# H2O GLM (Generialized Linear Regression) - Logistic Regression in R # 

H2O GLM successfully perform logistic regression when the response feature has either 0/1 binary values or only 2-class categorical values. You just need to set GLM Family to "Binomial" to build the logistic regression model. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

### Dataset in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_glm_log_prostate.png?raw=true)

### Building GLM model with training and cross validation in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_glm_log_model_build.png?raw=true)
Note: You must set Family to "Binomial" to build a logisitic regression model. 

### GLM Logistics Regression model in FLOW ###
![](https://github.com/Avkash/mldl/blob/master/images/flow_glm_log_model_auc.png?raw=true)
