# Building H2O (H2O-3) Core with DeepWater libraries #


Make sure your working directory is deepwater folder which you just pulled/cloned from githug

$pwd
```
/home/ubuntu/src/github/h2o/deepwater
```

To build DeepWater source, the command is same as H2O as below:

*~/h2o/deepwater$ ./gradlew build -x test*

### SUCCESS ###

```
mkdir -p build/deepwater/backends/mxnet
javac -sourcepath . -d build *.java build/*.java
cp build/libNative.so build/deepwater/backends/mxnet
cp ../thirdparty/mxnet/lib/libmxnet.so build/deepwater/backends/mxnet
:deepwater-mxnet:compileJava
:deepwater-mxnet:processResources
:deepwater-mxnet:classes
:deepwater-mxnet:jar
:compileJava UP-TO-DATE
:processResources UP-TO-DATE
:classes UP-TO-DATE
:jar SKIPPED
:shadowJar
:assemble
:check
:build
:deepwater-backend-api:assemble UP-TO-DATE
:deepwater-backend-api:check
:deepwater-backend-api:build
:deepwater-backend-api:javadoc
:deepwater-mxnet:javadoc
:deepwater-mxnet:javadocJar
:deepwater-mxnet:sourcesJar
:deepwater-mxnet:assemble
:deepwater-mxnet:check
:deepwater-mxnet:build

BUILD SUCCESSFUL

Total time: 33.982 secs
```

Now look for  build/libs into deepwater folder for deepwater-all.jar as below:

```
-rw-rw-r-- 1 avkash avkash 139695003 Jan  7 14:37 deepwater-all.jar
```

### PROBLEM ###

```
Error:
* What went wrong:
Execution failed for task ':deepwater-backend-api:compileJava'.
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

For DeepWater build, you *must* finish the 3rd party build where java specific libs/jars are build/pulled etc/

```

### PROBLEM ###

```
:deepwater-mxnet:make FAILED

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':deepwater-mxnet:make'.
> Process 'command 'make'' finished with non-zero exit value 2
```

** Solution **
```
 The deep water build is missing mxnet libs. 
 You must finish building mxnet source first. 
 
```

### PROBLEM ###

```
$ ./gradlew build -x test
deepwater-backend-api
deepwater-mxnet
deepwater-tensorflow
:deepwater-backend-api:compileJava UP-TO-DATE
:deepwater-backend-api:processResources UP-TO-DATE
:deepwater-backend-api:classes UP-TO-DATE
:deepwater-backend-api:jar UP-TO-DATE
:deepwater-mxnet:make
swig -outdir build -c++ -java -package deepwater.backends.mxnet -o build/deepwater_wrap.cxx deepwater.i
g++ -c -fPIC -std=c++11 -O3 -Wall -I/usr/lib/jvm/java-8-oracle/include/linux/ -I/usr/lib/jvm/java-8-oracle/include/ -Iinclude -I. -I./src/ -Wno-unused-function -DMSHADOW_USE_CUDA=0 -I/usr/lib/jvm/java-8-oracle/include/linux/ -I/usr/lib/jvm/java-8-oracle/include/ -Iinclude -I. -I./src/ build/deepwater_wrap.cxx -o build/deepwater_wrap.o
build/deepwater_wrap.cxx:176:17: fatal error: jni.h: No such file or directory
compilation terminated.
Makefile:72: recipe for target 'build/libNative.so' failed
make: *** [build/libNative.so] Error 1
:deepwater-mxnet:make FAILED

[OR]
:deepwater-mxnet:make
swig -outdir build -c++ -java -package deepwater.backends.mxnet -o build/deepwater_wrap.cxx deepwater.i
g++ -c -fPIC -std=c++11 -O3 -Wall -I/usr/lib/jvm/java-8-oracle/include/linux/ -I/usr/lib/jvm/java-8-oracle/include/ -Iinclude -I. -I./src/ -Wno-unused-function -DMSHADOW_USE_CUDA=0 -I/usr/lib/jvm/java-8-oracle/include/linux/ -I/usr/lib/jvm/java-8-oracle/include/ -Iinclude -I. -I./src/ build/deepwater_wrap.cxx -o build/deepwater_wrap.o
In file included from build/deepwater_wrap.cxx:176:0:
/usr/lib/jvm/java-8-openjdk-amd64/include/jni.h:45:20: fatal error: jni_md.h: No such file or directory
compilation terminated.
Makefile:72: recipe for target 'build/libNative.so' failed
make: *** [build/libNative.so] Error 1
:deepwater-mxnet:make FAILED
```
**Solution:**
```
  Look if you have jni.h 
    $ find $JAVA_HOME -name 'jni.h'
  Once confirmed add CPATH
    export CPATH=$JAVA_HOME/include
    $ ls $CPATH 
       >> should result jni.h

Set the following in yout bashrc or other profile you have:

 export CPATH=$JAVA_HOME/include
 export CPATH=${CPATH}:$JAVA_HOME/include/linux
```

### PROBLEM ###

```
$ ./gradlew build -x test
deepwater-backend-api
deepwater-mxnet
deepwater-tensorflow
:deepwater-backend-api:compileJava
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
:deepwater-backend-api:processResources UP-TO-DATE
:deepwater-backend-api:classes
:deepwater-backend-api:jar  <============================ SUCCESS 
:deepwater-mxnet:make       <============================ Build started 
mkdir -p build
....
....
Makefile:72: recipe for target 'build/libNative.so' failed
make: swig: Command not found <=============================== This is the ERROR
make: *** [build/libNative.so] Error 127
:deepwater-mxnet:make FAILED
```
**Solution:**

```
   You did not install swig in your machine. Install swig (see pre-requsite)
   $ sudo apt-get install swig
```

