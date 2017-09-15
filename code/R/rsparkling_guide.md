

```
> Sys.setenv(SPARK_HOME='/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6')
> options(rsparkling.sparklingwater.version = "2.1.5") 
> options(rsparkling.sparklingwater.location = "/Users/avkashchauhan/tools/sw2/sparkling-water-2.1.8/assembly/build/libs/sparkling-water-assembly_2.11-2.1.8-all.jar")
> library(rsparkling)
> library(sparklyr)
> library(h2o)
> sc = spark_connect(master = "local", version = "2.1.0")

```
