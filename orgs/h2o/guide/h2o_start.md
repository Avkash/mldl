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

## Starting H2O manually on multiple machines or in "Cluster Mode" ##
  There are 2 different ways you can start H2O cluster on multiple machines if you decide to create your own H2O cluster. 
  - Multicast Method
  - Flatfile Method

### Multicast Method ###
 - Select all the machines where you want to run H2O into cluster mode
 - Make sure your network supports multicast communication in between network machines
 - Now copy h2o.jar into a specific folder at all of the machines. You must make sure h2o.jar version is same on all machines
 - Now you need to start H2O process on all of these machines manually. H2O does not have a manager to do this job.
 - Visit all machines and start H2O cluster with exact same "-name" parameter values i.e. as below
   - Machine 1: $ java -jar h2o.jar -name "my-unique-cluster-1234"
   - Machine 2: $ java -jar h2o.jar -name "my-unique-cluster-1234"
   - Machine n: $ java -jar h2o.jar -name "my-unique-cluster-1234"
 - When all java processes will start on all machines, it will form a cloud of H2O nodes with the exact same name process. 
 - You will get all the nodes included in the H2O cluster where H2O process is running with the exact same name process. 
 - You can not add any new nodes once the cluster is up and running
 - Remove of any node or if any of the java process dies in any node due to any reason will kill H2O cluster.
 
### Flatfile Method ###
 - Select all the machines where you want to run H2O into cluster mode
 - Make sure your network supports general IP/UDP communication in between network machines (i.e. no firewall blocking)
 - Create a list of ip address on all selected machines and note down into specific file name i.e. flatfile.txt as below
   - $ cat flatfile.txt
     - 192.168.10.101:54322
     - 192.168.10.102:54322
     - 192.168.10.103:54322
 - Now copy h2o.jar into a specific folder at all of the machines. You must make sure h2o.jar version is same on all machines
 - Make sure to copy the exact same flatfile.txt on all the machine where H2O.jar is copies for easier accessibility
 - Now you need to start H2O process on all of these machines manually. H2O does not have a manager to do this job.
 - Visit all machines and start H2O cluster with exact same "-name" parameter values i.e. as below
   - Machine 1: $ java -jar h2o.jar -flatfile flatfile.txt
   - Machine 2: $ java -jar h2o.jar -flatfile flatfile.txt
   - Machine n: $ java -jar h2o.jar -flatfile flatfile.txt
 - When all java processes will start on all machines, it will form a cloud of H2O nodes with the exact same name process. 
 - You will get all the nodes included in the H2O cluster where H2O process is running with the exact same name process. 
 - You can not add any new nodes once the cluster is up and running
 - Remove of any node or if any of the java process dies in any node due to any reason will kill H2O cluster.
 
## Starting H2O from Hadoop cluster ##
  - Visit [here](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_cluster_hadoop.md)
  
## Starting H2O from Spark Cluaster ##
  - Visit [here](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/cluster/h2o_cluster_spark.md)
