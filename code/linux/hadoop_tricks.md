## Hadoop Tricks ##

### How to get Hadoop Namenode info and full HDFS path for files and folders: ###

To get Namenode info run the following command:
```
$ hdfs getconf -namenodes
 my-hadoop.h2oai.com
```
Once you have Namenode Info you can, that to create the full path to acess files:
```
$ hadoop fs -ls hdfs://my-hadoop.h2oai.com:/
Found 3 items
drwxrwxrwx   - hdfs supergroup          0 2017-10-09 08:12 hdfs://my-hadoop.h2oai.com:/datasets
drwxrwxrwt   - avkash avkash                0 2017-03-14 09:46 hdfs://my-hadoop.h2oai.com:/tmp
drwxr-xr-x   - avkash avkash                0 2017-06-15 16:34 hdfs://my-hadoop.h2oai.com:/user
```
