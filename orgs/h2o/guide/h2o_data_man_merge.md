# Merging 2 Datasets into one #


## Python ##
Here is the Python API to merge 2 H2O Datasets based on Column Names. Merge function is used to combine two datasets that share a common column name. You must have at least one column in common with this frame, and all columns in common are used as the merge key.  If you want to use only a subset of the columns in common, rename the other columns so the columns are unique in the merged result.
```
h2o_dataframe_left.merge(h2o_df_to_be_merged, all_x=False, all_y=False, by_x=None, by_y=None, method=u'auto')
```
### Parameters Description ###
- h2o_df_to_be_merged will be merged into h2o_dataframe_main, unless new dataframe is 
- all_x: If True, include all rows from the left/self frame
- all_y: If True, include all rows from the right/other frame
- by_x: list of columns in the current frame to use as a merge key.
- by_y: list of columns in the ``other`` frame to use as a merge key. Should have the same number of
    columns as in the ``by_x`` list.


# Merge the first dataset into the second dataset. Note that only columns in common are merged (i.e, values in df2 greater than 5 will not be merged).
df3 = df2.merge(df1)

# Merge all of df2 into df1. Note that this will result in missing values for column A, which does not include values greater than 5.
df4 = df2.merge(df1, all_x=True)


## R ##

