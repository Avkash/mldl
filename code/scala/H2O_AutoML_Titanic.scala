//###: Importing key libraries:
import java.io.File
import water.Key
import org.apache.spark.h2o._
import java.util.Date;

//###: Creating H2O Context:
val h2oContext = H2OContext.getOrCreate(sc)
import h2oContext._
import h2oContext.implicits._

//###: Importing Titanic data from a file stored on local file system:
val titanicData = new H2OFrame(new File("/Users/avkashchauhan/learn/customers/titanic_list.csv"))


//###: Importing AutoML specific libraries:
import ai.h2o.automl.AutoML
import ai.h2o.automl.AutoMLBuildSpec


//###: Creating AutoML process configuration:
val autoMLBuildSpec = new AutoMLBuildSpec()
autoMLBuildSpec.input_spec.training_frame = titanicData
autoMLBuildSpec.input_spec.response_column = "survived";

//###: Setting AutoML configuration to stop based on stopping criteria
autoMLBuildSpec.build_control.loss = "AUTO"
autoMLBuildSpec.build_control.stopping_criteria.set_max_runtime_secs(5)

//###: setting AutoML
val autoML = AutoML.makeAutoML(Key.make(), new Date(), autoMLBuildSpec)

AutoML.startAutoML(autoML)

AutoML.startAutoML(autoMLBuildSpec).get()

//###: Getting AML leaderboard
autoML.leaderboard

//###: Getting AML leaderboard
val leaderModel = autoML.leader

//### Getting Model summary and training/validation metrics 
leaderModel._output._model_summary
leaderModel._output._training_metrics
leaderModel._output._validation_metrics

//### Getting Model Metrics
leaderModel.loss
leaderModel.mse 
leaderModel.rmsle

//### Getting Model features and classes
leaderModel._output.nfeatures
leaderModel._output.nclasses

//### Getting Model classes, domains and checking if it is supervised or not
leaderModel._output.isSupervised
leaderModel._output.classNames
leaderModel._output._domains



