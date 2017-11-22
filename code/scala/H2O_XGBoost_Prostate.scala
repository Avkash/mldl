//###: Importing key libraries:
import org.apache.spark.h2o._
import org.apache.spark.SparkFiles
import org.apache.spark.examples.h2o._
import org.apache.spark.sql.{DataFrame, SQLContext}
import water.Key
import water.support.SparkContextSupport.addFiles
import water.support.H2OFrameSupport._
import java.io.File


//###: Creating H2O Context:
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._


//###: Importing titanic data from a file stored on local file system:
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/prostate.csv"))

//###:  Setting survived column to generate a classification model
withLockAndUpdate(prostateData){ fr => fr.replace(1, fr.vec("CAPSULE").toCategoricalVec)}

//###: Importing H2O Frame Support library
import water.support.H2OFrameSupport


//###:: Spliting the dataset into training, testing and holdout frames
val allFrames = H2OFrameSupport.splitFrame(prostateData, Seq("train.hex", "test.hex", "hold.hex"), Seq(0.6, 0.3, 0.1))
val (prostateTrainData, prostateTestData, prostateHoldData) = (allFrames(0), allFrames(1), allFrames(2))

//###: Importing XGBoost specific libraries to access XGBoost, XGBoostModel and XGBoostParameters:
import _root_.hex.tree.xgboost._


//###: Creating XGBoost Regression Model using titanic data ingested previously:
val xgbParams = new XGBoostModel.XGBoostParameters()

//###: Setting fold assignment to Muldulo
import _root_.hex.Model.Parameters.FoldAssignmentScheme
xgbParams._fold_assignment = FoldAssignmentScheme.Modulo


//###: Setting XGBoost Parameters:
xgbParams._train = prostateTrainData
xgbParams._response_column = 'CAPSULE
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

//###: Creating GBM Model with supplied key name
val xgb = new XGBoost(xgbParams,Key.make("xgbProstateClassificationModel.hex"))
val xgbProstateModel = xgb.trainModel().get()

//###: Getting Model Details built in previous step:
xgbProstateModel


//###: Getting Model summary and training metrics 
xgbProstateModel._output._model_summary
xgbProstateModel._output._training_metrics

//###: Getting Model Metrics
xgbProstateModel.auc
xgbProstateModel.rmsle
xgbProstateModel.mse
xgbProstateModel.loss

//###: Getting Model features and classes
xgbProstateModel._output.nfeatures
xgbProstateModel._output.nclasses

//###: Getting Model classes, domains and checking if it is supervised or not
xgbProstateModel._output.isSupervised
xgbProstateModel._output.classNames
xgbProstateModel._output._domains

//###: Performing Predictions with the Model built earlier
val predH2OFrame = xgbProstateModel.score(prostateTestData)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))