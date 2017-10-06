## Herringbone ##

Herringbone is a suite of tools for working with parquet files on hdfs, and with impala and hive.
[https://github.com/stripe/herringbone](https://github.com/stripe/herringbone)

## Installation: ##

Note: You must be using a Hadoop machine and herringbone needs Hadoop environmet. 

### Pre-requsite : Thrift  ###

 - Thrift 0.9.1 (MUST have 0.9.1 as 0.9.3 and 0.10.0 will give error while packaging)
 - Get thrift 0.9.1 [Link](https://archive.apache.org/dist/thrift/0.9.1/)
   - Download      - $ wget https://archive.apache.org/dist/thrift/0.9.1/thrift-0.9.1.tar.gz
   - Unzip         - $ tar -xvf  thrift-0.9.1.tar.gz
   - Configure     - $ cd thrift-0.9.1.tar.gz; $ ./configure
   - Make          - $ sudo make
   - Make install  - $ sudo make install 
   - Check version - $ thrift --version

### Pre-requsite : Impala  ###
  
 - First setup Cloudera repo in your machine:
   - Go to specific folder:   $ cd /etc/apt/sources.list.d/
   - Get the cloudera repo:   $ wget http://archive.cloudera.com/impala/ubuntu/precise/amd64/impala/cloudera.list
   - Update your Ubuntu repo: $ sudo apt-get update
 - Install Impala
   - Install impala            : $ sudo apt-get install impala
   - Install impala Server     : $ sudo apt-get install impala-server 
   - Install impala stat-store : $ sudo apt-get install impala-state-store
   - Install impala shell      : $ sudo apt-get install impala-shell
   - Verify  : impala          : $ impala-shell

```
impala-shell
Starting Impala Shell without Kerberos authentication
Connected to mr-0xd7-precise1.0xdata.loc:21000
Server version: impalad version 2.6.0-cdh5.8.4 RELEASE (build 207450616f75adbe082a4c2e1145a2384da83fa6)
Welcome to the Impala shell. Press TAB twice to see a list of available commands.

Copyright (c) 2012 Cloudera, Inc. All rights reserved.

(Shell build version: Impala Shell v1.4.0-cdh4-INTERNAL (08fa346) built on Mon Jul 14 15:52:52 PDT 2014)
```

### Building : Herringbone source  ###

 - Clone git repo     :  $ git clone https://github.com/stripe/herringbone.git
 - go to folder       :  $ cd herringbone
 - Using mvn to build : $ mvn package

Here is the successful herringbone "mvn package" command log for your review:

```
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] Herringbone Impala
[INFO] Herringbone Main
[INFO] Herringbone
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Herringbone Impala 0.0.2
[INFO] ------------------------------------------------------------------------
..
..
..
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Herringbone 0.0.1
[INFO] ------------------------------------------------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO]
[INFO] Herringbone Impala ................................. SUCCESS [ 2.930 s]
[INFO] Herringbone Main ................................... SUCCESS [ 13.012 s]
[INFO] Herringbone ........................................ SUCCESS [ 0.000 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 16.079 s
[INFO] Finished at: 2017-10-06T11:27:20-07:00
[INFO] Final Memory: 90M/1963M
[INFO] ------------------------------------------------------------------------
```

### Using Herringbone  ###

Note: You must have fiels on Hadoop, not on local file system

Verify the file on Hadoop:

 -  ~/herringbone$ hadoop fs -ls /user/avkash/file-test1.parquet
 -  -rw-r--r--   3 avkash avkash    1463376 2017-09-13 16:56 /user/avkash/file-test1.parquet
 -  ~/herringbone$ bin/herringbone flatten -i /user/avkash/file-test1.parquet
 
```
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/home/avkash/herringbone/herringbone-main/target/herringbone-0.0.1-jar-with-dependencies.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/cloudera/parcels/CDH-5.8.4-1.cdh5.8.4.p0.5/jars/slf4j-log4j12-1.7.5.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
17/10/06 12:06:44 INFO client.RMProxy: Connecting to ResourceManager at mr-0xd1-precise1.0xdata.loc/172.16.2.211:8032
17/10/06 12:06:45 INFO Configuration.deprecation: mapred.max.split.size is deprecated. Instead, use mapreduce.input.fileinputformat.split.maxsize
17/10/06 12:06:45 INFO input.FileInputFormat: Total input paths to process : 1
17/10/06 12:06:45 INFO Configuration.deprecation: mapred.min.split.size is deprecated. Instead, use mapreduce.input.fileinputformat.split.minsize
1 initial splits were generated.
  Max: 1.34M
  Min: 1.34M
  Avg: 1.34M
1 merged splits were generated.
  Max: 1.34M
  Min: 1.34M
  Avg: 1.34M
17/10/06 12:06:45 INFO mapreduce.JobSubmitter: number of splits:1
17/10/06 12:06:45 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499294366934_0707
17/10/06 12:06:45 INFO impl.YarnClientImpl: Submitted application application_1499294366934_0707
17/10/06 12:06:46 INFO mapreduce.Job: The url to track the job: http://mr-0xd1-precise1.0xdata.loc:8088/proxy/application_1499294366934_0707/
17/10/06 12:06:46 INFO mapreduce.Job: Running job: job_1499294366934_0707
17/10/06 12:06:52 INFO mapreduce.Job: Job job_1499294366934_0707 running in uber mode : false
17/10/06 12:06:52 INFO mapreduce.Job:  map 0% reduce 0%
17/10/06 12:07:22 INFO mapreduce.Job:  map 100% reduce 0%
```
Now verify the file:

~/herringbone$ hadoop fs -ls /user/avkash/file-test1.parquet-flat

```
Found 2 items
-rw-r--r--   3 avkash avkash          0 2017-10-06 12:07 /user/avkash/file-test1.parquet-flat/_SUCCESS
-rw-r--r--   3 avkash avkash    2901311 2017-10-06 12:07 /user/avkash/file-test1.parquet-flat/part-m-00000.parquet
```


