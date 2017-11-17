# H2O Deep Learning - Binomial Classification in Scala # 

H2O Deep Learning successfully perform binomial classification when the response column/feature is categorical or enum based on Neural Network algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Scala Code ##
  - [H2O_Deep Learning Classification with Titanic Dataset in Scala](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DeepLearning_Classification_titanic.ipynb)
  
## Binomial Classification Sample Code with Titanic dataset in Scala ##

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

Importing titanic data from a file stored on local file system:
```
val titanicData = new H2OFrame(new File("/Users/avkashchauhan/examples/titanic_list.csv"))
```

Importing Deep Learning specific libraries:
```
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters
```

Creating Deep Learning Classification Model using titanic data ingested previously:
```
val dlParams = new DeepLearningParameters()
dlParams._train = titanicData
```

Setting response ("survived") column to categorical or enum for classification type model:
```
withLockAndUpdate(titanicData){ fr => fr.replace(1, fr.vec("survived").toCategoricalVec)}
dlParams._response_column = 'survived
```

Setting remaining Deep Learning Parameters:
```
dlParams._nfolds = 5
dlParams._seed= 123445
dlParams._epochs = 25
dlParams._train_samples_per_iteration = 20
dlParams._score_training_samples = 50
dlParams._activation = DeepLearningParameters.Activation.Rectifier
dlParams._variable_importances = true
dlParams._keep_cross_validation_predictions = true
dlParams._adaptive_rate = false
```

Creating Deep Learning Model with supplied key name
```
val dl = new DeepLearning(dlParams, Key.make("dlTitanicClassificationModel.hex"))
val dlTitanicModel = dl.trainModel.get()
```

Getting Model Details built in previous step:
```
dlTitanicModel
```

Getting Deep Learning Model Summary:
```
dlTitanicModel._output._model_summary
```

Getting Deep Learning Model Training Metrics
```
dlTitanicModel._output._training_metrics
```
Getting Deep Learning Model variable importance data
```
dlTitanicModel._output._variable_importances
```

Getting Deep Learning Model AUC metric:
```
dlTitanicModel.auc
```

Getting Deep Learning Model MSE metrics
```
dlTitanicModel.mse
```

Getting Deep Learning Model LOSS metrics
```
dlTitanicModel.loss
```

Getting Deep Learning Model features
```
dlTitanicModel._output.nfeatures
```

Getting Deep Learning Model classes
```
dlTitanicModel._output.nclasses
```

Getting Deep Learning Model check if it is supervised
```
dlTitanicModel._output.isSupervised
```

Getting Deep Learning Model all classes
```
dlTitanicModel._output.classNames
```

Getting Deep Learning Model domains
```
dlTitanicModel._output._domains
```

### Performing Prediction ###
```
val predH2OFrame = dlTitanicModel.score(titanicData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```




