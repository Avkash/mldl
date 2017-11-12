# H2O Architecture #

## What is H2O? ##

H2O is open source in-memory distributed machine learning platform with enterprise level modeling and scoring functionalities. H2O can on a standalong machine like Windows, OSX or Linux OS or it can run on distributed systems like Hadoop and Spark. It can ingest data from various enterprise endpoints and H2O models can score at sub-second level on either one machine or hundreds of machines. 

Following are key detais:
   - H2O is open source means everything happens in H2O is publically available to learn and see through code (no black box)
   - "In-memory" means all the processing happes into memory so it is very fast
   - "Distributed" means you can run H2O on several (hundreds) nodes which helps enterprises to do machine learning on very large amount of data
 - Enterprise grade machine learing
   - H2O support various enterprise level data sources i.e. NFS, S3, S3N, HDFS, RDBMS (through JDBC driver), noSQL
   - H2O support various data format i.e. avro, parquet, excel, json, csv, svmlite, ARRF, ORC
 - Enterprise grade scoring sub-system
   - H2O models can be scored with H2O (in-cluster) and outside H2O (out-cluster)
   - In-cluster scoring is done through H2O binary model
   - Out-cluster scoring is done through MOJO and POJO
 - Programmer Friendly
   - With H2O you dont need to learn any new machine learning language. H2O support all functionalities from Python, R, Java, Scala or any language which supports RESTful interface. 
   - H2O support supervised, unsupervised/clustering algorithms with support to imputation, encoding, several solvers family, distributions and various machine learning functions built into algorith,s

## How it works? ##
  - Create H2O cluster
    - You can run H2O on a single machine or a several machines in cluster mode, locally, on Hadoop or Spark cluster.
    - You connect to H2O cluster from your favorite programming language interface i.e. Python, R, Java, Scala or just Web
  - Ingest Data
    - Once H2O cluster is running, you just need to ingest your machine learning ready data into H2O cluster memory
  - Build Model
    - H2O has supports for supervised, unsupervised/clustering algorithms so select your algo and build model
  - Perform model validation
    - H2O comes with validation data and n-fold cross validation so check your model accuracy
    - H2O has builtin function to generate various model accuracy parameters so you just need to check, not need to perform any new calculation
  - Execute Scoring
    - H2O has builtin scoring method so you can quickly score with new data
    - H2O also comes by out cluster scoring where you export your models into Java code as POJO and/or MOJO models
    - These POJO and MOJO models can score anywhere where you have Java runtime available
    - H2O provides a support class name h2o-genmodel.jar, thats all you need to perform scoring on a single machine or on a scoring cluster.

## What Algorithms are supported with H2O? ##
  - Supervised
    - Deep Learning (Feed Forwards Neural Networks)
    - Distributed Random Forest (DRF)
    - Generalized Linear Model (GLM)
    - Gradient Boosting Machine (GBM)
    - Naive Bayes Classifier (NB)
    - Stacked Ensembles  (SE)
    - XGBoost (xgboost)
  - Unsupervised/Clustering
    - Generalized Low Rank Models (GLRM)
    - K-Means (k-means)
    - Principal Component Analysis (PCA)

## What you can do with H2O? ##
 - Get started with minimal effort and investment. 
 - Super fast machine learning, all in memory.
 - Make better predictions. 
 - Use algorithms and the processing power you need to analyze bigger data sets, more models, and more variables.
 - H2O is an extensible open source platform that offers the most pragmatic way to put big data to work for your business.
 - With H2O, you can work with your existing languages and tools. 
 - Further, you can extend the platform seamlessly into your Hadoop environments.
 - Score without H2O in any environment where Java runs
