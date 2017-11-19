# H2O Deep Learning - Linear Regression in Scala # 

H2O Deep Learning successfully perform linear regression when the response column/feature is numeric based on Neural Network algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [auto_mpg.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/auto_mpg.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code##
  - [H2O_Deep Learning Regression with Autompg Dataset in Scala Code](https://github.com/Avkash/mldl/blob/master/code/R/H2O_DeepLearning_Regression_AutoMpg.R)
  
  
## Linear Regression Sample Code in Scala ##

### Importing key libraries:
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

### Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

### Importing titanic data from a file stored on local file system:
```
val autoMpgData = new H2OFrame(new File("/Users/avkashchauhan/examples/auto_mpg.csv"))
```

### Importing Deep Learning specific libraries:
```
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters
```

### Creating Deep Learning Classification Model using titanic data ingested previously:
```
val dlParams = new DeepLearningParameters()
dlParams._train = autoMpgData
```

### Setting response as "mpg" column which is numeric so it will be regression model type:
```
dlParams._response_column = 'mpg
```

### Setting distribution parameter to Bernoulli:
```
import _root_.hex.genmodel.utils.DistributionFamily
dlParams._distribution = DistributionFamily.AUTO
```

### Setting remaining Deep Learning Parameters:
```
dlParams._nfolds = 5
dlParams._seed= 123456
dlParams._epochs = 100
dlParams._train_samples_per_iteration = 20
dlParams._score_training_samples = 50
dlParams._activation = DeepLearningParameters.Activation.Tanh
dlParams._variable_importances = true
dlParams._keep_cross_validation_predictions = true
dlParams._adaptive_rate = false
```

### Creating Deep Learning Model 
### val drf = new DRF(dlParams, Key.make("drfAutoMpgRegressionModel.hex"))
```
val dl = new DeepLearning(dlParams, Key.make("dlAutoMpgRegressionModel.hex"))
val dlAutoMpgModel = dl.trainModel.get()
```

### Getting Model Details built in previous step:
```
dlAutoMpgModel
```

### Getting Model summary, training metrics and varialbe importance
```
dlAutoMpgModel._output._model_summary
dlAutoMpgModel._output._training_metrics
dlAutoMpgModel._output._variable_importances
```

### Getting Model Metrics
```
dlAutoMpgModel.rmsle
dlAutoMpgModel.mse
dlAutoMpgModel.loss
```

### Getting Model features and classes
```
dlAutoMpgModel._output.nfeatures
dlAutoMpgModel._output.nclasses
```

### Getting Model classes, domains and checking if it is supervised or not
```
dlAutoMpgModel._output.isSupervised
dlAutoMpgModel._output.classNames
dlAutoMpgModel._output._domains
```

### Performing Predictions with the Model built earlier
```
val predH2OFrame = dlAutoMpgModel.score(autoMpgData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```




