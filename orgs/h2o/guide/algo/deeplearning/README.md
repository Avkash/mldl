# Deep Learning in H2O #

H2O’s Deep Learning is based on a multi-layer feedforward artificial neural network that is trained with stochastic gradient descent using back-propagation. The network can contain a large number of hidden layers consisting of neurons with tanh, rectifier, and maxout activation functions. Advanced features such as adaptive learning rate, rate annealing, momentum training, dropout, L1 or L2 regularization, checkpointing, and grid search enable high predictive accuracy. Each compute node trains a copy of the global model parameters on its local data with multi-threading (asynchronously) and contributes periodically to the global model via model averaging across the network. You can learn more about H2O Deep Learning [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/deep-learning.html).

### Deep Learning linear regression example in various lnguage: ### 

- [FLOW]
- [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_lin_reg_auto_python.md)
- [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_regression_autompg_R.md)
- [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_regression_autompg_scala.md)


### Deep Learning Binomial Classification example in various lnguage: ### 

- [FLOW]
- [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_python.md)
- [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_R.md)
- [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/deeplearning/h2o_dl_classification_titanic_scala.md)



Helpful Links:
 - [H2O Deep Learning Performance Tuning](https://blog.h2o.ai/2015/08/deep-learning-performance-august/)
 - [How many hidden layers should I use?(ftp://ftp.sas.com/pub/neural/FAQ3.html#A_hl)]
 - [How To Improve Deep Learning Performance](https://machinelearningmastery.com/improve-deep-learning-performance/)
 - [H2O Deep Learning Turorial and Tuning](https://github.com/h2oai/h2o-tutorials/tree/master/tutorials/deeplearning)
