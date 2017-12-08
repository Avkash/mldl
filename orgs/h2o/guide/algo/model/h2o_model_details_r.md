# H2O model details in R #

You can access H2O model parameters as below:
```
h2o_model@parameters
h2o_model@parameters
h2o_model@model_id
h2o_model@algorithms
```

You can access more deeper parameters for H2O model parameters as below:
```
h2o_model@parameters$model_id
h2o_model@parameters$ntrees
h2o_model@parameters$nfolds

h2o_model@allparameters$max_depth
h2o_model@allparameters$learn_rate
```

You can more model details i.e. summary, scoring history, validation metrics summary etc as below:
```
h2o_model@model$model_summary
h2o_model@model$scoring_history
h2o_model@model$cross_validation_metrics_summary
```

To get a list of all cross validation models try as below:
```
h2o_model@model$cross_validation_models
h2o_model@model$cross_validation_metrics@algorithm
h2o_model@model$cross_validation_metrics@metrics$r2
```
