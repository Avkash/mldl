# Exporting Binary Models in H2O #


## FLOW (Import model | Export model) ##

### Exporting H2O Binary model ###

~[](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_model_export.png?raw=true)

### Importing H2O Binary model ###

![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_model_import.png?raw=true)

## Python ##

### Exporting H2O Binary model ###
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

For example if model is saved at the location below, you can load into H2O as below:
```
model_path = "/Users/avkashchauhan/Downloads/GBM_model_python_1511810189311_2237"
h2o_gbm_model = h2o.load_model(model_path)
h2o_gbm_model.model_performance(xval=True).r2()
```

## R ##

### Exporting H2O Binary model ###

For example if you have GBM model as below:
```
h2o_gbm  = h2o.gbm(nfolds = 5, x = features, y = response, training_frame= train)
h2o.performance(model = h2o_gbm, xval=True)
```
We can export this model as below:
```
h2o.saveModel(object=h2o_gbm, path="/Users/avkashchauhan/Downloads/", force=True)
```
Above: 
 - object : The R model object
 - path  : The fully qualified path where you want to save the model
 - force : If True then the model file will be overwritten
 
### Importing H2O Binary model ###
For example if model is saved at the location below, you can load into H2O as below:
```
model_path = "/Users/avkashchauhan/Downloads/GBM_model_python_1511810189311_2237"
h2o_gbm_model = h2o.loadModel(model_path)
h2o.performance(h2o_gbm_model,xval=TRUE)
```

## Scala (Import model | Export model) ##

