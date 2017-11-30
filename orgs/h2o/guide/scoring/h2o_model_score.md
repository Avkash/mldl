# Scoring with H2O POJO and MOJO models #

POJO and MOJO models allow users to build a model using H2O and then deploy the model to score in real-time, using the POJO and MOJO model or a REST API call to a scoring server.

### [Scoring (in-cluster)with Binary Model](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md) ### 
   - FLOW
   - Python
   - R
   - Scala

### [Scoring (out-cluster) with POJO and MOJO Model](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_outcluster.md) ### 
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


