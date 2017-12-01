## Converting pyspark.sql.dataframe.DataFrame to H2O Data Frame ##

The folllowing code shows 2 steps:

  1. Converting pyspark.sql.dataframe.DataFrame to H2O Data Frame (Recommended)
  2. Converting pyspark.sql.dataframe.DataFrame to H2O Data Frame through Pandas DataFrame (Not Recommended)

Here is he source code:

// Imports
```
from pyspark.sql import Row
from pysparkling import *
import h2o
```
// H2O Context
```
h2oContext = H2OContext.getOrCreate(spark)
```

// Creating a pyspark.sql.dataframe.DataFrame 
```
rdd = sc.parallelize([Row(name='Alice', age=5, height=80),Row(name='Alice', age=5, height=80),Row(name='Alice', age=10, height=80)])
df = rdd.toDF()
```

// Verifying it
```
type(df)
<class 'pyspark.sql.dataframe.DataFrame'>
```

// Converting pyspark.sql.dataframe.DataFrame to H2O Frame (Direct Transformation - Recommended)
```
hdf = h2oContext.as_h2o_frame(df)
>>> type(hdf)
<class 'h2o.frame.H2OFrame'>
```

// Converting pyspark.sql.dataframe.DataFrame to H2O Frame (Transformation through Pandas - Not recommended )
```
hdf = h2o.H2OFrame(df.toPandas())
>>> type(hdf)
<class 'h2o.frame.H2OFrame'>
```


