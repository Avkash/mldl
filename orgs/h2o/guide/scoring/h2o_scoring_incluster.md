# Scoring with H2O Binary Models #

Once H2O model is loaded into H2O memory you can perform the scoring depending on the environment you have. 

## Scoring in FLOW  ###
First you would need to select your model in FLOW then select "Predict" button on the UI to launch prediction cell:
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_predict_select.png?raw=true)

In the "predict" cell, you would need to pass the data frame, and then perform prediction:
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_predict_cell.png?raw=true)

## Scoring in Python  ###
If you model object in python is h2o_gbm you can perform prediction by passing test dataframe as below:
```
prediction_results = h2o_gbm.predict(test_data=test_df)
```
The prediction_results dataframe will have the prediction results.

## Scoring in R  ###
If you model object in R is h2o_gbm you can perform prediction by passing test dataframe as below:
```
prediction_results = h2o.predict(h2o_gbm, test_data=test_df)
```
The prediction_results dataframe will have the prediction results.

## Scoring in SCala  ###
If you model object inScala is h2oGbmModel you can perform prediction by passing test dataframe as below:
```
val predH2OFrame = h2oGbmModel.score(prostateData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```
The predFromModel dataframe will have the prediction results with the column name "predict" containing the results.

