# H2O Build Environment - Test for all requirements#

Note: Make sure you have proper results for the following commands:

## Java ##
$ java -version
```
 openjdk version "1.8.0_111"
 OpenJDK Runtime Environment (build 1.8.0_111-8u111-b14-2ubuntu0.16.04.2-b14)
 OpenJDK 64-Bit Server VM (build 25.111-b14, mixed mode)
```

Note: Java 1.6 and 1.7 and 1.8 are supported. 

$ javac -version
```
javac 1.8.0_111
```

Note: You must have JDK and JRE in the build machine. 

### JAVA_HOME ###

$ echo $JAVA_HOME
```
/usr/lib/jvm/java-8-openjdk-amd64
```

Note: JAVA_HOME must need to set otherwise javacpp step will show errors.

$ ls $JAVA_HOME
```
 ASSEMBLY_EXCEPTION  bin  docs  include  jre  lib  man  src.zip  THIRD_PARTY_README
``` 

 Note: Above command just shows access to java home folders. 

*Note: You must setup the following:*

```
 export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
 export CPATH=$JAVA_HOME/include
 export CPATH=${CPATH}:$JAVA_HOME/include/linux
 export PATH=${PATH}:/usr/local/cuda/bin
```


## GCC ## 

ubuntu@ip-10-0-0-35:~/src/github/h2o/deepwater/thirdparty/mxnet$ gcc --version
```
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
 Copyright (C) 2015 Free Software Foundation, Inc.
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

## G++ ##

ubuntu@ip-10-0-0-35:~/src/github/h2o/deepwater/thirdparty/mxnet$ g++ --version
```
 g++ (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
 Copyright (C) 2015 Free Software Foundation, Inc.
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

Note: GCC & G++ - 5.x and above does work fine. 

## Nvidia compilers tools for CUDA compilation ##

$ nvcc

$ nvidia-smi

sudo apt install nvidia-cuda-toolkit
