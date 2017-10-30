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

### File(s) Import in H2O ##

H2O has on single API to ingest all supported kinds of data format from all supported data source. In the following API, the path can be any of the following:
- Local file system i.e.
  - C:\>file_location
  - /Users/avkashchauhan/learn/customers/prostate.csv
- File at your HDFS
  - hdfs://cloudera.hadoop.com:/user/avkash/prostate.csv
- File at HTTP/HTTPS
 - http://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/arrhythmia.csv.gz
- Files at S3 location
 - s3n://mybucket/myDir
- Files are Azure blob storage:
 - wasb://mybucket@myaccount.blob.core.windows.net/myDir 

#### Here is how you will use the file import API in various ways: ####

```
FLOW
importFiles
# R
h2o.importFiles(path="path to your file")
# Python
h2o.import_files(path="path to your files")
```


### Ingesting data in H2O ###
 - Importing a File
   - FLOW
      - In the FLOW cell type "importFiles" and select "SHIFT + ENTER" / Or click "RUN" button at the top MENU
      - In the open cell insert the file name
      - You can add multiple files with same data format into same cell
      - The Actual PARSE action is two step
      - First Step: Once all the files are selected you select "Parse all files" which just reads the header and other info
      - Second Step: The actual parse action happens and files are read from the source and loaded into H2O memory
      - This is how all the above steps looks like:
      ![](https://github.com/Avkash/mldl/blob/master/images/flow-file-ingest.png?raw=true)
   - Python
```  
import h2o
h2o.import_file()
``` 
  - R
```  
library(h2o)
h2o.importFile()
```      
   - Scala
```   
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/prostate.csv"))
```

### Importing Multiple Files (FLOW | Python | R | Scala) ###
   - FLOW
   - python
   - R
     - 
     - h2o.importFile()
   - Scala
   
### Uploading a File (FLOW | Python | R | Scala) ###

### Ingesting data from SQL (Python | R) ###

### Understanding Data distribution in memory ###

