# H2O Pre-requsite Components #


## OS: Ubuntu 16.04  ##

Update your machine with the following libraries:

```
sudo apt-get update
sudo apt-get install libblas-dev liblapack-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install maven
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install swig
```

Following components are needed for building H2O core source:
```
 sudo apt-get install npm
 sudo apt-get install nodejs-legacy
```

Following Python modules are needed to build python specific code in H2O:
```
   pip install requests
   pip install tabulate
   pip install future
   pip install colorama
```
Following R specific modules are needed to build R specific code in H2O:
```
  sudo apt-get install r-base r-base-dev
  sudo apt install r-cran-littler
  sudo apt-get install libcurl4-openssl-dev	
```
Following R libraries are needed inside R environment to compile R specific code:
```
   > install.packages("devtools")
   > install.packages("roxygen2")
   > install.packages("RCurl")
```
