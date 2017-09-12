# GBM Regression and Classification Scala Sample #

Here is the full working code:

```
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


// Import prostate data into H2O
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/prostate.csv"))

import h2oContext.implicits._
import _root_.hex.tree.gbm.GBM
import _root_.hex.tree.gbm.GBMModel.GBMParameters


// --------------
// 1. Regression 
// --------------

val gbmParams = new GBMParameters()
gbmParams._train = prostateData
gbmParams._response_column = 'CAPSULE

val gbm = new GBM(gbmParams,Key.make("gbmRegModel.hex"))
val gbmRegModel = gbm.trainModel.get
// Same as above
val gbmRegModel = gbm.trainModel().get()

// --------------
// Get GBM Regression Model
// --------------
gbmRegModel

// --------------
// 1. Prediction (Using GBM Regression Model)
// --------------
val predH2OFrame = gbmRegModel.score(prostateData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))


// --------------
// 2. Classification 
// --------------
val gbmParams = new GBMParameters()
gbmParams._train = prostateData

prostateData.names()
//
// >>> res6: Array[String] = Array(ID, CAPSULE, AGE, RACE, DPROS, DCAPS, PSA, VOL, GLEASON)
// Based on above the CAPSULE is the id = 1
// Note: If we will not set categorical for response variable we will see the following exception
//        - water.exceptions.H2OModelBuilderIllegalArgumentException: 
//             - Illegal argument(s) for GBM model: gbmModel.hex.  Details: ERRR on field: _distribution: Binomial requires the response to be a 2-class categorical


withLockAndUpdate(prostateData){ fr => fr.replace(1, fr.vec("CAPSULE").toCategoricalVec)}

gbmParams._response_column = 'CAPSULE

import _root_.hex.genmodel.utils.DistributionFamily
gbmParams._distribution = DistributionFamily.bernoulli

val gbm = new GBM(gbmParams,Key.make("gbmBinModel.hex"))
val gbmBinModel = gbm.trainModel.get
// Same as above
val gbmBinModel = gbm.trainModel().get()

// --------------
// Get GBM Binomial Model
// --------------
gbmBinModel

// --------------
// 2. Prediction (Using GBM Binomial Model)
// --------------
val predH2OFrame = gbmBinModel.score(prostateData)('predict)
val predFromModel = asRDD[DoubleHolder](predH2OFrame).collect.map(_.result.getOrElse(Double.NaN))


```
