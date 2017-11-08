# Finding correlation between features #

H2O does not have a built-oncapability of understanding correlation amongs features so if you are using Python or R API with H2O, you can use any of the Python or R libraries and tools to create correlations among you features.

In this section we will just use few common libraries and method to generate feature correlations.

## Python ##

```
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (12, 12)

plt.figure(figsize=(20,10))
plt.matshow(df.as_data_frame().corr())
plt.show()
```
This is how the plot looks like:
![](https://github.com/Avkash/mldl/blob/master/images/flow_plot_matshow.png?raw=true)

This is how you can use seaborn library to plot correlation graph for your dataframe:
```
import seaborn as sns
sns.set_context("notebook")

plt.figure(figsize=(20,10))
corr = df.as_data_frame().corr()
sns.heatmap(corr, 
            xticklabels=corr.columns.values,
            yticklabels=corr.columns.values)
plt.show()
```
This is how the correlation plot looks like:
![](https://github.com/Avkash/mldl/blob/master/images/flow_seaborn_heatmap.png?raw=true)


## R ## 

