# Building H2O (H2O-3) Core Source Code #

Note: Make sure you have completed the [H2O Pre-requsite](https://github.com/Avkash/mldl/blob/master/pages/h2o_dw_prerequsite.md) requirements. 

Start: change your current working folder to H2O core - h2o-3 source code
```
$ pwd
/home/ubuntu/src/github/h2o/h2o-3
```

Now run the build command without the test (building test component will take very long so do it later)
```
$ ./gradlew build -x test
```

### SUCCESS ###

```
:h2o-hadoop:h2o-mapreduce-generic:compileJava took 27.439 secs
:h2o-hadoop:h2o-mapreduce-generic:processResources UP-TO-DATE
:h2o-hadoop:h2o-mapreduce-generic:classes
:h2o-hadoop:h2o-mapreduce-generic:jar
:h2o-hadoop:h2o-mapreduce-generic:assemble
:h2o-hadoop:h2o-mapreduce-generic:check
:h2o-hadoop:h2o-mapreduce-generic:build
:h2o-hadoop:h2o-yarn-generic:compileJava
warning: [options] bootstrap class path not set in conjunction with -source 1.6
1 warning
:h2o-hadoop:h2o-yarn-generic:processResources UP-TO-DATE
:h2o-hadoop:h2o-yarn-generic:classes
:h2o-hadoop:h2o-yarn-generic:jar
:h2o-hadoop:h2o-yarn-generic:assemble
:h2o-hadoop:h2o-yarn-generic:check
:h2o-hadoop:h2o-yarn-generic:build

BUILD SUCCESSFUL

Total time: 4 mins 8.879 secs

Task timings:
  27.439 secs  :h2o-hadoop:h2o-mapreduce-generic:compileJava
  27.437 secs  :h2o-web:installNpmPackages
  17.574 secs  :h2o-assembly:shadowJar
  16.524 secs  :h2o-scala_2.10:compileScala
  14.865 secs  :h2o-scala_2.11:compileScala
  12.437 secs  :h2o-orc-parser:compileJava
   8.855 secs  :h2o-core:compileJava
  41.229 secs  All others
  
```

### PROBLEM ###

```
:buildSrc:clean UP-TO-DATE
:buildSrc:compileJava FAILED

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':compileJava'.
> Could not find tools.jar
```
**Solution:**
```
1. Make sure you have following both commands working:
  $ java
  $ javac
  
If no javac then install openjdk:

  $ sudo apt-get install openjdk-8-jdk

You must set JAVA_HOME environment because gradle is not able to find tools.jar and looking for JAVA_HOME 

$ echo $JAVA_HOME
  /usr/lib/jvm/java-8-openjdk-amd64

```

### PROBLEM ###
```
FAILURE: Build failed with an exception.
* What went wrong:
Execution failed for task ':h2o-web:compileHelpFiles'.
> A problem occurred starting process 'command 'node''
```
**Solution:**
```
 sudo apt-get install npm
 sudo apt-get install nodejs-legacy
```

### PROBLEM ###
```
ImportError: No module named requests
:h2o-bindings:runGenerateRESTAPIBindingsSrc FAILED
:h2o-bindings:runGenerateRESTAPIBindingsSrc took 0.065 secs
FAILURE: Build failed with an exception.
* What went wrong:
Execution failed for task ':h2o-bindings:runGenerateRESTAPIBindingsSrc'.
> Process 'command 'python'' finished with non-zero exit value 1
```
** Solution: **
```
  pip install requests
```

### PROBLEM ###
```
ImportError: No module named tabulate
:h2o-py:buildDist FAILED
:h2o-py:buildDist took 0.137 secs
FAILURE: Build failed with an exception.
* What went wrong:
Execution failed for task ':h2o-py:buildDist'.
> Process 'command 'python'' finished with non-zero exit value 1
```
**Solution:**
   pip install tabulate

### PROBLEM ###
```
ImportError: No module named future.utils
:h2o-py:buildDist FAILED
:h2o-py:buildDist took 0.115 secs

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':h2o-py:buildDist'.
```
** Solution:**
```
   pip install future
```

### PROBLEM ###
```
ImportError: No module named colorama
:h2o-py:buildDist FAILED
:h2o-py:buildDist took 0.194 secs

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':h2o-py:buildDist'.
```
** Solution:**
```
 pip install colorama
```

### PROBLEM ###
```
:h2o-r:getRVersion FAILED
:h2o-r:getRVersion took 0.003 secs

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':h2o-r:getRVersion'.
> A problem occurred starting process 'command 'R''
```
**Solution:**
```
  sudo apt-get install r-base r-base-dev
  sudo apt install r-cran-littler
  $ r --version
      r ('littler') version 0.3.0

 Latest R:
     R-3.3.2.tar.gz
    wget https://cran.rstudio.com/src/base/R-3/R-3.2.2.tar.gz
    tar xvf  R-3.3.2.tar.gz
    cd R-3.3.2
    ./configure
      [NOTE] If you hit following error/problem 
        checking for curl/curl.h... no
        configure: error: libcurl >= 7.28.0 library and headers are required with support for https
        [Solution]
        $ sudo apt-get install libcurl4-openssl-dev	

    sudo make && sudo make install
```   

### PROBLEM ###
```
...
...
> library(devtools); document('h2o-package');
Error in library(devtools) : there is no package called ‘devtools’
Execution halted
:h2o-r:buildPackageDocumentation FAILED
:h2o-r:buildPackageDocumentation took 0.177 secs

FAILURE: Build failed with an exception.
```
**Solution:**
   $ R
   Now in R console:
   > install.packages("devtools")
   > install.packages("roxygen2")

### PROBLEM ###
```
> library(devtools); document('h2o-package');
Updating h2o documentation
Loading h2o
Error in (function (dep_name, dep_ver = NA, dep_compare = NA)  :
  Dependency package RCurl not available.
Calls: document -> load_all -> load_imports -> mapply -> <Anonymous>
Execution halted
:h2o-r:buildPackageDocumentation FAILED
:h2o-r:buildPackageDocumentation took 0.624 secs
```
**Solution:**
   $ R
   Now in R console:
   > install.packages("RCurl")

