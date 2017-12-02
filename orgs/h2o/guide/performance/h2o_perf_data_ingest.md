# Data Ingest Performance in H2O #

Here are key points to remember when achieving great performance during data ingest into H2O:
- For large datasets, you should be using h2o.import_file
 - Please make sure that as.h2o API is mostly for small datasets
 - Please use upload_file/uploadFile API to move data from your local file system to H2O memory directly.
 - If ingesting data into H2O from a multinode H2O (standalone) cluster, you must copy the file on all the nodes otherwise use distributed file system i.e. Hadoop/HDFS. 

