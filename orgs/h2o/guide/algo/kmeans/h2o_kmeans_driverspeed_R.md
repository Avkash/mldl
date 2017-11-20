# K-Means Algorithm in H2O #

H2O has 3 key unsupervised algorithms implemented, i.e. K-Means, PCA and GLRM. The K-means clustering algorithm tries to find structures in the data without using any labels or target values.

## Datasets used in K-means Examples ##
  - [driver_delivery_speed.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/driver_delivery_speed.csv)
  - [iris](https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv)

#### Datasource: The data for this example is taken from this article: [https://www.datascience.com/blog/k-means-clustering](https://www.datascience.com/blog/k-means-clustering) ####

## K-means Examples in R ##

# Datasource: The data for this example is taken from the article below:
# URL: https://www.datascience.com/blog/k-means-clustering


###: Importing h2o and other required libraries
```
library(h2o)
library(ggplot2)
```

###: Initializing H2O Cluster
```
h2o.init()
```

###: Importing dataset
```
hdf = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/driver_delivery_speed.csv")
```

###: Understanding Dataset
```
h2o.describe(hdf)
```

###: This dataset has 3 columns
###: Driver ID
###: Distance_Feature: mean distance driven per day
###: Speeding_Feature: mean percentage of time a driver was >5 mph over the speed limit.

###: displaying first 5 rows of the dataset:
```
h2o.head(hdf,n=5)
```

###: Only selecting Distance_Feature and Speeding_Feature from the dataset
```
hdf = hdf[c('Distance_Feature', 'Speeding_Feature')]
hdf
```

###: Visualizing dataset to understand the distribution better
```
h2o.hist(hdf$Distance_Feature)
h2o.hist(hdf$Speeding_Feature)
```

###: Plotting all the points into scatter-plot to understand the distribution
```
rdf = as.data.frame(hdf)
ggplot(rdf, aes(rdf$Distance_Feature, rdf$Speeding_Feature)) + geom_point()
```

###: Creating a cluster of size 4 with the given data
```
estimator = h2o.kmeans(k=4, init="Random", seed=2, standardize=TRUE, x=h2o.colnames(hdf), training_frame = hdf)
```

###: Understanding the k-means model by understanding each row assignment into a specific cluster
#h2o.predict_leaf_node_assignment(object = estimator)
###: ERROR: predictions with a missing `newdata` argument is not implemented yet

###: Predicting the cluster assignment for the given data
```
predicted = h2o.predict(estimator, hdf)
```

###: Listing the prediction for the clusters
```
predicted
```

###: Making sure the cluster items matches with cluster count
```
h2o.unique(predicted['predict'])
```

###: Adding the predictions values as a new column to given dataset and then setting it as enum or categorical
```
hdf["labels"] = predicted["predict"]
hdf["labels"] = h2o.asfactor(hdf["labels"])
h2o.describe(hdf)
```

###: Verifying the given dataset after the prediction column addition
```
h2o.head(hdf, n = 5)
```

###: Getting unique values from the prediction results which are basicaly cluster ids
```
h2o.levels(h2o.asfactor(predicted['predict']))
```

###: Plotting the prediction results using the predction levels on given data
```
ggplot(as.data.frame(hdf), aes(Distance_Feature, Speeding_Feature) , color = labels) + geom_point()
```

###: The following example shows how to use a range of clusters size to generate results
```
for (i in 2:15){
  estimator = h2o.kmeans(k=i, init="Random", seed=2, standardize=TRUE, x= h2o.colnames(hdf), training_frame = hdf)
}
```

###: The following example shows how to use estimate_k to find the cluster size
```
estimator = h2o.kmeans(k=100, estimate_k = TRUE,  init="Random", seed=2, standardize=TRUE,
                       x=h2o.colnames(hdf), training_frame = hdf)
```


