## Building dlib from source on OSX and installing on Python3 (Anaconda) ##

## Pre-requisite ##

- Python3 (3.5 to be exact)
- XCode (Installed Tools and working)
- Have Build Tools install using brew (Homebrew)

## Get dlib sourge from git ##

You can dlib source as below:
```
$ git clone https://github.com/davisking/dlib.git
```

## Start Build Process ## 

Lets get into the dlib source and following the command:

```
$ cd dlib
$ mkdir build
$ cd build
```
#### Configuing the build process ####

```
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
```

#### Now making the build libraries ####
```
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
#### Now installing the dlib with python (3.5) ####

```
$ cd ..
$ python

$ python setup.py install

running install
running bdist_egg
running egg_info
creating dlib.egg-info
...
...
Scanning dependencies of target dlib
[  1%] Building CXX object dlib_build/CMakeFiles/dlib.dir/base64/base64_kernel_1.cpp.o
...
...
[ 79%] Linking CXX static library libdlib.a
[ 79%] Built target dlib
Scanning dependencies of target dlib_python
...
...
[100%] Linking CXX shared module /work/src/tools/dlib/build/lib.macosx-10.6-x86_64-3.5/dlib.cpython-35m-darwin.so
[100%] Built target dlib_python
creating build/bdist.macosx-10.6-x86_64
creating build/bdist.macosx-10.6-x86_64/egg
copying build/lib.macosx-10.6-x86_64-3.5/dlib.cpython-35m-darwin.so -> build/bdist.macosx-10.6-x86_64/egg
creating stub loader for dlib.cpython-35m-darwin.so
byte-compiling build/bdist.macosx-10.6-x86_64/egg/dlib.py to dlib.cpython-35.pyc
creating build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
copying dlib.egg-info/PKG-INFO -> build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
copying dlib.egg-info/SOURCES.txt -> build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
copying dlib.egg-info/dependency_links.txt -> build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
copying dlib.egg-info/not-zip-safe -> build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
copying dlib.egg-info/top_level.txt -> build/bdist.macosx-10.6-x86_64/egg/EGG-INFO
writing build/bdist.macosx-10.6-x86_64/egg/EGG-INFO/native_libs.txt
creating dist
creating 'dist/dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg' and adding 'build/bdist.macosx-10.6-x86_64/egg' to it
removing 'build/bdist.macosx-10.6-x86_64/egg' (and everything under it)
Processing dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg
creating /Users/avkashchauhan/anaconda2/envs/python35cv/lib/python3.5/site-packages/dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg
Extracting dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg to /Users/avkashchauhan/anaconda2/envs/python35cv/lib/python3.5/site-packages
Adding dlib 19.16.99 to easy-install.pth file

Installed /Users/avkashchauhan/anaconda2/envs/python35cv/lib/python3.5/site-packages/dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg
Processing dependencies for dlib==19.16.99
Finished processing dependencies for dlib==19.16.99

```

## Make sure build & install is sucessful ##

Here we are starting python (3.5) and importing dlib:

```
$ python                                                                                                                     Python 3.5.4 |Anaconda custom (64-bit)| (default, Nov  8 2017, 18:11:28)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import dlib
>>> dlib.__version__
'19.16.99'
>>>
```



