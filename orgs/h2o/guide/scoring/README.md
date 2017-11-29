# H2O Models in Production #

One of the top advantage of H2O is to export H2O models as POJO (Plain Old Java Object) and/or MOJO (Model Object Optimized). Both POJO and MOJO is based on Java runtime so these models can score whereever Java is available, thats all you need, Java only. Both POJO and MOJO models can then be deployed for scoring in real time where Java is available. You can learn more about H2O models in production [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/productionizing.html). 

H2O does provide h2o-genmodel.jar as the only compile and runtime dependency for POJO and MOJO. For POJO you must use the exact same version of h2o-genmodel.jar however MOJO is compatible with any version of h2o-genmodel.jar. 

After your model is ready to meet your business need, you can export those H2O models to 3 different formats: 
1. Binary Model
2. POJO
3. MOJO

### [Exporting Models]() ## 
   - FLOW
   - Python
   - R
   - Scala

### Binary Model ###
This is in-cluster scoring method means you must need exact verion of H2O cluster up and running to score with H2O Binary Models. You can export binary models and import back to H2O as long as both the export and import H2O cluser version are exactly the same. 

### POJO Model ###
A POJO (Plain Old Java Object) model is Java code which has everything needed for a H2O model to score without H2O runtine. It compiled as java code and runs like Java code. You can embedd it into your full Java project and use score as a function.  POJO models are supported for Deep Learning, DRF, GBM, GLM, GLRM, K-Means, PCAA, and Stacked Ensembles.

### MOJO Model ###
A MOJO (Model Object, Optimized) is much improved version of POJO in compact foramt and can be used as as alternative to POJO model. MOJO models are supported for Deep Learning, DRF, GBM, GLM, GLRM, K-Means, Stacked Ensembles, SVM, Word2vec, and XGBoost algorithms. 

### [In Cluster Scoring with Binary Model]() ### 
   - FLOW
   - Python
   - R
   - Scala

### [Out Cluster Scoring with POJO and MOJO Model]() ### 
   - POJO Scoring
     - Classification Sample in Java | Scala
     - Regression Sample in Java | Scala
   - MOJO Scoring
     - Classification Sample in Java | Scala
     - Regression Sample in Java | Scala
   - Hive Scoring
     - Hive UDF Sample in Java
     
### Using genmodel.jar by passing model, input csv and output csv (all commandline) ### 
java -ea -cp h2o-genmodel.jar:gbm_model_dir -Xmx4g -XX:MaxPermSize=256m -XX:ReservedCodeCacheSize=256m hex.genmodel.tools.PredictCsv --header --model GBM_model_R_1508436572991_1 --input /Users/nidhimehta/Downloads/data2.csv --output output.csv --decimal

### Additional Resources ###
 - [H2O MOJO into a Servlet](https://github.com/h2oai/app-mojo-servlet)
 - [POJO and MOJO Java Docs](http://docs.h2o.ai/h2o/latest-stable/h2o-genmodel/javadoc/index.html)
