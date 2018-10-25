## Building dlib on OSX ##





```
$ cd dlib
$ mkdir build
$ cd build
$ cmake ..
...
...
-- Looking for sgesv_ - found
CUDA_TOOLKIT_ROOT_DIR not found or specified
-- Could NOT find CUDA (missing: CUDA_TOOLKIT_ROOT_DIR CUDA_NVCC_EXECUTABLE CUDA_INCLUDE_DIRS CUDA_CUDART_LIBRARY) (Required is at least version "7.5")
-- Disabling CUDA support for dlib.  DLIB WILL NOT USE CUDA
-- Building a C++11 test project to see if your compiler supports C++11
-- C++11 activated.
-- Configuring done
-- Generating done
-- Build files have been written to: /work/src/tools/dlib/build

$ cmake --build .

Scanning dependencies of target dlib
[  0%] Building CXX object dlib/CMakeFiles/dlib.dir/base64/base64_kernel_1.cpp.o
[  1%] Building CXX object dlib/CMakeFiles/dlib.dir/bigint/bigint_kernel_1.cpp.o
[  2%] Building CXX object dlib/CMakeFiles/dlib.dir/bigint/bigint_kernel_2.cpp.o
...
...
[ 97%] Building CXX object dlib/CMakeFiles/dlib.dir/external/libjpeg/jfdctfst.cpp.o
[ 98%] Building CXX object dlib/CMakeFiles/dlib.dir/image_loader/jpeg_loader.cpp.o
[ 99%] Building CXX object dlib/CMakeFiles/dlib.dir/image_saver/save_jpeg.cpp.o
[100%] Linking CXX static library libdlib.a
[100%] Built target dlib
```

