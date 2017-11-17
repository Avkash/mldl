Distributed Random Forest (DRF) is a powerful classification and regression tool. When given a set of data, DRF generates a forest of classification (or regression) trees, rather than a single classification (or regression) tree. Each of these trees is a weak learner built on a subset of rows and columns. More trees will reduce the variance. Both classification and regression take the average prediction over all of their trees to make a final prediction, whether predicting for a class or numeric value (note: for a categorical response column, DRF maps factors (e.g. ‘dog’, ‘cat’, ‘mouse) in lexicographic order to a name lookup array with integer indices (e.g. ‘cat -> 0, ‘dog’ -> 1, ‘mouse’ -> 2).

You can learn more about DRF in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/drf.html).

### DRF linear regression example in various lnguage: ### 

- [FLOW]
- [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_regression_autompg_python.md)
- [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_regression_autompg_R.md)
- [Scala]


### DRF logistic regression example in various lnguage: ### 

- [FLOW]
- [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_classification_titanic_python.md)
- [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_classification_titanic_R.md)
- [Scala]

