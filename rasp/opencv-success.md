## Successfull OpenCV Build with 3.3.0 ##

```
[ 99%] Linking CXX executable ../../bin/cpp-tutorial-Sobel_Demo
[ 99%] Built target tutorial_BasicLinearTransforms
Scanning dependencies of target tutorial_Remap_Demo
[ 99%] Built target tutorial_Sobel_Demo
Scanning dependencies of target tutorial_HitMiss
[ 99%] Building CXX object samples/cpp/CMakeFiles/tutorial_Remap_Demo.dir/tutorial_code/ImgTrans/Remap_Demo.cpp.o
[ 99%] Building CXX object samples/cpp/CMakeFiles/tutorial_HitMiss.dir/tutorial_code/ImgProc/HitMiss.cpp.o
[ 99%] Linking CXX executable ../../bin/cpp-tutorial-Remap_Demo
[ 99%] Linking CXX executable ../../bin/cpp-tutorial-HitMiss
[ 99%] Built target tutorial_Remap_Demo
[ 99%] Built target tutorial_HitMiss
Scanning dependencies of target tutorial_Morphology_2
Scanning dependencies of target tutorial_Morphology_1
[ 99%] Building CXX object samples/cpp/CMakeFiles/tutorial_Morphology_1.dir/tutorial_code/ImgProc/Morphology_1.cpp.o
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_Morphology_2.dir/tutorial_code/ImgProc/Morphology_2.cpp.o
[100%] Linking CXX executable ../../bin/cpp-tutorial-Morphology_2
[100%] Linking CXX executable ../../bin/cpp-tutorial-Morphology_1
[100%] Built target tutorial_Morphology_2
[100%] Built target tutorial_Morphology_1
Scanning dependencies of target example_smiledetect
Scanning dependencies of target tutorial_objectDetection
[100%] Building CXX object samples/cpp/CMakeFiles/example_smiledetect.dir/smiledetect.cpp.o
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_objectDetection.dir/tutorial_code/objectDetection/objectDetection.cpp.o
[100%] Linking CXX executable ../../bin/cpp-tutorial-objectDetection
[100%] Linking CXX executable ../../bin/cpp-example-smiledetect
[100%] Built target example_smiledetect
[100%] Built target tutorial_objectDetection
Scanning dependencies of target tutorial_Pyramids
Scanning dependencies of target tutorial_Threshold
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_Threshold.dir/tutorial_code/ImgProc/Threshold.cpp.o
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_Pyramids.dir/tutorial_code/ImgProc/Pyramids.cpp.o
[100%] Linking CXX executable ../../bin/cpp-tutorial-Pyramids
[100%] Linking CXX executable ../../bin/cpp-tutorial-Threshold
[100%] Built target tutorial_Threshold
[100%] Built target tutorial_Pyramids
Scanning dependencies of target tutorial_Geometric_Transforms_Demo
Scanning dependencies of target tutorial_CannyDetector_Demo
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_Geometric_Transforms_Demo.dir/tutorial_code/ImgTrans/Geometric_Transforms_Demo.cpp.o
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_CannyDetector_Demo.dir/tutorial_code/ImgTrans/CannyDetector_Demo.cpp.o
[100%] Linking CXX executable ../../bin/cpp-tutorial-CannyDetector_Demo
[100%] Linking CXX executable ../../bin/cpp-tutorial-Geometric_Transforms_Demo
[100%] Built target tutorial_Geometric_Transforms_Demo
[100%] Built target tutorial_CannyDetector_Demo
Scanning dependencies of target tutorial_HoughCircle_Demo
[100%] Building CXX object samples/cpp/CMakeFiles/tutorial_HoughCircle_Demo.dir/tutorial_code/ImgTrans/HoughCircle_Demo.cpp.o
[100%] Linking CXX executable ../../bin/cpp-tutorial-HoughCircle_Demo
[100%] Built target tutorial_HoughCircle_Demo
[100%] Linking CXX shared module ../../lib/cv2.so
[100%] Built target opencv_python2
[100%] Linking CXX shared module ../../lib/python3/cv2.cpython-35m-arm-linux-gnueabihf.so
[100%] Built target opencv_python3
```

## Verifying cv2.so ready in python2:  ##

```
pi@raspberrypi:~/opencv-3.3.0/build $ ls -l /usr/local/lib/python2.7/site-packages/
total 3880
-rw-r--r-- 1 root staff 3971680 Oct 20 22:03 cv2.so
```

## Verifying cv2.so ready in python3:  ##
```
pi@raspberrypi:~/opencv-3.3.0/build $ ls -l /usr/local/lib/python3.5/site-packages/
total 3876
-rw-r--r-- 1 root staff 3968472 Oct 20 22:03 cv2.cpython-35m-arm-linux-gnueabihf.so
```

## copying (symlink) cv2.so inside virtual environment name cvp2 ##

```
pi@raspberrypi:~ $ ln -s /usr/local/lib/python2.7/site-packages/cv2.so  ~/.virtualenvs/cvp2/lib/python2.7/site-packages/cv2.so
```

## Verifying Python2 in Virtual Environment ##

```
(cvp2) pi@raspberrypi:~ $ python
Python 2.7.13 (default, Sep 26 2018, 18:42:22)
[GCC 6.3.0 20170516] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'3.3.0'
>>> quit()
```

## copying (symlink) cv2.so inside virtual environment name cvp3 ##

```
pi@raspberrypi:~ $ ln -s /usr/local/lib/python3.5/site-packages/cv2.so  ~/.virtualenvs/cvp3/lib/python3.5/site-packages/cv2.so
```
