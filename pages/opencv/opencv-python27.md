## Installing OpenCV in OSX ##

###  Have xcode tools installed ###
```
sudo xcodebuild -license
sudo xcode-select --install
```
Note: You must have brew installed in OSX your machine to get further. To install brew visit [here](https://brew.sh/)

### Have Python (2.7) as your base python on OSX ###
```
$ python                                                                                                               ──(Tue,Oct23)─┘
Python 2.7.15 |Anaconda, Inc.| (default, May  1 2018, 18:37:05)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
$ which python
/Users/avkashchauhan/anaconda2/bin/python
$ where python3
/Users/avkashchauhan/anaconda2/bin/python
/usr/local/bin/python
/usr/bin/python
```


### Python Environment ###

Note: 
1. I am using Anaconda to have separate python2.7 and python3.5 environments. If you need help with Anaconda on OSX visit [here](https://github.com/Avkash/mldl/blob/master/pages/anaconda_tips.md).
2. I will be using Python 3.5 environment for building OpenCV. 

Now Make sure you have:
1. Python 2.7 or 3.5 Ready
2. numpy installed with Python

### Verify Python Environment ###
```
$ source activate python27cv
(python27cv) ─> python
Python 2.7.15 |Anaconda, Inc.| (default, May  1 2018, 18:37:05)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy
>>> numpy.__version__
'1.15.0'
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
### Finding Python header and Library ###

```
Library dylib:  /Users/avkashchauhan/anaconda2/lib/libpython2.7.dylib
Header:  /Users/avkashchauhan/anaconda2/include/python2.7/Python.h
```


### Lets Configure opencv ###

Goto opencv-3.4.3 folder:
```
$ mkdir build
$ cd build
$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D BUILD_opencv_java=OFF \
-D BUILD_opencv_python2=ON \
-D BUILD_opencv_python3=OFF \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D OPENCV_EXTRA_MODULES_PATH=/work/src/tools/opencv/opencv_contrib-3.4.3/modules \
-D PYTHON2_LIBRARY=/Users/avkashchauhan/anaconda2/lib/libpython2.7.dylib \
-D PYTHON2_INCLUDE_DIR=/Users/avkashchauhan/anaconda2/include/python2.7/ \
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

### Successful Build Scenario (Luck works here!!) ###
```
Scanning dependencies of target example_cpp_select3dobj
[100%] Built target example_cpp_kalman
[100%] Building CXX object samples/cpp/CMakeFiles/example_cpp_select3dobj.dir/select3dobj.cpp.o
[100%] Linking CXX executable ../../bin/example_cpp_warpPerspective_demo
[100%] Linking CXX executable ../../bin/example_cpp_matchmethod_orb_akaze_brisk
[100%] Built target example_cpp_warpPerspective_demo
[100%] Built target example_cpp_matchmethod_orb_akaze_brisk
[100%] Linking CXX executable ../../bin/example_cpp_lkdemo
[100%] Built target example_cpp_lkdemo
[100%] Linking CXX executable ../../bin/example_tutorial_video-write
[100%] Linking CXX executable ../../bin/example_cpp_connected_components
[100%] Built target example_tutorial_video-write
[100%] Built target example_cpp_connected_components
[100%] Linking CXX executable ../../bin/example_cpp_3calibration
[100%] Built target example_cpp_3calibration
[100%] Linking CXX executable ../../bin/example_cpp_select3dobj
[100%] Built target example_cpp_select3dobj
```
Note: Not out of woods yet. We still need to make installer as well as next step.

### Making Installer after the make success ###
```
$ sudo make install
```

### Successful "make install" ###
```
....
....
-- Installing: /usr/local/share/OpenCV/samples/python/opt_flow.py
-- Installing: /usr/local/share/OpenCV/samples/python/peopledetect.py
-- Installing: /usr/local/share/OpenCV/samples/python/plane_ar.py
-- Installing: /usr/local/share/OpenCV/samples/python/plane_tracker.py
-- Installing: /usr/local/share/OpenCV/samples/python/squares.py
-- Installing: /usr/local/share/OpenCV/samples/python/stereo_match.py
-- Installing: /usr/local/share/OpenCV/samples/python/texture_flow.py
-- Installing: /usr/local/share/OpenCV/samples/python/tst_scene_render.py
-- Installing: /usr/local/share/OpenCV/samples/python/turing.py
-- Installing: /usr/local/share/OpenCV/samples/python/video.py
-- Installing: /usr/local/share/OpenCV/samples/python/video_threaded.py
-- Installing: /usr/local/share/OpenCV/samples/python/video_v4l2.py
-- Installing: /usr/local/share/OpenCV/samples/python/watershed.py
```




