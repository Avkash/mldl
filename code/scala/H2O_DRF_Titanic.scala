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
import _root_.hex.tree.drf.DRF
import _root_.hex.tree.drf.DRFModel
import _root_.hex.tree.drf.DRFModel.DRFParameters


### Creating Deep Learning Classification Model using titanic data ingested previously:
val drfParams = new DRFParameters()
drfParams._train = titanicData


### Setting response ("survived") column to categorical or enum for classification type model:
withLockAndUpdate(titanicData){ fr => fr.replace(1, fr.vec("survived").toCategoricalVec)}
drfParams._response_column = 'survived

### Setting distribution parameter to Bernoulli:
import _root_.hex.genmodel.utils.DistributionFamily
drfParams._distribution = DistributionFamily.bernoulli

### Setting remaining Deep Learning Parameters:
drfParams._nfolds = 5
drfParams._seed= 123445
drfParams._keep_cross_validation_predictions = true
drfParams._ntrees = 100
drfParams._max_depth = 10
drfParams._sample_rate = 0.9
drfParams._col_sample_rate_per_tree=0.8


### Creating Deep Learning Model 
### val drf = new DRF(drfParams, Key.make("drfTitanicClassificationModel.hex"))
val drf = new DRF(drfParams)
val drfTitanicModel = drf.trainModel.get()

### Getting Model Details built in previous step:
drfTitanicModel

### Getting Model summary, training metrics and varialbe importance
drfTitanicModel._output._model_summary
drfTitanicModel._output._training_metrics
drfTitanicModel._output._variable_importances

### Getting Model Metrics
drfTitanicModel.auc
drfTitanicModel.mse
drfTitanicModel.loss

### Getting Model features and classes
drfTitanicModel._output.nfeatures
drfTitanicModel._output.nclasses

### Getting Model classes, domains and checking if it is supervised or not
drfTitanicModel._output.isSupervised
drfTitanicModel._output.classNames
drfTitanicModel._output._domains

### Performing Predictions with the Model built earlier
val predH2OFrame = drfTitanicModel.score(titanicData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))




