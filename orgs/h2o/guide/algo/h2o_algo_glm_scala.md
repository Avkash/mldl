# H2O GLM (Generialized Linear Regression) - Linear Regression in Scala #

## Datasets ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Sample Code in Python ##

Importing key classes specific to H2O:
```
import org.apache.spark.h2o._
import water.Key
import java.io.File
```

Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

Importing prostate data from a file stored on local file system:
```
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/prostate.csv"))
```

Creating GLM Linear Regression Model using prostate data ingested previously:
```
import _root_.hex.glm.GLM
import _root_.hex.glm.GLMModel.GLMParameters
val glmParams = new GLMParameters()
glmParams._train = prostateData
glmParams._response_column = 'CAPSULE
glmParams._nfolds = 5
glmParams._seed = 1111
glmParams._keep_cross_validation_predictions = true;
val glm = new GLM(glmParams,Key.make("glmProstateLinearModel.hex"))
val glmProstateModel = glm.trainModel().get()
```

Getting Model Details built in previous step:
```
glmProstateModel
```

