# Finding correlation between features #

H2O does not have a built-oncapability of understanding correlation amongs features so if you are using Python or R API with H2O, you can use any of the Python or R libraries and tools to create correlations among you features.

In this section we will just use few common libraries and method to generate feature correlations.

## Python ##
Lets load the dataset:
```
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/prostate.csv")
```

Now we will be build the correlation play using MapPlotLib library as below:

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

This is how you can build Corralation matrix heatmap using Seaborn library 
Note: You must select only numeric columns from the dataframe
```
## Getting the list of numeric features from the given dataset:
print(df.columns_by_type("numeric"))
print(len(df.col_names))

## Now lets build Corralation matrix heatmap
cor_matrix = df.as_data_frame().corr().round(2)
# Plotting heatmap 
fig = plt.figure(figsize=(18,18));
sns.heatmap(cor_matrix, annot=True, center=0, cmap = sns.diverging_palette(250, 10, as_cmap=True), ax=plt.subplot(111));
plt.show()
```
This is how the heatmap looks like:

![](https://github.com/Avkash/mldl/blob/master/images/flow_sns_heapmap_numeric.png?raw=true)

Helpful content:
 - [Kaggle: Data Exploration Porto Seguro's Safe Driver Prediction](https://www.kaggle.com/neviadomski/data-exploration-porto-seguro-s-safe-driver)

## R ## 

