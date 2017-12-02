# Anomaly Detection with H2O Deep Learning Auto Encoder in Scala #

High-dimensional data can be converted to low-dimensional codes by training a multilayer neural network with a small central layer to reconstruct high-dimensional input vectors. This kind of neural network is named Autoencoder.

H2O uses Deep Learning framework to develop an anomaly detection demonstration using a deep autoencoder. 

## Dataset used in this Sample ##

The dataset is an ECG time series of heartbeats and the goal is to determine which heartbeats are outliers. The training data (20 “good” heartbeats) and the test data (training data with 3 “bad” heartbeats appended for simplicity) can be downloaded directly into the H2O cluster, as shown below. Each row represents a single heartbeat.

 - [Training dataset: ecg_discord_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv)
 - [Test Dataset: ecg_discord_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv)

## Get Scala Sample Code ##
 - [Scala Code Sample](https://github.com/Avkash/mldl/blob/master/code/scala/H2O-AutoEncoder-ECG.scala) 

## Anomaly Detection samples in Scala ##

///### Importing key libraries:
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

//### Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

//###: Importing Data
```
val ecgTrainData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/ecg_discord_train.csv"))
val ecgTestData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/ecg_discord_test.csv"))
```

//###: Importing Deep Learning specific libraries
```
import _root_.hex.deeplearning
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModelInfo
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters.Activation
```

//###: setting up deep learning parameter object
```
val dlParams = new DeepLearningParameters()
```

//###: Configuring Deep Learning Parameter
//###: Note: You must set _autoencoder = true to make sure you want to use autoencoder model
```
dlParams._train = ecgTrainData
dlParams._hidden = Array[Int](100, 100)
dlParams._epochs = 5
dlParams._activation = Activation.RectifierWithDropout
dlParams._autoencoder = true
dlParams._destination_key = Key.make("dlEncoderModel.hex").asInstanceOf[water.Key[Frame]]
```

//###: Create a the deep learning job to create autoencoder model
```
val dl = new DeepLearning(dlParams)
val dlEncoderModel = dl.trainModel.get()
```

//###: Take a look at the auto encoder model
```
dlEncoderModel
```

//###: Reconstruction error per feature using test Dataset:
```
val reconstruction_error =  dlEncoderModel.scoreAutoEncoder(ecgTestData, Key.make(), true)
```

//###: List of names into reconstruction_error
```
reconstruction_error.names
```

//###: Reconstruction error per feature using test Dataset:
```
val reconstruction_error =  dlEncoderModel.scoreAutoEncoder(ecgTestData, Key.make(), false)
val reconstruction_error_vec = reconstruction_error.anyVec()
```

//###: Calculating mean
```
val error_mean = reconstruction_error_vec.mean
```

//###: Checking MSE from the model
```
val model_mse = dlEncoderModel.mse()
```

Resource: [H2O Deep Learning Auto Encoder Text Code](https://github.com/h2oai/h2o-3/blob/bd8ce2917bdf2f07aea79ad5ff8dd4d859dfcf42/h2o-algos/src/test/java/hex/deeplearning/DeepLearningAutoEncoderTest.java)
