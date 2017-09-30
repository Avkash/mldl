# Linux Scripting #

### Password-less SSH ###
$ ssh-keygen -t rsa 
$ ls -la ~/.ssh/
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 700 $HOME && chmod 700 ~/.ssh && chmod 600 ~/.ssh/*


