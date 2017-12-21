# Applied Machine Learning with H2O (From 0 to 100) #

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
 - [Converting pyspark.sql.dataframe.DataFrame to H2O Data Frame](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_spark_df_conversion.md)

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
 - [Ingest data from S3 & export to S3N/S3A](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_ingest_s3_general.md)
 - [Ingesting Data from S3 from Java API](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/data/h2o_ingest_s3_java.md)
 
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

## [17. Supervised Machine Learning Algotithm : GLM (Generalized Linear Model)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/glm/README.md) ##
  - Linear Regression Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_r.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_scala.md)
  - Logestic Regression (Binomial Classification)
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/h2o_algo_glm_log_scala.md)

## [18. Supervised Machine Learning Algotithm : GBM (Gradient Boosting Machine)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/README.md) ##
  - Regression Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_lin_reg_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_lin_reg_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_lin_reg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_lin_reg_scala.md)
  - Biomial Classification Example
    - [FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_bin_reg_flow.md)
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_bin_reg_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_bin_reg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_bin_reg_scala.md)
  - Multinomial Classification Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_multi_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/gbm/h2o_gbm_multi_R.md)
     
 ## [19. Supervised Machine Learning Algotithm : DRF (Distributed Random Forest)](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/README.md) ##
  - Regression Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_regression_autompg_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_regression_autompg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_regression_autompg_scala.md)
  - Classification Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_classification_titanic_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_classification_titanic_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/drf/h2o_drf_classification_titanic_scala.md)

 ## [20. Supervised Machine Learning Algotithm : Deep Learning](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/README.md) ##
  - Regression Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_lin_reg_auto_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_regression_autompg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_regression_autompg_scala.md)
  - Classification Example
    - FLOW
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_scala.md)

## [21. Un-supervised Machine Learning Algotithms - K-MEANS](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/kmeans/README.md) ##
   - FLOW
   - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/kmeans/h2o_kmeans_driverspeed_python.md)
   - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/kmeans/h2o_kmeans_driverspeed_R.md) 
   - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/kmeans/h2o_kmeans_scala.md)

## [22. Hyperparameters and Grid Search in H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/README.md) ##
 - Classification
   - Samples with Titanic Dataset
     - [GLM in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_glm_titanic_python.md) | [GLM in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_glm_titanic_R.md) 
     - [GBM in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_gbm_titanic_python.md) | [GBM in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_gbm_titanic_R.md)
     - [Random Forest in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_drf_titanic_python.md) | [Random Forest in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_drf_titanic_R.md)
     - [Deep Learning in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_dl_titanic_python.md) | [Deep Learning in R]()
 - Regression 
   - Samples with House Price Dataset
     - [GLM in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_glm_houseprice_python.md)  | [GLM in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_glm_houseprice_R.md)
     - [GBM in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_gbm_houseprice_python.md) | [GBM in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_gbm_houseprice_R.md)
     - [Random Forest in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_drf_houseprice_python.md) | [Random Forest in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_drf_houseprice_R.md)
     - [Deep Learning in Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_dl_houseprice_python.md) | [Deep Learning in R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/grid/h2o_grid_dl_houseprice_R.md)

## [23. Supervised Machine Learning Algotithm : Stacked Ensembles](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/README.md) ##
  - Regression Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_regression_houseprice_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_regression_autompg_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_classification_titanic_scala.md)
  - Classification Example
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_classification_titanic_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2o_se_classification_titanic_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/stackedensemble/h2_se_regression_houseprice_scala.md)

## [24. XGBoost in H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/README.md) ##
- Classification
  - Titanic Dataset
    - [FLOW]
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgb_titanic_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_titanic_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_titanic_scala.md)
  - Prostate Dataset
    - [FLOW]
    - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_prostate_python.md)
    - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_prostate_R.md)
    - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_prostate_scala.md)
- Regression
  - [FLOW]
  - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_houseprice_python.md)
  - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_houseprice_R.md)
  - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/xgboost/h2o_xgboost_houseprice_scala.md)
   
## [25. AutoML in H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/README.md) ##
 - Classification Example
   - FLOW
   - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_classification_python.md)
   - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_classification_titanic_R.md)
   - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_titanic_scala.md)
 - Regression Example
   - FLOW
   - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_regression_houseprice_python.md)
   - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_regression_houseprice_R.md)
   - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/automl/h2o_automl_titanic_scala.md)

## [26. Anomaly detection using H2O Deep Learning Auto Encoder](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/encoder/README.md) ##
  - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/encoder/h2o_encoder_ecg_python.md)
  - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/encoder/h2o_encoder_ecg_R.md)
  - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/encoder/h2o_encoder_ecg_scala.md)

## [27. H2O Word2Vec Algorithm](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/README.md) ##
  - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-python.md)
  - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-R.md)
  - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-scala.md)
     
## [28. Model Details from R, Python & Scala API](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/model/README.md) ##     
  - [Python API for model details](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/model/h2o_model_python.md)
  - [R API for model details](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/model/h2o_model_details_r.md)
  - [Scala API for Model details](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/model/h2o_model_details_scala.md)
  
## [29. H2O Models in Production](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/README.md) ##
 - [Exporting H2O models](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_model_export.md)
    - [Exporting and Importing (Binary Only) Models](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_export_binary.md)
    - [Exporting POJO and MOJO Models](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_exporting_pojo_mojo.md)
 - [Scoring with H2O Model](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_model_score.md)
    - [Scoring (in-cluster)with Binary Model](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_incluster.md)
    - Scoring (out-cluster) with POJO and MOJO Model
      - [Scoring with POJO: Classification & Regression Sample in Java](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_pojo_java.md)
      - [Scoring with MOJO: Classification & Regression Sample in Java](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_mojo_java.md) 
 - Hive Scoring with POJO and MOJO models
   - [Hive UDF POJO Template Sample](https://github.com/h2oai/h2o-tutorials/tree/master/tutorials/hive_udf_template/hive_udf_pojo_template)
   - [Hive UDF MOJO Template Sample](https://github.com/h2oai/h2o-tutorials/tree/master/tutorials/hive_udf_template/hive_udf_mojo_template)
   - [Hive UDF Multi-MOJO Template Sample](https://github.com/h2oai/h2o-tutorials/tree/master/tutorials/hive_udf_template/hive_multimojo_udf_template)
   - [Scoring using MOJO with Hive UDf Function](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_scoring_hive_udf_prostate.md)
 - Scoring in Spark with Spark UDF
   - [Spark UDF Scroing with H2O MOJO Models - Part 1](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_spark_udf.md)
   - [Spark UDF Scroing with H2O MOJO Models - Part 2](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/scoring/h2o_score_spark_udf2.md)

## [30. H2O Performance](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/README.md) ##
 - [Cluster size and node type/count approximation](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/h2o_perf_cluster_size.md)
 - [Data ingest performance into H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/h2o_perf_data_ingest.md)
 - [Analyzing data/objects into H2O memory](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/h2o_perf_objects_memory.md)
 - [Visualizing and Understanding Dataset Distribution into H2O memory from FLOW](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/h2o_data_view_flow.md)
 - [Understanding CPU utilization in H2O cluster](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/performance/h2o_water_meter.md) 

## [31. Advance and Expert Machine Learning with H2O]() ##
  - Checkpoint Models in H2O
  - Partial Dependency Plots
  - Partial Dependency Plots with Global Quantiles
  - Confidence Internal for Prediction

## [32. Various Tips and Tricks while using H2O](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/guidance/README.md)
  - [Creating Variable Importance table in Python from an H2O Model](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/guidance/h2o_variamp_plot_python.md)
  
## [Appendix: Important Links] ##
 - [H2O Website](https://www.h2o.ai/)
 - [Latest Download Page](https://www.h2o.ai/download/)
 - [Documentation](http://docs.h2o.ai/h2o/latest-stable/index.html)
 - [H2O Python Demos](https://github.com/h2oai/h2o-3/tree/master/h2o-py/demos)
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
 

