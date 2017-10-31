# H2O Data Manipulation #

## Converting H2O and Pandas Dataframe vice-versa (Python Only) ##

Importing required libraries: 
```
import h2o
import pandas as pd
```
Creating H2O Dataframe:
```
df = h2o.import_file("https://s3.amazonaws.com/h2o-airlines-unpacked/allyears2k.csv")
```
Verifying the H2O dataframe:
```
type(df)
```
Converting H2O Dataframe to Pandas Dataframe
```
pd_df = df.as_data_frame()
```
Verifying the pandas dataframe:
```
type(pd_df)
```
Converting Pandas Dataframe to H2O Dataframe
```
h2o_df = h2o.H2OFrame(pd_df)
```
Re-Verifying the pandas dataframe:
```
type(h2o_df)
```

