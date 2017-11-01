# Imputing values into H2O Dataframe #

H2O provids impute function to perform in-place imputation by filling missing values in the given columns (or dataset) with aggregates computed on either given column or a collection of grouped by columns or by given value.

Import has the following required parameters:

- column: A specific column to impute. The default of 0 specifies to impute the entire frame.
- method: The type of imputation to perform. 
  - mean: mean replaces NAs with the column mean
  - median: median replaces NAs with the column median
  - mode: mode replaces with the most common factor (applied for factor columns only)
- by : group by columns
- value : given value

## Python ##



## R ## 
