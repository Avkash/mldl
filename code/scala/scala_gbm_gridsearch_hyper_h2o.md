

// --------
// https://github.com/h2oai/h2o-3/blob/6c9aa26fcd1a47321845da62a9d32d3687a380dd/h2o-algos/src/test/java/hex/tree/gbm/GBMGridTest.java
// --------

import org.apache.spark.SparkFiles
import org.apache.spark.h2o._
import org.apache.spark.examples.h2o._
import org.apache.spark.sql.{DataFrame, SQLContext}
import water.Key
import java.io.File

import water.support.SparkContextSupport.addFiles
import water.support.H2OFrameSupport._

// Create SQL support
implicit val sqlContext = spark.sqlContext
import sqlContext.implicits._

// Start H2O services
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._

// Register files to SparkContext
addFiles(sc,
  "/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/year2005.csv.gz",
  "/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/Chicago_Ohare_International_Airport.csv")

// Import all year airlines data into H2O
val airlinesData = new H2OFrame(new File(SparkFiles.get("year2005.csv.gz")))

// Import weather data into Spark
val wrawdata = sc.textFile(SparkFiles.get("Chicago_Ohare_International_Airport.csv"),8).cache()
val weatherTable = wrawdata.map(_.split(",")).map(row => WeatherParse(row)).filter(!_.isWrongRow())

// Transfer data from H2O to Spark DataFrame
val airlinesTable = h2oContext.asDataFrame(airlinesData).map(row => AirlinesParse(row))
val flightsToORD = airlinesTable.filter(f => f.Dest==Some("ORD"))

// Use Spark SQL to join flight and weather data in spark
flightsToORD.toDF.createOrReplaceTempView("FlightsToORD")
weatherTable.toDF.createOrReplaceTempView("WeatherORD")

// Perform SQL Join on both tables
val bigTable = sqlContext.sql(
  """SELECT
          |f.Year,f.Month,f.DayofMonth,
          |f.CRSDepTime,f.CRSArrTime,f.CRSElapsedTime,
          |f.UniqueCarrier,f.FlightNum,f.TailNum,
          |f.Origin,f.Distance,
          |w.TmaxF,w.TminF,w.TmeanF,w.PrcpIn,w.SnowIn,w.CDD,w.HDD,w.GDD,
          |f.IsDepDelayed
          |FROM FlightsToORD f
          |JOIN WeatherORD w
          |ON f.Year=w.Year AND f.Month=w.Month AND f.DayofMonth=w.Day""".stripMargin)


val trainFrame:H2OFrame = bigTable
withLockAndUpdate(trainFrame){ fr => fr.replace(19, fr.vec("IsDepDelayed").toCategoricalVec)}

bigTable.numCols
bigTable.numRows

import h2oContext.implicits._
import _root_.hex.tree.gbm.GBM
import _root_.hex.tree.gbm.GBMModel.GBMParameters

val gbmParams = new GBMParameters()

gbmParams._train = trainFrame
gbmParams._response_column = 'IsDepDelayed

import _root_.hex.genmodel.utils.DistributionFamily

gbmParams._distribution = DistributionFamily.bernoulli

val gbm = new GBM(gbmParams,Key.make("gbmModel.hex"))
val gbmModel = gbm.trainModel.get
// Same as above
val gbmModel = gbm.trainModel().get()

// Use model to estimate delay on training data
val predGBMH2OFrame = gbmModel.score(trainFrame)('predict)
val predGBMFromModel = asRDD[DoubleHolder](predGBMH2OFrame).collect.map(_.result.getOrElse(Double.NaN))

def let[A](in: A)(body: A => Unit) = {
    body(in)
    in
}


import _root_.hex.grid.{GridSearch}
import _root_.hex.grid.GridSearch
import _root_.hex.ScoreKeeper

import water.Key
import scala.collection.JavaConversions._

val gbmHyperSpace: java.util.Map[String, Array[Object]] = Map[String, Array[AnyRef]](
  "_ntrees" -> (1 to 10).map(v => Int.box(100*v)).toArray,
  "_max_depth" -> (2 to 7).map(Int.box).toArray,
  "_learn_rate" -> Array(0.1, 0.01).map(Double.box),
  "_col_sample_rate" -> Array(0.3, 0.7, 1.0).map(Double.box),
  "_learn_rate_annealing" -> Array(0.8, 0.9, 0.95, 1.0).map(Double.box)
)

// @Snippet
import _root_.hex.grid.HyperSpaceSearchCriteria.RandomDiscreteValueSearchCriteria


val gbmHyperSpaceCriteria = let(new RandomDiscreteValueSearchCriteria) { c =>
  c.set_stopping_metric(ScoreKeeper.StoppingMetric.RMSE)
  c.set_stopping_tolerance(0.1)
  c.set_stopping_rounds(1)
  c.set_max_runtime_secs(4 * 60 /* seconds */)
}

//
// This step will create 
// If you will pass the code below it will run through also for long time
// val gs = GridSearch.startGridSearch(null, gbmParams, gbmHyperSpace);
// 
val gbmGrid = GridSearch.startGridSearch(Key.make("gbmGridModel"),
                                             gbmParams,
                                             gbmHyperSpace,
                                             new GridSearch.SimpleParametersBuilderFactory[GBMParameters],
                                             gbmHyperSpaceCriteria).get()


//   Training Frame Info
gbmGrid.getTrainingFrame

//
// Looking at gird models by  Keys
//
val mKeys = gbmGrid.getModelKeys()
gbmGrid.createSummaryTable(mKeys, "mse", true);
gbmGrid.createSummaryTable(mKeys, "rmse", true);

//   Model Count
gbmGrid.getModelCount

//   All Models
gbmGrid.getModels
val ms = gbmGrid.getModels()
val gbm =ms(0)
val gbm =ms(1)
val gbm =ms(2)

// All hyper parameters
gbmGrid.getHyperNames

val mKeys = gbmGrid.getModelKeys()

for (Key mKey : mKeys) {
  mKey
}

// All hyper parameters values by each parameters

grid.getHyperValues(gbm)


val grid = gbmGrid.get().asInstanceOf[_root_.hex.grid.Grid[_root_.hex.Model.Parameters]]


val gbmXModel = gbmGrid.getModels.minBy(_._output._validation_metrics.rmse()).asInstanceOf[GBMModel]
println(gbmXModel._output._validation_metrics)


