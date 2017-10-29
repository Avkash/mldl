# Starting H2O Cluster #

## Starting H2O locally ##
 - #### Running on Windows/Linux/OSX: ####
   - Run > java -jar h2o.jar
 - #### Running from R ####
   - Load Binaries
     - CMD> library(h2o)
   - Initialize H2O
     - CMD> h2o.init()     
 - #### Running from Python ####
   - Load Binaries
     - CMD> import h2o
   - Initialize H2O
     - CMD> h2o.init()     

## Starting H2O from Hadoop cluster ##
 - Download H2O hadoop driver on one of your Datanode (You just need to download only on ONE Datanode)
 - Unzip it using a local user name who has write permissing on HDFS
 - Decide the following settings:
   - Total number of nodes you want to run (set -nodes parameter with the desired count)
   - Memory you want to set for each node (set -mapperXmx parameter with proper desired memory)
   - Output folder (set -output parameter with a folder name on HDFS which does not exist, will be created at runtime)
 - Run the command as below from one of the node:
   - $ hadoop jar h2odriver.jar -nodes 1 -mapperXmx 6g -output hdfsOutputDirName 
 
## Starting H2O from Spark Cluaster ##
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
 - #### Running Spark Local Mode #### 
   - Setup environment to run in Local Mode
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
 - #### Running Spark Cluster Mode ####
   - Setup environment to run in Local Mode
     - export MASTER="yarn-client" 
     - export SPARK_HOME=/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
     - export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
   - Running from the command line:
     - $ bin/sparkling-shell --num-executors 10 --executor-memory 10g --executor-cores 4
     - $ bin/sparkling-shell --conf "spark.executor.memory=1g"

