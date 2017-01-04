# Building OpenCV #

Building OpenCV

>>>>- Without CUDA
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/src/opencv_contrib/modules -D BUILD_EXAMPLES=ON -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++  -D WITH_OPENGL=ON ..

>>>>- With CUDA
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=~/src/opencv_contrib/modules -D BUILD_EXAMPLES=ON -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCUDA_CUDA_LIBRARY=/usr/local/cuda -DWITH_CUDA=ON -DENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D WITH_OPENGL=ON  ..


Note: If you have opencv installed you can look for opencv if CUDA is enabled:

OPENCV with CUDA
pkg-config --libs opencv | grep cuda
-L/usr/local/lib -lopencv_cudabgsegm -lopencv_cudaobjdetect -lopencv_cudastereo -lopencv_stitching -lopencv_cudafeatures2d -lopencv_superres -lopencv_cudacodec -lopencv_videostab -lopencv_cudaoptflow -lopencv_cudalegacy -lopencv_cudawarping -lopencv_aruco -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dpm -lopencv_fuzzy -lopencv_line_descriptor -lopencv_optflow -lopencv_reg -lopencv_saliency -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_rgbd -lopencv_surface_matching -lopencv_tracking -lopencv_datasets -lopencv_text -lopencv_face -lopencv_plot -lopencv_dnn -lopencv_xfeatures2d -lopencv_shape -lopencv_video -lopencv_ximgproc -lopencv_calib3d -lopencv_features2d -lopencv_flann -lopencv_xobjdetect -lopencv_objdetect -lopencv_ml -lopencv_xphoto -lopencv_highgui -lopencv_videoio -lopencv_photo -lopencv_imgcodecs -lopencv_cudaimgproc -lopencv_cudafilters -lopencv_imgproc -lopencv_cudaarithm -lopencv_core -lopencv_cudev


OPENCV with NO CUDA
pkg-config --libs opencv | grep cuda
-L/USR/LOCAL/LIB -LOPENCV_STITCHING -LOPENCV_SUPERRES -LOPENCV_VIDEOSTAB -LOPENCV_ARUCO -LOPENCV_BGSEGM -LOPENCV_BIOINSPIRED -LOPENCV_CCALIB -LOPENCV_CVV -LOPENCV_DNN -LOPENCV_DPM -LOPENCV_FUZZY -LOPENCV_HDF -LOPENCV_LINE_DESCRIPTOR -LOPENCV_OPTFLOW -LOPENCV_PLOT -LOPENCV_REG -LOPENCV_SALIENCY -LOPENCV_STEREO -LOPENCV_STRUCTURED_LIGHT -LOPENCV_PHASE_UNWRAPPING -LOPENCV_RGBD -LOPENCV_SURFACE_MATCHING -LOPENCV_TRACKING -LOPENCV_DATASETS -LOPENCV_TEXT -LOPENCV_FACE -LOPENCV_XFEATURES2D -LOPENCV_SHAPE -LOPENCV_VIDEO -LOPENCV_XIMGPROC -LOPENCV_CALIB3D -LOPENCV_FEATURES2D -LOPENCV_FLANN -LOPENCV_XOBJDETECT -LOPENCV_OBJDETECT -LOPENCV_ML -LOPENCV_XPHOTO -LOPENCV_HIGHGUI -LOPENCV_VIDEOIO -LOPENCV_IMGCODECS -LOPENCV_PHOTO -LOPENCV_IMGPROC -LOPENCV_CORE

CMake Error at /usr/share/cmake-3.5/Modules/FindQt4.cmake:1326 (message):
  Found unsuitable Qt version "" from NOTFOUND, this code requires Qt 4.x
Call Stack (most recent call first):
  cmake/OpenCVFindLibsGUI.cmake:34 (find_package)
  CMakeLists.txt:556 (include)

$ qmake --version
   qmake: could not find a Qt installation of ''

$ sudo apt-get install qt4-dev-tools libqt4-dev

$ qmake -v
   QMake version 2.01a
   Using Qt version 4.8.7 in /usr/lib/x86_64-linux-gnu

B
$ make -jN
$ sudo make install

>>> import cv2 as cv
>>> cv.__version__
'3.2.0-dev'   


Testing:
ll /usr/local/lib/libopencv_c
libopencv_calib3d.so               libopencv_cudacodec.so             libopencv_cudaobjdetect.so
libopencv_calib3d.so.3.2           libopencv_cudacodec.so.3.2         libopencv_cudaobjdetect.so.3.2
libopencv_calib3d.so.3.2.0         libopencv_cudacodec.so.3.2.0       libopencv_cudaobjdetect.so.3.2.0
libopencv_ccalib.so                libopencv_cudafeatures2d.so        libopencv_cudaoptflow.so
libopencv_ccalib.so.3.2            libopencv_cudafeatures2d.so.3.2    libopencv_cudaoptflow.so.3.2
libopencv_ccalib.so.3.2.0          libopencv_cudafeatures2d.so.3.2.0  libopencv_cudaoptflow.so.3.2.0
libopencv_core.so                  libopencv_cudafilters.so           libopencv_cudastereo.so
libopencv_core.so.3.2              libopencv_cudafilters.so.3.2       libopencv_cudastereo.so.3.2
libopencv_core.so.3.2.0            libopencv_cudafilters.so.3.2.0     libopencv_cudastereo.so.3.2.0
libopencv_cudaarithm.so            libopencv_cudaimgproc.so           libopencv_cudawarping.so
libopencv_cudaarithm.so.3.2        libopencv_cudaimgproc.so.3.2       libopencv_cudawarping.so.3.2
libopencv_cudaarithm.so.3.2.0      libopencv_cudaimgproc.so.3.2.0     libopencv_cudawarping.so.3.2.0
libopencv_cudabgsegm.so            libopencv_cudalegacy.so            libopencv_cudev.so
libopencv_cudabgsegm.so.3.2        libopencv_cudalegacy.so.3.2        libopencv_cudev.so.3.2
libopencv_cudabgsegm.so.3.2.0      libopencv_cudalegacy.so.3.2.0      libopencv_cudev.so.3.2.0

 ll -lh /usr/local/lib/libopencv_*.so.3.2.0
-rw-r--r-- 1 root root 361K Dec 31 17:58 /usr/local/lib/libopencv_aruco.so.3.2.0
-rw-r--r-- 1 root root  72K Dec 31 17:55 /usr/local/lib/libopencv_bgsegm.so.3.2.0
-rw-r--r-- 1 root root 260K Dec 31 17:55 /usr/local/lib/libopencv_bioinspired.so.3.2.0
-rw-r--r-- 1 root root 1.7M Dec 31 17:56 /usr/local/lib/libopencv_calib3d.so.3.2.0
-rw-r--r-- 1 root root 496K Dec 31 17:56 /usr/local/lib/libopencv_ccalib.so.3.2.0
-rw-r--r-- 1 root root  20M Dec 31 17:52 /usr/local/lib/libopencv_core.so.3.2.0
-rw-r--r-- 1 root root 141M Dec 31 17:52 /usr/local/lib/libopencv_cudaarithm.so.3.2.0
-rw-r--r-- 1 root root 1.4M Dec 31 17:53 /usr/local/lib/libopencv_cudabgsegm.so.3.2.0
-rw-r--r-- 1 root root 174K Dec 31 17:54 /usr/local/lib/libopencv_cudacodec.so.3.2.0
-rw-r--r-- 1 root root  27M Dec 31 17:56 /usr/local/lib/libopencv_cudafeatures2d.so.3.2.0
-rw-r--r-- 1 root root 375M Dec 31 17:53 /usr/local/lib/libopencv_cudafilters.so.3.2.0
-rw-r--r-- 1 root root  28M Dec 31 17:53 /usr/local/lib/libopencv_cudaimgproc.so.3.2.0
-rw-r--r-- 1 root root 7.7M Dec 31 17:56 /usr/local/lib/libopencv_cudalegacy.so.3.2.0
-rw-r--r-- 1 root root 1.1M Dec 31 17:56 /usr/local/lib/libopencv_cudaobjdetect.so.3.2.0
-rw-r--r-- 1 root root  50M Dec 31 17:56 /usr/local/lib/libopencv_cudaoptflow.so.3.2.0
-rw-r--r-- 1 root root 9.8M Dec 31 17:56 /usr/local/lib/libopencv_cudastereo.so.3.2.0
-rw-r--r-- 1 root root  51M Dec 31 17:53 /usr/local/lib/libopencv_cudawarping.so.3.2.0
-rw-r--r-- 1 root root 7.5K Dec 31 16:40 /usr/local/lib/libopencv_cudev.so.3.2.0
-rw-r--r-- 1 root root 636K Dec 31 17:56 /usr/local/lib/libopencv_datasets.so.3.2.0
-rw-r--r-- 1 root root 5.0M Dec 31 17:53 /usr/local/lib/libopencv_dnn.so.3.2.0
-rw-r--r-- 1 root root 155K Dec 31 17:55 /usr/local/lib/libopencv_dpm.so.3.2.0
-rw-r--r-- 1 root root 202K Dec 31 17:55 /usr/local/lib/libopencv_face.so.3.2.0
-rw-r--r-- 1 root root 894K Dec 31 17:55 /usr/local/lib/libopencv_features2d.so.3.2.0
-rw-r--r-- 1 root root 457K Dec 31 17:52 /usr/local/lib/libopencv_flann.so.3.2.0
-rw-r--r-- 1 root root  62K Dec 31 17:54 /usr/local/lib/libopencv_fuzzy.so.3.2.0
-rw-r--r-- 1 root root 335K Dec 31 17:52 /usr/local/lib/libopencv_highgui.so.3.2.0
-rw-r--r-- 1 root root 3.8M Dec 31 17:52 /usr/local/lib/libopencv_imgcodecs.so.3.2.0
-rw-r--r-- 1 root root  24M Dec 31 17:52 /usr/local/lib/libopencv_imgproc.so.3.2.0
-rw-r--r-- 1 root root 225K Dec 31 17:55 /usr/local/lib/libopencv_line_descriptor.so.3.2.0
-rw-r--r-- 1 root root 900K Dec 31 17:52 /usr/local/lib/libopencv_ml.so.3.2.0
-rw-r--r-- 1 root root 482K Dec 31 17:54 /usr/local/lib/libopencv_objdetect.so.3.2.0
-rw-r--r-- 1 root root 426K Dec 31 17:58 /usr/local/lib/libopencv_optflow.so.3.2.0
-rw-r--r-- 1 root root  51K Dec 31 17:58 /usr/local/lib/libopencv_phase_unwrapping.so.3.2.0
-rw-r--r-- 1 root root 2.7M Dec 31 17:54 /usr/local/lib/libopencv_photo.so.3.2.0
-rw-r--r-- 1 root root  50K Dec 31 17:54 /usr/local/lib/libopencv_plot.so.3.2.0
-rw-r--r-- 1 root root 1.5M Dec 31 17:52 /usr/local/lib/libopencv_reg.so.3.2.0
-rw-r--r-- 1 root root 623K Dec 31 17:57 /usr/local/lib/libopencv_rgbd.so.3.2.0
-rw-r--r-- 1 root root 226K Dec 31 17:55 /usr/local/lib/libopencv_saliency.so.3.2.0
-rw-r--r-- 1 root root 277K Dec 31 17:54 /usr/local/lib/libopencv_shape.so.3.2.0
-rw-r--r-- 1 root root 192K Dec 31 17:57 /usr/local/lib/libopencv_stereo.so.3.2.0
-rw-r--r-- 1 root root 905K Dec 31 17:58 /usr/local/lib/libopencv_stitching.so.3.2.0
-rw-r--r-- 1 root root 132K Dec 31 17:58 /usr/local/lib/libopencv_structured_light.so.3.2.0
-rw-r--r-- 1 root root 598K Dec 31 17:57 /usr/local/lib/libopencv_superres.so.3.2.0
-rw-r--r-- 1 root root 376K Dec 31 17:53 /usr/local/lib/libopencv_surface_matching.so.3.2.0
-rw-r--r-- 1 root root 445K Dec 31 17:55 /usr/local/lib/libopencv_text.so.3.2.0
-rw-r--r-- 1 root root 3.5M Dec 31 17:57 /usr/local/lib/libopencv_tracking.so.3.2.0
-rw-r--r-- 1 root root 165K Dec 31 17:52 /usr/local/lib/libopencv_videoio.so.3.2.0
-rw-r--r-- 1 root root 1.8M Dec 31 17:53 /usr/local/lib/libopencv_video.so.3.2.0
-rw-r--r-- 1 root root 2.4M Dec 31 17:57 /usr/local/lib/libopencv_videostab.so.3.2.0
-rw-r--r-- 1 root root 3.6M Dec 31 17:57 /usr/local/lib/libopencv_xfeatures2d.so.3.2.0
-rw-r--r-- 1 root root 1.3M Dec 31 17:57 /usr/local/lib/libopencv_ximgproc.so.3.2.0
-rw-r--r-- 1 root root 117K Dec 31 17:55 /usr/local/lib/libopencv_xobjdetect.so.3.2.0
-rw-r--r-- 1 root root 288K Dec 31 17:55 /usr/local/lib/libopencv_xphoto.so.3.2.0

With CUDA:
$ ll -lh /usr/local/lib/libopencv_*.so.3.2.0
-rw-r--r-- 1 root root 363K Dec 31 20:34 /usr/local/lib/libopencv_aruco.so.3.2.0
-rw-r--r-- 1 root root  74K Dec 31 20:31 /usr/local/lib/libopencv_bgsegm.so.3.2.0
-rw-r--r-- 1 root root 265K Dec 31 20:31 /usr/local/lib/libopencv_bioinspired.so.3.2.0
-rw-r--r-- 1 root root 1.7M Dec 31 20:32 /usr/local/lib/libopencv_calib3d.so.3.2.0
-rw-r--r-- 1 root root 493K Dec 31 20:32 /usr/local/lib/libopencv_ccalib.so.3.2.0
-rw-r--r-- 1 root root  21M Dec 31 20:28 /usr/local/lib/libopencv_core.so.3.2.0
-rw-r--r-- 1 root root 133M Dec 31 20:28 /usr/local/lib/libopencv_cudaarithm.so.3.2.0
-rw-r--r-- 1 root root 1.2M Dec 31 20:29 /usr/local/lib/libopencv_cudabgsegm.so.3.2.0
-rw-r--r-- 1 root root 176K Dec 31 20:31 /usr/local/lib/libopencv_cudacodec.so.3.2.0
-rw-r--r-- 1 root root  27M Dec 31 20:32 /usr/local/lib/libopencv_cudafeatures2d.so.3.2.0
-rw-r--r-- 1 root root 375M Dec 31 20:29 /usr/local/lib/libopencv_cudafilters.so.3.2.0
-rw-r--r-- 1 root root  24M Dec 31 20:30 /usr/local/lib/libopencv_cudaimgproc.so.3.2.0
-rw-r--r-- 1 root root 7.4M Dec 31 20:32 /usr/local/lib/libopencv_cudalegacy.so.3.2.0
-rw-r--r-- 1 root root 943K Dec 31 20:32 /usr/local/lib/libopencv_cudaobjdetect.so.3.2.0
-rw-r--r-- 1 root root  69M Dec 31 20:33 /usr/local/lib/libopencv_cudaoptflow.so.3.2.0
-rw-r--r-- 1 root root 9.6M Dec 31 20:33 /usr/local/lib/libopencv_cudastereo.so.3.2.0
-rw-r--r-- 1 root root  43M Dec 31 20:30 /usr/local/lib/libopencv_cudawarping.so.3.2.0
-rw-r--r-- 1 root root 9.0K Dec 31 18:15 /usr/local/lib/libopencv_cudev.so.3.2.0
-rw-r--r-- 1 root root 638K Dec 31 20:33 /usr/local/lib/libopencv_datasets.so.3.2.0
-rw-r--r-- 1 root root 5.0M Dec 31 20:30 /usr/local/lib/libopencv_dnn.so.3.2.0
-rw-r--r-- 1 root root 157K Dec 31 20:31 /usr/local/lib/libopencv_dpm.so.3.2.0
-rw-r--r-- 1 root root 204K Dec 31 20:31 /usr/local/lib/libopencv_face.so.3.2.0
-rw-r--r-- 1 root root 902K Dec 31 20:31 /usr/local/lib/libopencv_features2d.so.3.2.0
-rw-r--r-- 1 root root 471K Dec 31 20:29 /usr/local/lib/libopencv_flann.so.3.2.0
-rw-r--r-- 1 root root  63K Dec 31 20:30 /usr/local/lib/libopencv_fuzzy.so.3.2.0
-rw-r--r-- 1 root root 341K Dec 31 20:28 /usr/local/lib/libopencv_highgui.so.3.2.0
-rw-r--r-- 1 root root 3.8M Dec 31 20:28 /usr/local/lib/libopencv_imgcodecs.so.3.2.0
-rw-r--r-- 1 root root  24M Dec 31 20:28 /usr/local/lib/libopencv_imgproc.so.3.2.0
-rw-r--r-- 1 root root 226K Dec 31 20:32 /usr/local/lib/libopencv_line_descriptor.so.3.2.0
-rw-r--r-- 1 root root 917K Dec 31 20:29 /usr/local/lib/libopencv_ml.so.3.2.0
-rw-r--r-- 1 root root 484K Dec 31 20:31 /usr/local/lib/libopencv_objdetect.so.3.2.0
-rw-r--r-- 1 root root 443K Dec 31 20:34 /usr/local/lib/libopencv_optflow.so.3.2.0
-rw-r--r-- 1 root root  53K Dec 31 20:34 /usr/local/lib/libopencv_phase_unwrapping.so.3.2.0
-rw-r--r-- 1 root root 2.3M Dec 31 20:30 /usr/local/lib/libopencv_photo.so.3.2.0
-rw-r--r-- 1 root root  52K Dec 31 20:31 /usr/local/lib/libopencv_plot.so.3.2.0
-rw-r--r-- 1 root root 1.5M Dec 31 20:29 /usr/local/lib/libopencv_reg.so.3.2.0
-rw-r--r-- 1 root root 620K Dec 31 20:33 /usr/local/lib/libopencv_rgbd.so.3.2.0
-rw-r--r-- 1 root root 228K Dec 31 20:32 /usr/local/lib/libopencv_saliency.so.3.2.0
-rw-r--r-- 1 root root 279K Dec 31 20:30 /usr/local/lib/libopencv_shape.so.3.2.0
-rw-r--r-- 1 root root 193K Dec 31 20:33 /usr/local/lib/libopencv_stereo.so.3.2.0
-rw-r--r-- 1 root root 810K Dec 31 20:34 /usr/local/lib/libopencv_stitching.so.3.2.0
-rw-r--r-- 1 root root 133K Dec 31 20:34 /usr/local/lib/libopencv_structured_light.so.3.2.0
-rw-r--r-- 1 root root 599K Dec 31 20:33 /usr/local/lib/libopencv_superres.so.3.2.0
-rw-r--r-- 1 root root 389K Dec 31 20:29 /usr/local/lib/libopencv_surface_matching.so.3.2.0
-rw-r--r-- 1 root root 446K Dec 31 20:32 /usr/local/lib/libopencv_text.so.3.2.0
-rw-r--r-- 1 root root 3.5M Dec 31 20:33 /usr/local/lib/libopencv_tracking.so.3.2.0
-rw-r--r-- 1 root root 167K Dec 31 20:28 /usr/local/lib/libopencv_videoio.so.3.2.0
-rw-r--r-- 1 root root 1.8M Dec 31 20:29 /usr/local/lib/libopencv_video.so.3.2.0
-rw-r--r-- 1 root root 2.4M Dec 31 20:33 /usr/local/lib/libopencv_videostab.so.3.2.0
-rw-r--r-- 1 root root 3.4M Dec 31 20:34 /usr/local/lib/libopencv_xfeatures2d.so.3.2.0
-rw-r--r-- 1 root root 1.3M Dec 31 20:34 /usr/local/lib/libopencv_ximgproc.so.3.2.0
-rw-r--r-- 1 root root 118K Dec 31 20:31 /usr/local/lib/libopencv_xobjdetect.so.3.2.0
-rw-r--r-- 1 root root 289K Dec 31 20:31 /usr/local/lib/libopencv_xphoto.so.3.2.0

>>> cv2.__version__
'3.2.0-dev'
>>> cv2.cuda
<module 'cv2.cuda' (built-in)>

=====
help(cv2)

Help on module cv2:

NAME
    cv2

FILE
    /usr/local/lib/python2.7/dist-packages/cv2.so

SUBMODULES
    Error
    aruco
    bgsegm
    bioinspired
    cuda
    datasets
    detail
    dnn
    face
    fisheye
    flann
    ft
    instr
    line_descriptor
    ml
    motempl
    multicalib
    ocl
    ogl
    omnidir
    optflow
    plot
    ppf_match_3d
    rgbd
    saliency
    structured_light
    text
    videostab
    xfeatures2d
    ximgproc
    xphoto
 =========================
