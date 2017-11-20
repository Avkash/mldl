# K-Means Algorithm in H2O #

H2O has 3 key unsupervised algorithms implemented, i.e. K-Means, PCA and GLRM. The K-means clustering algorithm tries to find structures in the data without using any labels or target values.

## Datasets used in K-means Examples ##
  - [driver_delivery_speed.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/driver_delivery_speed.csv)
  - [iris](https://raw.githubusercontent.com/Avkash/mldl/master/data/iris.csv)

#### Datasource: The data for this example is taken from this article: [https://www.datascience.com/blog/k-means-clustering](https://www.datascience.com/blog/k-means-clustering) ####

## Get the Scala Sample Code ##
  - [H2O Kmeans with Driver-Delivery-Speed Dataset in Scala](https://github.com/Avkash/mldl/blob/master/code/scala/H2O-KMeans-DriverSpeed.scala)

## K-means Examples in Scala ##

###: Importing key libraries:
```
import org.apache.spark.h2o._
import org.apache.spark.SparkFiles
import org.apache.spark.examples.h2o._
import org.apache.spark.sql.{DataFrame, SQLContext}
import water.Key
import water.support.SparkContextSupport.addFiles
import water.support.H2OFrameSupport._
import java.io.File
```

###: Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

###: Importing titanic data from a file stored on local file system:
```
val driversData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/driver_delivery_speed.csv"))
```

###: Importing Kmeans specific libraries:
```
import _root_.hex.kmeans
import _root_.hex.kmeans.KMeans
import _root_.hex.kmeans.KMeansModel
import _root_.hex.kmeans.KMeansModel.KMeansParameters
```

###: Creating Kmeans Model with fixed cluster size as given with _k parameter:
```
val kmParams = new KMeansParameters()
kmParams._train = driversData
kmParams._k = 4
kmParams._seed = 1234
kmParams._max_iterations = 10
kmParams._estimate_k = false
kmParams._standardize = false;
```

###: Creating Deep Learning Model with supplied key name
```
val km = new KMeans(kmParams)
val kmModel = km.trainModel.get()
```

###: Creating Kmeans Model with estimate_k as true with max limit of cluster size as _k (100):
```
kmParams._k = 100
kmParams._estimate_k = true
###: Note: You must build model again after updating the above settings 
```

###: Getting Model Details built in previous step:
```
kmModel
```

###: Getting Model summary and training metrics 
```
kmModel._output._model_summary
kmModel._output._training_metrics
```

###: Distributuon of all data into speicific clusters
```
kmModel._output._size
```

###: Getting the size of the cluster
```
kmModel._output._size.length
```

###: Getting Model Metrics
```
kmModel._output._k
kmModel._output._k.length
kmModel._output._centers_raw
kmModel._output._centers_std_raw
```

###: Getting Model features and classes
```
kmModel._output.nfeatures
kmModel._output.nclasses
```

###: Getting Model classes, domains and checking if it is supervised or not
```
kmModel._output.isSupervised
kmModel._output.classNames
kmModel._output._domains
```
