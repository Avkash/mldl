# H2O in Hadoop Cluster #
You can run H2O as mapreduce job (either managed by Hadoop Job tracker or YARN manager) by using H2O driver binary based on your specific version of Hadoop. 

### Supported Platform ###
H2O supports the following Hadoop platforms:
 - Cloudera 
 - Hortworks HDP
 - Mapr 
 - Apache Hadoop

### Getting the binaries ###
 - Based on the H2O version you choose ( Choose latest if you can), visit H2O download page
   - https://www.h2o.ai/download/   
 - Download proper H2O driver package (ZIP file) depending on your Hadoop version
 - ![](?raw=true)
 - You just need to download the H2O driver ZIP on one of the Datanode where you have permission 
 - Once zip file is availalbe, please unzip it
 - You must see h2odriver.jar file along with other files. 
 - You just need h2odriver.jar to start H2O cluster on Hadoop.
 
## Starting H2O from Hadoop cluster ##
 - Download H2O hadoop driver on one of your Datanode (You just need to download only on ONE Datanode)
 - Unzip it using a local user name who has write permissing on HDFS
 - Decide the following settings:
   - Total number of nodes you want to run (set -nodes parameter with the desired count)
   - Memory you want to set for each node (set -mapperXmx parameter with proper desired memory)
   - Output folder (set -output parameter with a folder name on HDFS which does not exist, will be created at runtime)
 - Run the command as below from one of the node:
```
 $ hadoop jar h2odriver.jar -nodes 1 -mapperXmx 6g -output hdfsOutputDirName 
```  
 - You can also set the log levels for your Hadoop job as below:
``` 
   - $ hadoop jar h2odriver.jar -nodes 3 -JJ '-Dai.h2o.log_level=WARN' -mapperXmx 3g -output tmp/to1
```

### Cluster Setting ####
