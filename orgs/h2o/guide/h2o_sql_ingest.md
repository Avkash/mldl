# [Ingesting data from SQL in H2O using Python and R](#IngestingDataFromSQLInPythonAndR) #

### Supported Scenarios ### 
You can use 
- JDBC Driver 0.42 and above core
- 

### Python ###
Here are the H2O API you can use in Python to connect a support RDBMS using proper JDBC Driver:
```
h2o.import_sql_select(connection_url, select_query, username, password, optimize=True)
h2o.import_sql_table(connection_url, table, username, password, columns=None, optimize=True)
```

Here is Python Sample code to check Netezza RDBMS connected using JDBC Driver:

Step 1: Importing python jaydebeapi library
```
import jaydebeapi
```
Step 2: Setting Database connection settings
```
dsn_database = "avkash"            
dsn_hostname = "172.16.181.131" 
dsn_port = "5480"                
dsn_uid = "admin"        
dsn_pwd = "password"      
jdbc_driver_name = "org.netezza.Driver"
jdbc_driver_loc = "/Users/avkashchauhan/learn/customers/netezza/nzjdbc3.jar"
###jdbc:netezza://" + server + "/" + dbName ;
connection_string='jdbc:netezza://'+dsn_hostname+':'+dsn_port+'/'+dsn_database
url = '{0}:user={1};password={2}'.format(connection_string, dsn_uid, dsn_pwd)
print("URL: " + url)
print("Connection String: " + connection_string)
```

Step 3:Creating Database Connection
```
conn = jaydebeapi.connect("org.netezza.Driver", connection_string, {'user': dsn_uid, 'password': dsn_pwd},
                         jars = "/Users/avkashchauhan/learn/customers/netezza/nzjdbc3.jar")
curs = conn.cursor()
```

Step 4:Processing SQL Query
```
curs.execute("select * from allusers")
result = curs.fetchall()
print("Total records: " + str(len(result)))
print(result[0])
```

Step 5: Printing all records
```
for i in range(len(result)):
    print(result[i])
```

Step 6: Closing all connections
```
curs.close()
conn.close()
```

### R ###

Here are the H2O API you can use in R to connect a support RDBMS using proper JDBC Driver:
```
h2o.import_sql_select(connection_url, select_query, username, password,  optimize = NULL)

h2o.import_sql_table(connection_url, table, username, password,  columns = NULL, optimize = NULL)
```
Testing R connection to Postgresql using RPostgreSQL package:
```
install.packages("RPostgreSQL")

# User package RPostgreSQL 
library(RPostgreSQL)

# Code to test database and table:
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "dvdrentaldb", host = "localhost", port = 5432,
user = "avkash", password = "avkash")
dbExistsTable(con, "actor")
```
Here is an example of using H2O API to read a SQL table from Postgresql Database:
```
library(h2o)
h2o.init()
payment = h2o.import_sql_table(connection_url = “jdbc:postgresql://localhost:5432/h2odb?&useSSL=false”, table= “payment”, username = “avkash”, password = “avkash”)
payment
```
Here are few helpful articles to assist you in accessing RDBMS tables in H2O:
 - [Setup postgresql database on OSX](https://aichamp.wordpress.com/2017/03/20/setup-postgresql-database-on-osx/)
 - [Restoring DVD rental database into postgresql](https://aichamp.wordpress.com/2017/03/20/restoring-dvd-rental-database-into-postgresql/)
 - [Building H2O GLM model using Postgresql database and JDBC driver](https://aichamp.wordpress.com/2017/03/20/building-h2o-glm-model-using-postgresql-database-and-jdbc-driver/)

### Understanding Data distribution in memory ###
