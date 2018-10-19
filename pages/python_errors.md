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






