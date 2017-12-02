# Selection of H2O Cluster size and node counts #

## Cluster size approximation ##
 - This of H2O cluster as a commodity which you turn on, get your job done, export results and desolve/remove/kill it.
 - H2O is not designed with high availability and long running server in minds, instead it is designed for speed and accuracy. 
 - All the data is in H2O cluster memory so when you will have to ingest data back if cluster no logger running.
 - The simple rule to create a cluster is to understand the size of data you want to process with H2O and then multiply 4-6 times to it and that will be the optimum size of your H2O cluster, you would need to create
 - H2O supports parallal ingest from import_file/importFile API, so data ingestion is super fast. 

## H2O Cluster type approximation ##
 - If you have enough memory (4-6x rule) to fit your source data, you should always create a single node cluster. This design removes overhead into distributed copy and processing, and expedite your training.
 - If you are working on tree based algorithm, its best to reduce the number of nodes. This will expedite the training time.
 - If you are working on GLM the performance with multiple nodes and or small nodes cluster will be similar.
 - If you data is very sparse, do not worry much, as H2O has capability to handle sparse data.   
 - For H2O cluster in Hadoop and/or spark, its best to provide as much memory as possible, and reduce the number of node count.
 - For Deep learning, you need as many as CPUs you can provide in your cluster. Add more CPUs will help you to achieve faster training time. 
