# Accessing H2O Library #

Before you would want to access H2O you would need to make sure you have installed H2O properly. The link below will help you install in your desired environment:
 - [H2O Installation](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/h2o_installation.md)

There are 2 key API to connect with H2O cluster from R or Python interface:
```
h2o.init()
h2o.connect()
```
Note: 
  - If no IP address and PORT is give, default IP as localhost and defult port 54321 will be used.
  - You can use h2o.init() and h2o.connect() to connect any H2O instance started locally, Hadoop, YARN etc. API does not distinguish how H2O cluster was started. 
 
### Difference between h2o.init() and h2o.connect() ###
 - ### h2o.init() ###
  - API will check first to see if H2O to running at default IP address and port
  - If H2O is running, then API will connect to running H2O instance
  - If H2O is not running, then API will try to start H2O on given IP address (Only apply to local IP Address/Localhost)
  - H2O cluser will not be started if startH2O parameter is set to FALSE (R)/ start = False/True for Python. 
 - ### h2o.connect() ###
  - This option is use to connect with an H2O instance which is already running and available on an IP/PORT
  - You must provide IP and PORT with the parameter.  

## List of parameters for h2o.init() ##
- url: Full URL of the server to connect to. (This can be used instead of ip + port + https.)
- ip: The ip address (or host name) of the server where H2O is running.
- port: Port number that H2O service is listening to.
- https: Set to True to connect via https:// instead of http://.
- insecure: When using https, setting this to True will disable SSL certificates verification.
- username: The username to log in with when using basic authentication.
- password: The password to log in with when using basic authentication.
- cookies: Cookie (or list of) to add to each request.
- proxy: The proxy server address.
- start_h2o: If False, do not attempt to start an H2O server when a connection to an existing one failed.
- nthreads: “Number of threads” option when launching a new H2O server.
- ice_root: The directory for temporary files for the new H2O server.
- enable_assertions: Enable assertions in Java for the new H2O server.
- max_mem_size: Maximum memory to use for the new H2O server.
- min_mem_size: Minimum memory to use for the new H2O server.
- strict_version_check: If True, an error will be raised if the client and server versions don’t match.

## Web Frontend (FLOW) ##
You can access H2O from FLOW by 
 https://IP_ADDRESS:PORT

The default port for H2O is 54321 so you can access H2O from FLOW 
![](https://github.com/Avkash/mldl/blob/master/images/flow-ui.png?raw=true)


## Python ##
You can connect to H2O from Python as below:
```
import h2o
h2o.init(ip = "ip_address_of_h2o_instance", port = NNNNN)
```


## R ##
You can connect to H2O from R as below:
```
library(h2o)
h2o.init(ip = "ip_address_of_h2o_instance", port = NNNNN)
```

## Scala ## 
You would be using Sparkling Water package with Spark to use with Scala. Once you have Sparkling Water prompt you can start the sparking shell as below:
```
 $ bin/sparklink-shell
```
Once sparkling shell is available from scala, you get the H2O context as below:
```
scala> import org.apache.spark.h2o._
import org.apache.spark.h2o._

scala> val hc = H2OContext.getOrCreate(spark)
......
......
Sparkling Water Context:
 * H2O name: sparkling-water-avkashchauhan_local-1509317501071
 * cluster size: 1
 * list of used nodes:
  (executorId, host, port)
  ------------------------
  (driver,10.0.0.46,54321)
  ------------------------

  Open H2O Flow in browser: http://10.0.0.46:54321 (CMD + click in Mac OSX)
```
After that you just connect to H2O from FLOW, R or Python, either way you want to. 

## Connecting H2O from R/Python API ##
First of all you must have H2O cluster version same as your R/Python API version so you can use H2O functions correctly however sometimes you may want to connect a little different H2O cluster from R/Python API. You can pass string_version_check with false in any of the H2O API to conenct with H2O with different version.
### R ###
```
h2o.init(string_version_check = False)
```
### Python ###
```
h2o.init(string_version_check = False)
```
Note: If you try to connect an H2O cluster which large version different you will get lots of error so its best to avoid using string_version_check parameter so make sure both H2O cluster and API have same version. 
