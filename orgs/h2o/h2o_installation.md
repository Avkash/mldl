# H2O installation #




## Creating H2O cluster on N machines ##

### Flatfile Method ###
 - Make sure all the machines are in same subnet
 - Create a file name flatfile.txt included all the nodes IP address and port as below:
   10.0.0.101:54321
   10.0.0.181:54321
 - This flatfile.txt must be same on all node and accessible to all nodes.
 - Make sure all machines have same version of h2o.jar download locally.
 - Now in EACH machine run the EXACT SAME command line as below:
   $ java -jar h2o.har -flatfile flatfile.txt -port 54321
 - Now access any of the machine to IP address and port above to access H2O
 
 Note: 
 - You dont not need SSH access or full open network between N machine 
 - You must need to make sure that 54321 and 54323 ports are open
 - When forming the cluster, do not open your webbrowser with FLOW UI untill all the clusters are up. Opening the webui in   between cause a known issue and the cluster will not be formed. 
  

### Multicast Method ### 
 - In this method you must make sure the multicast networking is enabled in between your machines. (EC2 instances does not have multicast enabled so it will not work)
 - Make sure all machines have same version of h2o.jar download locally.
 - Now in EACH machine run the EXACT SAME command line as below:
   $ java -jar h2o.har -name unique_cluster_name_xxyyzz -port 54321
 - As soon as the h2o process will run on all machines it will form a cluster of N nodes

Log Results:
- If 2 or more are set in flatfile.txt, you will see a log message showing the cluster is formed:
  - Cloud of size 2 formed [ip-10-0-0-101.ec2.internal/10.0.0.101:54321, ip-10-0-0-181.ec2.internal/10.0.0.181:54321]
