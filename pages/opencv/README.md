## Installing OpenCV in OSX ##

###  Have xcode tools installed ###
```
sudo xcodebuild -license
sudo xcode-select --install
```
Note: You must have brew installed in OSX your machine to get further. To install brew visit [here](https://brew.sh/)

### Python Environment ###

Note: 
1. I am using Anaconda to have separate python2.7 and python3.5 environments. If you need help with Anaconda on OSX visit [here](https://github.com/Avkash/mldl/blob/master/pages/anaconda_tips.md).
2. I will be using Python 3.5 environment for building OpenCV. 

Now Make sure you have:
1. Python 2.7 or 3.5 Ready
2. numpy installed with Python

### Verify Python Environment ###
```
$ source activate python35cv
(python35cv) ┌─(/work/src/tools/opencv/opencv3.4.3/build)───
└─(21:37:23)──> python                                                                                                         Python 3.5.4 |Anaconda, Inc.| (default, Nov  8 2017, 18:11:28)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy
>>> numpy.__version__
'1.14.0'
>>>
```

### Installing tools on OSX: ###
```
$ brew install cmake pkg-config
$ brew install jpeg libpng libtiff openexr
```
### Get Source code ###

- [Home: Opencv_contrib Release](https://github.com/opencv/opencv_contrib/releases)
- [Home: Opencv Release](https://opencv.org/releases.html)


```
$ wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.3.zip
$ wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.3.zip

```

### Lets Configure opencv ###

Goto opencv-3.4.3 folder:
```
$ mkdir build
$ cd build
$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D BUILD_opencv_java=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D OPENCV_EXTRA_MODULES_PATH=/work/src/tools/opencv/opencv_contrib-3.4.3/modules \
-D BUILD_EXAMPLES=ON \
-D WITH_CUDA=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS= OFF ..
```
Note: Please make sure the path to opencv_contrib is correct above. 

```
$ make -jN
```
Note: Above N is the value of the CPU core you would want to use during make process.



