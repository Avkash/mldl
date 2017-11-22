# Grid (Hyperparameter) Search in H2O #
H2O supports random hyperparameter search with time- and metric-based early stopping. 

## What are HyperParameters? ##
Nearly all model algorithms used in machine learning have a set of tuning "knobs" which affect how the learning algorithm fits the model to the data. Examples are the regularization settings alpha and lambda for Generalized Linear Modeling or ntrees and max_depth for Gradient Boosted Models. These knobs are called hyperparameters to distinguish them from internal model parameters, such as GLM's beta coefficients or Deep Learning's weights, which get learned from the data during the model training process.

## What Is Hyperparameter Optimization? ##

The set of all combinations of values for these knobs is called the hyperparameter space. We'd like to find a set of hyperparameter values which gives us the best model for our data in a reasonable amount of time. This process is called hyperparameter optimization.

Learn more about gird search in H2O [here](https://github.com/h2oai/h2o-3/blob/master/h2o-docs/src/product/tutorials/random%20hyperparmeter%20search%20and%20roadmap.md). 

## Grid Search Examples in H2O ##
 - GLM
 - GBM
 - Random Forest
 - Deep Learning
 - KMeans
 - XGBoost
 
## Articles ##
 - [H2O Grid (Hyperparameters) Search Roadmap](https://github.com/h2oai/h2o-3/blob/master/h2o-docs/src/product/tutorials/random%20hyperparmeter%20search%20and%20roadmap.md)
