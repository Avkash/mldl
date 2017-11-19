# H2O Stacked Ensemble - Binomial Classification in Python # 

H2O’s Stacked Ensemble method is supervised ensemble machine learning algorithm that finds the optimal combination of a collection of prediction algorithms using a process called stacking. This method currently supports regression and binary classification.

## Dataset ##
The dataset used in this example can be obtained from here:
 - [titanic_list.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.
  
## Get the Sample Python Notebook ##
  - [H2O Stacked Ensemble Classification with Titanic Dataset Notebook](https://github.com/Avkash/mldl/blob/master/notebook/h2o/H2O-StackEnsembles-Titanic.ipynb)
  
## Stacked Ensemble Binomial Classification Sample Code in Python ##

###: Loading important libraries 
```python
import h2o
from __future__ import print_function
```

###: Loading H2O Ensemble, Gird Search, GBM, Random Forest and Deep Learning specific libraries
```python
from h2o.estimators.random_forest import H2ORandomForestEstimator
from h2o.estimators.gbm import H2OGradientBoostingEstimator
from h2o.estimators.stackedensemble import H2OStackedEnsembleEstimator
from h2o.estimators.deeplearning import H2ODeepLearningEstimator
from h2o.grid.grid_search import H2OGridSearch
```

###: Initializing H2O
```python
h2o.init()
```

###:Importing training and test data
```
### Local
df = h2o.import_file("/Users/avkashchauhan/examples/titanic_list.csv")
### URL
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
```

###: Understanding the size of training dataset
```python
print(df.shape)
```

###: Understanding the training dataset
```python
df.describe()
```

###: Listing columns in training dataset
```python
df.col_names
```

###: Setting response column to "medv" <- Median house value
```python
response = "survived"
```

###: Setting response column as factore to generate classification model (Binomial exactly)
```python
df[response] = df[response].asfactor()
```

###: Spliting dataset into 2 sets for training and test dataset
```python
train, test = df.split_frame(ratios = [0.9])
```

###: Cecking the size of traning and test dataset
```python
print(df.shape)
print(train.shape)
print(test.shape)
```

###: Setting all the columns as features which will be used in training
```python
features = train.columns
features.remove(response)
print(features)
```

###: Ignoring columns not to be used in traning
```python
ignore_list = ['name', 'ticket', 'home.dest']
for each_name in ignore_list:
    features.remove(each_name)
print(features)    
```

###: We will be using cross validation in traning so setting Number of CV folds 
```python
nfolds = 5
```

## You can create ensemble models in few given ways: ##
###: 1. First Train individual models and pass as list to ensemble
###: 2. Train a grid of models
###: 3. Train several grids of models

Note: All base models must have the same cross-validation folds and the cross-validated predicted values must be kept using keep_cross_validation_predictions set to TRUE.


##  Ensemble 1.  ##
###: First Train individual models and pass as list to ensemble
###: We will generate a 3-model ensemble using GBM + RF + Deep Learning model types

###: Training and cross-validating a GBM Regression Model and R2 metrics will be used as main metric
```python
titanic_gbm = H2OGradientBoostingEstimator(distribution="AUTO",
                                      ntrees=10,
                                      max_depth=3,
                                      min_rows=2,
                                      learn_rate=0.2,
                                      nfolds=nfolds,
                                      fold_assignment="Modulo",
                                      keep_cross_validation_predictions=True,
                                      seed=1,
                                      model_id ="Titanic_GBM_Classification_Model")
titanic_gbm.train(x=features, y=response, training_frame=train)
```

###: Training and cross-validating a Random Forest Regression Model and R2 metrics will be used as main metric
```python
titanic_rf = H2ORandomForestEstimator(ntrees=10,
                                 nfolds=nfolds,
                                 fold_assignment="Modulo",
                                 keep_cross_validation_predictions=True,
                                 seed=1,
                                 model_id = "Titanic_RF_Clssification_Model")
titanic_rf.train(x=features, y=response, training_frame=train)
```

###: Training and cross-validating a Deep Learning Regression Model and AUC metrics will be used as main metric
```python
titanic_dl = H2ODeepLearningEstimator(
                                 nfolds=nfolds,
                                 fold_assignment="Modulo",
                                 keep_cross_validation_predictions=True,
                                 hidden = [10,10],
                                 epochs = 25,
                                 train_samples_per_iteration=10,
                                 score_training_samples=20,
                                 activation="Rectifier",
                                 adaptive_rate = False,
                                 seed=1,
                                 model_id = "Titanic_DL_Classification_Model")
titanic_dl.train(x=features, y=response, training_frame=train)
```

###: Getting Model ID of each model we have built
```python
print(titanic_gbm.model_id)
print(titanic_rf.model_id)
print(titanic_dl.model_id)
```

###: Getting Model performance based cross validation using R2 metric for each model
```python
print(titanic_gbm.model_performance(xval=True).auc())
print(titanic_rf.model_performance(xval=True).auc())
print(titanic_dl.model_performance(xval=True).auc())
```

###: Generating an ensemble model using all 3 previously created GBM, RD and DL models
```python
ensemble = H2OStackedEnsembleEstimator(model_id="Titanic_ensemble_model",
                                       base_models=[titanic_gbm.model_id, 
                                                    titanic_rf.model_id,
                                                    titanic_dl.model_id ])
ensemble.train(x=features, y=response, training_frame=train)
```

###: Evaluating ensemble performance using test data
```python
perf_stack_test = ensemble.model_performance(test)
```

###: Comparing Base Learner performance using test set for GBM, RF and Deep Learning Model:
```python
perf_gbm_test = titanic_gbm.model_performance(test)
perf_rf_test = titanic_rf.model_performance(test)
perf_dl_test = titanic_dl.model_performance(test)
baselearner_best_auc_test = max(perf_gbm_test.auc(), perf_rf_test.auc(), perf_dl_test.auc())
print("Best Base-learner Test AUC :  {0}".format(baselearner_best_auc_test))
```

###: Getting Stack Ensemble Models performance using test set:
```python
stack_auc_test = perf_stack_test.auc()
print("Ensemble Test AUC:  {0}".format(stack_auc_test))
```

###: Printing Original Modelperformance using test data for comparision
```python
print("Original GBM Model Test AUC : ", perf_gbm_test.auc())
print("Original RF Model Test AUC :", perf_rf_test.auc())
print("Original Deep Learning Model Test AUC : ", perf_dl_test.auc())
```

###: Stack Ensemble model is like any other model in H2O 
###: So you sure can perform predictions using test set as needed
```python
pred = ensemble.predict(test)
```


## Ensemble 2. ##
###: First We will generate a random Grid of model selecting GBM as main algorithm
###: Secondany we will stack all of grid model together

###: Let's specify GBM hyperparameters for the grid search
```python
gbm_hyper_params = {"learn_rate": [0.01, 0.05, 0.1, 0.2, 0.5, 1.0],
                "max_depth": [ 5, 7, 10],
                "sample_rate": [0.5, 0.75, 1.0],
                "col_sample_rate": [0.5, 0.6, 0.7, 0.8]}
```

###: Now we will setup the Grid Search criteria and other parameter to fine tune it:
```python
grid_search_criteria = {"strategy": "RandomDiscrete", 
                   "max_models": 50, 
                   "seed": 12345}
```

###: Now we will build the H2O GBM model based on Gird Search criteria and GBM hyperparameters setting:
```python
titanic_gbm_grid = H2OGridSearch(model=H2OGradientBoostingEstimator(ntrees=10,
                                                        seed=1,
                                                        nfolds=nfolds,
                                                        fold_assignment="Modulo",
                                                        keep_cross_validation_predictions=True),
                     hyper_params=gbm_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="Titanic_gbm_grid")

titanic_gbm_grid.train(x=features, y=response, training_frame=train)
```

###: Lets see the count of all models we built during grid search
```python
len(titanic_gbm_grid.model_ids)
```

###: Now we will train a stacked ensemble model by passing the GBM grid models
```python
titanic_grid_ensemble = H2OStackedEnsembleEstimator(model_id="titanic_gbm_grid_ensemble",
                                       base_models=titanic_gbm_grid.model_ids)
titanic_grid_ensemble.train(x=features, y=response, training_frame=train)
```

###: Let's evaluate the stacked ensemble model performance based on test data
```python
perf_stack_test = titanic_grid_ensemble.model_performance(test)
```

###: Now we can compare base learner performance with stacked ensemble model using test data
```python
baselearner_best_auc_test = max([h2o.get_model(model).model_performance(test_data=test).auc() for model in titanic_gbm_grid.model_ids])

stack_auc_test = perf_stack_test.auc()
print("Best Base-learner model AUC:  {0}".format(baselearner_best_auc_test))
print("Ensemble Model AUC:  {0}".format(stack_auc_test))
```

###:  Stack Ensemble model is like any other model in H2O 
###: So you sure can perform predictions using test set as needed
```python
pred = titanic_grid_ensemble.predict(test)
```

## Ensemble 3. ##
###: First We will generate a random Grid of model selecting Deep Learning as main algorithm
###: Secondany we will stack Previously created GBM and recently created Deep Learning model together

###: Let's specify Deep Learning hyperparameters for the grid search
```python
dl_hyper_params = { "hidden" : [1, 5,10],
                     "train_samples_per_iteration" : [5, 10],
                     "score_training_samples" : [10, 20]}
```

###: Now we will setup the Grid Search criteria and other parameter to fine tune it:
```python
grid_search_criteria = {"strategy": "RandomDiscrete", 
                   "max_models": 50, 
                   "seed": 12345}
```


###: Now we will build H2O Deep Learning models based on Gird Search criteria and GBM hyperparameters setting:
```python
titanic_dl_grid = H2OGridSearch(model=H2ODeepLearningEstimator(epochs=20,
                                                        seed=1,
                                                        nfolds=nfolds,
                                                        fold_assignment="Modulo",
                                                        keep_cross_validation_predictions=True),
                     hyper_params=dl_hyper_params,
                     search_criteria=grid_search_criteria,
                     grid_id="Titanic_dl_grid")

titanic_dl_grid.train(x=features, y=response, training_frame=train)
```

###: Lets see the count of all models we built during grid search
```python
len(titanic_dl_grid.model_ids)
```

###: Now we will train a stacked ensemble model by passing the GBM and Deep Learning grid models
```python
all_ids = []
```

```python
for mid in titanic_dl_grid.model_ids:
    all_ids.append(mid)
for mid in titanic_gbm_grid.model_ids:
    all_ids.append(mid)
print(len(all_ids))    
```
###: Now we will train a stacked ensemble model by passing the GBM and Deep Learning grid models
```python
titanic_gbm_dl_grid_ensemble = H2OStackedEnsembleEstimator(model_id="titanic_gbm_dl_grid_ensemble_3",
                                       base_models=all_ids)

titanic_gbm_dl_grid_ensemble.train(x=features, y=response, training_frame=train)
```

###: Let's evaluate the stacked ensemble model performance based on test data
```python
perf_gbm_dl_stack_test = titanic_gbm_dl_grid_ensemble.model_performance(test)
```

###: Now we can compare base learner performance with stacked ensemble model using test data
```python
baselearner_gbm_dl_best_auc_test = max([h2o.get_model(model).model_performance(test_data=test).auc() for model in all_ids])

stack_gbm_dl_auc_test = perf_gbm_dl_stack_test.auc()
print("Best Base-learner model AUC:  {0}".format(baselearner_gbm_dl_best_auc_test))
print("Ensemble Model AUC:  {0}".format(stack_gbm_dl_auc_test))
```

