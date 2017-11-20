# K-Means Algorithm in H2O #

H2O has 3 key unsupervised algorithms implemented, i.e. K-Means, PCA and GLRM. The K-means clustering algorithm tries to find structures in the data without using any labels or target values.

## Datasets used in K-means Examples ##
  - [driver_delivery_speed.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/driver_delivery_speed.csv)
  - [iris](https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv)

### Datasource: The data for this example is taken from this article: [https://www.datascience.com/blog/k-means-clustering](https://www.datascience.com/blog/k-means-clustering) ###

## K-means Examples in Python ##


###: Importing h2o and other required libraries
```python
import h2o
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (12, 6)
```

###: Initializing H2O Cluster
```python
h2o.init()
```

###: Importing dataset
```python
hdf = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/driver_delivery_speed.csv")
```

###: Understanding Dataset
```python
hdf.describe()
```

###: This dataset has 3 columns
# Driver ID
# Distance_Feature: mean distance driven per day
# Speeding_Feature: mean percentage of time a driver was >5 mph over the speed limit.
```python
hdf.head(5)
```

###: Only selecting Distance_Feature and Speeding_Feature from the dataset
```python
hdf = hdf[:,['Distance_Feature', 'Speeding_Feature']]
hdf
```

###: Visualizing dataset to understand the distribution better
```python
import pylab as pl
hdf.as_data_frame().hist(figsize=(20,10))
pl.show()
```

###: Plotting all the points into scatter-plot to understand the distribution
```python
plt.figure(figsize=(20,10))
plt.plot(hdf.as_data_frame().Distance_Feature,df.Speeding_Feature,'ko')
plt.ylabel('Speeding Feature')
plt.xlabel('Distance Feature')
plt.ylim(0,100)
plt.show()
```

###: Importing K-means specific H2O library
```python
from h2o.estimators.kmeans import H2OKMeansEstimator
```

###: Creating a cluster of size 4 with the given data
```python
estimator = H2OKMeansEstimator(k=4, init="Random", seed=2, standardize=True)
estimator.train(x=hdf.col_names, training_frame = hdf)
```

###: Understanding the k-means model by understanding each row assignment into a specific cluster
```python
print(estimator.predict_leaf_node_assignment)
```

###: Predicting the cluster assignment for the given data
```python
predicted = estimator.predict(hdf)
```

###: Listing the prediction for the clusters
```python
predicted
```

###: Making sure the cluster items matches with cluster count
```python
predicted['predict'].unique()
```

###: Adding the predictions values as a new column to given dataset and then setting it as enum or categorical
```python
hdf["labels"] = predicted["predict"].asfactor()
```

###: Verifying the given dataset after the prediction column addition
```python
hdf.head(5)
```

###: Using Seaborn graphic package to visualize data based on predicted cluster labels
```python
import seaborn as sns
plt.figure(figsize=(20,10))
sns.pairplot(hdf.as_data_frame(), vars=["Speeding_Feature" , "Distance_Feature"], hue="labels");
plt.show()
```

###: Getting unique values from the prediction results which are basicaly cluster ids
```python
predicted['predict'].asfactor().levels()
```

###: Converting the Prediction values to a numpy array of int32 type
```python
pred_array = np.array(predicted.as_data_frame()['predict'].values.tolist(), dtype=np.int32)
pred_array
```

### Extracting each column values from the given dataset as a list
```python
f1 = hdf.as_data_frame()['Distance_Feature'].values
f2 = hdf.as_data_frame()['Speeding_Feature'].values
```


###: Creating a function to Plot the prediction results using the predction levels on given data
```python
def plot_kmeans_labels(labels):
    plt.figure(figsize=(20,10))
    h1,=plt.plot(f1[labels==0],f2[labels==0],'go')

    plt.plot(np.mean(f1[labels==0]),np.mean(f2[labels==0]),'g*',markersize=20,mew=3)
    h2,=plt.plot(f1[labels==1],f2[labels==1],'bo')
    plt.plot(np.mean(f1[labels==1]),np.mean(f2[labels==1]),'b*',markersize=20,mew=3)
    h3,=plt.plot(f1[labels==2],f2[labels==2],'mo')
    plt.plot(np.mean(f1[labels==2]),np.mean(f2[labels==2]),'m*',markersize=20,mew=3)
    h4,=plt.plot(f1[labels==3],f2[labels==3],'ro')
    plt.plot(np.mean(f1[labels==3]),np.mean(f2[labels==3]),'r*',markersize=20,mew=3)
    plt.ylabel('Speeding Feature')
    plt.xlabel('Distance Feature')
    plt.legend([h1,h2,h3,h4],['Group 1','Group 2','Group 3','Group 4'], loc='upper left')
    plt.show()
```

###: Applying the function to plot predicted labels with given dataset 
```python
plot_kmeans_labels(pred_array)
```

###: The following example shows how to use a range of clusters size to generate results
```python
results = [H2OKMeansEstimator(k=clusters, init="Random", seed=2, standardize=True) for clusters in range(2,15)]
for estimator in results:
    estimator.train(x=hdf.col_names, training_frame = hdf)
```

###: The following example shows how to use estimate_k to find the cluster size
```python
estimator = H2OKMeansEstimator(k=100, estimate_k = True,  init="Random", seed=2, standardize=True)
estimator.train(x=hdf.col_names, training_frame = hdf)
```

