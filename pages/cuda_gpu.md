# GPU - CUDA Specific Libraries and Tools #


## Get Cuda 8.0 from Nvidia ##

Get updated Nvidia driver from the link below: [https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads)

## CUDA 7.x to 8.0 Update ##

[Updating Nvidia CUDA to 8.0.x in Ubuntu 16.04](https://aichamp.wordpress.com/2016/11/09/updating-nvidia-cuda-to-8-0-x-in-ubuntu-16-04-ec2-gx-instance/)

## NVidia Toolkit ##

[Installing Nvidia driver and toolkit in Ubuntu 16.04 with tooklit samples](https://aichamp.wordpress.com/2016/11/20/installing-nvidia-driver-and-toolkit-in-ubuntu-16-04-with-tooklit-samples/)

## Solving Issues ##

$ nvidia-smi
```
nvidia-smi: command not found
```
Solution:
   You dont have Nvidia toollit install. You can install it as below:
   ```
   $ sudo apt install nvidia-cuda-toolkit
   ```

$ nvidia-smi
```
NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.
```
Solution:
 You don't have NVidia driver installed.  Depending on your graphics card please install the driver. 


$ nvcc
```
nvcc: command not found
```
Solution:
 The program 'nvcc' is currently not installed. You can install it by typing:
  $ sudo apt install nvidia-cuda-toolkit

Note: If you install nvidia toolkit, its best to reboot the machine. 

$ nvcc
```
   nvcc fatal   : No input files specified; use option --help for more information
```
Note: All is good, the compiler is working and expecting required arguments.

$ nvcc --version
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2016 NVIDIA Corporation
Built on Sun_Sep__4_22:14:01_CDT_2016
Cuda compilation tools, release 8.0, V8.0.44
```
Note: Above you have CUDA 8.0.

nvcc --version
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2015 NVIDIA Corporation
Built on Tue_Aug_11_14:27:32_CDT_2015
Cuda compilation tools, release 7.5, V7.5.17
```
Note: Above you have CUDA 7.5.

ubuntu@ip-10-0-0-212:~$ nvidia-smi
```
Fri Dec 30 22:48:00 2016
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 367.57                 Driver Version: 367.57                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GRID K520           Off  | 0000:00:03.0     Off |                  N/A |
| N/A   27C    P0     1W / 125W |      0MiB /  4036MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
Note: Above you have Nvidia driver 367.57


