# Pysparkling Full end to end test Script #

```
#start pysparkling:

#http_proxy='' https_proxy='' /opt/sparkling-water/current/bin/pysparkling 

#inside pysparkling:

from pyspark.sql import SparkSession
from random import random

print "Making spark context"
spark = (SparkSession.builder
         .appName("av_lts_removed_test")
         .config("spark.dynamicAllocation.cachedExecutorIdleTimeout","1800")
         .config("spark.dynamicAllocation.enabled","true")
         .config("spark.dynamicAllocation.executorIdleTimeout","60")
         .config("spark.dynamicAllocation.maxExecutors","512")
         .config("spark.dynamicAllocation.minExecutors","0")
         .config("spark.dynamicAllocation.schedulerBacklogTimeout","30")
         .config("spark.dynamicAllocation.sustainedSchedulerBacklogTimeout","10")
         .config("spark.shuffle.consolidateFiles","true")
         .config("spark.shuffle.service.enabled","true")
         .config("spark.ui.retainedTasks","2")
         .config("spark.ui.enable","false")
         .config("spark.ui.enabled","false")
         .enableHiveSupport()
         .getOrCreate()
         )

sc = spark.sparkContext
print "SC available: %s" % sc

amplification = int(random()*100000)

print "We'll aplify the dataset %s times" % amplification

def amplifier(row):
    return [row] * amplification

print "Making dataset"
train = sc.parallelize([(1,"red","dog",1),
                        (1,"red","cat",1),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0),
                        (1,"red","cat",0),
                        (1,"black","dog",0),
                        (1,"black","dog",0)]).flatMap(amplifier).repartition(1).cache()
train2 = train.toDF(["fake_intercept","color","pet","label"])
train2.show()
 

print "Making h2o context"
from pysparkling import *
import h2o
conf = (H2OConf(spark)
        .use_auto_cluster_start()
        .set_yarn_queue("h2o")
        .set_num_of_external_h2o_nodes(2)
        .set_cluster_start_timeout(1000)
        .set_mapper_xmx("1G")
        )

context = H2OContext.getOrCreate(spark, conf)

print "H2o Context available"
print context

print "Uploading data to H2O frame"
h2o_data = context.as_h2o_frame(train2)
#this hangs instead of copying the data to the h2o cloud
print "Upload done"

cat_feats = ["color", "pet"]
response = "label"  
num_feats = ["fake_intercept"]

for i in cat_feats + [response]:
    h2o_data[i] = h2o_data[i].asfactor()

from h2o.estimators.gbm import H2OGradientBoostingEstimator
print "Training GBM"
gbm = H2OGradientBoostingEstimator(
            model_id="toy_model",
            distribution="bernoulli",
            seed=42,
            max_depth = 5,
            stopping_metric = 'logloss', # let early stopping feature determine
            stopping_rounds = 2,     # the optimal number of trees
            score_tree_interval = 1,
            ntrees = 10
        )

# this sometimes fails/is interrupted
gbm.train(x = cat_feats + num_feats,
             y = response,
             training_frame = h2o_data
            )
print "Training GBM done"

print "I have made my run."


```
