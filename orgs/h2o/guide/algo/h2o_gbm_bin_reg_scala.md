# H2O GBM (Gradient Boosting Machine) - Logistic Classification in Scala #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Logistic Regression Sample Code in Scala ##

Importing key classes specific to H2O:
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

Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

Importing prostate data from a file stored on local file system:
```
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/examples/prostate.csv"))
```

Importing GLM Linear Regression Model specific libraries:
```
import _root_.hex.tree.gbm.GBM
import _root_.hex.tree.gbm.GBMModel
import _root_.hex.tree.gbm.GBMModel.GBMParameters
```

Creating GLM Linear Regression Model using prostate data ingested previously:
```
val gbmParams = new GBMParameters()
gbmParams._train = prostateData
```
Setting response ("CAPSULE") column to categorical or enum for classification type model:
```
withLockAndUpdate(prostateData){ fr => fr.replace(1, fr.vec("CAPSULE").toCategoricalVec)}
gbmParams._response_column = 'CAPSULE
```
Setting GBM distribution family to bernoulli for 2-class classification:
```
import _root_.hex.genmodel.utils.DistributionFamily
gbmParams._distribution = DistributionFamily.bernoulli
```
Setting remaining GBM Parameters:
```
gbmParams._nfolds = 5
gbmParams._seed = 1111
gbmParams._keep_cross_validation_predictions = true;
val gbm = new GBM(gbmParams,Key.make("gbmProstateClassificationModel.hex"))
val gbmProstateModel = gbm.trainModel().get()
```
Getting Model Details built in previous step:
```
gbmProstateModel
```
Getting GBM Model Summary:
```
gbmProstateModel._output._model_summary
```
Training Metrics of the GBM Model:
```
gbmProstateModel._output._training_metrics
```
Validation Metrics of GBM Model:
```
gbmProstateModel._output._validation_metrics
```
Variable Importance table of GBM Model:
```
gbmProstateModel._output._variable_importances
```
Variable Importance Summary of GBM Model:
```
gbmProstateModel._output._varimp.summary
```
Getting GBM Model metrics MSE (mean square error):
```
gbmProstateModel.mse
```
Getting GBM Model metrics AUC (Area under the curve):
```
gbmProstateModel.auc
```
Getting GBM Model metrics loss (LOSS):
```
gbmProstateModel.loss
```

Getting the total features count in GBM model:
```
gbmProstateModel._output.nfeatures
```
Total number of classes in GBM Model:
```
gbmProstateModel._output.nclasses
```
Checking if the GBM model is supervised or not:
```
gbmProstateModel._output.isSupervised
```
A List of class names from the GBM Model:
```
gbmProstateModel._output.classNames
```
GBM Model Domain (Features if enum) list (null represents numeric features) 
```
gbmProstateModel._output._domains
```
