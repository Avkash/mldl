
## Copy the model and genmodel from exported location to into the Hive UDF project $$

```
$ cp generated_model/h2o-genmodel.jar localjars
$ cd src/main/
$ mkdir resources
$ cp generated_model/GBMModel.zip src/main/java/resources/ai/h2o/hive/udf/GBMModel.zip
```

## Update the pom.xml to Reflect Hadoop and Hive Versions ##

Get your version numbers using:
```
$ hadoop version
$ hive --version

And plug these into the <properties> section of the pom.xml file. Currently, the configuration is set for pulling the necessary dependencies for Hortonworks. For other Hadoop distributions, you will also need to update the <repositories> section to reflect the respective repositories (a commented-out link to a Cloudera repository is included).

```

## Now Compiling the UDF Jar File ###

You must have maven 3.5.0 or newer maven because older maven may not work.

```
$ mvn compile
$ mvn package -Dmaven.test.skip=true

[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ ScoreData ---
[INFO] Building jar: /h2oai/h2o-tutorials/tutorials/hive_udf_template/hive_udf_mojo_template/target/ScoreData-1.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
```


## Copying dataset to HDFS ##


```
 $ hadoop fs -copyFromLocal prostate.csv /user/avkash/prostate
 $ hadoop fs -ls /user/avkash/prostate
 $ hadoop fs -cat /user/avkash/prostate/prostate.csv
```

## Adding  test dataset into Hive ##

```
hive > CREATE EXTERNAL TABLE prostate_data_set (ID INT, CAPSULE INT, AGE INT, RACE INT, DPROS INT, DCAPS INT, PSA INT, VOL INT, GLEASON INT) COMMENT 'prostate test data' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE location '/user/avkash/prostate' tblproperties ("skip.header.line.count"="1");

hive > ANALYZE TABLE prostate_data_set COMPUTE STATISTICS;

hive > select * from prostate_data_set limit 10;
OK
1	0	65	1	2	1	1	0	6
2	0	72	1	3	2	6	0	7
3	0	70	1	1	2	4	0	6
4	0	76	2	2	1	51	20	7
5	0	69	1	1	1	12	55	6
6	1	71	1	3	2	3	0	8
7	0	68	2	4	2	31	0	7
8	0	61	2	4	2	66	27	7
9	0	69	1	1	1	3	24	7
10	0	68	2	1	2	13	0	6

```

## Copying the final builds files to HDFS

Copy the following two files from local development enviroment to HDFS
 - ScoreData-1.0-SNAPSHOT.jar
 - h2o-genmodel.jar 

```
~$ hadoop fs -copyFromLocal h2o-genmodel.jar /user/avkash
~$ hadoop fs -copyFromLocal ScoreData-1.0-SNAPSHOT.jar /user/avkash
~$ hadoop fs -ls /user/avkash
-rw-r--r--   3 avkash avkash      71560 2017-09-13 17:46 /user/avkash/ScoreData-1.0-SNAPSHOT.jar
-rw-r--r--   3 avkash avkash    7030878 2017-09-13 17:45 /user/avkash/h2o-genmodel.jar
drwxr-xr-x   - avkash avkash          0 2017-09-13 17:36 /user/avkash/prostate
-rw-r--r--   3 avkash avkash       9254 2017-09-13 17:33 /user/avkash/prostate.csv
```

## Adding JAR files to Hive ##

```

hive> ADD JAR hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/h2o-genmodel.jar;

   converting to local hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/h2o-genmodel.jar
   Added [/tmp/e50722e8-c498-4839-95bd-6776045a19fc_resources/h2o-genmodel.jar] to class path
   Added resources: [hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/h2o-genmodel.jar]

hive> ADD JAR hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/ScoreData-1.0-SNAPSHOT.jar;
   converting to local hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/ScoreData-1.0-SNAPSHOT.jar
   Added [/tmp/e50722e8-c498-4839-95bd-6776045a19fc_resources/ScoreData-1.0-SNAPSHOT.jar] to class path
   Added resources: [hdfs://mr-0xd1-precise1.0xdata.loc:8020/user/avkash/ScoreData-1.0-SNAPSHOT.jar]

hive> CREATE TEMPORARY FUNCTION scoredata AS 'ai.h2o.hive.udf.ScoreDataUDF';
   OK
   Time taken: 0.512 seconds

```
## Validating the scoredata function is in give ##

While running "show functions;" command at give you can see the function is listed properly.

```
hive> show functions;
  ....
  rpad
  rtrim
  scoredata
  second
  sentences
  ...
```

## Testing the solution in Hive ## 

Now we are going to score first 10 rows from our dataset using the scoredata function as below:

```
hive> SELECT scoredata(ID, AGE, RACE, DPROS, DCAPS, PSA, VOL, GLEASON) FROM prostate_data_set LIMIT 10;

Query ID = avkash_20170913175151_7834edf7-4c4d-47db-9ac5-08706f7d3806
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1499294366934_0510, Tracking URL = http://mr-0xd1-precise1.0xdata.loc:8088/proxy/application_1499294366934_0510/
Kill Command = /opt/cloudera/parcels/CDH-5.8.4-1.cdh5.8.4.p0.5/lib/hadoop/bin/hadoop job  -kill job_1499294366934_0510
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2017-09-13 17:51:28,491 Stage-1 map = 0%,  reduce = 0%
2017-09-13 17:51:34,814 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.64 sec
MapReduce Total cumulative CPU time: 1 seconds 640 msec
Ended Job = job_1499294366934_0510
MapReduce Jobs Launched:
Stage-Stage-1: Map: 1   Cumulative CPU: 1.64 sec   HDFS Read: 49778 HDFS Write: 40 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 640 msec
OK
0.0
0.0
0.0
0.0
0.0
1.0
0.0
0.0
0.0
0.0
Time taken: 16.303 seconds, Fetched: 10 row(s)

```

## Things to look ##

 - Look at the UDF function source code
