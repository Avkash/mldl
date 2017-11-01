# Imputing values into H2O Dataframe #

H2O provids impute function to perform in-place imputation by filling missing values in the given columns (or dataset) with aggregates computed on either given column or a collection of grouped by columns or by given value.

Import has the following required parameters:

- column: A specific column to impute. The default of 0 specifies to impute the entire frame.
- method: The type of imputation to perform. 
  - mean: mean replaces NAs with the column mean (group by column(s))
  - mode: mode replaces with the most common factor (applied for factor columns only) - (group by column(s))
  - median: median replaces NAs with the column median based on:
    - Interpolate
    - Average
    - Low
    - High
- by : group by columns
- value : given value

Load the data: [Titanic Dataset](https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv)

### FLOW ###
Below you can see the titanic data set loaded into H2O, visible in FLOW UI:
![](https://github.com/Avkash/mldl/blob/master/images/flow-titanitc-ds.png?raw=true)
Above you can also see the "Age" has about 264 missing values comparative to dataset size of 1310 records. 

The image blow shows how you can select a particular column and apply mean, mode, median imputation function to fill missing values:
![](https://github.com/Avkash/mldl/blob/master/images/flow-impute.png?raw=true)


## Python ##
API
```
h2oDataFrame.impute(column=-1, method=u'mean', combine_method=u'interpolate', by=None, group_by_frame=None, values=None)
```
Parameters:
 - int column: Index of the column to impute, or -1 to impute the entire frame.
 - str method: The method of imputation: ``"mean"``, ``"median"``, or ``"mode"``.
 - str combine_method: When the method is ``"median"``, this setting dictates how to combine quantiles
    for even samples. One of ``"interpolate"``, ``"average"``, ``"low"``, ``"high"``.
 - by: The list of columns to group on.
   H2OFrame group_by_frame: Impute the values with this pre-computed grouped frame.
 - List values: The list of impute values, one per column. None indicates to skip the column.

Loading the Dataset:
```
titanic = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
```
Looking at specific column "Age" descriptions:
```
titanic['age'].describe()
Rows:1309
Cols:1


age
type	real
mins	0.1667
mean	29.8811345124
maxs	80.0
sigma	14.4134996999
zeros	0
missing	263
0	29.0
1	0.9167
2	2.0
3	30.0
4	25.0
5	48.0
6	63.0
7	39.0
8	53.0
9	71.0
```
Above you can see that Age Column has lots about 263 missing values out of 1310 records. 

### Imputing by mean ###
```
age_impute = titanic.impute("age", method="mean")
age_impute
Result: 29.881134512428304 value as mean will be placed into missing age value for each record
```

### Imputing by mean alogn with a group by column  ###
```
age_impute = titanic.impute("age", method="mean", by=["pclass"])
age_impute
pclass	mean_age
1	39.1599
2	29.5067
3	24.8164
Result: All the age values will be imputed based on the class type. If class is 1 then 39, 2 then 29 and 3 then 24. 
```

### Imputing by mode ###
```
age_impute = titanic.impute("age", method="mode")
age_impute
Result: 24.0 value as mode will be placed into missing age value for each record
```

### Imputing by median ###
```
age_impute = titanic.impute("age", method="median")
age_impute
Result: 28.0 value as mode will be placed into missing age value for each record
```
Note: You can try and experiment the other way to import missing "Age" values and see how it helps.

## R ## 
