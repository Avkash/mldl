## mxnet libs ##


### Wthout CUDA ###

 - in the config.mk
 - USE_CUDA = 0

```
ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll lib/
		total 37508
		drwxrwxr-x  2 ubuntu ubuntu     4096 Dec 30 22:58 ./
		drwxrwxr-x 22 ubuntu ubuntu     4096 Dec 30 22:58 ../
		-rw-rw-r--  1 ubuntu ubuntu 27493922 Dec 30 22:58 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu 10901728 Dec 30 22:58 libmxnet.so*
		ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ pwd
		/home/ubuntu/src/github/h2o/deepwater/thirdparty/mxnet
		ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll -h lib/
		total 37M
		drwxrwxr-x  2 ubuntu ubuntu 4.0K Dec 30 22:58 ./
		drwxrwxr-x 22 ubuntu ubuntu 4.0K Dec 30 22:58 ../
		-rw-rw-r--  1 ubuntu ubuntu  27M Dec 30 22:58 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu  11M Dec 30 22:58 libmxnet.so*

```

### With CUDA ###

- in the config.mk
- USE_CUDA = 1
- USE_CUDA_PATH = /usr/local/cuda/

```
ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll lib
		total 355060
		drwxrwxr-x  2 ubuntu ubuntu      4096 Dec 31 07:08 ./
		drwxrwxr-x 22 ubuntu ubuntu      4096 Dec 31 07:04 ../
		-rw-rw-r--  1 ubuntu ubuntu 246826542 Dec 31 07:08 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu 116739744 Dec 31 07:08 libmxnet.so*
		ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll -h lib
		total 347M
		drwxrwxr-x  2 ubuntu ubuntu 4.0K Dec 31 07:08 ./
		drwxrwxr-x 22 ubuntu ubuntu 4.0K Dec 31 07:04 ../
		-rw-rw-r--  1 ubuntu ubuntu 236M Dec 31 07:08 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu 112M Dec 31 07:08 libmxnet.so*
Note: - Above there is no OpenCV yet.     
```

### With Opencv + CUDA ###
 - in the config.mk
 - USE_OPENCV = 1

```
ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll lib/
		total 356328
		drwxrwxr-x  2 ubuntu ubuntu      4096 Dec 31 21:02 ./
		drwxrwxr-x 23 ubuntu ubuntu      4096 Dec 31 21:02 ../
		-rw-rw-r--  1 ubuntu ubuntu 247813544 Dec 31 21:02 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu 117053328 Dec 31 21:02 libmxnet.so*
		ubuntu@ip-10-0-0-212:~/src/github/h2o/deepwater/thirdparty/mxnet$ ll -lh lib/
		total 348M
		drwxrwxr-x  2 ubuntu ubuntu 4.0K Dec 31 21:02 ./
		drwxrwxr-x 23 ubuntu ubuntu 4.0K Dec 31 21:02 ../
		-rw-rw-r--  1 ubuntu ubuntu 237M Dec 31 21:02 libmxnet.a
		-rwxrwxr-x  1 ubuntu ubuntu 112M Dec 31 21:02 libmxnet.so*
```
