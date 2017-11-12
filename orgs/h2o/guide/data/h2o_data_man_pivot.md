# Pivoting H2O dataframes # 

Pivot is also referred as transposing the data frame to particular column and associated values. A Pivot operation requires 3 parameters:

 - Index: Index is the column where pivoted rows should be aligned on; 
 - Column: Column represents the column to pivot
 - Value: Value specifies the values of the pivoted table.

Note: 
 - Index and column should be of type enum, int, or time.
 - For cases of multiple indexes for a column label, the aggregation method is to pick the first occurrence in the data frame

## Python ##
API
```
df.pivot(index, column, value)
```
Parameters:
 - index: Index is a column that will be the row label
 - column: The labels for the columns in the pivoted Frame
 - value: The column of values for the given index and column label

### Lets Load data: ###
```
activity_state = h2o.H2OFrame({'activity_value': ['1','2','3','4','1','3','4'],
                   'state_name': ['CA','WA','OR','NY','CA','OR', 'NY'],
                   'activity_id': ['1','2','1','1','4','6', '5']})
activity_state

activity_id	activity_value	state_name
1	1	CA
2	2	WA
1	3	OR
1	4	NY
4	1	CA
6	3	OR
5	4	NY
```
Result: Above you can see that for each activity_id there is activity value associated for each state. 

### Create pivot table for each activity_id and state based on activity value ###
```
activity_state_pivot = df.pivot(index="activity_id",column="state_name",value="activity_value")
print(activity_state_pivot)

activity_id	CA	NY	OR	WA
1	1	4	3	nan
2	nan	nan	nan	2
4	1	nan	nan	nan
5	nan	4	nan	nan
6	nan	nan	3	nan
```
Result: Above you can see that for each activity_id, all the different values for each states are created into new data frame. 

## R ##
API
```
h2o.pivot(x, index, column, value)
```
Parameters:
 - x	: an H2OFrame
 - index : 	the column where pivoted rows should be aligned on
 - column : 	the column to pivot
 - value : 	values of the pivoted table

### Lets Load data: ###
```
activity_data = data.frame(activity_value = c('1','2','3','4','1','3','4'),
                   state_name = c('CA','WA','OR','NY','CA','OR', 'NY'),
                   activity_id =  c('1','2','1','1','4','6', '5'))
activity_state = as.h2o(activity_data)
activity_state
  activity_value state_name activity_id
1              1         CA           1
2              2         WA           2
3              3         OR           1
4              4         NY           1
5              1         CA           4
6              3         OR           6
```
Result: Above you can see that for each activity_id there is activity value associated for each state. 

### Create pivot table for each activity_id and state based on activity value ###
```
activity_state_pivot = h2o.pivot(activity_state, index="activity_id",column="state_name",value="activity_value")
> activity_state_pivot
  activity_id  CA  NY  OR  WA
1           1   0   3   2 NaN
2           2 NaN NaN NaN   1
3           4   0 NaN NaN NaN
4           5 NaN   3 NaN NaN
5           6 NaN NaN   2 NaN
```
Result: Above you can see that for each activity_id, all the different values for each states are created into new data frame. 

