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

### rsparkling with passing sparkling water assemblies or package-version ### 

```
options(rsparkling.sparklingwater.version = "2.1.5") 
### --- Sometimes verison does not work and passing exact jar helps
options(rsparkling.sparklingwater.location = "/tmp/sparkling-water-assembly_2.11-2.1.7-all.jar")
library(rsparkling) 
library(sparklyr) 
library(h2o)
sc = spark_connect(master = "local")
### --- Pass exact spark version with above if hit version issue 
h2o_context(sc, strict_version_check = FALSE)
### ---Testing h2o contenxt -> This will start H2O server
mtcars_tbl <- copy_to(sc, mtcars, "mtcars", overwrite = TRUE)
spark_disconnect(sc)
```
