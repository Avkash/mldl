# H2O Deep Learning - Binomial Classification Regression in Python # 

H2O Deep Learning successfully perform binomial classification when the response column/feature is categorical or enum based on Neural Network algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Binomial Classification Sample Code in Python ##

###: Importing H2O Library
```python
import h2o
```
### : Initializing h2O
```python
h2o.init()
