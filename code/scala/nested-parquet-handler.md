## Handling nested parquet with columns as Array

The following Script does the following:
 - 1. Handle nestest parquet
 - 2. Remove columns as Array

### Here is a the script ##

```
def flattenSchema(schema: StructType, prefix: String = null) : Array[Column] = {
  schema.fields.flatMap(f => {
    val colPath = if (prefix == null) s"`${f.name}`" else s"${prefix}.`${f.name}`"

    f.dataType match {
      case st: StructType => flattenSchema(st, colPath)
      // Skip user defined types like array or vectors
      case x if x.isInstanceOf[ArrayType] => Array.empty[Column]
      case _ => Array(col(colPath).alias(colPath.replaceAll("[.`]", "_")))
    }
  })
}
```
### Here are all the commands ###

```

val spark = new org.apache.spark.sql.SQLContext(sc)
import org.apache.spark.sql.types._
import org.apache.spark.sql.Column
import org.apache.spark.sql.types._
import org.apache.spark.sql.functions._

scala> :paste
// Entering paste mode (ctrl-D to finish)

def flattenSchema(schema: StructType, prefix: String = null) : Array[Column] = {
  schema.fields.flatMap(f => {
    val colPath = if (prefix == null) s"`${f.name}`" else s"${prefix}.`${f.name}`"

    f.dataType match {
      case st: StructType => flattenSchema(st, colPath)
      // Skip user defined types like array or vectors
      case x if x.isInstanceOf[ArrayType] => Array.empty[Column]
      case _ => Array(col(colPath).alias(colPath.replaceAll("[.`]", "_")))
    }
  })
}

// Exiting paste mode, now interpreting.

flattenSchema: (schema: org.apache.spark.sql.types.StructType, prefix: String)Array[org.apache.spark.sql.Column]

scala >

val df = spark.read.parquet("/user/avkash/test.parquet")

df.select(flattenSchema(df.schema):_*).write.format("com.databricks.spark.csv").save("/Users/avkashchauhan/Downloads/saveit/result.csv")

```


### Here is a working example for Spark 2.1 ##

```
~/sw2/sparkling-water-2.1.14 -> bin/sparkling-shell                                                                                                                                                                             
-----
  Spark master (MASTER)     : local[*]
  Spark home   (SPARK_HOME) : /Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6
  H2O build version         : 3.14.0.2 (weierstrass)
  Spark build version       : 2.1.1
  Scala version             : 2.11
----

Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=384m; support was removed in 8.0
17/09/27 17:12:49 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
17/09/27 17:12:51 WARN General: Plugin (Bundle) "org.datanucleus.store.rdbms" is already registered. Ensure you dont have multiple JAR versions of the same plugin in the classpath. The URL "file:/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-rdbms-3.2.9.jar" is already registered, and you are trying to register an identical plugin located at URL "file:/Volumes/OSxexT/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-rdbms-3.2.9.jar."
17/09/27 17:12:51 WARN General: Plugin (Bundle) "org.datanucleus" is already registered. Ensure you dont have multiple JAR versions of the same plugin in the classpath. The URL "file:/Volumes/OSxexT/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-core-3.2.10.jar" is already registered, and you are trying to register an identical plugin located at URL "file:/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-core-3.2.10.jar."
17/09/27 17:12:51 WARN General: Plugin (Bundle) "org.datanucleus.api.jdo" is already registered. Ensure you dont have multiple JAR versions of the same plugin in the classpath. The URL "file:/Users/avkashchauhan/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-api-jdo-3.2.6.jar" is already registered, and you are trying to register an identical plugin located at URL "file:/Volumes/OSxexT/tools/spark-2.1.0-bin-hadoop2.6/jars/datanucleus-api-jdo-3.2.6.jar."
17/09/27 17:12:53 WARN ObjectStore: Failed to get database global_temp, returning NoSuchObjectException
Spark context Web UI available at http://10.0.0.46:4040
Spark context available as 'sc' (master = local[*], app id = local-1506557570254).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.1.0
      /_/

Using Scala version 2.11.8 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_101)
Type in expressions to have them evaluated.
Type :help for more information.

scala> val spark = new org.apache.spark.sql.SQLContext(sc)
warning: there was one deprecation warning; re-run with -deprecation for details
spark: org.apache.spark.sql.SQLContext = org.apache.spark.sql.SQLContext@69d61a6f

scala> import org.apache.spark.sql.types._
import org.apache.spark.sql.types._

scala> import org.apache.spark.sql.Column
import org.apache.spark.sql.Column

scala> import org.apache.spark.sql.types._
import org.apache.spark.sql.types._

scala> import org.apache.spark.sql.functions._
import org.apache.spark.sql.functions._

scala> :paste
// Entering paste mode (ctrl-D to finish)

def flattenSchema(schema: StructType, prefix: String = null) : Array[Column] = {
  schema.fields.flatMap(f => {
    val colPath = if (prefix == null) s"`${f.name}`" else s"${prefix}.`${f.name}`"

    f.dataType match {
      case st: StructType => flattenSchema(st, colPath)
      // Skip user defined types like array or vectors
      case x if x.isInstanceOf[ArrayType] => Array.empty[Column]
      case _ => Array(col(colPath).alias(colPath.replaceAll("[.`]", "_")))
    }
  })
}

// Exiting paste mode, now interpreting.

flattenSchema: (schema: org.apache.spark.sql.types.StructType, prefix: String)Array[org.apache.spark.sql.Column]

scala> val df = spark.read.parquet("/Users/avkashchauhan/Downloads/filename_test1.parquet")
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
17/09/27 17:14:03 WARN Utils: Truncated the string representation of a plan since it was too large. This behavior can be adjusted by setting 'spark.debug.maxToStringFields' in SparkEnv.conf.
df: org.apache.spark.sql.DataFrame = [TICKET_XX: string, TICKET_TYPEXX: string ... 104 more fields]

scala> df.select(flattenSchema(df.schema):_*).write.format("com.databricks.spark.csv").save("/Users/avkashchauhan/Downloads/saveit/result.csv")
17/09/27 17:15:20 WARN ParquetRecordReader: Can not initialize counter due to context is not a instance of TaskInputOutputContext, but is org.apache.hadoop.mapreduce.task.TaskAttemptContextImpl

```

### Here is a working example for Spark 1.6 ##

```
avkash@mr-0xd7-precise1:~/sparkling-water-1.6.8$ bin/sparkling-shell --packages com.databricks:spark-csv_2.10:1.5.0

-----
  Spark master (MASTER) : local[*]
  Spark home (SPARK_HOME) : /opt/cloudera/parcels/CDH/lib/spark
  H2O build version : 3.10.0.7 (turing)
  Spark build version : 1.6.2
----

WARNING: User-defined SPARK_HOME (/opt/cloudera/parcels/CDH-5.8.4-1.cdh5.8.4.p0.5/lib/spark) overrides detected (/opt/cloudera/parcels/CDH/lib/spark).
WARNING: Running spark-class from user-defined location.
Ivy Default Cache set to: /home/avkash/.ivy2/cache
The jars for the packages stored in: /home/avkash/.ivy2/jars
:: loading settings :: url = jar:file:/opt/cloudera/parcels/CDH-5.8.4-1.cdh5.8.4.p0.5/jars/spark-assembly-1.6.0-cdh5.8.4-hadoop2.6.0-cdh5.8.4.jar!/org/apache/ivy/core/settings/ivysettings.xml
com.databricks#spark-csv_2.10 added as a dependency
:: resolving dependencies :: org.apache.spark#spark-submit-parent;1.0
 confs: [default]
 found com.databricks#spark-csv_2.10;1.5.0 in central
 found org.apache.commons#commons-csv;1.1 in central
 found com.univocity#univocity-parsers;1.5.1 in central
:: resolution report :: resolve 425ms :: artifacts dl 11ms
 :: modules in use:
 com.databricks#spark-csv_2.10;1.5.0 from central in [default]
 com.univocity#univocity-parsers;1.5.1 from central in [default]
 org.apache.commons#commons-csv;1.1 from central in [default]
 ---------------------------------------------------------------------
 | | modules || artifacts |
 | conf | number| search|dwnlded|evicted|| number|dwnlded|
 ---------------------------------------------------------------------
 | default | 3 | 0 | 0 | 0 || 3 | 0 |
 ---------------------------------------------------------------------
:: retrieving :: org.apache.spark#spark-submit-parent
 confs: [default]
 0 artifacts copied, 3 already retrieved (0kB/10ms)
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel).
Welcome to
      ____ __
     / __/__ ___ _____/ /__
    _\ \/ _ \/ _ `/ __/ '_/
   /___/ .__/\_,_/_/ /_/\_\ version 1.6.0
      /_/

Using Scala version 2.10.5 (Java HotSpot(TM) 64-Bit Server VM, Java 1.7.0_80)
Type in expressions to have them evaluated.
Type :help for more information.
17/09/20 13:32:14 WARN util.Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.
Spark context available as sc (master = yarn-client, app id = application_1499294366934_0582).
SQL context available as sqlContext.

scala> val spark = new org.apache.spark.sql.SQLContext(sc)
spark: org.apache.spark.sql.SQLContext = org.apache.spark.sql.SQLContext@7246c09a

scala> import org.apache.spark.sql.types._
import org.apache.spark.sql.types._

scala> import org.apache.spark.sql.Column
import org.apache.spark.sql.Column

scala> import org.apache.spark.sql.types._
import org.apache.spark.sql.types._

scala> import org.apache.spark.sql.functions._
import org.apache.spark.sql.functions._

scala>

scala> :paste
// Entering paste mode (ctrl-D to finish)

def flattenSchema(schema: StructType, prefix: String = null) : Array[Column] = {
  schema.fields.flatMap(f => {
    val colPath = if (prefix == null) s"`${f.name}`" else s"${prefix}.`${f.name}`"

    f.dataType match {
      case st: StructType => flattenSchema(st, colPath)
      // Skip user defined types like array or vectors
      case x if x.isInstanceOf[ArrayType] => Array.empty[Column]
      case _ => Array(col(colPath).alias(colPath.replaceAll("[.`]", "_")))
    }
  })
}

// Exiting paste mode, now interpreting.

flattenSchema: (schema: org.apache.spark.sql.types.StructType, prefix: String)Array[org.apache.spark.sql.Column]

scala>

scala> val df = spark.read.parquet("/user/avkash/Test-test1.parquet")
df: org.apache.spark.sql.DataFrame = [TICKET_XX: string, TICKET_TYPEXX: string, EXT_REFER...

scala> df.select(flattenSchema(df.schema):_*).write.format("com.databricks.spark.csv").save("/Users/avkashchauhan/Downloads/saveit/result.csv")

```
