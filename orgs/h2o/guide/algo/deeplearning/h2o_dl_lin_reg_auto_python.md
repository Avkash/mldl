# H2O Deep Learning - Linear Regression in Python # 

H2O Deep Learning successfully perform linear regression when the response column/feature is numeric based on Neural Network algorithms. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [auto_mpg.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/auto_mpg.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O_Deep Learning Regression with Autompg Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DeepLearning_Regression_autompg.ipynb)
  
  
## Linear Regression Sample Code in Python ##

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
h2o.cluster().show_status(True)
```
###: Importing Dataset
```python
df = h2o.import_file("/Users/avkashchauhan/src/github.com/avkash/mldl/data/auto_mpg.csv")
```
###: Understanding Dataset
```python
df.describe()
```
###: Getting a list of columns in our dataset
```python
df.col_names
```
###: Understanding Dataset with pylab library
```python
import pylab as pl
pl.figure(figsize=(20,10))
df.as_data_frame().hist()
pl.show()
```

###: Understanding Dataset with Seaborn python library using origin as color hue
```python
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (12, 12)

import seaborn as sns
sns.set_context("notebook")

sns.pairplot(df.as_data_frame(), vars=["horsepower" , "cylinders", "origin", "weight"], hue="origin");
plt.show()
```

###: Getting the list of classes in the response column ()
```python
df['cylinders'].asfactor().levels()
```
###: Understanding Dataset with Seaborn python library using cylinders as color hue
```python
sns.pairplot(df.as_data_frame(), vars=["horsepower" , "origin", "weight"], hue="cylinders");
plt.show()
```

###: Setting Response column
```python
response = "mpg"
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

###: Importing H2O Deep Learning library
```python
from h2o.estimators.deeplearning import H2ODeepLearningEstimator
```

###: Setting H2O Deep Learning model configuration (default)
```python
dl_auto_basic = H2ODeepLearningEstimator()
```

###: Training H2O Deep Learning Model 
```python
dl_auto_basic.train(x = features, y = response, training_frame=df)
```

###: Understanding H2O Deep Learning Model
```python
dl_auto_basic
```

###: Understanding H2O Deep Learning Model overall performance based on training data
```python
dl_auto_basic.model_performance(train=True)
```

###: Understanding H2O Deep Learning Model - r2 Model metrics based on training data
```python
dl_auto_basic.model_performance(train=True).r2()
```

###: Setting H2O Deep Learning model configuration to use cross validation with 5 folds
```python
dl_auto_cv = H2ODeepLearningEstimator(nfolds = 5)
```

###: Training H2O Deep Learning Model 
```python
dl_auto_cv.train(x = features, y = response, training_frame=df)
dl_auto_cv
```


###: Understanding H2O Deep Learning Model overall performance based on training data (r2 only)
```python
dl_auto_cv.model_performance(train=True).r2()
```


###: Understanding H2O Deep Learning Model overall performance based on cross validation data (r2 only)
```python
dl_auto_cv.model_performance(xval=True).r2()
```


###: Understanding H2O Deep Learning Model scoring History
```python
dl_auto_cv.score_history()
```

###: Understanding H2O Deep Learning Model variable importance
```python
dl_auto_cv.varimp()
```


###: Generating H2O Deep Learning Model variable importance plot
```python
dl_auto_cv.varimp_plot()
```


###: Setting H2O Deep Learning model configuration to use cross validation with 5 folds and various other parameters
###: for tuning the performance and accuracy
```python
dl_auto_cv_tuned = H2ODeepLearningEstimator(nfolds = 5,
                                           hidden = [10,10],
                                           epochs = 25,
                                           train_samples_per_iteration=10,
                                           score_training_samples=20,
                                           activation="Rectifier",
                                           adaptive_rate = False)
# default activation works best this data #
# adaptive_rate = False works best for this data #
```

###: Training H2O Deep Learning Model 
```python
dl_auto_cv_tuned.train(x = features , y = response, training_frame=df)
```


###: Understanding H2O Deep Learning Model overall performance based on cross validation data (r2 only)
```python
dl_auto_cv_tuned.model_performance(xval=True).r2()
```

###: Plotting H2O Deep Learning Model performance based on mae metric
```python
dl_auto_cv_tuned.plot(metric="mae")
```

###: Plotting H2O Deep Learning Model performance based on rmse metric
```python
dl_auto_cv.plot(metric='rmse')
```


###: Plotting H2O Deep Learning Model variable importance plot
```python
dl_auto_cv_tuned.varimp_plot()
```


###: Comparing H2O Deep Learning Model performance based on tuned and default cross validation model
```python
print(dl_auto_cv_tuned.model_performance(xval=True).r2())
print(dl_auto_cv_tuned.model_performance(train=True).r2())
```

### PERFORMING PREDICTIONS USING a TEST DATA SET

###: listing first 3 rows from the original data set
```python
df.head(3)
```


###: listing original data set columns
```python
df.columns_by_type()
```


###: creating test data set based on features used for building model
```python
df_test = h2o.H2OFrame.from_python({"cylinders":11, "displacement" : 400, "horsepower" : 400, 
                                    "weight" : 2000, "acceleration" : 14, "modelyear" : 90,
                                   "origin" : 2})
```

###: Performing prediction using one of the best deep learning model we built earlier
```python
dl_auto_cv_tuned.predict(df_test)
```

