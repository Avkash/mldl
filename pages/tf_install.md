

[1]
$ python

Python 2.7.12 (default, Nov 19 2016, 06:48:10)
.....
.....
>>> import tensorflow
...
ImportError: libcudart.so.8.0: cannot open shared object file: No such file or directory


Error importing tensorflow.  Unless you are using bazel,
you should not try to import tensorflow from its source directory;
please exit the tensorflow source tree, and relaunch your python interpreter
from there.

Note: I have installed TF with GPU and thats why there is the error. 
Solution: Install GPU driver. 


SOLUTION:
=========
https://aichamp.wordpress.com/2016/11/09/updating-nvidia-cuda-to-8-0-x-in-ubuntu-16-04-ec2-gx-instance/

must REBOOT

[2]
python
Python 2.7.12 (default, Nov 19 2016, 06:48:10)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcublas.so locally
I tensorflow/stream_executor/dso_loader.cc:119] Couldn't open CUDA library libcudnn.so. LD_LIBRARY_PATH:
I tensorflow/stream_executor/cuda/cuda_dnn.cc:3459] Unable to load cuDNN DSO
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcufft.so locally
I tensorflow/stream_executor/dso_loader.cc:119] Couldn't open CUDA library libcuda.so.1. LD_LIBRARY_PATH:
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:165] hostname: mr-dl8
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:189] libcuda reported version is: Not found: was unable to find libcuda.so DSO loaded into this program
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:363] driver version file contents: """NVRM version: NVIDIA UNIX x86_64 Kernel Module  370.28  Thu Sep  1 19:45:04 PDT 2016
GCC version:  gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4)
"""
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:193] kernel reported version is: 370.28.0
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:1092] LD_LIBRARY_PATH:
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:1093] failed to find libcuda.so on this system: Failed precondition: could not dlopen DSO: libcuda.so.1; dlerror: libcuda.so.1: cannot open shared object file: No such file or directory
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcurand.so locally


WORK:
=====
find /usr/local/cuda/ -name 'libcuda.so'

Add the following in your bashrc or whatever your profile:

export LD_LIBRARY_PATH=/usr/local/cuda/lib64/

Solution: 
https://aichamp.wordpress.com/2016/11/21/tensorflow-with-cudacudnn-on-ubuntu-16-04/

must REBOOT

[3]
>>> import tensorflow as tf
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcublas.so locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcudnn.so locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcufft.so locally
I tensorflow/stream_executor/dso_loader.cc:119] Couldn't open CUDA library libcuda.so.1. LD_LIBRARY_PATH: /usr/local/cuda/lib64/
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:165] hostname: mr-dl8
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:189] libcuda reported version is: Not found: was unable to find libcuda.so DSO loaded into this program
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:363] driver version file contents: """NVRM version: NVIDIA UNIX x86_64 Kernel Module  370.28  Thu Sep  1 19:45:04 PDT 2016
GCC version:  gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4)
"""
I tensorflow/stream_executor/cuda/cuda_diagnostics.cc:193] kernel reported version is: 370.28.0
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:1092] LD_LIBRARY_PATH: /usr/local/cuda/lib64/
I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:1093] failed to find libcuda.so on this system: Failed precondition: could not dlopen DSO: libcuda.so.1; dlerror: libcuda.so.1: cannot open shared object file: No such file or directory
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcurand.so locally

WORK
====
With Nvidia 370
You will find libcuda.so in the following folder

$ ll $LD_LIBRARY_PATH/stubs
OR
$ ll stubs/libcuda.so

sudo cp  $LD_LIBRARY_PATH/stubs/libcuda.so $LD_LIBRARY_PATH/
sudo cp  $LD_LIBRARY_PATH/libcuda.so $LD_LIBRARY_PATH/libcuda.so.1

$ ll $LD_LIBRARY_PATH/libcuda.so*

you must see both libcuda.so and libcuda.so.1

must REBOOT

[4]
$ python
Python 2.7.12 (default, Nov 19 2016, 06:48:10)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import tensorflow as tf
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcublas.so locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcudnn.so locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcufft.so locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcuda.so.1 locally
I tensorflow/stream_executor/dso_loader.cc:128] successfully opened CUDA library libcurand.so locally


