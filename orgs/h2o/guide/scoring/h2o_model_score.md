# Scoring with H2O POJO and MOJO models #

POJO and MOJO models allow users to build a model using H2O and then deploy the model to score in real-time, using the POJO and MOJO model or a REST API call to a scoring server.

### Scoring (in-cluster)with Binary Model ### 
   - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md)
   - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md)
   - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md)
   - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md)

### Scoring (out-cluster) with POJO and MOJO Model ### 
   - [Scoring with POJO: Classification & Regression Sample in Java](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_pojo_java.md)
   - [Scoring with MOJO: Classification & Regression Sample in Java](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_mojo_java.md) 
   - Hive Scoring
     - Hive UDF Sample in Java

## Compiling the Java code with POJO and MOJO models ##
Compiling POJO with Java 1.7 
```   
 $ javac -cp h2o-genmodel.jar -J-Xmx2g -J-XX:MaxPermSize=128m  your_pojo_model.java main.java
``` 
Compiling MOJO with Java 1.7 
```   
 $ javac -cp h2o-genmodel.jar -J-Xmx2g -J-XX:MaxPermSize=128m  main.java
``` 
Compiling POJO with Java 1.8 
```   
 $ javac -cp h2o-genmodel.jar -J-Xmx2g your_pojo_model.java  main.java
``` 
Compiling MOJO with Java 1.8
```   
 $ javac -cp h2o-genmodel.jar -J-Xmx2g main.java
``` 

## Running the code ##
You just need to use the h2o-genmodel.jar into class path (and any other class you need)  and just use the main class (i.e. main.java was our main class in above code) to run the code as below:
```
$ java -cp .:h2o-genmodel.jar main
```

## Command-Line Scoring with POJO/MOJO models and data as CSV ##
Using genmodel.jar by passing model, input csv and output csv (all commandline)
```
$ java -ea -cp h2o-genmodel.jar:gbm_model_dir -Xmx4g -XX:MaxPermSize=256m 
    -XX:ReservedCodeCacheSize=256m hex.genmodel.tools.PredictCsv 
    --header --model GBM_model_R_1508436572991_1 
    --input /Downloads/data2.csv 
    --output output.csv 
    --decimal
```
