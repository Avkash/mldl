# Converting features to proper type i.e. num or enum # 

## FLOW ##
When you get dataset summary in FLOW you will be able to convert specific feature to enum or numeric by selecting proper action from the "Action" column of dataset summary view. For numeric, string and other columns you can convert them to enum using "convert to enum" action. Also for enum columnds you can convert back to numeric using "convert to numeric" action. 

![](https://github.com/Avkash/mldl/blob/master/images/flow_feature_convert.png?raw=true)
Note: Please see the "Action" column in the above images for column/feature specific action.

## Python ##
Lets load a sample dataset:
```
df = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/multifeatures.csv")
```

Now we can get the type of columns as below:
API:
```
df.columns_by_type(coltype = column_type)
```
Parameter:
- numeric     - Numeric, but not categorical or time
- categorical - Integer, with a categorical/factor String mapping
- string       - String column
- time         - Long msec since the Unix Epoch - with a variety of display/parse options
- uuid         - UUID
- bad          - No none-NA rows (triple negative! all NAs or zero rows)

Note:
 - You can pass full dataset or just a column with the following API.
 - If passing whole dataset, please make sure the source type matches the requirest type requirement

### Convert to String type ###
```
df['Column_name'] = df['Column_name'].ascharacter()
df[column_ID] = df[column_ID].ascharacter()
```
### Convert to Categorical or Factor or Enum type ###
```
df['Column_name'] = df['Column_name'].asfactor()
df[column_ID] = df[column_ID].asfactor()
```
### Convert to Date type ###
```
df['Column_name'] = df['Column_name'].as_date()
df[column_ID] = df[column_ID].as_date()
```
### Convert to Numeric type ###
```
df['Column_name'] = df['Column_name'].asnumeric()
df[column_ID] = df[column_ID].asnumeric()
```
## R ##

