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


