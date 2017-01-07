# H2O Build Environment - Test for all requirements#

## Environment ##

```
CPATH=/usr/lib/jvm/java-8-openjdk-amd64/include:/usr/lib/jvm/java-8-openjdk-amd64/include/linux
PATH=/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/src/protoc-3.0.0:/home/ubuntu/src/protoc-3.0.0/bin
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
```

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

### R  ###

```
$ R --version
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.
```

### Python ###

```
$ python
Python 2.7.12 (default, Nov 19 2016, 06:48:10)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
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

$ nvcc --version
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2016 NVIDIA Corporation
Built on Sun_Sep__4_22:14:01_CDT_2016
Cuda compilation tools, release 8.0, V8.0.44
```

$ nvidia-smi
```
Wed Jan  4 06:47:38 2017
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.57                 Driver Version: 367.57                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K520           Off  | 0000:00:03.0     Off |                  N/A |
| N/A   28C    P0    37W / 125W |      0MiB /  4036MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

sudo apt install nvidia-cuda-toolkit
