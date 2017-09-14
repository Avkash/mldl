
## Building the UDF Jar File ###


[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ ScoreData ---
[INFO] Building jar: /h2oai/h2o-tutorials/tutorials/hive_udf_template/hive_udf_mojo_template/target/ScoreData-1.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS


## Copying dataset to HDFS ##

 $ hadoop fs -copyFromLocal prostate.csv /user/avkash/prostate
 $ hadoop fs -ls /user/avkash/prostate
 $ hadoop fs -cat /user/avkash/prostate/prostate.csv

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



