# Anomaly Detection with H2O Deep Learning Auto Encoder in R #

High-dimensional data can be converted to low-dimensional codes by training a multilayer neural network with a small central layer to reconstruct high-dimensional input vectors. This kind of neural network is named Autoencoder.

H2O uses Deep Learning framework to develop an anomaly detection demonstration using a deep autoencoder. 

## Dataset used in this Sample ##

The dataset is an ECG time series of heartbeats and the goal is to determine which heartbeats are outliers. The training data (20 “good” heartbeats) and the test data (training data with 3 “bad” heartbeats appended for simplicity) can be downloaded directly into the H2O cluster, as shown below. Each row represents a single heartbeat.

 - [Training dataset: ecg_discord_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv)
 - [Test Dataset: ecg_discord_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv)

## Get R Sample Code ##
 - [R Code Sample](https://github.com/Avkash/mldl/blob/master/code/R/H2O-AutoEncoder-Ecg.R) 

## Anomaly Detection samples in R ##

###: Importing H2O and other required libraries
```
library(h2o)
```

###: Initializing H2O cluster
```
h2o.init()
```

###: Importing dataset
```
train_ecg = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv")
test_ecg = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv")
```

###: Understand training dataset
```
h2o.describe(train_ecg)
```

###: transpose the frame to have the time series as a single colum to plot
```
train_ecg_transpose = t(as.data.frame(train_ecg))
plot(train_ecg_transpose,  x = 1:length(train_ecg_transpose),  col="blue")
```

###: Using Configured Deep Learning to train neural network
```
auto_encoder_model = h2o.deeplearning( 
  activation="Tanh", 
  hidden=c(50,50), 
  autoencoder = TRUE,
  l1=1e-5,
  score_interval=0,
  epochs=100,
  x=names(train_ecg), training_frame=train_ecg
)
```

###: Getting model details:
```
auto_encoder_model
```

###: Computing reconstruction error with the Anomaly detection function. 
###: This is the Mean Square Error between output and input layers.
```
reconstruction_error = h2o.anomaly(auto_encoder_model, test_ecg)
```

###: Now the question is: Which of the test_ecg time series are most likely an anomaly? 
###: Lets select the top N that have high error rate
###:Pulling reconstruction error data into R and plotting to find outliers (last 3 heartbeats)
```
reconstruction_error <- as.data.frame(reconstruction_error)
reconstruction_error
plot.ts(reconstruction_error)
```

###: Listing anomalies based on reconstucted MSE values:
```
anomalies = reconstruction_error[reconstruction_error['Reconstruction.MSE'] > 1.0]
anomalies
```
###: Plotting test data without anomalies
```
plot.ts(reconstruction_error)
```

###: Perform Prediction/Testing = Reconstructing the test dataset
```
test_recon =  h2o.predict(auto_encoder_model, test_ecg) 
head(test_recon)
```
