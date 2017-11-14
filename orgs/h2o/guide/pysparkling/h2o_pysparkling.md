# pysparkling : H2O Sparkling Water from PySpark #

You can use H2O Sparkling Water from PySpark and the H2O Sparkling Water integration with Python, Pyspark and Spark is called PySparkling.

### Installing pyspark from pipy ###
Pypi Source: [https://pypi.python.org/pypi/h2o_pysparkling_2.2](https://pypi.python.org/pypi/h2o_pysparkling_2.2)

There are multiple PySparkling packages, each is intended to be used with different Spark version.

- h2o_pysparkling_2.2 - for Spark 2.2.x
- h2o_pysparkling_2.1 - for Spark 2.1.x
- h2o_pysparkling_2.0 - for Spark 2.0.x
- h2o_pysparkling_1.6 - for Spark 1.6.x (Only critical fixes)

As an example, to install PySparkling for Spark 2.2, try as below:
```
pip install h2o_pysparkling_2.2
```
### Environment Setup ###
As Sparkling Water, PySpark and Pysparkling, all have dependency on Spark, you must have SPARK_HOME set as Spark Home:
```
export SPARK_HOME="/path/to/spark/installation"
## --- To Run Spark local cluster
export MASTER='local[*]'
## --- To Run Spark on YARN cluster
export MASTER='yarn-client'

```
### Run PySparkling interactive shell ###

Inside Sparkling Water directory you can launch PySparkling shell as below:
```
$ bin/pysparkling
```
This pysparkling shell accepts common pyspark arguments.
```
#: -- Initialize H2OContext
from pysparkling import *
import h2o
hc = H2OContext.getOrCreate(spark)
```
### Run IPython with PySparkling ###
If you want to start PySparkling with jupyter Notebook, try as below:
```
PYSPARK_DRIVER_PYTHON="ipython" bin/pysparkling
```

### Run IPython Notebook with PySparkling ###
You must setup the PYSPARK_DRIVER_PYTHON as below:
```
PYSPARK_DRIVER_PYTHON="ipython" 
```
After that you can launch pysparkling shell as below:
```
PYSPARK_DRIVER_PYTHON_OPTS="notebook" bin/pysparkling
```

You must set the following environment if you are trying pysparkling on Windows OS:
```
SET PYSPARK_DRIVER_PYTHON=ipython
SET PYSPARK_DRIVER_PYTHON_OPTS=notebook
bin/pysparkling
```

### Samples ###
 - [H2O Pysparkling GBM Sample](https://github.com/h2oai/h2o-tutorials/tree/master/tutorials/pysparkling)
