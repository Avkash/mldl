# Visaulize the input data # 

## FLOW ##
H2O FLOW has limited capability to visalize the input data. 

First when you ingest a dataset you can get detailed view of your data as below:
![](https://github.com/Avkash/mldl/blob/master/images/flow_frame_summary.png?raw=true)

You can also click on a particular feature to visualize the values in the feature as below:
![](https://github.com/Avkash/mldl/blob/master/images/flow_column_summary.png?raw=true)

## Python ##
Lets ingest some dataset:
```
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")
```

Now we can use 3 party libraries to visualize the data as below:
### Using matplotlib, seaborn to visualize the data ###
```
import pylab as pl
pl.figure(figsize=(20,10))
df.as_data_frame().hist()
pl.show()
```
This is how the plot looks like:
![](https://github.com/Avkash/mldl/blob/master/images/flow_prostate_pyplot.png?raw=true)

### Using matplotlib, seaborn to visualize the data ###

```
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (12, 12)

import seaborn as sns
sns.set_context("notebook")

sns.pairplot(df.as_data_frame(), vars=["AGE" , "RACE", "DPROS", "DCAPS"], hue="CAPSULE");
plt.show()
```
This is how the plot looks like:
![](https://github.com/Avkash/mldl/blob/master/images/flow_prostate_seaborn_plot.png?raw=true)

## R ##

