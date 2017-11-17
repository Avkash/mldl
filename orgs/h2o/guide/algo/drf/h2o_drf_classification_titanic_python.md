# H2O Distributed Random Forest - Binomial Classification in Python # 

H2O Distributed Random Forest successfully perform binomial classification when the response column/feature is categorical or enum based on Random Forest Algorithm. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O Random Forest Classification with Titanic Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O_DRF_Classification_titanic.ipynb)
  
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


###: Importing H2O Distributed Random Forest library
```python
from h2o.estimators.random_forest import H2ORandomForestEstimator
```


###: Setting H2O Distributed Random Forest model configuration (default)
```python
drf_titanic_basic = H2ORandomForestEstimator()
```


###: Training H2O Distributed Random Forest Model 
```python
drf_titanic_basic.train(x = features, y = response,training_frame=df)
```


###: Understanding H2O Distributed Random Forest Model overall performance based on training data
```python
drf_titanic_basic.model_performance(train=True)
```


###: Understanding H2O Distributed Random Forest Model - AUC Model metrics based on training data
```python
drf_titanic_basic.model_performance(train=True).auc()
```


###: Setting H2O Distributed Random Forest model configuration to use cross validation with 5 folds
```python
drf_titanic_cv = H2ORandomForestEstimator(nfolds = 5 )
```


###: Training H2O Distributed Random Forest Model
```python
drf_titanic_cv.train(x = features, y = response,training_frame=df)
```


###: Understanding H2O Distributed Random Forest Model overall performance based on cross validation data (r2 only)
```python
drf_titanic_cv.model_performance(xval=True).auc()
```


###: Plotting H2O Distributed Random Forest Model for its AUC metric 
```python
drf_titanic_cv.plot(metric='auc')
```


###: Generating H2O Distributed Random Forest 
```python
drf_titanic_cv.varimp_plot()
```


###: Setting H2O Distributed Random Forest model configuration to use cross validation with 5 folds and various other parameters for tuning the performance and accuracy
```python
drf_titanic_cv_tuned = H2ORandomForestEstimator(nfolds = 5,
                                    ntrees=10,
                                    max_depth=3,
                                    min_rows=2,
                                    keep_cross_validation_predictions=True,
                                   seed = 12345)
```

###: Training H2O Distributed Random Forest Model 
```python
drf_titanic_cv_tuned.train(x = features, y = response, training_frame=df)
```


###: Understanding H2O Distributed Random Forest Model overall performance based on cross validation data (AUC only)
```python
print(drf_titanic_basic.model_performance(train=True).auc())
print(drf_titanic_cv.model_performance(xval=True).auc())
print(drf_titanic_cv_tuned.model_performance(xval=True).auc())
```


###:  H2O Distributed Random Forest Tuned model varialbe importance plot
```python
drf_titanic_cv_tuned.varimp_plot()
```


###:  H2O Distributed Random Forest Tuned model varialbe importance plot
```python
drf_titanic_cv_tuned.score_history()
```


drf_titanic_cv_tuned.scoring_history()
```python
### PERFORMING PREDICTIONS USING a TEST DATA SET
```

###: listing features used for model building from the original data set
```python
features
```


###: listing first 3 rows from the original data set
```python
df.head(3).describe()
```


###: creating test data set based on features used for building model
```python
df_test = h2o.H2OFrame.from_python({"pclass":2, "sex" : 'male', "age" : 28, 
                                    "sibsp" : 1, "parch" : 2, "fare" : 321.9, "boat": 2, 'body' : 123,
                                   "embarked" : 'S', "cabin": "B5"})
type(df_test)
```


###: Performing prediction using one of the best Distributed Random Forest model we built earlier
```python
drf_titanic_cv_tuned.predict(df_test)
```


###: Looking at the histogram of response variable from original data set
```python
df[response].asnumeric().hist()
```
