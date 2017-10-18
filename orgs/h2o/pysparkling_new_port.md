## Running Pysparkling session with external Port ##


### Setup your Environment ##
SPARK_HOME=/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6



### Launching pysparkling ###
~/tools/sw2/sparkling-water-2.1.14 $ bin/pysparkling

```
Python 2.7.13 |Anaconda 4.4.0 (x86_64)| (default, Dec 20 2016, 23:05:08)
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.57)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
Anaconda is brought to you by Continuum Analytics.
Please check out: http://continuum.io/thanks and https://anaconda.org
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
17/10/18 13:06:10 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
17/10/18 13:06:15 WARN ObjectStore: Failed to get database global_temp, returning NoSuchObjectException
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 2.1.0
      /_/

Using Python version 2.7.13 (default, Dec 20 2016 23:05:08)
SparkSession available as 'spark'.
```
### Importing proper libraries ###
```
>>> from pysparkling import *
>>> import h2o
>>> h2oConf = H2OConf(sc)
/private/var/folders/x7/331tvwcd6p17jj9zdmhnkpyc0000gn/T/avkashchauhan/spark/work/spark-f0906683-0a1d-4793-9b59-a1620af38bef/userFiles-cde245ca-8fff-458e-a6f4-9c1845731517/h2o_pysparkling_2.1-2.1.14.zip/pysparkling/conf.py:13: UserWarning: Method H2OContext.getOrCreate with argument of type SparkContext is deprecated and parameter of type SparkSession is preferred.
```

### Getting H2O Configuration ###
>>> h2oConf
```
Sparkling Water configuration:
  backend cluster mode : internal
  workers              : None
  cloudName            : Not set yet, it will be set automatically before starting H2OContext.
  flatfile             : true
  clientBasePort       : 54321
  nodeBasePort         : 54321
  cloudTimeout         : 60000
  h2oNodeLog           : INFO
  h2oClientLog         : WARN
  nthreads             : -1
  drddMulFactor        : 10
```

### Setting a new port to launch H2O ###
>>> h2oConf.set_client_port_base(54300)
```
Sparkling Water configuration:
  backend cluster mode : internal
  workers              : None
  cloudName            : Not set yet, it will be set automatically before starting H2OContext.
  flatfile             : true
  clientBasePort       : 54300
  nodeBasePort         : 54321
  cloudTimeout         : 60000
  h2oNodeLog           : INFO
  h2oClientLog         : WARN
  nthreads             : -1
  drddMulFactor        : 10
```  
>>> h2oConf.set_node_base_port(54300)
```
Sparkling Water configuration:
  backend cluster mode : internal
  workers              : None
  cloudName            : Not set yet, it will be set automatically before starting H2OContext.
  flatfile             : true
  clientBasePort       : 54300
  nodeBasePort         : 54300
  cloudTimeout         : 60000
  h2oNodeLog           : INFO
  h2oClientLog         : WARN
  nthreads             : -1
  drddMulFactor        : 10
```
### Viewing H2O Configuration ###
>>> h2oConf
```
Sparkling Water configuration:
  backend cluster mode : internal
  workers              : None
  cloudName            : Not set yet, it will be set automatically before starting H2OContext.
  flatfile             : true
  clientBasePort       : 54300
  nodeBasePort         : 54300
  cloudTimeout         : 60000
  h2oNodeLog           : INFO
  h2oClientLog         : WARN
  nthreads             : -1
  drddMulFactor        : 10
```
### Launching H2O Cluster in pysparkling ###
>>> hc = H2OContext.getOrCreate(spark, h2oConf)
```
17/10/18 13:07:32 WARN H2OContext: Method H2OContext.getOrCreate with an argument of type SparkContext is deprecated and parameter of type SparkSession is preferred.
17/10/18 13:07:32 WARN InternalH2OBackend: Increasing 'spark.locality.wait' to value 30000
17/10/18 13:07:32 WARN InternalH2OBackend: Due to non-deterministic behavior of Spark broadcast-based joins
We recommend to disable them by
configuring `spark.sql.autoBroadcastJoinThreshold` variable to value `-1`:
sqlContext.sql("SET spark.sql.autoBroadcastJoinThreshold=-1")
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 0:
[rdd_0_0]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 7:
[rdd_0_7]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 3:
[rdd_0_3]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 5:
[rdd_0_5]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 6:
[rdd_0_6]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 1:
[rdd_0_1]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 2:
[rdd_0_2]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 4:
[rdd_0_4]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 9:
[rdd_0_9]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 10:
[rdd_0_10]
17/10/18 13:07:33 WARN Executor: 1 block locks were not released by TID = 8:
[rdd_0_8]
10-18 13:07:34.409 10.0.0.46:54300       89996  #r thread INFO: Found XGBoost backend with library: xgboost4j
10-18 13:07:34.418 10.0.0.46:54300       89996  #r thread INFO: Your system supports only minimal version of XGBoost (no GPUs, no multithreading)!
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: ----- H2O started  -----
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Build git branch: rel-weierstrass
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Build git hash: 03e64d5c87f1eb7bcad9372bb4a73c4aab4f52d9
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Build git describe: jenkins-3.14.0.1-6-g03e64d5
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Build project version: 3.14.0.2 (latest version: 3.14.0.6)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Build age: 1 month and 26 days
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Built by: 'jenkins'
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Built on: '2017-08-21 22:18:30'
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Build git branch: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Build git hash: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Build git describe: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Build project version: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Built by: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: Watchdog Built on: (unknown)
10-18 13:07:34.419 10.0.0.46:54300       89996  #r thread INFO: XGBoost Build git branch: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: XGBoost Build git hash: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: XGBoost Build git describe: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: XGBoost Build project version: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: XGBoost Built by: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: XGBoost Built on: (unknown)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Processed H2O arguments: [-name, sparkling-water-avkashchauhan_local-1508357171822, -ga_opt_out, -log_level, INFO, -baseport, 54300, -ip, 10.0.0.46, -log_dir, /Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14/h2ologs/local-1508357171822]
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Java availableProcessors: 8
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Java heap totalMemory: 493.5 MB
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Java heap maxMemory: 910.5 MB
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Java version: Java 1.8.0_101 (from Oracle Corporation)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: JVM launch parameters: [-Xmx1g]
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: OS version: Mac OS X 10.12.6 (x86_64)
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Machine physical memory: 16.00 GB
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: X-h2o-cluster-id: 1508357252723
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: User name: 'avkashchauhan'
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Opted out of sending usage metrics.
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: IPv6 stack selected: false
10-18 13:07:34.420 10.0.0.46:54300       89996  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:3eea:c3b7:1ad4:317b%utun0/name:utun0 (utun0)
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:38e4:bff:febb:63e1%awdl0/name:awdl0 (awdl0)
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:0:0:0:c770
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:1d41:734d:6f21:e9
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:1c6c:26:e862:7761
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: en0 (en0), fe80:0:0:0:d5:151e:593:4a60%en0
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: en0 (en0), 10.0.0.46
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: lo0 (lo0), fe80:0:0:0:0:0:0:1%lo0
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: lo0 (lo0), 0:0:0:0:0:0:0:1
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: Possible IP Address: lo0 (lo0), 127.0.0.1
10-18 13:07:34.421 10.0.0.46:54300       89996  #r thread INFO: H2O node running in unencrypted mode.
10-18 13:07:34.423 10.0.0.46:54300       89996  #r thread INFO: Internal communication uses port: 54301
10-18 13:07:34.423 10.0.0.46:54300       89996  #r thread INFO: Listening for HTTP and REST traffic on http://10.0.0.46:54300/
10-18 13:07:34.455 10.0.0.46:54300       89996  #r thread INFO: H2O cloud name: 'sparkling-water-avkashchauhan_local-1508357171822' on /10.0.0.46:54300, discovery address /235.116.48.225:60276
10-18 13:07:34.455 10.0.0.46:54300       89996  #r thread INFO: If you have trouble connecting, try SSH tunneling from your local machine (e.g., via port 55555):
10-18 13:07:34.455 10.0.0.46:54300       89996  #r thread INFO:   1. Open a terminal and run 'ssh -L 55555:localhost:54300 avkashchauhan@10.0.0.46'
10-18 13:07:34.455 10.0.0.46:54300       89996  #r thread INFO:   2. Point your browser to http://localhost:55555
10-18 13:07:34.592 10.0.0.46:54300       89996  #r thread INFO: Log dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14/h2ologs/local-1508357171822'
10-18 13:07:34.592 10.0.0.46:54300       89996  #r thread INFO: Cur dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14'
10-18 13:07:34.601 10.0.0.46:54300       89996  #r thread INFO: HDFS subsystem successfully initialized
10-18 13:07:34.606 10.0.0.46:54300       89996  #r thread INFO: S3 subsystem successfully initialized
10-18 13:07:34.607 10.0.0.46:54300       89996  #r thread INFO: Flow dir: '/Users/avkashchauhan/h2oflows'
10-18 13:07:34.618 10.0.0.46:54300       89996  #r thread INFO: Cloud of size 1 formed [/10.0.0.46:54300]
10-18 13:07:34.662 10.0.0.46:54300       89996  #r thread INFO: Registered parsers: [GUESS, ARFF, XLS, SVMLight, AVRO, ORC, PARQUET, CSV]
10-18 13:07:34.662 10.0.0.46:54300       89996  #r thread INFO: Watchdog extension initialized
10-18 13:07:34.662 10.0.0.46:54300       89996  #r thread INFO: XGBoost extension initialized
10-18 13:07:34.663 10.0.0.46:54300       89996  #r thread INFO: Registered 2 core extensions in: 24ms
10-18 13:07:34.663 10.0.0.46:54300       89996  #r thread INFO: Registered H2O core extensions: [Watchdog, XGBoost]
10-18 13:07:35.037 10.0.0.46:54300       89996  #r thread INFO: Registered: 160 REST APIs in: 374ms
10-18 13:07:35.037 10.0.0.46:54300       89996  #r thread INFO: Registered REST API extensions: [XGBoost, Algos, AutoML, Core V3, Core V4]
10-18 13:07:35.148 10.0.0.46:54300       89996  #r thread INFO: Registered: 244 schemas in 110ms
10-18 13:07:35.148 10.0.0.46:54300       89996  #r thread INFO: H2O started in 1439ms
10-18 13:07:35.148 10.0.0.46:54300       89996  #r thread INFO:
10-18 13:07:35.148 10.0.0.46:54300       89996  #r thread INFO: Open H2O Flow in your web browser: http://10.0.0.46:54300
10-18 13:07:35.148 10.0.0.46:54300       89996  #r thread INFO:
```

### Getting H2O Cluster Status ###
>>> h2o.cluster_status()
```
10-18 13:07:41.000 10.0.0.46:54300       89996  Thread-2  TRACE: H2OContext initialized
Connecting to H2O server at http://10.0.0.46:54300... successful.
10-18 13:07:41.151 10.0.0.46:54300       89996  #6758-124 INFO: POST /4/sessions, parms: {}
10-18 13:07:41.155 10.0.0.46:54300       89996  #6758-124 INFO: Locking cloud to new members, because water.api.schemas4.SessionIdV4
10-18 13:07:41.175 10.0.0.46:54300       89996  #6758-125 INFO: POST /99/Rapids, parms: {ast=(setTimeZone "UTC"), session_id=_sid_a616}
10-18 13:07:41.329 10.0.0.46:54300       89996  #6758-126 INFO: GET /3/Capabilities/API, parms: {}
--------------------------  -------------------------------------------------
H2O cluster uptime:         07 secs
H2O cluster version:        3.14.0.2
H2O cluster version age:    1 month and 26 days
H2O cluster name:           sparkling-water-avkashchauhan_local-1508357171822
H2O cluster total nodes:    1
H2O cluster free memory:    758 Mb
H2O cluster total cores:    8
H2O cluster allowed cores:  8
H2O cluster status:         accepting new members, healthy
H2O connection url:         http://10.0.0.46:54300
H2O connection proxy:
H2O internal security:      False
H2O API Extensions:         XGBoost, Algos, AutoML, Core V3, Core V4
Python version:             2.7.13 final
--------------------------  -------------------------------------------------
>>>
>>> h2o.cluster_status()
[WARNING] in <stdin> line 1:
    >>> ????
        ^^^^ Deprecated, use ``h2o.cluster().show_status(True)``.
10-18 13:07:41.681 10.0.0.46:54300       89996  #6758-127 INFO: GET /3/Capabilities/API, parms: {}
--------------------------  -------------------------------------------------
H2O cluster uptime:         07 secs
H2O cluster version:        3.14.0.2
H2O cluster version age:    1 month and 26 days
H2O cluster name:           sparkling-water-avkashchauhan_local-1508357171822
H2O cluster total nodes:    1
H2O cluster free memory:    758 Mb
H2O cluster total cores:    8
H2O cluster allowed cores:  8
H2O cluster status:         accepting new members, healthy
H2O connection url:         http://10.0.0.46:54300
H2O connection proxy:
H2O internal security:      False
H2O API Extensions:         XGBoost, Algos, AutoML, Core V3, Core V4
Python version:             2.7.13 final
--------------------------  -------------------------------------------------
Nodes info:     Node 1
--------------  -------------------------
h2o             10.0.0.46/10.0.0.46:54300
healthy         True
last_ping       1508357260861
num_cpus        8
sys_load        2.921875
mem_value_size  0
free_mem        794852352
pojo_mem        159875072
swap_mem        0
free_disk       233269362688
max_disk        499987251200
pid             89996
num_keys        0
tcps_active     0
open_fds        -1
rpcs_active     0
```
### Closing or Shutting Down H2O Cluster Status ###

>>> h2o.shutdown()
```
[WARNING] in <stdin> line 1:
    >>> ????
        ^^^^ Deprecated, use ``h2o.cluster().shutdown()``.
10-18 13:08:00.737 10.0.0.46:54300       89996  #6758-128 INFO: GET /, parms: {}
10-18 13:08:00.740 10.0.0.46:54300       89996  #6758-128 INFO: GET /flow/index.html, parms: {}
10-18 13:08:00.746 10.0.0.46:54300       89996  #6758-129 INFO: POST /3/Shutdown, parms: {}
10-18 13:08:00.755 10.0.0.46:54300       89996  #6758-122 INFO: DELETE /4/sessions/_sid_a616, parms: {}
H2O session _sid_a616 closed.
````

End of the demo
