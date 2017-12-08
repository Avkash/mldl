# H2O model details in Python #

If you want to access H2O model json output, try as below:
```
gbm_model_cv._model_json['output']
gbm_model_cv._model_json['output']['variable_importances']
```

Convert H2O model output to a dataframe:
```
gbm_model_cv._model_json['output']['variable_importances'].as_data_frame()
```

All of model features used to build the model:
```
variables = mymodel._model_json['output']['variable_importances']['variable']
```

If you have H2O GBM model built with validation frame and stopping metrics, you can get actual number of trees as below:
```
gbm_model_valid._model_json['output']['model_summary']['number_of_trees']
```

If you have H2O GBM model built with cross validation fold and stopping metrics, you can get actual number of trees as below:
```
gbm_model_cv.full_parameters['ntrees']['actual_value']
```
