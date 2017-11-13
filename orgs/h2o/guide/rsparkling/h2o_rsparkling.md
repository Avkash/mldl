# rsparkling : Sparkling Water package on R with SparklyR #

The rsparkling is an R package which can be used with R for H2O Sparkling Water application on Spark. 

### Installing rsparkling: Must need H2O R Packagge & sparklyr ###

Install latest version of H2O R Package:
Visit: [https://www.h2o.ai/download/](https://www.h2o.ai/download/)
Get the latest H2O for R: http://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/7/index.html
```
install.packages("h2o", type="source", repos="http://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/7/R")
```
You must need sparklyR to use rsparkling so please install latest sparklyr as below:
```
install.packages("sparklyr")
```
After that you must install rsparkling package from CRAN as below:
```
install.packages("rsparkling")
```

### rsparkling with sparkling water assemblies or package-version and Spark Locak ### 

```
options(rsparkling.sparklingwater.version = "2.1.5") 
### --- Sometimes verison does not work and passing exact jar helps
options(rsparkling.sparklingwater.location = "/tmp/sparkling-water-assembly_2.11-2.1.7-all.jar")
library(rsparkling) 
library(sparklyr) 
library(h2o)
sc = spark_connect(master = "local")
### --- Check all the settings from sc
sc
### --- Pass exact spark version with above if hit version issue 
h2o_context(sc, strict_version_check = FALSE)
### ---Testing h2o contenxt -> This will start H2O server
mtcars_tbl <- copy_to(sc, mtcars, "mtcars", overwrite = TRUE)
spark_disconnect(sc)
```

### rsparkling with data ingest on LOCAL Spark ###
```
options(rsparkling.sparklingwater.location = "/tmp/sparkling-water-assembly_2.11-2.1.7-all.jar")
library(rsparkling)
library(sparklyr)
sc <- spark_connect(master = "local", version = "2.1.0")
If there is any issue with sparklyr and spark version pass exact version above.
mtcars_tbl <- copy_to(sc, mtcars, "mtcars")
h2o_context(sc, strict_version_check = FALSE)
sciris_tbl <- copy_to(sc, iris)
mtcars_tbl <- copy_to(sc, mtcars, "iris1")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars", overwrite = TRUE)
Spark_disconnect(sc)
```
### Opening H2O FLOW from rsparkling ###
```
library(rsparkling)
library(sparklyr)
library(h2o)
sc <- spark_connect(master = "local", version = "2.1.0")
h2o_flow(sc)
### ---
h2o_flow(sc, strict_version_check = FALSE)
```

### rsparkling: Copy data from H2O to Spark Dataframe ###
```
packageVersion("sparklyr")
sc <- spark_connect(master = "local")
### Note:  A new spark tab will be visible in Rstudio
sc 
### Note: You will get a report on various sc details
> iris_tbl <- copy_to(sc, iris)
### Note: Above will create a folder name /tmp/hive in the machine where this command runs.
### - You can launch Spark UI
### - You will also see data frame 
### - If hit permission error with /tmp/hive
### - Remove the folder /tmp/hive
### - Rerun above command
```

### H2O GBM Sample with rsparkling and sparklyR ###
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

### rsparkling on Hadoop with Spark and YARN with multuple node cluster ###
```
options(rsparkling.sparklingwater.location="/tmp/sparkling-water-assembly_2.11-2.1.8-all.jar")
Sys.setenv(SPARK_HOME="/usr/hdp/current/spark2-client/")
library(sparklyr)
library(rsparkling)
config <- spark_config()
config$spark.executor.cores <- 4
config$spark.executor.memory <- "4G”
config$spark.executor.instances = 3
sc <- spark_connect(master = "yarn-client", config = config, version = '2.1.0')
```

### rsparkling sample on Hadoop with YARN and Spark with GBM ###
```
options(rsparkling.sparklingwater.location="/tmp/sparkling-water-assembly_2.11-2.1.8-all.jar")
Sys.setenv(SPARK_HOME="/usr/hdp/current/spark2-client/")
library(sparklyr)
library(rsparkling)
sc <- spark_connect(master = "yarn-client")
mtcars_tbl <- copy_to(sc, mtcars, overwrite = TRUE)
mtcars_tblmtcars_hf <- as_h2o_frame(sc, mtcars_tbl)
mtcars_hf <- as_h2o_frame(sc, mtcars_tbl, strict_version_check = FALSE)
mtcars_hf
y <- "mpg”
x <- setdiff(names(mtcars_hf), y)
library(h2o)
splits <- h2o.splitFrame(mtcars_hf, ratios = 0.7, seed = 1)
fit <- h2o.gbm(x = x,y = y,training_frame = splits[[1]],min_rows = 1,seed = 1)
fit
```
### Troubleshooting rsparkling #1 ###
```
options(rsparkling.sparklingwater.version = "2.1.5") 
library(rsparkling) 
library(rsparkling) 
sc <- spark_connect(master = "local") 
Minor version of Sparkling Water does not correspond to minor Spark version. Minor Sparkling Water Version = 1 Minor Spark Version = 0 
Error in spark_dependencies(spark_version = spark_version, scala_version = scala_version) :
```
Solution:
```
Note: We must have major and minor version match between spark and sparkling water
```

### Troubleshooting rsparkling #2 ###
```
library(sparklyr)
options(rsparkling.sparklingwater.location = "/home/ec2-user/tools/sparkling-water-2.1.7") 
library(rsparkling) 
sc <- spark_connect(master = "local", version = "2.0.2") 
Warning message: In normalizePath(unlist(unique(all_jars))) : path[1]="/home/ec2-user/tools/sparkling-water-2.1.7": Permission denied
```
Solution:
```
Note: Use the version instead of path 
options(rsparkling.sparklingwater.version = '1.6.7')
```
### Troubleshooting rsparkling  on Hadoop #3 ###
```
sc <- spark_connect(master = "yarn", version = "2.1.0") 
Error in force(code) : Failed during initialize_connection: org.apache.hadoop.security.AccessControlException: Permission denied: user=achauhan, access=WRITE, inode="/user/achauhan/.sparkStaging/application_1495591894623_0007":hdfs:hdfs:drwxr-xr-x
```
Solution:
```
Note: The achauhan user must be on HDFS >> /user/achauhan with ownership level set as achauhan:hdfs
```


