# Group By operation on dataframe #

Using "group by" function you can group one or multiple columns and apply a function to the result. Using "group by" function you can:

 - split data into groups based on some criteria
 - applies a function to each group independently
 - combines the results into an H2OFrame
 
The result is a new H2OFrame with columns equivalent to the number of groups created. The returned groups are sorted by the natural group-by column sort.

The group by function is lazy evaluated so you would need to call get_frame() function to get the group function started and get the result frame which is an H2OFrame so you can perform all the function like any other H2OFrame.

## Python ##

Lets Load some data:
```
prostate = h2o.import_file("/Users/avkashchauhan/learn/customers/prostate.csv")
prostate.shape
prostate.col_names
prostate.describe
```

### Get all values count based on specific column  ##
```
race_count = prostate.group_by("RACE")
race_count.count()
race_count.get_frame()
Result: The result frame has all the individual RACE values count as dataframe.
```

### Get all values count based on multiple columns  ##
```
cols= ["AGE", "RACE"]
records_by_age_race = prostate.group_by(by=cols).count(na ="all")
records_by_age_race.get_frame()
Result: The result frame has all the individual RACE & AGE values count as dataframe.
```
### Get all values count based on column(s) and then perform a function on results frame  ##
```
gleason_by_age = prostate.group_by(by='AGE').sum('PSA', na ="all")
#[Option A]
gleason_age = gleason_by_age.get_frame()
gleason_age
#[Option B]
gleason_age = gleason_by_age.count().get_frame()
gleason_age
gleason_age['sum_PSA']

Result:
[Option A] You will get all AGE values for each AGE value the sum of all PSA.
[Option B] You will get all AGE values for each AGE value the sum of all PSA along with occurance count
```
### Apply group by on multiple columns and then perform function on results frame  ##
```
cols_1 = ['AGE', 'RACE', 'CAPSULE','DCAPS','DPROS']
cols_2 = ["DCAPS", "DPROS"]
prostate[cols_1].group_by(by='CAPSULE').sum(cols_2, na ="ignore").get_frame()
Result: You can get each CAPSULE value and for each CAPSULE you will get sum of PSA and sum of DCAPS
```

## R ##
