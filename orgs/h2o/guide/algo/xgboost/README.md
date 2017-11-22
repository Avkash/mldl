# XGBoost in H2O #

XGBoost is a supervised learning algorithm that implements a process called boosting to yield accurate models. Boosting refers to the ensemble learning technique of building many models sequentially, with each new model attempting to correct for the deficiencies in the previous model. In tree boosting, each new model that is added to the ensemble is a decision tree. XGBoost provides parallel tree boosting (also known as GBDT, GBM) that solves many data science problems in a fast and accurate way. For many problems, XGBoost is one of the best gradient boosting machine (GBM) frameworks today.

XGBoost is an optimized distributed gradient boosting library designed to be highly efficient, flexible, and portable. XGBoost provides parallel tree boosting (also known as GBDT, GBM) that solves many data science problems in a fast and accurate way.

You can learn more about H2O XGBoost details [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/xgboost.html?highlight=xgboost).

## XGBoost Samples in H2O ##

- Classification
  - [FLOW]
  - [Python (Titanic Dataset)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgb_titanic_python.md)
  - [Python (Prostate Dataset)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_prostate_python.md)
  - [R (Titanic Dataset)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_titanic_R.md)
  - [R (Prostate Dataset)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_prostate_R.md)
  - [Scala]
- Regression
  - [FLOW]
  - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_houseprice_python.md)
  - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_houseprice_R.md)
  - [Scala]
 
 ## Important Facts ##
  - Your response columnd must not contain empty fields:
    - Details: ERRR on field: _response_column: Response contains missing values (NAs) - not supported by XGBoost.
  - 
 
 ## Articles ##
  - [Blog: XGBoost in H2O](https://blog.h2o.ai/2017/06/xgboost-in-h2o-machine-learning-platform/)
  - [XGBoost Documentation in H2O](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/xgboost.html)
  - [XGBoost Test Code in H2O[(https://github.com/h2oai/h2o-3/blob/master/h2o-extensions/xgboost/src/test/java/hex/tree/xgboost/XGBoostTest.java)

