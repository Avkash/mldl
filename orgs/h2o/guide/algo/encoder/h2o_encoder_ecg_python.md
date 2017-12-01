# Anomaly Detection with H2O Deep Learning Auto Encoder in Python #

High-dimensional data can be converted to low-dimensional codes by training a multilayer neural network with a small central layer to reconstruct high-dimensional input vectors. This kind of neural network is named Autoencoder.

H2O uses Deep Learning framework to develop an anomaly detection demonstration using a deep autoencoder. 

## Dataset used in this Sample ##

The dataset is an ECG time series of heartbeats and the goal is to determine which heartbeats are outliers. The training data (20 “good” heartbeats) and the test data (training data with 3 “bad” heartbeats appended for simplicity) can be downloaded directly into the H2O cluster, as shown below. Each row represents a single heartbeat.

 - [Training dataset: ecg_discord_train.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv)
 - [Test Dataset: ecg_discord_test.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv)

## Get Python Sample Code ##
 -[Python Notebook Sample]() 

## Anomaly Detection samples in Python ##

###: Importing H2O and other required libraries
```
import h2o
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
```

###: Setting matplot graph to print within Jupyter Notebook
```
%matplotlib inline
```

###: Initializing H2O cluster
```
h2o.init()
```

###: Importing H2O AutoEncoder Estimator
```
from h2o.estimators.deeplearning import H2OAutoEncoderEstimator
```

###: Importing dataset
```
train_ecg = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_train.csv")
test_ecg = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/ecg_discord_test.csv")
```

###: transpose the frame to have the time serie as a single colum to plot
```
train_ecg.as_data_frame().T.plot(legend=False, title="ECG Train Data", color='blue'); # don't display the legend
```

###: Configuring AutoEncoderEstimator for best results:
```
encoder_model = H2OAutoEncoderEstimator( 
        activation="Tanh", 
        hidden=[50], 
        l1=1e-5,
        score_interval=0,
        epochs=100
)
```

###: Using AutoEncoderEstimator to train neural network
```
encoder_model.train(x=train_ecg.names, training_frame=train_ecg)             
```

###: Getting model details:
```
encoder_model
```

###: Computing reconstruction error with the Anomaly detection function. 
###: This is the Mean Square Error between output and input layers. 
```
reconstruction_error = encoder_model.anomaly(test_ecg)
```

###: Now the question is: Which of the test_ecg time series are most likely an anomaly?
###: Lets select the top N that have high error rate
```
df = reconstruction_error.as_data_frame()
df['Rank'] = df['Reconstruction.MSE'].rank(ascending=False)
df_sorted = df.sort_values('Rank')
df_sorted
```

###: Listing anomalies based on reconstucted MSE values:
```
anomalies = df_sorted[ df_sorted['Reconstruction.MSE'] > 1.0 ]
anomalies
```

###: Plotting test data without anomalies
```
data = test_ecg.as_data_frame()
data.T.plot(legend=False, title="ECG Test Data", color='blue')
```
###: Plotting test data with anomalies
```
ax = data.T.plot(legend=False, color='blue')
data.T[anomalies.index].plot(legend=False, title="ECG Anomalies in the Data", color='red', ax=ax);
```
