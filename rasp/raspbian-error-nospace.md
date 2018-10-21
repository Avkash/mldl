## Problems when there is no space in the disk ##

Here are various variants of problems:

```
$ sudo apt-get upgrade
-bash: /usr/bin/sudo: Input/output error
pi@raspberrypi:~ $
pi@raspberrypi:~ $
pi@raspberrypi:~ $ sudo apt-get upgrade
-bash: /usr/bin/sudo: Input/output error
pi@raspberrypi:~ $
pi@raspberrypi:~ $
pi@raspberrypi:~ $ df -h
-bash: df: command not found
pi@raspberrypi:~ $ df -h
-bash: df: command not found
pi@raspberrypi:~ $ ls -l
-bash: /bin/ls: Input/output error
pi@raspberrypi:~ $ sudo reboot
-bash: /usr/bin/sudo: Input/output error
```



### Root Cause ##

- There is no disk space available in your device.
- Make space and get back on.
