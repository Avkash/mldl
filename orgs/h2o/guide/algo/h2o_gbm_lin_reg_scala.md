# H2O GBM (Gradient Boosting Machine) - Linear Regression in Scala #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Linear Regression Sample Code in Scala ##

Importing key classes specific to H2O:
```
import org.apache.spark.h2o._
import water.Key
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
gbmParams._response_column = 'CAPSULE
gbmParams._nfolds = 5
gbmParams._seed = 1111
gbmParams._keep_cross_validation_predictions = true;
val gbm = new GBM(gbmParams,Key.make("gbmProstateLinearModel.hex"))
val gbmProstateModel = gbm.trainModel().get()
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
Getting Model Details built in previous step:
```
gbmProstateModel
```

Getting GBM Model metrics MSE (mean square error):
```
gbmProstateModel.mse
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
