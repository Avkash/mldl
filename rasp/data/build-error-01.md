### Random "internal compiler error" Error during OpenCV "make -j4" ###


```
[ 57%] Built target example_dpm_cascade_detect_camera
Scanning dependencies of target opencv_perf_features2d
Scanning dependencies of target opencv_line_descriptor
Scanning dependencies of target opencv_saliency
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_test_features2d.dir/test/ocl/test_brute_force_matcher.cpp.o
[ 57%] Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/LSDDetector.cpp.o
c++: internal compiler error: Segmentation fault (program cc1plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-6/README.Bugs> for instructions.
modules/features2d/CMakeFiles/opencv_test_features2d.dir/build.make:62: recipe for target 'modules/features2d/CMakeFiles/opencv_test_features2d.dir/test/ocl/test_brute_force_matcher.cpp.o' failed
make[2]: *** [modules/features2d/CMakeFiles/opencv_test_features2d.dir/test/ocl/test_brute_force_matcher.cpp.o] Error 4
CMakeFiles/Makefile2:10740: recipe for target 'modules/features2d/CMakeFiles/opencv_test_features2d.dir/all' failed
make[1]: *** [modules/features2d/CMakeFiles/opencv_test_features2d.dir/all] Error 2
make[1]: *** Waiting for unfinished jobs....
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_perf_features2d.dir/perf/opencl/perf_brute_force_matcher.cpp.o
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_perf_features2d.dir/perf/opencl/perf_feature2d.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/BING/CmFile.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/BING/CmShow.cpp.o
[ 57%] Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/BING/FilterTIG.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/BING/ValStructVec.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/BING/objectnessBING.cpp.o
[ 57%] Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/binary_descriptor_matcher.cpp.o
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_perf_features2d.dir/perf/perf_batchDistance.cpp.o
[ 57%] Building CXX object modules/line_descriptor/CMakeFiles/opencv_line_descriptor.dir/src/draw.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/motionSaliency.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/motionSaliencyBinWangApr2014.cpp.o
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_perf_features2d.dir/perf/perf_feature2d.cpp.o
[ 57%] Linking CXX shared library ../../lib/libopencv_line_descriptor.so
[ 57%] Built target opencv_line_descriptor
[ 57%] Building CXX object modules/features2d/CMakeFiles/opencv_perf_features2d.dir/perf/perf_main.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/objectness.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/saliency.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/staticSaliency.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/staticSaliencySpectralResidual.cpp.o
[ 57%] Building CXX object modules/saliency/CMakeFiles/opencv_saliency.dir/src/staticSaliencyFineGrained.cpp.o
[ 57%] Linking CXX shared library ../../lib/libopencv_saliency.so
[ 57%] Built target opencv_saliency
[ 57%] Linking CXX executable ../../bin/opencv_perf_features2d
[ 57%] Built target opencv_perf_features2d
Makefile:160: recipe for target 'all' failed
make: *** [all] Error 2
```

## Solution ##

- Restart the build and it worked.

