///### Importing key libraries:
import org.apache.spark.h2o._
import org.apache.spark.SparkFiles
import org.apache.spark.examples.h2o._
import org.apache.spark.sql.{DataFrame, SQLContext}
import water.Key
import water.support.SparkContextSupport.addFiles
import water.support.H2OFrameSupport._
import java.io.File

//### Creating H2O Context:
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._



val ecgTrainData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/ecg_discord_train.csv"))
val ecgTestData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/ecg_discord_test.csv"))

import _root_.hex.deeplearning
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModelInfo
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters.Activation


val dlParams = new DeepLearningParameters()

dlParams._train = ecgTrainData
dlParams._hidden = Array[Int](100, 100)
dlParams._epochs = 5
dlParams._activation = Activation.RectifierWithDropout
dlParams._autoencoder = true
dlParams._destination_key = Key.make("dlEncoderModel.hex").asInstanceOf[water.Key[Frame]]


// Create a job
val dl = new DeepLearning(dlParams)
val dlEncoderModel = dl.trainModel.get

// Reconstruction error per feature using test Dataset:
val reconstruction_error =  dlEncoderModel.scoreAutoEncoder(ecgTestData, Key.make(), true)

// List of names into reconstruction_error
reconstruction_error.names

// Reconstruction error per feature using test Dataset:
val reconstruction_error =  dlEncoderModel.scoreAutoEncoder(ecgTestData, Key.make(), false)
val reconstruction_error_vec = reconstruction_error.anyVec()

// Calculate mean
val error_mean = reconstruction_error_vec.mean

// Checking MSE from the model
val model_mse = dlEncoderModel.mse()


