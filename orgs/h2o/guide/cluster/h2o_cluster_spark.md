# H2O on Spark Cluster with Sparkling Water #
You can H2O in Spark environment by using Sparkling Water application which is just H2O packaged assemblies to support various Spark versions. You can run Sparkling Water one any environment where Spark is running as long as Spark version is supported by H2O Sparkling Water. 

### Supported Platform ###
Currently H2O Sparkling Water supports the following Spark versions running anywhere either on local Spark cluster, Spark on Hadoop or Databricks Cloud:  
 - Spark 1.6
 - Spark 2.0
 - Spark 2.1
 - Spark 2.2
 
### Getting Sparkling Water binaries (Download Sparkling Water Assemblies) ###
  - Visit the H2O download URL as below
   - https://www.h2o.ai/download/
  - Visit the Sparkling Water section to download Sparling Water assmebies depending your spark version
  - Unzip the files to the local file system where you have proper permission
  
### Installation on Spark Cluster ###
 - You must have Spark (desired version) accessible on the machine where you want to run Sparkling Water
   - It could be copied locally as 
     - /Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
   - It could be on a Hadoop cluster
     - Spark on Cloudera  >> /opt/cloudera/parcels/CDH/lib/spark
   - It could be on Apache Hadoop or Hortonworks Cluster
     - HADOOP_CONF_DIR=/etc/hadoop/conf
 - Download Sparkling Water package (zip) on one of your Spark node 
   - You just need to copy only on ONE Datanode or Spark Node
   - The Node must have physical access to Spark runtime on the same DataNode

### Starting H2O from Spark Cluster Internal - Local Mode ###
  - Setup environment to run in Internal Local Mode 
    - export MASTER="local[*]" 
    - export SPARK_HOME=/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
    - export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
  - Decide the key configuration
    - Total number of executors (set --num-executors parameter )
    - Total number of CPU core for each executor (set --executor-cores parameter)
    - Memory for executor process (set --executor-memory parameter)
    - Memory for the driver process (set --driver-memory parameter)
  - Running from the command line:
    - $ bin/sparkling-shell --num-executors 3 --executor-memory 2g --executor-cores 1
    - $ bin/sparkling-shell --conf "spark.executor.memory=1g"
    
### Starting H2O from Spark Cluster Internal - Cluster or YARN Mode ###
  - Setup environment to run in Local Cluster Mode
    - export MASTER="yarn-client" 
    - export SPARK_HOME=/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
    - export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
  - Running from the command line:
    - $ bin/sparkling-shell --num-executors 10 --executor-memory 10g --executor-cores 4
    - $ bin/sparkling-shell --conf "spark.executor.memory=1g"

### Starting H2O with Sparkling Water from Scala ###
Once you have Spark and Sparkling Water available in your machine, you can run H2O from Sparkling Water shell as below: 
```
sparkling-water-2.1.16$> bin/sparkling-shell  
-----
  Spark master (MASTER)     : local[*]
  Spark home   (SPARK_HOME) : /Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
  H2O build version         : 3.14.0.7 (weierstrass)
  Spark build version       : 2.1.1
  Scala version             : 2.11
----
Spark context Web UI available at http://10.0.0.46:4040
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.1.0
      /_/

Using Scala version 2.11.8 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_101)
Type in expressions to have them evaluated.
Type :help for more information.

scala> import org.apache.spark.h2o._
import org.apache.spark.h2o._

scala> val hc = H2OContext.getOrCreate(spark)
...
...
hc: org.apache.spark.h2o.H2OContext =

Sparkling Water Context:
 * H2O name: sparkling-water-avkashchauhan_local-1509317501071
 * cluster size: 1
 * list of used nodes:
  (executorId, host, port)
  ------------------------
  (driver,10.0.0.46,54321)
  ------------------------

  Open H2O Flow in browser: http://10.0.0.46:54321 (CMD + click in Mac OSX)
```

Now you can connect to H2O running in Scala from Web(FLOW), R or Python as described above. 

### Launching Cluster (deploy mode - client vs cluster) ###
 - In internal mode, H2O cluser is created automatically during the call of H2OContext.getOrCreate when it is initiate in the user code. 
 - In external mode, H2O cluster runs separately from the rest of Spark application. This separation gives H2O more stability since H2O is no longer affected by Spark executors being killed.
 - External cluster is deployed two ways: 
   - Manual External Mode: Sparkling Water starts H2O cluster
   - Automatic External Mode: The H2O cluster is started automatically based on given configuration. 
 - In both modes, we can't use regular H2O/H2O driver jar as main artifact for external H2O cluster, but we need to extend it by classes required by Sparkling Water. 
 - Users are expected to extend the H2O/H2O driver jar and build the artifacts on their own using steps provided [here](https://github.com/h2oai/sparkling-water/blob/master/doc/tutorials/backends.rst).
 - Learn more about Sparkling Water client or cluster mode [here](https://github.com/h2oai/sparkling-water/blob/master/doc/tutorials/backends.rst)
