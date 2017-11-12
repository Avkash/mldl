# Filling NA values in H2O data frame with new data #

Sometime you have a dataset which comes with lots of empty values and you may need to fill data with some of the approximation values. 

Note: fill NA function does work with numric values, if you have string columns, it will give error. 

## Python ##
API : It fills NA along a given axis and along a given direction with a maximum fill length
```
df.fillna(method=u'forward', axis=0, maxlen=1)
```
Parameters:
 - method: ``"forward"`` or ``"backward"``
 - axis:  0 for columnar-wise or 1 for row-wise fill
 - maxlen: Max number of consecutive NA's to fill

Lets create a Frame with lots of empty values:
```
df = h2o.create_frame(rows=20,
                      cols=5,
                      real_fraction=1.0,
                      real_range=100,
                      missing_fraction=0.5,
                      seed=123) 
print(df.shape)                      
```
You will see a data frame will be created with 20 rows and 5 columns (C1,C2,C3,C4,C5) with random values and NAs.

Now we can fill "NA" with the values suited in the column
```
df.fillna(axis=1, method='forward', maxlen=1)
Result will have few values filled. 

df.fillna(axis=1, method='forward', maxlen=100)
Result will have lots of values values filled. 
```

## R ## 
API:
```
h2o.fillna(x, method = "forward", axis = 1, maxlen = 1L)
```
Parameters:
 - x	 : an H2OFrame
 - method : A String: "forward" or "backward"
 - axis : An Integer 1 for row-wise fill (default), 2 for column-wise fill
 - maxlen: An Integer for maximum number of consecutive NA's to fill

Lets create a Frame with lots of empty values:
```
df =  h2o.createFrame(real_range = 10, response_factors = 2, has_response = TRUE, missing_fraction = 0.5, 
  randomize = TRUE)
```
Now we can fill "NA" with the values suited in the column
```
dfr = h2o.fillna(df)
Result will have few values filled. 

dfr = h2o.fillna(df, maxlen = 5L)
Result will have lots of values values filled. 
```


