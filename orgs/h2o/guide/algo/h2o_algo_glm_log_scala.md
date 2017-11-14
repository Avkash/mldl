# H2O GLM (Generialized Linear Regression) - Logistic Regression in Scala # 

H2O GLM successfully perform logistic regression when the response feature has either 0/1 binary values or only 2-class categorical values. You just need to set GLM Family to "Binomial" to build the logistic regression model. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [prostate.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Logistic Regression Sample Code in Scala ##

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
val prostateData = new H2OFrame(new File("/Users/avkashchauhan/examples/prostate.csv"))
```

Importing GLM Linear Regression Model specific libraries:
```
import _root_.hex.glm.GLM
import _root_.hex.glm.GLMModel
import _root_.hex.glm.GLMModel.GLMParameters
```

Creating GLM Linear Regression Model using prostate data ingested previously:
```
val glmParams = new GLMParameters()
glmParams._train = prostateData
glmParams._response_column = 'CAPSULE
glmParams._nfolds = 5
glmParams._seed = 1111
glmParams._family = GLMModel.GLMParameters.Family.binomial
glmParams._link = GLMModel.GLMParameters.Link.logit
glmParams._keep_cross_validation_predictions = true;
val glm = new GLM(glmParams,Key.make("glmProstateLogisticModel.hex"))
val glmProstateModel = glm.trainModel().get()
```

Getting Model Details built in previous step:
```
glmProstateModel
```
Getting GLM Model metrics AUC (Area Under the Curve):
```
glmProstateModel.auc
```

Getting GLM Model metrics MSE (mean square error):
```
glmProstateModel.mse
```

Getting GLM Model metrics loss (LOSS):
```
glmProstateModel.loss
```

Getting the list of features used in GLM:
```
glmProstateModel.names
```
Getting domains for the model:
```
glmProstateModel._output._domains
```
Getting Training Metrics from GLM Model:
```
glmProstateModel._output._training_metrics
```
Getting cross validation metrics from GLM Model:
```
glmProstateModel._output._cross_validation_metrics
```
Getting cross validation metrics summary from GLM Model:
```
glmProstateModel._output._cross_validation_metrics_summary
```
