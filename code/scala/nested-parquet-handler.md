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

### Here is a working example for Spark 2.1 ##

```
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

scala> val df = spark.read.parquet("/user/avkash/TTS-XRE-test1.parquet")
df: org.apache.spark.sql.DataFrame = [TICKET_ID: string, TICKET_TYPE: string, PROB_CODE: string, PROB_SUM: string, SOL_CODE: string, SOL_DESCR: string, CAUSE_CODE: string, CAUSE_DESCRIPTION: string, REG_ID: string, REG_NAME: string, SYSTEM_ID: string, SYSTEM_NAME: string, FTA_ID: string, SUP_AREA_ID: string, SUP_AREA_NAME: string, QUEUE_ID: string, QUEUE_NAME: string, AGENT_ASSIGN: string, PRODUCT: string, SUBMITTING_SUP_AREA_ID: string, SUBMITTING_SUP_AREA_NAME: string, PRIORITY: string, STATUS: string, SEVERITY: string, PARENT_TICKET_ID: string, CUSTOMER_ID: string, ACCT_NUM: string, CUSTOMER_CLASS: string, NODE: string, NIU_ID: string, TTR_SECONDS: string, TTR_HRS: string, SRC: string, SRC_REFERENCE: string, CONTACT_NAME: string, CONTACT_PHONE: string, EXT_ASSIGNEE: string, EXT_REFER...

scala> df.select(flattenSchema(df.schema):_*).write.format("com.databricks.spark.csv").save("/user/avkash/saveit")

```
