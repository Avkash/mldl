##Scala code to perform AutoML ##

Here is the full scala code:

```
scala> import ai.h2o.automl.AutoML;
scala> import ai.h2o.automl.AutoMLBuildSpec
scala> import org.apache.spark.h2o._
scala> val h2oContext = H2OContext.getOrCreate(sc)
scala> import h2oContext._
scala> import java.io.File
scala> import h2oContext.implicits._
scala> import water.Key
scala> val prostateData = new H2OFrame(new File("/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/prostate.csv"))
scala> val autoMLBuildSpec = new AutoMLBuildSpec()
scala> autoMLBuildSpec.input_spec.training_frame = prostateData.
scala> autoMLBuildSpec.input_spec.training_frame = prostateData._key
scala> autoMLBuildSpec.input_spec.response_column = "CAPSULE";
scala> autoMLBuildSpec.build_control.loss = "AUTO"
scala> autoMLBuildSpec.build_control.stopping_criteria.set_max_runtime_secs(5)
scala> import java.util.Date;
scala> val aml = AutoML.makeAutoML(Key.make(), new Date(), autoMLBuildSpec)
scala> AutoML.startAutoML(aml)
scala> aml.leader
scala> aml.leaderboard

```


Here is the full code execution:

```
scala> import ai.h2o.automl.AutoML;
import ai.h2o.automl.AutoML

scala> import ai.h2o.automl.AutoMLBuildSpec
import ai.h2o.automl.AutoMLBuildSpec

scala> import org.apache.spark.h2o._
import org.apache.spark.h2o._

scala> val h2oContext = H2OContext.getOrCreate(sc)
17/09/15 20:21:15 WARN H2OContext: Method H2OContext.getOrCreate with an argument of type SparkContext is deprecated and parameter of type SparkSession is preferred.
17/09/15 20:21:15 WARN InternalH2OBackend: Increasing 'spark.locality.wait' to value 30000
17/09/15 20:21:15 WARN InternalH2OBackend: Due to non-deterministic behavior of Spark broadcast-based joins
We recommend to disable them by
configuring `spark.sql.autoBroadcastJoinThreshold` variable to value `-1`:
sqlContext.sql("SET spark.sql.autoBroadcastJoinThreshold=-1")
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 2:
[rdd_0_2]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 5:
[rdd_0_5]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 4:
[rdd_0_4]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 7:
[rdd_0_7]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 3:
[rdd_0_3]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 0:
[rdd_0_0]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 1:
[rdd_0_1]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 6:
[rdd_0_6]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 9:
[rdd_0_9]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 8:
[rdd_0_8]
17/09/15 20:21:16 WARN Executor: 1 block locks were not released by TID = 10:
[rdd_0_10]
09-15 20:21:17.596 10.0.0.46:54323       51356  #r thread INFO: Found XGBoost backend with library: xgboost4j
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Your system supports only minimal version of XGBoost (no GPUs, no multithreading)!
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: ----- H2O started  -----
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Build git branch: rel-weierstrass
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Build git hash: 03e64d5c87f1eb7bcad9372bb4a73c4aab4f52d9
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Build git describe: jenkins-3.14.0.1-6-g03e64d5
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Build project version: 3.14.0.2 (latest version: 3.14.0.2)
09-15 20:21:17.614 10.0.0.46:54323       51356  #r thread INFO: Build age: 24 days
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Built by: 'jenkins'
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Built on: '2017-08-21 22:18:30'
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Build git branch: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Build git hash: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Build git describe: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Build project version: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Built by: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Watchdog Built on: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Build git branch: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Build git hash: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Build git describe: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Build project version: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Built by: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: XGBoost Built on: (unknown)
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Processed H2O arguments: [-name, sparkling-water-avkashchauhan_local-1505532002512, -ga_opt_out, -log_level, INFO, -baseport, 54321, -ip, 10.0.0.46, -log_dir, /Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14/h2ologs/local-1505532002512]
09-15 20:21:17.615 10.0.0.46:54323       51356  #r thread INFO: Java availableProcessors: 8
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Java heap totalMemory: 735.5 MB
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Java heap maxMemory: 2.67 GB
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Java version: Java 1.8.0_101 (from Oracle Corporation)
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: JVM launch parameters: [-Dscala.usejavacp=true, -Xmx3G, -XX:MaxPermSize=384m]
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: OS version: Mac OS X 10.12.6 (x86_64)
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Machine physical memory: 16.00 GB
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: X-h2o-cluster-id: 1505532075841
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: User name: 'avkashchauhan'
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Opted out of sending usage metrics.
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: IPv6 stack selected: false
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:3eea:c3b7:1ad4:317b%utun0/name:utun0 (utun0)
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Network address/interface is not reachable in 150ms: /fe80:0:0:0:38e4:bff:febb:63e1%awdl0/name:awdl0 (awdl0)
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:0:0:0:5101
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:49b0:aebf:b647:bf93
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: en0 (en0), 2601:646:c401:818d:1c6c:26:e862:7761
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: en0 (en0), fe80:0:0:0:d5:151e:593:4a60%en0
09-15 20:21:17.616 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: en0 (en0), 10.0.0.46
09-15 20:21:17.617 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: lo0 (lo0), fe80:0:0:0:0:0:0:1%lo0
09-15 20:21:17.617 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: lo0 (lo0), 0:0:0:0:0:0:0:1
09-15 20:21:17.617 10.0.0.46:54323       51356  #r thread INFO: Possible IP Address: lo0 (lo0), 127.0.0.1
09-15 20:21:17.617 10.0.0.46:54323       51356  #r thread INFO: H2O node running in unencrypted mode.
09-15 20:21:17.619 10.0.0.46:54323       51356  #r thread INFO: Internal communication uses port: 54324
09-15 20:21:17.619 10.0.0.46:54323       51356  #r thread INFO: Listening for HTTP and REST traffic on http://10.0.0.46:54323/
09-15 20:21:17.653 10.0.0.46:54323       51356  #r thread INFO: H2O cloud name: 'sparkling-water-avkashchauhan_local-1505532002512' on /10.0.0.46:54323, discovery address /235.200.37.90:60360
09-15 20:21:17.654 10.0.0.46:54323       51356  #r thread INFO: If you have trouble connecting, try SSH tunneling from your local machine (e.g., via port 55555):
09-15 20:21:17.654 10.0.0.46:54323       51356  #r thread INFO:   1. Open a terminal and run 'ssh -L 55555:localhost:54323 avkashchauhan@10.0.0.46'
09-15 20:21:17.654 10.0.0.46:54323       51356  #r thread INFO:   2. Point your browser to http://localhost:55555
09-15 20:21:17.793 10.0.0.46:54323       51356  #r thread INFO: Log dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14/h2ologs/local-1505532002512'
09-15 20:21:17.793 10.0.0.46:54323       51356  #r thread INFO: Cur dir: '/Volumes/OSxexT/tools/sw2/sparkling-water-2.1.14'
09-15 20:21:17.800 10.0.0.46:54323       51356  #r thread INFO: HDFS subsystem successfully initialized
09-15 20:21:17.806 10.0.0.46:54323       51356  #r thread INFO: S3 subsystem successfully initialized
09-15 20:21:17.806 10.0.0.46:54323       51356  #r thread INFO: Flow dir: '/Users/avkashchauhan/h2oflows'
09-15 20:21:17.817 10.0.0.46:54323       51356  #r thread INFO: Cloud of size 1 formed [/10.0.0.46:54323]
09-15 20:21:17.861 10.0.0.46:54323       51356  #r thread INFO: Registered parsers: [GUESS, ARFF, XLS, SVMLight, AVRO, ORC, PARQUET, CSV]
09-15 20:21:17.861 10.0.0.46:54323       51356  #r thread INFO: Watchdog extension initialized
09-15 20:21:17.861 10.0.0.46:54323       51356  #r thread INFO: XGBoost extension initialized
09-15 20:21:17.861 10.0.0.46:54323       51356  #r thread INFO: Registered 2 core extensions in: 24ms
09-15 20:21:17.862 10.0.0.46:54323       51356  #r thread INFO: Registered H2O core extensions: [Watchdog, XGBoost]
09-15 20:21:18.355 10.0.0.46:54323       51356  #r thread INFO: Registered: 160 REST APIs in: 493ms
09-15 20:21:18.355 10.0.0.46:54323       51356  #r thread INFO: Registered REST API extensions: [XGBoost, Algos, AutoML, Core V3, Core V4]
09-15 20:21:18.448 10.0.0.46:54323       51356  #r thread INFO: Registered: 244 schemas in 93ms
09-15 20:21:18.449 10.0.0.46:54323       51356  #r thread INFO: H2O started in 1848ms
09-15 20:21:18.449 10.0.0.46:54323       51356  #r thread INFO:
09-15 20:21:18.449 10.0.0.46:54323       51356  #r thread INFO: Open H2O Flow in your web browser: http://10.0.0.46:54323
09-15 20:21:18.449 10.0.0.46:54323       51356  #r thread INFO:
09-15 20:21:20.541 10.0.0.46:54323       51356  main      TRACE: H2OContext initialized
h2oContext: org.apache.spark.h2o.H2OContext =

Sparkling Water Context:
 * H2O name: sparkling-water-avkashchauhan_local-1505532002512
 * cluster size: 1
 * list of used nodes:
  (executorId, host, port)
  ------------------------
  (driver,10.0.0.46,54323)
  ------------------------

  Open H2O Flow in browser: http://10.0.0.46:54323 (CMD + click in Mac OSX)


scala> import h2oContext._
import h2oContext._

scala> import java.io.File
import java.io.File

scala> import h2oContext.implicits._
import h2oContext.implicits._

scala> import water.Key
import water.Key

scala> val prostateData = new H2OFrame(new File("/Users/avkashchauhan/src/github.com/h2oai/sparkling-water/examples/smalldata/prostate.csv"))
09-15 20:22:43.228 10.0.0.46:54323       51356  main      INFO: Locking cloud to new members, because water.fvec.NFSFileVec
09-15 20:22:43.464 10.0.0.46:54323       51356  main      INFO: ParseSetup heuristic: cloudSize: 1, cores: 8, numCols: 9, maxLineLength: 28, totalSize: 9254, localParseSize: 9254, chunkSize: 4194304, numChunks: 1, numChunks * cols: 9
09-15 20:22:43.466 10.0.0.46:54323       51356  main      INFO: Total file size: 9.0 KB
09-15 20:22:43.484 10.0.0.46:54323       51356  main      INFO: Parse chunk size 4194304
09-15 20:22:43.585 10.0.0.46:54323       51356  FJ-1-15   INFO: Parse result for prostate.hex (380 rows):
09-15 20:22:43.598 10.0.0.46:54323       51356  FJ-1-15   INFO:    ColV2    type          min          max         mean        sigma         NAs constant cardinality
09-15 20:22:43.598 10.0.0.46:54323       51356  FJ-1-15   INFO:       ID: numeric      1.00000      380.000      190.500      109.841
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:  CAPSULE: numeric      0.00000      1.00000     0.402632     0.491074
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:      AGE: numeric      43.0000      79.0000      66.0395      6.52707
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:     RACE: numeric      0.00000      2.00000      1.08684     0.308773
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:    DPROS: numeric      1.00000      4.00000      2.27105      1.00011
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:    DCAPS: numeric      1.00000      2.00000      1.10789     0.310656
09-15 20:22:43.599 10.0.0.46:54323       51356  FJ-1-15   INFO:      PSA: numeric     0.300000      139.700      15.4086      19.9976
09-15 20:22:43.600 10.0.0.46:54323       51356  FJ-1-15   INFO:      VOL: numeric      0.00000      97.6000      15.8129      18.3476
09-15 20:22:43.600 10.0.0.46:54323       51356  FJ-1-15   INFO:  GLEASON: numeric      0.00000      9.00000      6.38421      1.09195
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO: Chunk compression summary:
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:   Chunk Type                 Chunk Name       Count  Count Percentage        Size  Size Percentage
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:          CBS                     Binary           1          11.111 %      118  B          2.421 %
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:          C1N  1-Byte Integers (w/o NAs)           5          55.556 %      2.2 KB         45.958 %
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:           C2            2-Byte Integers           1          11.111 %      828  B         16.988 %
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:          C2S           2-Byte Fractions           2          22.222 %      1.6 KB         34.633 %
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO: Frame distribution summary:
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:                        Size  Number of Rows  Number of Chunks per Column  Number of Chunks
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO: 10.0.0.46:54323      4.8 KB             380                            1                 9
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:            mean      4.8 KB      380.000000                     1.000000          9.000000
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:             min      4.8 KB      380.000000                     1.000000          9.000000
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:             max      4.8 KB      380.000000                     1.000000          9.000000
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:          stddev        0  B        0.000000                     0.000000          0.000000
09-15 20:22:43.612 10.0.0.46:54323       51356  FJ-1-15   INFO:           total      4.8 KB             380                            1                 9
prostateData: water.fvec.H2OFrame =
Frame key: prostate.hex
   cols: 9
   rows: 380
 chunks: 1
   size: 4874

scala> val autoMLBuildSpec = new AutoMLBuildSpec()
autoMLBuildSpec: ai.h2o.automl.AutoMLBuildSpec = ai.h2o.automl.AutoMLBuildSpec@5cfadadc

scala> autoMLBuildSpec.input_spec.training_frame = prostateData.
VecSelector         anyVec        clone             domains        hasNAs         isVec            makeSchema   name        readExternal      rename        toCSV           uniquify           vec
VecTransformation   apply         colToEnum         extractFrame   hashCode       key              means        names       readJSON          replace       toJsonString    unlock             vecs
_kb                 asBytes       compareTo         find           home           keys             modes        numCols     read_lock         restructure   toString        unlock_all         write
_key                bulkRollups   deepCopy          frozenType     home_node      keysList         moveFirst    numRows     reloadFromBytes   setNames      toTwoDimTable   update             writeAll
_lockers            byteSize      deepSlice         get            insertVec      lastVec          mults        postWrite   reloadVecs        sort          type            user_allowed       writeExternal
_names              cardinality   delete            getVecKey      isChunkKey     lastVecName      naCount      prepend     remove            subframe      types           valueClass         writeJSON
add                 checksum      delete_and_lock   hasInfs        isCompatible   makeCompatible   naFraction   read        removeAll         swap          typesStr        valueClassSimple   write_lock

scala> autoMLBuildSpec.input_spec.training_frame = prostateData._key
autoMLBuildSpec.input_spec.training_frame: water.Key[water.fvec.Frame] = prostate.hex

scala> autoMLBuildSpec.input_spec.response_column = "CAPSULE";
autoMLBuildSpec.input_spec.response_column: String = CAPSULE

scala> autoMLBuildSpec.build_control.loss = "AUTO"
autoMLBuildSpec.build_control.loss: String = AUTO

scala> autoMLBuildSpec.build_control.stopping_criteria.set_max_runtime_secs(5)

scala> import java.util.Date;
import java.util.Date

scala> val aml = AutoML.makeAutoML(Key.make(), new Date(), autoMLBuildSpec)
aml: ai.h2o.automl.AutoML = ai.h2o.automl.AutoML@3ad9012f

scala> AutoML.startAutoML(aml)
..............
...
... This will start the AML process which will take some time to finish
...
..............

scala> aml.leader
warning: there was one feature warning; re-run with -feature for details
res4: hex.Model[?0,?1,?2] forSome { type ?0 <: hex.Model[?0,?1,?2]; type ?1 <: hex.Model.Parameters; type ?2 <: hex.Model.Output } =
Model Metrics Type: RegressionGLM
 Description: N/A
 model id: GLM_grid_0_AutoML_20170915_202514_model_1
 frame id: automl_training_prostate.hex
 MSE: 0.16562025
 RMSE: 0.4069647
 mean residual deviance: 0.16562025
 mean absolute error: 0.35771698
 root mean squared log error: 0.28812236
 null DOF: 265.0
 residual DOF: 257.0
 null deviance: 64.8421
 residual deviance: 44.05499
 AIC: 296.59195
Model Metrics Type: RegressionGLM
 Description: N/A
 model id: GLM_grid_0_AutoML_20170915_202514_model_1
 frame id: automl_validation_prostate.hex
 MSE: 0.21967092
 RMSE: 0.46869063
 mean residual deviance: 0.21967092
 mean absolute error: 0.4152546
 root mean squared...
scala> aml.leader
leader   leaderboard

scala> aml.leaderboard
res5: ai.h2o.automl.Leaderboard = Leaderboard for project_name "automl_prostate":  | model_id ; [Ljava.lang.String;@5dde2d12 | GLM_grid_0_AutoML_20170915_202514_model_1 ; [D@71c8e40e | GLM_grid_0_AutoML_20170915_202514_model_0 ; [D@65a44d8a | StackedEnsemble_0_AutoML_20170915_202514 ; [D@5e24311b | DRF_0_AutoML_20170915_202514 ; [D@72be2170 | XRT_0_AutoML_20170915_202514 ; [D@446043bd | GBM_grid_0_AutoML_20170915_202514_model_0 ; [D@36f8ea6 |


```
