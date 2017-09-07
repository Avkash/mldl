## How to contribute python code in H2O ##

### Get the source code ###
 - Get the H2O Source
   - Try using -> $ git clone https://github.com/h2oai/h2o-3.git
 - 
### Python source tree
 - The root of python code is h2o-3/h2o-py
 -  
### Testing python code in real time without packaging and installing package ###
 - Set your H2O_HOME where your H2O source code is cloned
   - I have it as:  H2O_HOME=/Users/avkashchauhan/src/github.com/h2oai/h2o-3
 - Now you need to export the python path as below:    
   - $ export PYTHONPATH=$PYTHONPATH:$H2O_HOME/h2o-py
 - If you are jupyter user just open the notebooks from this folder
   - $ jupyter notebook
 - Now you can just test the code directly  here. All the updated code will be available without packaging and installation.

### Writing python test scripts ### 
 - The root of python code is h2o-3/h2o-py/tests
 - Add your test code into a new file in the selected folder as needed
   - For example I wrote my test here: h2o-py/tests/testdir_misc/pyunit_predict_json.py
 - At the H2O_HOME location I can run the tests
   - $ python scripts/run.py --wipe --test h2o-py/tests/testdir_misc/pyunit_predict_json.py
 - To get help on all available options try below:
   - $ python scripts/run.py --help
 - If you run the following it will run all the tests in the folder   
   - python scripts/run.py 
