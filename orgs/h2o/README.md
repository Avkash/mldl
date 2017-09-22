## H2O Articles ## 
 
 ### General H2O Specific Details ###
 - [Understanding H2O Rapids and tracking APIs](https://github.com/Avkash/mldl/blob/master/orgs/h2o/rapids_api.md)
 - [Working on a Pull Request (PR) to work on H2O source code and Merging into Master and Release Branch](https://github.com/Avkash/mldl/blob/master/orgs/h2o/pre_dev.md)
 - [Writing python code into H2O python API](https://github.com/Avkash/mldl/blob/master/orgs/h2o/python_dev.md)
 - [Python sample code to perform MOJO Scoring](https://github.com/Avkash/mldl/blob/master/code/python/python_mojo_score.md)
 - [Scoring using MOJO with Hive UDf Function](https://github.com/Avkash/mldl/blob/master/orgs/h2o/hive_udf_prostate.md)
 - [How to debug H2O with R]()
 - [rsparkling User Guide](https://github.com/Avkash/mldl/blob/master/code/R/rsparkling_guide.md)
 - [Creating H2O cluster of N machines using flatfile or multicate way](https://github.com/Avkash/mldl/blob/master/orgs/h2o/h2o_installation.md)

## AI/ML Solutions using H2O ##
 - [HR Employ Attrition - H2o AutoML](http://www.business-science.io/business/2017/09/18/hr_employee_attrition.html)
  - [Autoencoders and anomaly detection with machine learning in fraud analytics](https://shiring.github.io/machine_learning/2017/05/01/fraud)
  - [Social Machine Learning with H2O, Twitter, python](https://www.linkedin.com/pulse/social-machine-learning-h2o-twitter-python-marios-michailidis)
 
### Presentations ###
 - [H2O Machine Learning on Hadoop ](https://github.com/Avkash/mldl/blob/master/pages/docs/slidedecks/H2O-Hadoop-Full-Demo.pdf)
 - [H2O Model Deployment with MOJO and POJO](https://github.com/Avkash/mldl/blob/master/pages/docs/slidedecks/Model-deployment-Final.pdf)
 
### Deep Learning Algorithms ###
  - [Anomaly Detection Using H2O Deep Learning](https://dzone.com/articles/dive-deep-into-deep-learning-using-h2o-1)
  - [Anomaly Detection: Increasing Classification Accuracy with H2O's Autoencoder and R](http://amunategui.github.io/anomaly-detection-h2o/)
  - [Deep Learning session @ Statistical Learning and Data Mining IV course](https://github.com/ledell/sldm4-h2o/blob/master/sldm4-deeplearning-h2o.Rmd)

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
 
 ## Ingesting Data in H2O ##
  - Reading from Hive
    - The following command will give the hive table locaion on HDFS and use that location as data source to ingest file in H2O
       - hive > describe formatted <table_name>;
  
