# Visualizing and Understanding Dataset Distribution into H2O memory from FLOW #

I have uploaded the following file from HDFS to "3 nodes H2O cluster":
```
$ hadoop fs -ls hdfs://hadoop.h2o.ai/user/avkash/allyears.1987.2013.csv
15634874527 Bytes or 15.634874527 GB
Rows - 152,360,031 (152 Millions)
```

### This is how Airline dataset in H2O memory (Compressed) ###
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_airline_data.png?raw=true)

Note: 15.6 GB is compressed into 5GB into H2O memory.

### Disribution of Data into multiple nodes based on size and records ###
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_airline_dist_summary.png?raw=true)

Note: 
 - You can see that all 3 nodes have about 1.6GB data distributed evenly
 - You will also see that total 152,360,031 rows are distributed evenly around 50 Millions on each node.
 
### Distribution of data into multiple pieces (chunks and Vecs) ###
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_airline_compression.png?raw=true)
