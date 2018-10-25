## Face Recognition in Python on OSX ##

### Environment Pre-requisite ##
- Python 3.5
  - Python Package - face_recognition [Install help on OSX](https://github.com/Avkash/mldl/blob/master/pages/opencv/python_face_recognition.md)
- dlib with Python 3.5 [Install help on OSX](https://github.com/Avkash/mldl/blob/master/pages/opencv/dlib_install_osx.md)
- opencv (3.1.0) [Install help on OSX](https://github.com/Avkash/mldl/blob/master/pages/opencv/opencv-python3.md)


### Verify/Validate the environment ###

Starting python (3.5 from Conda environment) and then importing face_recognition and cv2:
```
$ python                                                                        

Python 3.5.4 |Anaconda custom (64-bit)| (default, Nov  8 2017, 18:11:28)
[GCC 4.2.1 Compatible Clang 4.0.1 (tags/RELEASE_401/final)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import face_recognition as fr
/Users/avkashchauhan/anaconda2/envs/python35cv/lib/python3.5/site-packages/face_recognition_models/__init__.py:7: 
UserWarning: Module dlib was already imported from /Users/avkashchauhan/anaconda2/envs/python35cv/lib/python3.5/site-packages/dlib-19.16.99-py3.5-macosx-10.6-x86_64.egg/dlib.cpython-35m-darwin.so, but /work/src/tools/dlib is being added to sys.path
  from pkg_resources import resource_filename
>>> fr.__version__
'1.2.3'
>>> import cv2
>>> cv2.__version__
'3.1.0'
>>>
```

