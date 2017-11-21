# H2O AutoML Regression in Scala #

H2O AutoML interface is designed to have as few parameters as possible so that all the user needs to do is point to their dataset, identify the response column and optionally specify a time constraint, a maximum number of models constraint, and early stopping parameters.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [house_price_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_train.csv)
 - [house_price_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/house_price_test.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Scala Code ##
  - [H2O AutoML Regression with House Price Dataset Scala Code](https://github.com/Avkash/mldl/blob/master/code/R/H2O_AutoML_Regression_HousePrice.R)
  
## H2O AutoML Regression Sample Code in Scala ##

###: Importing key libraries:
```
import java.io.File
import water.Key
import org.apache.spark.h2o._
import java.util.Date;
```

###: Creating H2O Context:
```
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._
```

###: Importing House Price data from a file stored on local file system:
```
val housePriceData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/house_price_train.csv"))
```

###: Importing AutoML specific libraries:
```
import ai.h2o.automl.AutoML
import ai.h2o.automl.AutoMLBuildSpec
```

###: Creating AutoML process configuration:
```
val autoMLBuildSpec = new AutoMLBuildSpec()
autoMLBuildSpec.input_spec.training_frame = housePriceData
autoMLBuildSpec.input_spec.response_column = "medv";
```

###: Setting AutoML configuration to stop based on stopping criteria
```
autoMLBuildSpec.build_control.loss = "AUTO"
autoMLBuildSpec.build_control.stopping_criteria.set_max_runtime_secs(5)
```

###: setting AutoML
```
val autoML = AutoML.makeAutoML(Key.make(), new Date(), autoMLBuildSpec)
```

###: Statung the AutoML process (The following call is non-blocking)
```
AutoML.startAutoML(autoML)
```

###: Use the following alternative function will run the blocking AutoML process
###: The next commmand will be blocked, untill the full execution of AutoML build process
```
AutoML.startAutoML(autoMLBuildSpec).get()
```

###: Getting AML leaderboard
```
autoML.leaderboard
```

###: Getting AML leaderboard
```
val leaderModel = autoML.leader
```

### Getting Model summary and training/validation metrics 
```
leaderModel._output._model_summary
leaderModel._output._training_metrics
leaderModel._output._validation_metrics
```

### Getting Model Metrics
```
leaderModel.loss
leaderModel.mse 
leaderModel.rmsle
```

### Getting Model features and classes
```
leaderModel._output.nfeatures
leaderModel._output.nclasses
```

### Getting Model classes, domains and checking if it is supervised or not
```
leaderModel._output.isSupervised
leaderModel._output.classNames
leaderModel._output._domains
```

