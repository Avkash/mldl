# mxnet - Build base without key libraries #

## Pre-requsite ##

* C++ compiler with C11 support 
 * gcc
 * g++
* [SWIG](http://www.swig.org/)

## mxnet Build ##

```
cd ../thirdparty/mxnet
git submodule update --init --recursive
cp make/config.mk .
### EDIT config.mk - USE_OPENCV=0, USE_CUDA=1, USE_CUDA_PATH=...
make -j8
```

Note: Above -j8 means use 8 available CPU cores to build the code. Alternatively you can use the following as well:

```
 $ make -j$(sysctl -n hw.ncpu)
```

## SUCCESS IN  mxnet BUILD ##

$  ll src/github/h2o/deepwater/thirdparty/mxnet/lib/
```
total 37508
drwxrwxr-x  2 ubuntu ubuntu     4096 Dec 30 22:58 ./
drwxrwxr-x 22 ubuntu ubuntu     4096 Dec 30 22:58 ../
-rw-rw-r--  1 ubuntu ubuntu 27493922 Dec 30 22:58 libmxnet.a
-rwxrwxr-x  1 ubuntu ubuntu 10901728 Dec 30 22:58 libmxnet.so*
```
Note: Once libmxnet.so is built, go back to the top-level directory of the deepwater repo, and follow the directions there.

## Build and install mxnet Python bindings ##

To build the Python egg (which can be installed with easy_install dist/*.egg), do the following:
```
cd thirdparty/mxnet/python
python setup.py install
```
Note: Now, you'll have the mxnet python module available for creating your own Deep Learning models from scratch. You can test it in the python as well. 

### PROBLEM ###
Note: IF there is any error in the build and after fixing the build you retry build but no progress i.e. below:

$ make -j8
```
cd /home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/dmlc-core; make libdmlc.a USE_SSE=1 config=/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/config.mk; cd /home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet
make[1]: Entering directory '/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/dmlc-core'
make[1]: 'libdmlc.a' is up to date.
make[1]: Leaving directory '/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/dmlc-core'
g++ -DMSHADOW_FORCE_STREAM -Wall -O3 -I/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/mshadow/ -I/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/dmlc-core/include -fPIC -Iinclude -funroll-loops -Wno-unused-parameter -Wno-unknown-pragmas -msse3 -DMSHADOW_USE_CUDA=0 -DMSHADOW_USE_CBLAS=1 -DMSHADOW_USE_MKL=0 -DMSHADOW_RABIT_PS=0 -DMSHADOW_DIST_PS=0 -DMSDHADOW_USE_PASCAL=0 -DMXNET_USE_OPENCV=0 -fopenmp  -DMXNET_USE_NVRTC=0 -shared -o lib/libmxnet.so build/src/resource.o build/src/io/io.o build/src/io/image_aug_default.o build/src/io/iter_csv.o build/src/io/iter_image_recordio.o build/src/io/iter_mnist.o build/src/common/mxrtc.o build/src/ndarray/ndarray_function.o build/src/ndarray/ndarray.o build/src/optimizer/sgd.o build/src/optimizer/optimizer.o build/src/operator/svm_output.o build/src/operator/smooth_l1_unary.o build/src/operator/elementwise_binary_broadcast_op.o build/src/operator/pooling.o build/src/operator/cast.o build/src/operator/crop.o build/src/operator/spatial_transformer.o build/src/operator/deconvolution.o build/src/operator/swapaxis.o build/src/operator/softmax_output.o build/src/operator/matrix_op.o build/src/operator/native_op.o build/src/operator/operator_util.o build/src/operator/rnn.o build/src/operator/reshape.o build/src/operator/elementwise_binary_op.o build/src/operator/make_loss.o build/src/operator/operator.o build/src/operator/lrn.o build/src/operator/correlation.o build/src/operator/elementwise_binary_scalar_op.o build/src/operator/fully_connected.o build/src/operator/broadcast_reduce_op.o build/src/operator/block_grad.o build/src/operator/leaky_relu.o build/src/operator/embedding.o build/src/operator/identity_attach_KL_sparse_reg.o build/src/operator/activation.o build/src/operator/upsampling.o build/src/operator/elementwise_sum.o build/src/operator/convolution.o build/src/operator/slice_channel.o build/src/operator/cudnn_batch_norm.o build/src/operator/cross_device_copy.o build/src/operator/elementwise_unary_op.o build/src/operator/regression_output.o build/src/operator/l2_normalization.o build/src/operator/ndarray_op.o build/src/operator/concat.o build/src/operator/sample_op.o build/src/operator/roi_pooling.o build/src/operator/custom.o build/src/operator/cudnn_convolution.o build/src/operator/batch_norm.o build/src/operator/dropout.o build/src/operator/broadcast_mask_op.o build/src/operator/softmax_activation.o build/src/operator/loss_binary_op.o build/src/symbol/graph_memory_allocator.o build/src/symbol/graph_executor.o build/src/symbol/static_graph.o build/src/symbol/symbol.o build/src/engine/naive_engine.o build/src/engine/threaded_engine_pooled.o build/src/engine/threaded_engine.o build/src/engine/engine.o build/src/engine/threaded_engine_perdevice.o build/src/storage/storage.o build/src/c_api/c_predict_api.o build/src/c_api/c_api.o build/src/c_api/c_api_error.o build/src/kvstore/kvstore.o /home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet/dmlc-core/libdmlc.a -pthread -lm -lcblas -fopenmp -lrt
```

Note: Above there is no action for make becuase dmlc-core already there with much of previous build libs. 

** Solution: **

   - $ make clean
   - $ make -jN


