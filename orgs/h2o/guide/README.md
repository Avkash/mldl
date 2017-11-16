# H2O - User Guide #

 - The code snippets will be in R, python, scala and java

## [1. Architecture](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_arch.md) ##
 - What is it?
 - How it works?
 - What Algorithms are supported with H2O?
 - What you can do with H2O? 
 
## [2. Installation](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_installation.md) ##
 - On Premise
 - Cluster
 - Hadoop
 - Spark
 
## [3. Starting H2O cluster](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_start.md) ##
 - FLOW
 - Python
 - R
 - Scala

## [4. H2O on Hadoop Cluster](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_cluster_hadoop.md) ##
 - Supported Platform
 - Getting H2O binaries (Download H2O Hadoop Driver)
 - Installation on Hadoop Cluster
 - Starting or Launching H2O Cluster
 - Cluster Setting with various parameters ( ip | port | disown)

## [5. Sparkling Water (H2O in Spark)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_cluster_spark.md) ##
 - Supported Platform
 - Getting Sparkling Water binaries (Download Sparkling Water Assemblies)
 - Installation on Spark Cluster
 - Launching Cluster (deploy mode - client vs cluster)
 - Machine Learning in Sparkling Water

## [6. pysparkling](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/pysparkling/h2o_pysparkling.md) ##
 - Installation
 - Connection spark cluster
 - pysparkling
   - GBM Example
   - DRF Sample
 
## [7. rsparkling](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/rsparkling/h2o_rsparkling.md) ##
 - Installation
 - Connection spark cluster
 - Analyzing Job and data
 - rsparkling
   - GBM Example
   - DRF Sample

## [8. Accessing H2O library](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_access.md) ##
 - Web Frontend (FLOW)
 - Python
 - R
 - Scala
   
## [9. Data Ingest](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_ingest.md) ##
 - Supported File Formats
 - Supported Data Types
 - Supported Data Source
 - Ingesting data in H2O
   - Importing a File (FLOW | Python | R | Scala)
   - Importing Multiple Files (FLOW | Python | R | Scala)
   - Uploading a File (FLOW | Python | R | Scala)

## [10. Ingesting data from RDBS in Python and R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_sql_ingest.md) ##
 - Supported Scenarios
 - Python API
 - R API
  
## [11. Public Datasets available to try with H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/datasets_get.md) ##
 - List of 25 Datasets
 - Loading datasets into H2O memory in FLOW
 - Loading datasets into H2O memory using Python API
 - Loading datasets into H2O memory using R API

## [12. Create Test dataset with H2O of any size and and type](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_createframe.md) ##
 - Why test datasets?
 - FLOW
 - Python
 - R
 
## [13. Dataframe manipulation in Python and R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_frame_man.md) ##
 - Dataframes in Python and R
 - Pandas, numpy and H2O Dataframes
 - H2O and R Dataframes

## [14. Spliting dataset in H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_dataset_split.md) ##
 - Why spliting datasets
 - H2O Dataframe split in FLOW
 - H2O Dataframe split in Python
 - H2O Dataframe split in R
 - H2O Dataframe split in Spark/Scala

## [15. Data Manipultion](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man.md) ##
 - [H2O Pandas Dataframe and vice-versa (Python)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_pd_h2o.md)
 - [Merging Two H2O Dataframes (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_merge.md)
 - [Combining Columns from Two Data Frames (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guidedata//h2o_data_ingest_cbind.md)
 - [Combining Rows from Two Data frames (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_rbind.md)
 - [Slicing Rows from an H2O data frame (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_rslice.md)
 - [Slicing Columns from an H2O data frame (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_cslice.md)
 - [Fill NAs in H2O data frame (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_fillna.md)
 - [Replacing numeric values in H2O dataframe (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_replace.md)
 - [Imputing values into H2O Data frame (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_impute.md)
 - [Group By operation on data frame (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_groupby.md)
 - [Pivoting data frames (Python | R)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_pivot.md)

## [16. Things data scientists do with data before model building]() ##
 - [Visaulize the input data](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/data/h2o_data_visualize.md)
 - [Finding correlation among features](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/data/h2o_data_correlation.md)
 - [Convert features to proper type i.e. num or enum](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_feature_convert.md)
 - [Impute missing values](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_man_impute.md)
 - [Ignore the features not needed in machine leaning](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_feature_ignore.md)
 - [Feature Engineering: External libraries and articles](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_data_feature_eng.md) 

## [17. Supervised Machine Learning Algotithm : GLM (Generalized Linear Model)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm.md) ##
  - Linear Regression Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_r.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_scala.md)
  - Logestic Regression (Binomial Classification)
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_scala.md))

## [18. Supervised Machine Learning Algotithm : GBM (Gradient Boosting Machine)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_gbm.md) ##
  - Regression Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_lin_reg_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_lin_reg_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_lin_reg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_lin_reg_scala.md)
  - Biomial Classification Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_bin_reg_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_bin_reg_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_bin_reg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_bin_reg_scala.md)
  - Multinomial Classification Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_multi_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_gbm_multi_R.md)
     
 ## [19. Supervised Machine Learning Algotithm : DRF (Distributed Random Forest)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/README.md) ##
  - Regression Example
    - FLOW
    - Python
    - R
    - Scala
  - Classification Example
    - FLOW
    - Python
    - R
    - Scala

 ## [20. Supervised Machine Learning Algotithm : Deep Learning](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/README.md) ##
  - Regression Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_lin_reg_auto_python.md)
    - R
    - Scala
  - Classification Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_python.md)
    - R
    - Scala

 ## [21. Supervised Machine Learning Algotithm : Stacked Ensembles](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_drf.md) ##
  - FLOW
  - Python
  - R
  - Scala

## [22. Supervised Machine Learning Algotithms - K-MEANS]() ##
   - FLOW
   - Python
   - R 
   - Scala

## [23. H2O Word2Vec Algotithm]() ##
   - What is it and what it does?
   - Python
   - R
     
## [24. H2O Models in Production]() ##
 - Supported Scenarios
 - Exporting Models
   - Binary  (FLOW | Python | R | Scala)
   - POJO and MOJO models (FLOW | Python | R | Scala)
 - Scoring Model
   - in-cluster scoring (FLOW | Python | R )
   - POJO Scoring
     - Classification Sample in Java | Scala
     - Regression Sample in Java | Scala
   - MOJO Scoring
     - Classification Sample in Java | Scala
     - Regression Sample in Java | Scala
   - Hive Scoring
     - Hive UDF Sample in Java

## [25. H2O Performance]() ##
  - Cluster size approximation
  - Analyzing data in H2O memory

## [26. Advance Concepts]() ##
  - Grid Search
    - Classification Example (FLOW | Python | R | Scala)
    - Regression Example (FLOW | Python | R | Scala)
  - Hpyerparameters 
    - Classification Example (FLOW | Python | R | Scala)
    - Regression Example (FLOW | Python | R | Scala)
  - AutoML
    - Classification Example (FLOW | Python | R | Scala)
    - Regression Example (FLOW | Python | R | Scala)
  - Cross-Validation
  
## [Appendix: Important Links] ##
 - [H2O Website](https://www.h2o.ai/)
 - [Latest Download Page](https://www.h2o.ai/download/)
 - [Documentation](http://docs.h2o.ai/h2o/latest-stable/index.html)
 - H2O Open Source Projects at Github
   - [H2O-3](https://github.com/h2oai/h2o-3)
   - [Sparkling Water](https://github.com/h2oai/sparkling-water)
   - [H2O4GPU](https://github.com/h2oai/h2o4gpu)
   - [H2O Meetups](https://github.com/h2oai/h2o-meetups)
   - [H2O Tutotrials](https://github.com/h2oai/h2o-tutorials)
 - [H2O Bugs and Open Issues]
   - [H2O JIRA Dashboard](https://0xdata.atlassian.net/secure/Dashboard.jspa)
   - [H2O-3 JIRA](https://0xdata.atlassian.net/projects/PUBDEV/issues)
   - [Sparkling Water JIRA](https://0xdata.atlassian.net/projects/SW/issues)   
 - [H2O StackOverflow Tags](https://stackoverflow.com/questions/tagged/h2o)
 - [H2OStream Community Mailing List](h2ostream@googlegroups.com)
 - H2O Enterprise Support
   - [Support Website](https://support.h2o.ai)
   - [Support Email](support@h2o.ai)
 

