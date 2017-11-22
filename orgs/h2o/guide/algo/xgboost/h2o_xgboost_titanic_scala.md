# Classification with H2O XGBoost in Scala #

XGBoost is an optimized distributed gradient boosting library designed to be highly efficient, flexible, and portable. XGBoost provides parallel tree boosting (also known as GBDT, GBM) that solves many data science problems in a fast and accurate way.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Source Code ##
  - [H2O XGBoost Classification with Titanic Dataset Scala](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_XGBoost_Classification_titanic.ipynb)
  
## Classification with H2O XGBoost in Scala ##

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
NOTE: Make sure your response column does not have empty or NA otherwise you will get the following error:
  - Details: ERRR on field: _response_column: Response contains missing values (NAs) - not supported by XGBoost.

###:  Setting survived column to generate a classification model
```
withLockAndUpdate(titanicData){ fr => fr.replace(1, fr.vec("survived").toCategoricalVec)}
```

###: Importing H2O Frame Support library
```
import water.support.H2OFrameSupport
```

###: Spliting the dataset into training, testing and holdout frames
```
val allFrames = H2OFrameSupport.splitFrame(titanicData, Seq("train.hex", "test.hex", "hold.hex"), Seq(0.6, 0.3, 0.1))
val (titanicTrainData, titanicTestData, titanicHoldData) = (allFrames(0), allFrames(1), allFrames(2))
```

###: Importing XGBoost specific libraries to access XGBoost, XGBoostModel and XGBoostParameters:
```
import _root_.hex.tree.xgboost._
```

###: Creating XGBoost Regression Model using titanic data ingested previously:
```
val xgbParams = new XGBoostModel.XGBoostParameters()
```

###: Setting fold assignment to Muldulo
```
import _root_.hex.Model.Parameters.FoldAssignmentScheme
xgbParams._fold_assignment = FoldAssignmentScheme.Modulo
```

###: Setting XGBoost Parameters:
```
xgbParams._train = titanicTrainData
xgbParams._response_column = 'survived
xgbParams._ntrees = 50
xgbParams._max_depth = 5
xgbParams._nfolds = 5
xgbParams._learn_rate = 0.01
xgbParams._sample_rate = 0.9
xgbParams._col_sample_rate_per_tree = 0.9
xgbParams._score_tree_interval = 5
xgbParams._min_rows = 5
xgbParams._seed = 1111
xgbParams._fold_assignment = FoldAssignmentScheme.Modulo
xgbParams._keep_cross_validation_predictions = true;
```

###: Creating GBM Model with supplied key name
```
val xgb = new XGBoost(xgbParams,Key.make("xgbTitanicClassificationModel.hex"))
val xgbTitanicModel = xgb.trainModel().get()
```

###: Getting Model Details built in previous step:
```
xgbTitanicModel
```

###: Getting Model summary and training metrics 
```
xgbTitanicModel._output._model_summary
xgbTitanicModel._output._training_metrics
```

###: Getting Model Metrics
```
xgbTitanicModel.auc
xgbTitanicModel.rmsle
xgbTitanicModel.mse
xgbTitanicModel.loss
```

###: Getting Model features and classes
```
xgbTitanicModel._output.nfeatures
xgbTitanicModel._output.nclasses
```

###: Getting Model classes, domains and checking if it is supervised or not
```
xgbTitanicModel._output.isSupervised
xgbTitanicModel._output.classNames
xgbTitanicModel._output._domains
```

###: Performing Predictions with the Model built earlier
```
val predH2OFrame = xgbTitanicModel.score(titanicTestData)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))
```
