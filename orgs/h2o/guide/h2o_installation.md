# H2O Installation #

H2O run on Linux, Windows and OSX environment and can be set to run either single node or in clustered mode i.e. running on multiple machine.

### Single Node (Standalone Mode): ###
 - You just need to download h2o binaries and run as Java process. 
 - It is a 2 step process
   - Download the zip and unzip
   - Run it using Java runtime
     - Windows     : C:\h2o_unzip_folder> java -jar h2o.jar
     - Linux & OSX : $ java -jar h2o.jar
 
### Multiple Node (Cluster Mode) : ###
 - You can run multinode H2O in 2 different ways
   - Multicast Method
     - Make sure your network support multicast network
     - Copy h2o.jar on all the machines where you want to run H2O
     - Run H2O jar by passing "-name" parameter with same name on all the machines as below:
       - Machine 1: java -jar h2o.jar -name "my_h2o_cluster_x"
       - Machine 2: java -jar h2o.jar -name "my_h2o_cluster_x"
       - Machine n: java -jar h2o.jar -name "my_h2o_cluster_x"       
     - When all the process with run on all the machines they will find each other and form a H2O cluster
   - Flatfile Method
     - First Copy h2o.jar in all the machines where you want to run H2O
     - Next create a text file (i.e. flatfile.txt) with all the machines IP address where you want to run H2O
     - Copy that text file (i.e. flatfile.txt) to all the machine where h2o.jar is placed
     - Run the command as below on all the machines
       - Machine 1: java -jar h2o.jar -flatfile flatfile.txt
       - Machine 2: java -jar h2o.jar -flatfile flatfile.txt
       - Machine n: java -jar h2o.jar -flatfile flatfile.txt              
 - #### On Hadoop Cluster as Hadoop MapReduce Job ####
   - Download Hadoop distribution of H2O as h2odriver.jar
 - #### On Spark cluster as Spark Job managed by YARN ####
   - Sparkling Water supports Spark 2.0, 2.1 and 2.2 along with older Spark 1.6  
   - Download Sparkling Water binaries baed on your Spark version as 
 
## Downloading H2O ##
 - #### Home of H2O Download ####
   - [https://www.h2o.ai/download/](https://www.h2o.ai/download/)
   - When in doubt select the "Latest Stable Release"
   - What is nightly build?
     - H2O automated build process build source code in nightly basis with the latest code pushed by the team, a very common open source practice. 
     - This is mostly untested code or mostly passed through automated code test run
     - Use at your own risk
 - #### Running on Windows/Linux/OSX: ####
   - Download H2O binaries on your machine
 - #### Downloading from R ####
   - Install H2O R Package on your R environment
     - CMD> install.packages("h2o", type="source", repos="URL_TO_THE_H2O_VERSION_R_DOWNLOAD")
 - #### Running from Python ####
   - Install H2O Python Package on your python environment
     - CMD> pip install URL_TO_THE_H2O_VERSION_R_DOWNLOAD

## Running H2O ##
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

## Running from Hadoop cluster ##
 - Download H2O hadoop driver on one of your Datanode (You just need to download only on ONE Datanode)
 - Unzip it using a local user name who has write permissing on HDFS
 - Decide the following settings:
   - Total number of nodes you want to run (set -nodes parameter with the desired count)
   - Memory you want to set for each node (set -mapperXmx parameter with proper desired memory)
   - Output folder (set -output parameter with a folder name on HDFS which does not exist, will be created at runtime)
 - Run the command as below from one of the node:
   - $ hadoop jar h2odriver.jar -nodes 1 -mapperXmx 6g -output hdfsOutputDirName 
 
## Running from Spark Cluaster ##
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


