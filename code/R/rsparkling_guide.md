
## Intallation Packages ##
 - [sparklyr](https://spark.apache.org/docs/latest/sparkr.html) 0.6.2
 - [rsparkling](https://github.com/h2oai/rsparkling) 0.2.1 
 - Apache spark 2.1.x
 - Sparkling Water 2.1.14
 - [RStudio] (https://github.com/rstudio) - Optional 


## Quick Start Script ##
```
Sys.setenv(SPARK_HOME='/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.7')
options(rsparkling.sparklingwater.version = "2.1.14") 
options(rsparkling.sparklingwater.location = "/Users/avkashchauhan/tools/sw2/sparkling-water-2.1.14/assembly/build/libs/sparkling-water-assembly_2.11-2.1.14-all.jar")
library(rsparkling)
library(sparklyr)
sc = spark_connect(master = "local", version = "2.1.0")
sc
h2o_context(sc, strict_version_check = FALSE)
library(h2o)
h2o.clusterInfo()
h2o_flow(sc)
spark_disconnect(sc)
```

Important Settings:
 - master = "local"         > To start local spark cluster
 - master = "yarn-client"   > To start a cluster managed by YARN 
 - To get a list of supported Sparkling Water versions: h2o_release_table()
 - When you will call spark_connect() you will see a new "tab" appears
   - Tab "Spark" is used to launch "SparkUI" 
   - Tab "Log" is used to collect spark logs
 - If there is any issue with sparklyr and spark version pass exact version above otherwise you dont need to pass version.

 
## Startup Script with config parameters to set executor settings ##
```
Sys.setenv(SPARK_HOME='/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.7')
options(rsparkling.sparklingwater.version = "2.1.14") 
options(rsparkling.sparklingwater.location = "/Users/avkashchauhan/tools/sw2/sparkling-water-2.1.14/assembly/build/libs/sparkling-water-assembly_2.11-2.1.14-all.jar")
library(rsparkling)
library(sparklyr)
config <- spark_config()
config$spark.executor.cores <- 4
config$spark.executor.memory <- "4G”
config$spark.executor.instances = 3  <==== This will create 3 Nodes Instance
sc <- spark_connect(master = "local", config = config, version = '2.1.0')
sc
h2o_context(sc, strict_version_check = FALSE)
library(h2o)
h2o.clusterInfo()
spark_disconnect(sc)
```

## Building H2O GLM model using rsparkling + sparklyr + H2O ## 
```
options(rsparkling.sparklingwater.location = "/tmp/sparkling-water-assembly_2.11-2.1.7-all.jar")
library(rsparkling)
library(sparklyr)
library(h2o)
sc <- spark_connect(master = "local", version = "2.1.0")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars")
sciris_tbl <- copy_to(sc, iris)
mtcars_tbl <- copy_to(sc, mtcars, "iris1")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars", overwrite = TRUE)
mtcars_h2o <- as_h2o_frame(sc, mtcars_tbl, strict_version_check = FALSE)
mtcars_glm <- h2o.glm(x = c("wt", "cyl"),mtcars_glm <- h2o.glm(x = c("wt", "cyl"),y = "mpg",training_frame = mtcars_h2o,lambda_search = TRUE)
mtcars_glm
spark_disconnect(sc)

```


