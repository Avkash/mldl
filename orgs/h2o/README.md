## H2O Articles ## 
 
 ### General H2O Specific Details ###
 - [Understanding H2O Rapids and tracking APIs](https://github.com/Avkash/mldl/blob/master/orgs/h2o/rapids_api.md)
 - [Key PR requests to learn the H2O Development](https://github.com/Avkash/mldl/blob/master/orgs/h2o/smart_pr.md)
 - [Working on a Pull Request (PR) to work on H2O source code and Merging into Master and Release Branch](https://github.com/Avkash/mldl/blob/master/orgs/h2o/pre_dev.md)
 - [Writing python code into H2O python API](https://github.com/Avkash/mldl/blob/master/orgs/h2o/python_dev.md)
 - [Python sample code to perform MOJO Scoring](https://github.com/Avkash/mldl/blob/master/code/python/python_mojo_score.md)
 - [Scoring using MOJO with Hive UDf Function](https://github.com/Avkash/mldl/blob/master/orgs/h2o/hive_udf_prostate.md)
 - [How to debug H2O with R]()
 - [rsparkling User Guide](https://github.com/Avkash/mldl/blob/master/code/R/rsparkling_guide.md)
 - [Creating H2O cluster of N machines using flatfile or multicast way](https://github.com/Avkash/mldl/blob/master/orgs/h2o/h2o_installation.md)

## Driverless AI ##
 - [Feature Engineering](https://github.com/h2oai/h2o-tutorials/blob/master/training/driverless_ai/DriverlessAI_FeatureEngineering.pdf)
 - [Experiment Settings and its impact](https://github.com/h2oai/h2o-tutorials/blob/master/training/driverless_ai/DriverlessAI_ExperimentSettings.md) 
 - [DRAFT Early Data Transformation document](https://github.com/h2oai/h2o-tutorials/blob/master/training/driverless_ai/DriverlessAI_Transformations.md)
 - [MLI Details](https://www.h2o.ai/wp-content/uploads/2017/09/MLI.pdf)
 - [DriverlessAI General Documentation](https://www.h2o.ai/wp-content/uploads/2017/09/driverlessai/index.html)
 - DriverlessAI Python Client Library
   - We also have an early version of the client library and coming soon to the early builds. 



## AI/ML Solutions using H2O ##
 - [HR Employ Attrition - H2o AutoML](http://www.business-science.io/business/2017/09/18/hr_employee_attrition.html)
  - [Autoencoders and anomaly detection with machine learning in fraud analytics](https://shiring.github.io/machine_learning/2017/05/01/fraud)
  - [Social Machine Learning with H2O, Twitter, python](https://www.linkedin.com/pulse/social-machine-learning-h2o-twitter-python-marios-michailidis)
 
### Presentations & Books ###
 - [H2O Machine Learning on Hadoop ](https://github.com/Avkash/mldl/blob/master/pages/docs/slidedecks/H2O-Hadoop-Full-Demo.pdf)
 - [H2O Model Deployment with MOJO and POJO](https://github.com/Avkash/mldl/blob/master/pages/docs/slidedecks/Model-deployment-Final.pdf)
 - [Practical Machine Learning with H2O  -  O'Reilly: Source Code and Datasets explained in the Book](https://github.com/DarrenCook/h2o)
 
### Deep Learning Algorithms ###
  - [Anomaly Detection Using H2O Deep Learning](https://dzone.com/articles/dive-deep-into-deep-learning-using-h2o-1)
  - [Anomaly Detection: Increasing Classification Accuracy with H2O's Autoencoder and R](http://amunategui.github.io/anomaly-detection-h2o/)
  - [Deep Learning session @ Statistical Learning and Data Mining IV course](https://github.com/ledell/sldm4-h2o/blob/master/sldm4-deeplearning-h2o.Rmd)

## Machine learning Expert Advice ## 
  - [Gradient Boosting, Decision Trees and XGBoost with CUDA](https://devblogs.nvidia.com/parallelforall/gradient-boosting-decision-trees-xgboost-cuda/)

## H2O Deep Water Build Process ##
 - [H2O Deep Water Build Guide](https://github.com/Avkash/mldl/blob/master/h2o_deepwater_build.md)
 - [A set of scikit-learn and h2o extension classes](https://github.com/tgsmith61591/skutil)
 - [Tips building H2O and Deep Water Source Code](https://aichamp.wordpress.com/2017/04/21/tips-building-h2o-and-deep-water-source-code/)

## H2O Packages ##
 - [Conda Python Packages](https://anaconda.org/h2oai/h2o/files)
   - To get a list of H2O package and their version at Conda visit link above.   
   - To install latest H2O package from conda you need to run command as below:
     - $ conda install -c h2oai h2o=3.14.0.2
 - [Pypi Python Packages](https://pypi.python.org/pypi/h2o)
 - Samples in H2O Code Branch
   - [Python Samples](https://github.com/h2oai/h2o-3/tree/c9e576170fb2d21fa928f39406593d0de9db072c/h2o-py/demos)
 
 
## Ingesting Data in H2O ##
  - Reading from Hive
    - The following command will give the hive table locaion on HDFS and use that location as data source to ingest file in H2O
       - hive > describe formatted <table_name>;
  
## H2O Hadoop Driver ##

The following is a successful Hadoop command to launch H2O Driver:

  ```
  avkash@my_server:~/h2o-3.14.0.2-cdh5.8$ hadoop jar h2odriver.jar -nodes 2 -mapperXmx 4g -output /user/avkash/007
Determining driver host interface for mapper->driver callback...
    [Possible callback IP address: x.x.x.x]
    [Possible callback IP address: 127.0.0.1]
Using mapper->driver callback IP address and port: x.x.x.x:51179
(You can override these with -driverif and -driverport/-driverportrange.)
Memory Settings:
    mapreduce.map.java.opts: -Xms4g -Xmx4g -XX:PermSize=256m -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Dlog4j.defaultInitOverride=true
    Extra memory percent: 10
    mapreduce.map.memory.mb: 4505
17/10/13 07:49:45 INFO client.RMProxy: Connecting to ResourceManager at my_hadoop_server.h2o.ai/x.x.x.x:8032
17/10/13 07:49:46 INFO mapreduce.JobSubmitter: number of splits:2
17/10/13 07:49:46 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499294366934_0756
17/10/13 07:49:46 INFO impl.YarnClientImpl: Submitted application application_1499294366934_0756
17/10/13 07:49:46 INFO mapreduce.Job: The url to track the job: http://my_hadoop_server.h2o.ai:8088/proxy/application_1499294366934_0756/
Job name 'H2O_8290' submitted
JobTracker job ID is 'job_1499294366934_0756'
For YARN users, logs command is 'yarn logs -applicationId application_1499294366934_0756'
Waiting for H2O cluster to come up...
H2O node 174.16.x.x:54323 requested flatfile
H2O node 174.16.x.x:54321 requested flatfile
Sending flatfiles to nodes...
    [Sending flatfile to node 172.16.2.218:54323]
    [Sending flatfile to node 172.16.2.212:54321]
H2O node 174.16.x.x:54321 reports H2O cluster size 1
H2O node 174.16.x.x:54323 reports H2O cluster size 1
H2O node 174.16.x.x:54323 reports H2O cluster size 2
H2O node 174.16.x.x:54321 reports H2O cluster size 2
H2O cluster (2 nodes) is up
(Note: Use the -disown option to exit the driver after cluster formation)

Open H2O Flow in your web browser: http://x.x.x.x:54321

(Press Ctrl-C to kill the cluster)
Blocking until the H2O cluster shuts down...
  ```
