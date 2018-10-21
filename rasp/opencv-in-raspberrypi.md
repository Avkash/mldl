## Installing OpenCV in RaspberryPi devices ##



### Configure Command inside OpenCV source build directory ###

```
$ cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D BUILD_opencv_java=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules \
-D BUILD_EXAMPLES=ON \
-D WITH_CUDA=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS= OFF ..
```




### Helpful Links to get OpenCV working on RaspberryPi 3 ###

 - https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/
 - https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
 - https://www.pyimagesearch.com/2015/10/26/how-to-install-opencv-3-on-raspbian-jessie/
 - https://www.pyimagesearch.com/2016/04/18/install-guide-raspberry-pi-3-raspbian-jessie-opencv-3/
 
