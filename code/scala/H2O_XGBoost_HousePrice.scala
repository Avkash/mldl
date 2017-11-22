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
val housePriceData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/house_price_train.csv"))
val housePriceTestData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/house_price_test.csv"))

//###: Importing XGBoost specific libraries to access XGBoost, XGBoostModel and XGBoostParameters:
import _root_.hex.tree.xgboost._


//###: Creating XGBoost Regression Model using titanic data ingested previously:
val xgbParams = new XGBoostModel.XGBoostParameters()

//###: Setting fold assignment to Muldulo
import _root_.hex.Model.Parameters.FoldAssignmentScheme
xgbParams._fold_assignment = FoldAssignmentScheme.Modulo


//###: Setting XGBoost Parameters:
xgbParams._train = housePriceData
xgbParams._response_column = 'medv
xgbParams._ntrees = 50
xgbParams._max_depth = 5
xgbParams._nfolds = 5
xgbParams._seed = 1111
xgbParams._fold_assignment = FoldAssignmentScheme.Modulo
xgbParams._keep_cross_validation_predictions = true;

//###: Creating GBM Model with supplied key name
val xgb = new XGBoost(xgbParams,Key.make("xgbHousePriceRegressionModel.hex"))
val xgbHousePriceModel = xgb.trainModel().get()

//###: Getting Model Details built in previous step:
xgbHousePriceModel


//###: Getting Model summary and training metrics 
xgbHousePriceModel._output._model_summary
xgbHousePriceModel._output._training_metrics

//###: Getting Model Metrics
xgbHousePriceModel.rmsle
xgbHousePriceModel.mse
xgbHousePriceModel.loss

//###: Getting Model features and classes
xgbHousePriceModel._output.nfeatures
xgbHousePriceModel._output.nclasses

//###: Getting Model classes, domains and checking if it is supervised or not
xgbHousePriceModel._output.isSupervised
xgbHousePriceModel._output.classNames
xgbHousePriceModel._output._domains

//###: Performing Predictions with the Model built earlier
val predH2OFrame = xgbHousePriceModel.score(housePriceTestData)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))