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


## Starting H2O with Sparkling Water from Scala ##
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
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=384m; support was removed in 8.0
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
Spark context Web UI available at http://10.0.0.46:4040
Spark context available as 'sc' (master = local[*], app id = local-1509317501071).
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
10-29 15:53:22.090 10.0.0.46:54321       38806  #r thread INFO: Found XGBoost backend with library: xgboost4j
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: Your system supports only minimal version of XGBoost (no GPUs, no multithreading)!
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: ----- H2O started  -----
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: Build git branch: rel-weierstrass
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: Build git hash: f1f65fe382ac4a0dc4631b9ee1468eb8eef7b27e
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: Build git describe: jenkins-3.14.0.6-6-gf1f65fe38
10-29 15:53:22.104 10.0.0.46:54321       38806  #r thread INFO: Build project version: 3.14.0.7 (latest version: 3.14.0.7)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Build age: 8 days
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Built by: 'jenkins'
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Built on: '2017-10-20 18:37:17'
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Build git branch: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Build git hash: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Build git describe: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Build project version: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Built by: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: Watchdog Built on: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Build git branch: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Build git hash: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Build git describe: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Build project version: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Built by: (unknown)
10-29 15:53:22.105 10.0.0.46:54321       38806  #r thread INFO: XGBoost Built on: (unknown)
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Processed H2O arguments: [-name, sparkling-water-avkashchauhan_local-1509317501071, -ga_opt_out, -log_level, INFO, -baseport, 54321, -ip, 10.0.0.46, -log_dir, /Volumes/OSxexT/tools/sw2/sparkling-water-2.1.16/h2ologs/local-1509317501071]
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Java availableProcessors: 8
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Java heap totalMemory: 919.5 MB
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Java heap maxMemory: 2.67 GB
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Java version: Java 1.8.0_101 (from Oracle Corporation)
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: JVM launch parameters: [-Dscala.usejavacp=true, -Xmx3G, -XX:MaxPermSize=384m]
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: OS version: Mac OS X 10.12.6 (x86_64)
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Machine physical memory: 16.00 GB
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: X-h2o-cluster-id: 1509317600107
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: User name: 'avkashchauhan'
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Opted out of sending usage metrics.
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: IPv6 stack selected: false
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:4bc9:91fe:2e9:74cf%utun0/name:utun0 (utun0)
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:1cc3:38ff:fef8:21f2%awdl0/name:awdl0 (awdl0)
10-29 15:53:22.106 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:0:0:0:c770
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:f03f:b621:4757:972
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:1c6c:26:e862:7761
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: en0 (en0), fe80:0:0:0:1803:7d61:b60a:f79c%en0
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: en0 (en0), 10.0.0.46
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: lo0 (lo0), fe80:0:0:0:0:0:0:1%lo0
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: lo0 (lo0), 0:0:0:0:0:0:0:1
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: Possible IP Address: lo0 (lo0), 127.0.0.1
10-29 15:53:22.107 10.0.0.46:54321       38806  #r thread INFO: H2O node running in unencrypted mode.
10-29 15:53:22.110 10.0.0.46:54321       38806  #r thread INFO: Internal communication uses port: 54322
10-29 15:53:22.110 10.0.0.46:54321       38806  #r thread INFO: Listening for HTTP and REST traffic on http://10.0.0.46:54321/
10-29 15:53:22.142 10.0.0.46:54321       38806  #r thread INFO: H2O cloud name: 'sparkling-water-avkashchauhan_local-1509317501071' on /10.0.0.46:54321, discovery address /228.169.143.11:58537
10-29 15:53:22.143 10.0.0.46:54321       38806  #r thread INFO: If you have trouble connecting, try SSH tunneling from your local machine (e.g., via port 55555):
10-29 15:53:22.143 10.0.0.46:54321       38806  #r thread INFO:   1. Open a terminal and run 'ssh -L 55555:localhost:54321 avkashchauhan@10.0.0.46'
10-29 15:53:22.143 10.0.0.46:54321       38806  #r thread INFO:   2. Point your browser to http://localhost:55555
10-29 15:53:22.274 10.0.0.46:54321       38806  #r thread INFO: Log dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.16/h2ologs/local-1509317501071'
10-29 15:53:22.274 10.0.0.46:54321       38806  #r thread INFO: Cur dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.16'
10-29 15:53:22.284 10.0.0.46:54321       38806  #r thread INFO: HDFS subsystem successfully initialized
10-29 15:53:22.293 10.0.0.46:54321       38806  #r thread INFO: S3 subsystem successfully initialized
10-29 15:53:22.293 10.0.0.46:54321       38806  #r thread INFO: Flow dir: '/Users/avkashchauhan/h2oflows'
10-29 15:53:22.307 10.0.0.46:54321       38806  #r thread INFO: Cloud of size 1 formed [/10.0.0.46:54321]
10-29 15:53:22.347 10.0.0.46:54321       38806  #r thread INFO: Registered parsers: [GUESS, ARFF, XLS, SVMLight, AVRO, ORC, PARQUET, CSV]
10-29 15:53:22.347 10.0.0.46:54321       38806  #r thread INFO: Watchdog extension initialized
10-29 15:53:22.347 10.0.0.46:54321       38806  #r thread INFO: XGBoost extension initialized
10-29 15:53:22.347 10.0.0.46:54321       38806  #r thread INFO: Registered 2 core extensions in: 24ms
10-29 15:53:22.347 10.0.0.46:54321       38806  #r thread INFO: Registered H2O core extensions: [Watchdog, XGBoost]
10-29 15:53:22.823 10.0.0.46:54321       38806  #r thread INFO: Registered: 161 REST APIs in: 476ms
10-29 15:53:22.823 10.0.0.46:54321       38806  #r thread INFO: Registered REST API extensions: [XGBoost, Algos, AutoML, Core V3, Core V4]
10-29 15:53:22.958 10.0.0.46:54321       38806  #r thread INFO: Registered: 246 schemas in 135ms
10-29 15:53:22.958 10.0.0.46:54321       38806  #r thread INFO: H2O started in 1654ms
10-29 15:53:22.958 10.0.0.46:54321       38806  #r thread INFO:
10-29 15:53:22.958 10.0.0.46:54321       38806  #r thread INFO: Open H2O Flow in your web browser: http://10.0.0.46:54321
10-29 15:53:22.958 10.0.0.46:54321       38806  #r thread INFO:
10-29 15:53:25.568 10.0.0.46:54321       38806  main      TRACE: H2OContext initialized
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
