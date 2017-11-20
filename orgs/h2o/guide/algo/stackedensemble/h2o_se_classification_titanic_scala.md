# H2O Stacked Ensemble - Binomial Classification in Scala # 

H2O’s Stacked Ensemble method is supervised ensemble machine learning algorithm that finds the optimal combination of a collection of prediction algorithms using a process called stacking. This method currently supports regression and binary classification.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Scala Code ##
  - [H2O Stacked Ensemble Classification with Titanic Dataset Scala](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-StackEnsembles-Titanic.ipynb)
  
## Stacked Ensemble Binomial Classification Sample Code in Scala ##

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
val titanicData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/titanic_list.csv"))
```

###: Setting response ("survived") column to categorical or enum for classification type model:
```
withLockAndUpdate(titanicData){ fr => fr.replace(1, fr.vec("survived").toCategoricalVec)}
```


###: Importing Deep Learning specific libraries:
```
import _root_.hex.deeplearning.DeepLearning
import _root_.hex.deeplearning.DeepLearningModel
import _root_.hex.deeplearning.DeepLearningModel.DeepLearningParameters
```


###: Creating Deep Learning Classification Model using titanic data ingested previously:
```
val dlParams = new DeepLearningParameters()
dlParams._train = titanicData
```

###: Setting fold assignment to Muldulo
```
import _root_.hex.Model.Parameters.FoldAssignmentScheme
dlParams._fold_assignment = FoldAssignmentScheme.Modulo
```

###: Setting remaining Deep Learning Parameters:
```
dlParams._response_column = 'survived
dlParams._nfolds = 5
dlParams._seed= 11111
dlParams._epochs = 10
dlParams._train_samples_per_iteration = 20
dlParams._score_training_samples = 50
dlParams._activation = DeepLearningParameters.Activation.Rectifier
dlParams._variable_importances = true
dlParams._keep_cross_validation_predictions = true
dlParams._adaptive_rate = false
```

###: Creating Deep Learning Model with supplied key name
```
val dl = new DeepLearning(dlParams, Key.make("dlTitanicClassificationModel.hex"))
val dlTitanicModel = dl.trainModel.get()
```

###: Getting Model Details built in previous step:
```
dlTitanicModel
```

###: Importing GBM specific libraries:
```
import _root_.hex.tree.gbm.GBM
import _root_.hex.tree.gbm.GBMModel.GBMParameters
```

###: Setting GBM Parameters:
```
val gbmParams = new GBMParameters()
gbmParams._train = titanicData
gbmParams._response_column = 'survived
gbmParams._nfolds = 5
gbmParams._seed = 1111
gbmParams._fold_assignment = FoldAssignmentScheme.Modulo
gbmParams._keep_cross_validation_predictions = true;
```

###: Creating GBM Model with supplied key name
```
val gbm = new GBM(gbmParams,Key.make("gbmTitanicClassificationModel.hex"))
val gbmTitanicModel = gbm.trainModel().get()
```

###: Getting Model Details built in previous step:
```
gbmTitanicModel
```

###: Importing Stacked Ensemble specific libraries:
```
import _root_.hex.Model
import _root_.hex.StackedEnsembleModel
import _root_.hex.ensemble.StackedEnsemble
```

###: Setting dataset and response column details with stacked ensemble
```
val stackedEnsembleParameters = new StackedEnsembleModel.StackedEnsembleParameters()
stackedEnsembleParameters._train = titanicData._key
stackedEnsembleParameters._response_column = 'survived
```

###: Setting models (both GBM and Deep Learning) as based models for stacked ensemble
```
type T_MODEL_KEY = Key[Model[_, _ <: Model.Parameters, _ <:Model.Output]]
stackedEnsembleParameters._base_models = Array(gbmTitanicModel._key.asInstanceOf[T_MODEL_KEY], dlTitanicModel._key.asInstanceOf[T_MODEL_KEY])
```

###: Building Stacked Ensemble Model
```
val stackedEnsembleJob = new StackedEnsemble(stackedEnsembleParameters)
val stackedEnsembleModel = stackedEnsembleJob.trainModel().get();
```

###: Getting Model summary and training metrics 
```
stackedEnsembleModel._output._model_summary
stackedEnsembleModel._output._training_metrics
```

###: Getting Model Metrics
stackedEnsembleModel.auc
stackedEnsembleModel.mse
stackedEnsembleModel.loss

###: Getting Model features and classes
```
stackedEnsembleModel._output.nfeatures
stackedEnsembleModel._output.nclasses
```

###: Getting Model classes, domains and checking if it is supervised or not
```
stackedEnsembleModel._output.isSupervised
stackedEnsembleModel._output.classNames
stackedEnsembleModel._output._domains
```

###: Performing Predictions with the Model built earlier
```
val predH2OFrame = stackedEnsembleModel.score(titanicData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```
