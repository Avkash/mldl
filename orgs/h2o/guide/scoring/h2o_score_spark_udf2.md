# MOJO Scoring with using Scala and Spark - Spark Dataframe to H2O RowData ##

Here is the full code which can be used on scala:

```
import _root_.hex.genmodel.GenModel
import _root_.hex.genmodel.easy.{EasyPredictModelWrapper, RowData}
import _root_.hex.genmodel.easy.prediction
import _root_.hex.genmodel.MojoModel
import _root_.hex.genmodel.easy.RowData

// Load Mojo
val mojo = MojoModel.load("/Users/avkashchauhan/learn/customers/mojo_bin/gbm_model.zip")
val easyModel = new EasyPredictModelWrapper(mojo)

// Get Mojo Details
var features = mojo.getNames.toBuffer

// Creating the Dataframe 
val df = Seq(
  (0, 68, 2, 2, 0, 6),
  (1, 95, 1, 2, 0, 6)
).toDF("ID", "AGE", "RACE", "DCAPS", "VOL", "GLEASON")

// Creating a test function to convert org.apache.spark.sql.Row to genmodel.easy.RowData
def rowToRowData(df: org.apache.spark.sql.DataFrame, row: org.apache.spark.sql.Row): RowData = {
  val rowAsMap = row.getValuesMap[Any](df.schema.fieldNames)
  val rowData = rowAsMap.foldLeft(new RowData()) { case (rd, (k,v)) => 
    if (v != null) { rd.put(k, v.toString) }
    rd
  }
  rowData
}
// Get a single row out from DataFrame
val rd = rowToRowData(df, df.first)


// Performing the Prediction
val prediction = easyModel.predictBinomial(rd).classProbabilities

// reading the rows directly into prediction function
val prediction = easyModel.predictBinomial(rowToRowData(df, df.take(2).array(0))).classProbabilities
val prediction = easyModel.predictBinomial(rowToRowData(df, df.take(2).array(1))).classProbabilities

Here is the executed code with results:

```
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.1.0
      /_/

Using Scala version 2.11.8 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_101)
Type in expressions to have them evaluated.
Type :help for more information.

scala> import _root_.hex.genmodel.GenModel
import _root_.hex.genmodel.GenModel

scala> import _root_.hex.genmodel.easy.{EasyPredictModelWrapper, RowData}
import _root_.hex.genmodel.easy.{EasyPredictModelWrapper, RowData}

scala> import _root_.hex.genmodel.easy.prediction
import _root_.hex.genmodel.easy.prediction

scala> import _root_.hex.genmodel.MojoModel
import _root_.hex.genmodel.MojoModel

scala> import _root_.hex.genmodel.easy.RowData
import _root_.hex.genmodel.easy.RowData

scala> // Load Mojo

scala> val mojo = MojoModel.load("/Users/avkashchauhan/learn/customers/mojo_bin/gbm_model.zip")
mojo: hex.genmodel.MojoModel = hex.genmodel.algos.gbm.GbmMojoModel@7f958d4a

scala> val easyModel = new EasyPredictModelWrapper(mojo)
easyModel: hex.genmodel.easy.EasyPredictModelWrapper = hex.genmodel.easy.EasyPredictModelWrapper@7602c65d

scala> // Get Mojo names

scala> var features = mojo.getNames.toBuffer
features: scala.collection.mutable.Buffer[String] = ArrayBuffer(ID, AGE, RACE, DPROS, DCAPS, PSA, VOL, GLEASON, CAPSULE)

val df = Seq(
  (0, 68, 2, 2, 0, 6),
  (1, 95, 1, 2, 0, 6)
).toDF("ID", "AGE", "RACE", "DCAPS", "VOL", "GLEASON")

scala> df.show
+---+---+----+-----+---+-------+
| ID|AGE|RACE|DCAPS|VOL|GLEASON|
+---+---+----+-----+---+-------+
|  0| 68|   2|    2|  0|      6|
|  0| 95|   1|    2|  0|      6|
+---+---+----+-----+---+-------+


def rowToRowData(df: org.apache.spark.sql.DataFrame, row: org.apache.spark.sql.Row): RowData = {
  val rowAsMap = row.getValuesMap[Any](df.schema.fieldNames)
  val rowData = rowAsMap.foldLeft(new RowData()) { case (rd, (k,v)) => 
    if (v != null) { rd.put(k, v.toString) }
    rd
  }
  rowData
}

scala> df.take(2).array(0)
res44: org.apache.spark.sql.Row = [0,68,2,2,0,6]

scala> df.take(2).array(1)
res45: org.apache.spark.sql.Row = [1,95,1,2,0,6]

scala> df.take(2).array(3)
java.lang.ArrayIndexOutOfBoundsException: 3

scala> df.first
res34: org.apache.spark.sql.Row = [0,68,2,2,0,6]

scala> val rd = rowToRowData(df, df.first)
rd: hex.genmodel.easy.RowData = {VOL=0, GLEASON=6, RACE=2, DCAPS=2, ID=0, AGE=68}

scala> rd
res20: hex.genmodel.easy.RowData = {VOL=0, GLEASON=6, RACE=2, DCAPS=2, ID=0, AGE=68}

scala> val prediction = easyModel.predictBinomial(rd).classProbabilities
prediction: Array[Double] = Array(0.9085014606850959, 0.0914985393149041)

scala> val rd = rowToRowData(df, df.take(2).array(0))
rd: hex.genmodel.easy.RowData = {VOL=0, GLEASON=6, RACE=2, DCAPS=2, ID=0, AGE=68}

scala> val prediction = easyModel.predictBinomial(rowToRowData(df, df.take(2).array(0))).classProbabilities
prediction: Array[Double] = Array(0.9085014606850959, 0.0914985393149041)

scala> val prediction = easyModel.predictBinomial(rowToRowData(df, df.take(2).array(1))).classProbabilities
prediction: Array[Double] = Array(0.900514116494164, 0.09948588350583602)


```
