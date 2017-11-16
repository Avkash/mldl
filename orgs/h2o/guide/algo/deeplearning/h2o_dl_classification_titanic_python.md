# H2O Deep Learning - Binomial Classification Regression in Python # 

H2O Deep Learning successfully perform binomial classification when the response column/feature is categorical or enum based on Neural Network algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O_Deep Learning Classification with Titanic Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DeepLearning_Classification_titanic.ipynb)
  
## Binomial Classification Sample Code in Python ##

###: Importing H2O Library
```python
import h2o
```


### : Initializing h2O
```python
h2o.init()
```


### : Getting H2O Cluster status
```python
h2o.cluster().show_status()
```

###: Importing Dataset
```python
df = h2o.import_file("/Users/avkashchauhan/src/github.com/avkash/mldl/data/titanic_list.csv")
```


###: Understanding Dataset
```python
df.describe()
```


###: Understanding Dataset with pylab library
```python
import pylab as pl
pl.figure(figsize=(20,10))
df.as_data_frame().hist()
pl.show()
```


###: Getting a list of columns in our dataset
```python
df.col_names
```


###: Setting Response column
```python
response = "survived"
```


###: Setting Response column to factor so we can get unique values in it
```python
df['survived'].asfactor().levels()
```


###: Understanding Dataset with Seaborn python library using origin as color pclass
```python
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (12, 12)

import seaborn as sns
sns.set_context("notebook")

## Error due to NAs

sns.pairplot(df.as_data_frame(), vars=["embarked", "survived"], hue="pclass");
plt.show()
```


###: Setting Response column to factor so we can build classification model
```python
df[response] = df[response].asfactor()
```


###: Verifying Response column as factor 
```python
df[response].describe()
```


###: Setting all columns/features into a local variable
```python
features = df.col_names
```


###: Settings all features for model building
```python
features.remove(response)
print(features)
```


###: Ignoring list of features which are not required for model building
```python
ignore_list = ['name', 'ticket', 'home.dest']
for x in ignore_list:
    features.remove(x)
print(features)    
```


###: Importing H2O Deep Learning library
```python
from h2o.estimators.deeplearning import H2ODeepLearningEstimator
```


###: Setting H2O Deep Learning model configuration (default)
```python
dl_titanic_basic = H2ODeepLearningEstimator()
```


###: Training H2O Deep Learning Model 
```python
dl_titanic_basic.train(x = features, y = response,training_frame=df)
```


###: Understanding H2O Deep Learning Model overall performance based on training data
```python
dl_titanic_basic.model_performance(train=True)
```


###: Understanding H2O Deep Learning Model - AUC Model metrics based on training data
```python
dl_titanic_basic.model_performance(train=True).auc()
```


###: Setting H2O Deep Learning model configuration to use cross validation with 5 folds
```python
dl_titanic_cv = H2ODeepLearningEstimator(nfolds = 5 )
```


###: Training H2O Deep Learning Model
```python
dl_titanic_cv.train(x = features, y = response,training_frame=df)
```


###: Understanding H2O Deep Learning Model overall performance based on cross validation data (r2 only)
```python
dl_titanic_cv.model_performance(xval=True).auc()
```


###: Plotting H2O Deep Learning Model for its AUC metric 
```python
dl_titanic_cv.plot(metric='auc')
```


###: Generating H2O Deep Learning 
```python
dl_titanic_cv.varimp_plot()
```


###: Setting H2O Deep Learning model configuration to use cross validation with 5 folds and various other parameters
###: for tuning the performance and accuracy
```python
dl_titanic_cv_tuned = H2ODeepLearningEstimator(nfolds = 5,
                                           hidden = [30],
                                           epochs = 25,
                                           train_samples_per_iteration=20,
                                           score_training_samples=50,
                                           activation="Rectifier",
                                           adaptive_rate = False,
                                           seed = 12345)
# default activation works best this data #
# adaptive_rate = False works best for this data (True will reduce the accuracy) #
# hidden layers [20] or [30] works better then [10,10] or multiple levels #
```


###: Training H2O Deep Learning Model 
```python
dl_titanic_cv_tuned.train(x = features, y = response, training_frame=df)
```


###: Understanding H2O Deep Learning Model overall performance based on cross validation data (AUC only)
```python
print(dl_titanic_basic.model_performance(train=True).auc())
print(dl_titanic_cv.model_performance(xval=True).auc())
print(dl_titanic_cv_tuned.model_performance(xval=True).auc())
```


###:  H2O Deep Learning Tuned model varialbe importance plot
```python
dl_titanic_cv_tuned.varimp_plot()
```


###:  H2O Deep Learning Tuned model varialbe importance plot
```python
dl_titanic_cv_tuned.score_history()
dl_titanic_cv_tuned.scoring_history()
```


### PERFORMING PREDICTIONS USING a T
