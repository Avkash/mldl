# Pivoting H2O dataframes # 

Pivot is also referred as transposing the data frame to particular column and associated values. A Pivot operation required 3 parameters:
 - Index: Index is the column where pivoted rows should be aligned on; 
 - Column: Column represents the column to pivot
 - Value: Value specifies the values of the pivoted table.
 
## Python ##
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
activity_state = df.pivot(index="activity_id",column="state_name",value="activity_value")
print(activity_state)

activity_id	CA	NY	OR	WA
1	1	4	3	nan
2	nan	nan	nan	2
4	1	nan	nan	nan
5	nan	4	nan	nan
6	nan	nan	3	nan
```
Result: Above you can see that for each activity_id, all the different values for each states are created into new data frame. 
