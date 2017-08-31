## Common python function specific to Java ## 

```

def check_java_process_and_version():
    """
    Helper function for predict_json() to check java version in the machine
    :return: True/False if support java is available
    """
    result = subprocess.call(["java", "-version"])
    if result is not 0:
        raise RuntimeError("Java process not found, exiting!!")

    output = subprocess.check_output(["java", "-version"], stderr=subprocess.STDOUT)
    #output = subprocess.Popen(["java", "-version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    #print output.communicate()
    #print output.wait()
    result = "0.0"
    supported = False
    if output.find("1.6.") is not -1:
        result = "1.6"
    elif output.find("1.7.") is not -1:
        result = "1.7"
        supported = True
    elif output.find("1.8.") is not -1:
        result = "1.8"
        supported = True
    return supported
    
```
