## Troubleshooting assistance with various build issues  ##


### [PROBLEM]  ###

```
/usr/bin/ld: cannot find -lcblas
collect2: error: ld returned 1 exit status
Makefile:189: recipe for target 'lib/libmxnet.so' failed
make: *** [lib/libmxnet.so] Error 1
```

[SOLUTION]
sudo apt-get install libatlas-base-dev

### [PROBLEM] ###
```
src/io/./image_augmenter.h:12:30: fatal error: opencv2/opencv.hpp: No such file or directory
compilation terminated.
Makefile:151: recipe for target 'build/src/io/io.o' failed
```

[SOLUTION]
open config.mk
set USE_OPENCV=0

================================================================================================================
[PROBLEM]
In file included from /home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/mshadow/mshadow/tensor.h:16:0,
                 from include/mxnet/base.h:13,
                 from src/resource.cc:9:
/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/mshadow/mshadow/./base.h:136:23: fatal error: cblas.h: No such file or directory
compilation terminated.

[SOLUTION]
sudo apt-get install libblas-dev liblapack-dev
