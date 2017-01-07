# Building DeepWater Source on Ubuntu 16.x and above machine #

## Getting Source Code ##
 - [Get H2O-3 Source Code](https://github.com/Avkash/mldl/blob/master/pages/h2o_source.md)
 - [Get DeepWater Source Code](https://github.com/Avkash/mldl/blob/master/pages/h2o_source.md)

## Pre-requsite and Environment ##
 - [Install prerequsite for H2O-3 and DeepWater](https://github.com/Avkash/mldl/blob/master/pages/h2o_dw_prerequsite.md)
 - [Test environment](https://github.com/Avkash/mldl/blob/master/pages/h2o_test_environment.md)

## GPU/CUDA Libraries and Tools ##

 - [Install GPU/CUDA libraries & tools](https://github.com/Avkash/mldl/blob/master/pages/cuda_gpu.md)

## [Step 1] Building h2o-3 source ##
   - [Building main H2O-3 without DeepWater libraries](https://github.com/Avkash/mldl/blob/master/pages/h2o_build_core.md)

## [Step 2] Building DeepWater Source ##

 - Edit settings.gradle
 - Build DeepWater with mxnet only
 
   ```
   if (!isGradlePropSet("buildOnlyBackendApi")) {
   include 'mxnet'
   //include 'tensorflow'
   }
   ```
 - Build DeepWater with tensorflow only
 
   ```
   if (!isGradlePropSet("buildOnlyBackendApi")) {
   //include 'mxnet'
   include 'tensorflow'
   }
   ```
 - Build DeepWater with mxnet and tensorflow
 
   ```
   if (!isGradlePropSet("buildOnlyBackendApi")) {
   include 'mxnet'
   include 'tensorflow'
   }
   ```
 - [Building DeepWater libraries](https://github.com/Avkash/mldl/blob/master/pages/h2o_build_dw.md)

### [Step 2.1] Building DeepWater - mxnet ###

   - [Base Quick Build](https://github.com/Avkash/mldl/blob/master/pages/mxnet_build_base.md)
     - You have abiliy to build mxnet with/without CUDA, OpenCV. 
     - Note: All these settings are in config.mk and you can edit them as below:  
   - Without CUDA 
     - USE_CUDA=0
   - With CUDA
     - USE_CUDA=0
     - USE_CUDA_PATH=/usr/local/cuda     
   - With CUDNN
     - USE_CUDNN=1
     - USE_CUDA_PATH=/usr/local/cuda     
     - Note: You must make sure that CUDNN files into CUDA home includes & lib folders
   - Without OpenCV
     - USE_OPENCV = 0
   - With OpenCV [Want to buid OpenCV?](https://github.com/Avkash/mldl/blob/master/pages/opencv_build.md) 
     - USE_OPENCV = 1
      
   - [Take a look at how mxnet libs are generated](https://github.com/Avkash/mldl/blob/master/pages/mxnet_libs.md) 
   
### [Step 2.2] Build thridparty section - Needed for Tensorflow ###
   - javacpp
   - javacpp-presets
   
### [Step 2.3] Building DeepWater - Tensorflow ###
   
   - Not Started yet

## [Step 3]Finally building H2O with DeepWater ###

Copy/link deepwater-all.jar from the deepwater source tree

**Copying deepwater-all.jar from deepwater to H2O-3 lib/ folder**

 ```
:~/src/github/h2o/h2o-3$ ll ../deepwater/build/libs/deepwater-all.jar
-rw-rw-r-- 1 avkash avkash 139695003 Jan  7 14:37 ../deepwater/build/libs/deepwater-all.jar
:~/src/github/h2o/h2o-3$ mkdir lib
:~/src/github/h2o/h2o-3$ cp ../deepwater/build/libs/deepwater-all.jar lib/
:~/src/github/h2o/h2o-3$ ll lib/
-rw-rw-r--  1 avkash avkash 139695003 Jan  7 15:06 deepwater-all.jar
```
 
 - Rebuild h2o
  - Run **[Step 1] Building h2o-3 source** Above

```
After successful build:
:~/src/github/h2o/h2o-3$ ll build/
-rw-rw-r--  1 avkash avkash  67437408 Jan  7 15:04 h2o-base.jar <= This is without deepwater
-rw-rw-r--  1 avkash avkash 342872720 Jan  7 15:07 h2o.jar
```

## Troubleshooting - Common Build Issues ###

 - [Common Build Issues/Failues](https://github.com/Avkash/mldl/blob/master/pages/build_troubleshooting.md)
