# Python 3.6 #

## Error:

subprocess.CalledProcessError: Command 'lsb_release -a' returned non-zero exit status 1.


## Solution:

Try :
```
$ lsb_release
Traceback (most recent call last):
  File "/usr/bin/lsb_release", line 25, in <module>
    import lsb_release
ModuleNotFoundError: No module named 'lsb_release'

$ lsb_release -a
Traceback (most recent call last):
  File "/usr/bin/lsb_release", line 25, in <module>
    import lsb_release
ModuleNotFoundError: No module named 'lsb_release'
```

Solve Now:
```
$ ls -l /usr/share/pyshared/lsb_release.py
-rw-r--r-- 1 root root 12730 Dec  3  2016 /usr/share/pyshared/lsb_release.py
pi@raspberrypi:~/Desktop/data $ sudo ln -s /usr/share/pyshared/lsb_release.py /usr/local/lib/python3.6/site-packages/lsb_release.py

```
================================




