# H2O - User Guide #

 - The code snippets will be in R, python, scala and java

### 1. Architecture ###
 - What is it?
 - How it works?
 - What you can do with H2O? 
 
### 2. Installation ###
 - On Premise
 - [Cluster](https://github.com/Avkash/mldl/blob/master/orgs/h2o/h2o_installation.md)
 - Hadoop
 - Spark

## 3. Accessing H2O Cluster
 - Web Frontend (FLOW)
 - Python
 - R
 
## 4. Data Ingest ##
 - Ingesting data in H2O
   - Uploading a File (FLOW | Python | R | Scala)
   - Importing a File (FLOW | Python | R | Scala)
   - Importing Multiple Files (FLOW | Python | R | Scala)
 - Ingesting data from SQL (Python | R)
 - Supported Data Source in H2O
 - Understanding Data distribution in memory
  
## 5. Data Manipultion ##
 - Splitting Datasets into Training/Testing/Validating  (Python | R | Scala)
 - H2O Pandas Dataframe and vice-versa (Python)
 - Merging Two H2O Dataframes (Python | R | Scala)
 - Group By operation on data frame (Python | R | Scala)
 - Combining Columns from Two Data Frames (Python | R | Scala)
 - Combining Rows from Two Data frames (Python | R | Scala)
 - Slicing Rows from an H2O data frame (Python | R | Scala)
 - Slicing Columns from an H2O data frame (Python | R | Scala)
 - Fill NAs in H2O data frame (Python | R | Scala)
 - Replacing Values in a H2O data frame (Python | R | Scala)
 - Imputing values into H2O Data frame (Python | R | Scala)
 - Pivoting data frames (Python | R | Scala)
 - [Slicing the data](https://github.com/Avkash/mldl/blob/master/orgs/h2o/h2o_data_man.md)

## 6. Machine Learning Algotithms with Code ##
  - Supervised 
    - GLM
      - Classification Example (FLOW | Python | R | Scala)
      - Regression Example (FLOW | Python | R | Scala)
    - GBM 
      - Binomial Classification Example (FLOW | Python | R | Scala)
      - Regression Example (FLOW | Python | R | Scala)
    - Distributed Random Forest
      - Multinomial Classification Example (FLOW | Python | R | Scala)
      - Regression Example (FLOW | Python | R | Scala)
    - Deep Learning
      - Classification Example (FLOW | Python | R | Scala)
      - Regression Example (FLOW | Python | R | Scala)
    - Naïve Bayes Classifier
    - Stacked Ensembles
  - Unsupervised 
    - KMeans (FLOW | Python | R | Scala)
    - PCA (FLOW | Python | R | Scala)
    - GLRM (FLOW | Python | R | Scala)
  - Miscellaneous 
    - Word2Vec (Python | R )
    
## 7. Sparkling Water ##
 - Installation
 - Launching Cluster (deploy mode - client vs cluster)
 - Machine Learning in Sparkling Water
 - pysparkling
   - GBM Example
   - DRF Sample
 - rsparkling
   - GBM Example
   - DRF Sample

## 8. pysparkling ##
 - Installation
 - Connection spark cluster
 - Machine learning example (GBM | GLM)
 
## 9. rsparkling ##
 - Installation
 - Connection spark cluster
 - Analyzing Job and data
 - Machine learning example (GBM | GLM | Deep Learning)
 
## 10. H2O on Hadoop Cluster ##
 - Launching Cluster 
 - using various parameters ( ip | port | disown)

## 11. H2O Models in Production ##
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

## 12. H2O Performance ##
  - Cluster size approximation
  - Analyzing data in H2O memory

## 13. Advance Concepts ##
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
  
## 14: Important Links ##
 - [Latest Download Page]
 - [Documentation]
 - [Github for ket projects]
 - [JIRA]
 - [Stackoverflow Tags]

