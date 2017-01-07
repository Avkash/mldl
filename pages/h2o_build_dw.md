# Building H2O (H2O-3) Core with DeepWater libraries #


Make sure your working directory is deepwater folder which you just pulled/cloned from githug

$pwd
```
/home/ubuntu/src/github/h2o/deepwater
```

To build DeepWater source, the command is same as H2O as below:

*~/h2o/deepwater$ ./gradlew build -x test*


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

