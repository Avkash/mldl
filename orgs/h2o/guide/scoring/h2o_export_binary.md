# Exporting Binary Models in H2O #


## FLOW (Import model | Export model) ##

## Python ##

### Export model ###
For example if you have GBM model as below:
```
from h2o.estimators.gbm import H2OGradientBoostingEstimator
h2o_gbm = H2OGradientBoostingEstimator(nfolds = 5)
h2o_gbm.train(x = features, y = response, training_frame= train)
h2o_gbm.model_performance(xval=True)
```
We can export this model as below:
```
h2o.save_model(model=h2o_gbm, path="/Users/avkashchauhan/Downloads/", force=True)
```
Above: 
 - model : The python model object
 - path  : The fully qualified path where you want to save the model
 - force : If True then the model file will be overwritten
 
### Importing H2O Binary model ###


## R (Import model | Export model) ##

## Scala (Import model | Export model) ##

