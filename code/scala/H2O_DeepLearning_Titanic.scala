### Importing key libraries:
import org.apache.spark.h2o._
import org.apache.spark.SparkFiles
import org.apache.spark.examples.h2o._
import org.apache.spark.sql.{DataFrame, SQLContext}
import water.Key
import water.support.SparkContextSupport.addFiles
import water.support.H2OFrameSupport._
import java.io.File


### Creating H2O Context:
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._


### Importing titanic data from a file stored on local file system:
val titanicData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/titanic_list.csv"))


### Importing Deep Learning specific libraries:
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters


### Creating Deep Learning Classification Model using titanic data ingested previously:
val dlParams = new DeepLearningParameters()
dlParams._train = titanicData

### Setting response ("survived") column to categorical or enum for classification type model:
withLockAndUpdate(titanicData){ fr => fr.replace(1, fr.vec("survived").toCategoricalVec)}
dlParams._response_column = 'survived

### Setting remaining Deep Learning Parameters:
dlParams._nfolds = 5
dlParams._seed= 123445
dlParams._epochs = 25
dlParams._train_samples_per_iteration = 20
dlParams._score_training_samples = 50
dlParams._activation = DeepLearningParameters.Activation.Rectifier
dlParams._variable_importances = true
dlParams._keep_cross_validation_predictions = true
dlParams._adaptive_rate = false

### Creating Deep Learning Model with supplied key name
val dl = new DeepLearning(dlParams, Key.make("dlTitanicClassificationModel.hex"))
val dlTitanicModel = dl.trainModel.get()

### Getting Model Details built in previous step:
dlTitanicModel

### Getting Model summary, training metrics and varialbe importance
dlTitanicModel._output._model_summary
dlTitanicModel._output._training_metrics
dlTitanicModel._output._variable_importances

### Getting Model Metrics
dlTitanicModel.auc
dlTitanicModel.mse
dlTitanicModel.loss

### Getting Model features and classes
dlTitanicModel._output.nfeatures
dlTitanicModel._output.nclasses

### Getting Model classes, domains and checking if it is supervised or not
dlTitanicModel._output.isSupervised
dlTitanicModel._output.classNames
dlTitanicModel._output._domains

### Performing Predictions with the Model built earlier
val predH2OFrame = dlTitanicModel.score(titanicData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))




