# Scoring (out-cluster) with POJO and MOJO Model #

## POJO Scoring ##

- Classification Sample in Java | Scala
- Regression Sample in Java | Scala

## MOJO Scoring ##
 - Classification Sample in Java | Scala
- Regression Sample in Java | Scala

## Hive Scoring ##
 - Hive UDF Sample in Java


### Using genmodel.jar by passing model, input csv and output csv (all commandline) ### 
java -ea -cp h2o-genmodel.jar:gbm_model_dir -Xmx4g -XX:MaxPermSize=256m -XX:ReservedCodeCacheSize=256m hex.genmodel.tools.PredictCsv --header --model GBM_model_R_1508436572991_1 --input /Downloads/data2.csv --output output.csv --decimal
