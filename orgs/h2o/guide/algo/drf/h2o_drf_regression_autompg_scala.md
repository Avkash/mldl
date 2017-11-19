# H2O Distributed Random Forest - Linear Regression in Scala # 

H2O Distributed random forest successfully perform linear regression when the response column/feature is numeric based on Random Forest algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [auto_mpg.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/auto_mpg.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample R Code##
  - [H2O Distributed Random Forest Regression with Autompg Dataset Scala Code](https://github.com/Avkash/mldl/blob/master/code/scala/H2O_DRF_Autompg.scala)
  
  
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

### Importing Distributed Random Forest specific libraries:
```
import _root_.hex.tree.drf.DRF
import _root_.hex.tree.drf.DRFModel
import _root_.hex.tree.drf.DRFModel.DRFParameters
```

### Creating Distributed Random Forest Classification Model using titanic data ingested previously:
```
val drfParams = new DRFParameters()
drfParams._train = autoMpgData
```

### Setting response as "mpg" column which is numeric so it will be regression model type:
```
drfParams._response_column = 'mpg
```

### Setting distribution parameter to Bernoulli:
```
import _root_.hex.genmodel.utils.DistributionFamily
drfParams._distribution = DistributionFamily.bernoulli
```

### Setting remaining Distributed Random Forest Parameters:
```
drfParams._nfolds = 5
drfParams._seed= 123445
drfParams._keep_cross_validation_predictions = true
drfParams._ntrees = 100
drfParams._max_depth = 10
drfParams._sample_rate = 0.75
drfParams._col_sample_rate_per_tree=0.75
```

### Creating Distributed Random Forest Model 
### val drf = new DRF(drfParams, Key.make("drfAutoMpgRegressionModel.hex"))
```
val drf = new DRF(drfParams)
val drfAutoMpgModel = drf.trainModel.get()
```

### Getting Model Details built in previous step:
```
drfAutoMpgModel
```

### Getting Model summary, training metrics and varialbe importance
```
drfAutoMpgModel._output._model_summary
drfAutoMpgModel._output._training_metrics
drfAutoMpgModel._output._variable_importances
```

### Getting Model Metrics
```
drfAutoMpgModel.rmsle
drfAutoMpgModel.mse
drfAutoMpgModel.loss
```

### Getting Model features and classes
```
drfAutoMpgModel._output.nfeatures
drfAutoMpgModel._output.nclasses
```

### Getting Model classes, domains and checking if it is supervised or not
```
drfAutoMpgModel._output.isSupervised
drfAutoMpgModel._output.classNames
drfAutoMpgModel._output._domains
```

### Performing Predictions with the Model built earlier
```
val predH2OFrame = drfAutoMpgModel.score(autoMpgData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```




