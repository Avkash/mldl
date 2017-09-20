# Anaconda Tips #

 - Create Environment
   - $ conda create -n python27 python=2.7 anaconda
   - Note: Above environment name is python27 and python version is 2.7
 - Activate Environment
   - $ source activate python27
   - Note: This will activate above environment name python27
 - Installing package in each environment
   - Be inside one of the environment
   - You can use pip to install the package i.e.
   - $ pip install h2o --user
 - List Enviroment
   - $ conda list --envs
   - Note: This will list other environments along with python27 as well. 
 - Running jupyter notebook:
   - Be inside one of the environment
   - $ jupypter notebook
 - Deactivate Environment
   - $ source deactivate python27
   - Note: This will stop the environment. Now the list command will still show the python27 listed because it is only stopped but not delete.
 - Stop Environment
   - $ conda remove --name python27 --all
   - Note: This will remove the environment python27 and listing it will not list it. 
   

Caution:
 - Make sure not to have PYTHON_PATH set otherwise it may have issues with conda runtime
 
