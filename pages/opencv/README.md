## Installing OpenCV in OSX ##

### From Anaconda ###

Python 2.7
 
 $ conda install opencv
 
Python 3.5
 
 $ conda install -c menpo opencv3

### Build your own ###

- [Installing OpenCV in OSX with Python 2.7 Through Anaconda](https://github.com/Avkash/mldl/blob/master/pages/opencv/opencv-python27.md)
- [Installing OpenCV in OSX with Python 3.5 through Anaconda](https://github.com/Avkash/mldl/blob/master/pages/opencv/opencv-python3.md)

### Testing opencv on OSX ###

#### Python 2.7 ####
Below python27cv is the anaconda environment based on Python 2.7.

```
$ source activate python27cv
$ python
Python 2.7.15 |Anaconda custom (64-bit)| (default, May  1 2018, 18:37:05)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'3.4.2'
>>>
```

#### Python 3.5 ####
Below python35cv is the anaconda environment based on Python 3.5.

```
$ source activate python35cv
$ python
Python 3.5.4 |Anaconda custom (64-bit)| (default, Nov  8 2017, 18:11:28)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> cv2.__version__
'3.1.0'
>>>
```


