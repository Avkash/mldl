# Anomaly Detection with H2O Deep Learning Auto Encoder #

If enough training data resembling some underlying pattern is provided, H2O can train the network to learn the patterns in the data. An anomalous test point is a point that does not match the typical data patterns. The autoencoder will likely have a high error rate in reconstructing this data, indicating the anomaly.

High-dimensional data can be converted to low-dimensional codes by training a multilayer neural network with a small central layer to reconstruct high-dimensional input vectors. This kind of neural network is named Autoencoder.

Autoencoders is nonlinear dimensionality reduction technique (Hinton et al, 2006) used for unsupervised learning of features, and they can learn low-dimensional codes that work much better than principal components analysis as a tool to reduce the dimensionality of data. H2O uses Deep Learning framework to develop an anomaly detection demonstration using a deep autoencoder. 

## Dataset used in this Sample ##

The dataset is an ECG time series of heartbeats and the goal is to determine which heartbeats are outliers. The training data (20 “good” heartbeats) and the test data (training data with 3 “bad” heartbeats appended for simplicity) can be downloaded directly into the H2O cluster, as shown below. Each row represents a single heartbeat.

 - [Training dataset: ecg_discord_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv)
 - [Test Dataset: ecg_discord_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv)

## Samples in various languages ##
 - Python
 - R
 - Scala

## Articles and Resources ##
 - [Anomaly Heart Beats Detection](https://github.com/h2oai/h2o-3/blob/master/examples/deeplearning/notebooks/deeplearning_anomaly_detection.ipynb)
