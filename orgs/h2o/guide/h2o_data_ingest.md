# H2O Data Ingest #

### [Supported file format](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_data_ingest.md#supportedfileformat) ###
H2O supports the following different file types:
 - CSV (delimited) files
 - ORC
 - SVMLight
 - ARFF
 - XLS
 - XLSX
 - Avro version 1.8.0 (without multifile parsing or column type modification)
 - Parquet (Some of the complex nested parquet files may not be read properly)

### [Supported Data Types](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_data_ingest.md#supporteddatatypes) ###
H2O supports the following data types:
- Numeric
- String
- Enum
- Time
- UUID

Note: H2O will also mark some of the data as invalid or unknown if could not set any of the above data type.

### [Supported Data Source](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_data_ingest.md#supporteddatasources) ###
H2O supports the following data source natively:
- Local File System
- Web based files hosted on https/https
- S3 (Supports both s3 and s3n)
- HDFS 
- JDBC (SQL source connected with JDBC driver 0.42 or higher )

H2O also supports the following data sources with some external libraries:
- Google Cloud Store Object Store files system using Google’s cloud storage connector (gcs-connector-latest-hadoop2.jar)
- IBM Swift Object Storage using IBM HDFS Driver (hadoop-openstack.jar)
- Alluxio data storage source using Alluxio client library (alluxio-core-client-*-jar-with-dependencies.jar)

### Ingesting data in H2O ###


### Uploading a File (FLOW | Python | R | Scala) ###

### Importing a File (FLOW | Python | R | Scala) ###

### Importing Multiple Files (FLOW | Python | R | Scala) ###

### Ingesting data from SQL (Python | R) ###

### Understanding Data distribution in memory ###

