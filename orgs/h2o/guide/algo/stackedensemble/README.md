# H2O Stacked Ensemble #

Ensemble machine learning methods use multiple learning algorithms to obtain better predictive performance than could be obtained from any of the constituent learning algorithms. Many of the popular modern machine learning algorithms are actually ensembles. For example, Random Forest and Gradient Boosting Machine (GBM) are both ensemble learners. Both bagging (e.g. Random Forest) and boosting (e.g. GBM) are methods for ensembling that take a collection of weak learners (e.g. decision tree) and form a single, strong learner.

H2O’s Stacked Ensemble method is supervised ensemble machine learning algorithm that finds the optimal combination of a collection of prediction algorithms using a process called stacking. This method currently supports regression and binary classification, and multiclass support is planned for a future release.

Learn more about stacked ensemble in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/stacked-ensembles.html).

  - Regression Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_regression_houseprice_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_regression_autompg_R.md)
    - [Scala]
    
  - Classification Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_classification_titanic_python.md)
    - [R]
    - [Scala]
