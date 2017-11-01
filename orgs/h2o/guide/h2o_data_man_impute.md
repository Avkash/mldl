# Imputing values into H2O Dataframe #

H2O provids impute function to perform in-place imputation by filling missing values in the given columns (or dataset) with aggregates computed on either given column or a collection of grouped by columns or by given value.

Import has the following required parameters:

- column: A specific column to impute. The default of 0 specifies to impute the entire frame.
- method: The type of imputation to perform. 
  - mean: mean replaces NAs with the column mean (group by column(s))
  - mode: mode replaces with the most common factor (applied for factor columns only) - (group by column(s))
  - median: median replaces NAs with the column median based on Interpolate, Average, Low, High
- by : group by columns
- value : given value

Load the data: [Titanic Dataset](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

### FLOW ###
Below you can see the titanic data set loaded into H2O, visible in FLOW UI:
![](https://github.com/Avkash/mldl/blob/master/images/flow-titanitc-ds.png?raw=true)
Above you can also see the "Age" has about 264 missing values comparative to dataset size of 1310 records. 

The image blow shows how you can select a particular column and apply mean, mode, median imputation function to fill missing values:
~[](https://github.com/Avkash/mldl/blob/master/images/flow-impute.png?raw=true)


## Python ##


## R ## 
