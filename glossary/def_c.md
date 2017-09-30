## Machine Learning/Deep Learning Terminology(Glossary) - C ##

Cross-validation | Convolutional Neural Netowork | Cross Entropy
___

## Cross-validation (CV) ##
Cross-validation is a technique to evaluate predictive models by partitioning the original sample into a training set to train the model, and a test set to evaluate it. In k-fold cross-validation, the original sample is randomly partitioned into k equal size subsamples. 
 - Depending on K, you will be traning models on that many time.  
 - You can use k-fold cross-validation in place of validation dataset, when you have smaller dataset and does not want to partition

## Convolutional Neural Netowork:##
Images are generally stationary in nature. That means the statistics of one part of the image is same as any other part. So a feature learnt in one zone can do similar pattern matching in another zone. In a big image, we take a small section and pass it through all the points in the big image. While passing at any point we convolve or join them into a single position. Instead, try to imagine that a big box of data becomes a small box of data for the next layer of neuron. This helps faster computation without loss of precision of data. Each small section of the image that passes over the big image converts into a small filter.

## Cross Entropy ##
Cross-entropy is commonly used to quantify the difference between two probability distributions. Usually the "true" distribution (the one that your machine learning algorithm is trying to match) is expressed in terms of a one-hot distribution.
Read [here](https://rdipietro.github.io/friendly-intro-to-cross-entropy-loss/) and [here](https://stackoverflow.com/questions/41990250/what-is-cross-entropy) for great discussion on cross entropy.
 


## Credits/Resources ##
 - []()

