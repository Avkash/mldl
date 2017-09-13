## MOJO Scoring with using Scala and Spark ##

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

// Creating the row
val r = new RowData
r.put("AGE", "68")
r.put("RACE", "2")
r.put("DCAPS", "2")
r.put("VOL", "0")
r.put("GLEASON", "6")

// Performing the Prediction
val prediction = easyModel.predictBinomial(r).classProbabilities
```

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

scala>

scala> // Load Mojo

scala> val mojo = MojoModel.load("/Users/avkashchauhan/learn/customers/mojo_bin/gbm_model.zip")
mojo: hex.genmodel.MojoModel = hex.genmodel.algos.gbm.GbmMojoModel@7f958d4a

scala> val easyModel = new EasyPredictModelWrapper(mojo)
easyModel: hex.genmodel.easy.EasyPredictModelWrapper = hex.genmodel.easy.EasyPredictModelWrapper@7602c65d

scala>

scala> // Get Mojo names

scala> var features = mojo.getNames.toBuffer
features: scala.collection.mutable.Buffer[String] = ArrayBuffer(ID, AGE, RACE, DPROS, DCAPS, PSA, VOL, GLEASON, CAPSULE)

scala> features.remove(mojo.getResponseIdx)
res0: String = CAPSULE

scala>

scala> val r = new RowData
r: hex.genmodel.easy.RowData = {}

scala> r.put("AGE", "68")
res1: Object = null

scala> r.put("RACE", "2")
res2: Object = null

scala> r.put("DCAPS", "2")
res3: Object = null

scala> r.put("VOL", "0")
res4: Object = null

scala> r.put("GLEASON", "6")
res5: Object = null

scala>

scala> val prediction = easyModel.predictBinomial(r).classProbabilities
prediction: Array[Double] = Array(0.44056667027822005, 0.55943332972178)
```
