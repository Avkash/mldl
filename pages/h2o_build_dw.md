# Building H2O (H2O-3) Core with DeepWater libraries #


Make sure your working directory is deepwater folder which you just pulled/cloned from githug

$pwd
```
/home/ubuntu/src/github/h2o/deepwater
```

To build DeepWater source, the command is same as H2O as below:

*~/h2o/deepwater$ ./gradlew build -x test*


###[PROBLEM]###

Error:
* What went wrong:
Execution failed for task ':deepwater-backend-api:compileJava'.
> Could not find tools.jar

**Solution: **

You did the finish the 3rd party build where java specific libs/jars are build/pulled etc/
