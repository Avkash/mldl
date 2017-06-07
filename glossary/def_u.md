# Machine Learning Terminology - U #

## unseen categorical ##
```
Unseen categorcal is 'some' values which are not seen into a categorical field when model was trained. Certain features  are used as enum or categorical and each categorical is given an id internally to handle to value. 

Now during prediction if a new value as "categorical" is provided for the exact same feature, the prediction module may or may not handle it properly as it didnt have ID for this new categorical. 

Here is an example:

df = h2o.importFile("/Users/nidhimehta/steam-automl/smalldata/allyears2k_headers.zip")
model2 = h2o.gbm(
  model_id = "model2",
  training_frame = df,
  x = c("Origin"),
  y = "IsDepDelayed",
  max_depth = 15,
  seed = 1234,
  min_rows = 1,
  ntrees = 5
)

Now, when prediction, set an unseen categorical level say - origin ="SANTA" which was not in original training data into "Origin" field.. so SANTA is considered as unseen variable. 

```

## unseen categorical ##
