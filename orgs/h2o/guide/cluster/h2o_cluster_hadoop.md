# H2O in Hadoop Cluster #

### Supported Platform ###

### Getting the binaries ###

## Starting H2O from Hadoop cluster ##
 - Download H2O hadoop driver on one of your Datanode (You just need to download only on ONE Datanode)
 - Unzip it using a local user name who has write permissing on HDFS
 - Decide the following settings:
   - Total number of nodes you want to run (set -nodes parameter with the desired count)
   - Memory you want to set for each node (set -mapperXmx parameter with proper desired memory)
   - Output folder (set -output parameter with a folder name on HDFS which does not exist, will be created at runtime)
 - Run the command as below from one of the node:
   - $ hadoop jar h2odriver.jar -nodes 1 -mapperXmx 6g -output hdfsOutputDirName 
 - You can also set the log levels for your Hadoop job as below:
   - $ hadoop jar h2odriver.jar -nodes 3 -JJ '-Dai.h2o.log_level=WARN' -mapperXmx 3g -output tmp/to1

### Cluster Setting ####
