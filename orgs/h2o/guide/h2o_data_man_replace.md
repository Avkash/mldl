# Replacing numeric values in H2O data frame #

H2O facilitate support for replacing numeric values into H2O dataframes depending on your selection. 

## Python ##

Loading Dataset:
```
usersA = h2o.import_file("/Users/avkashchauhan/Downloads/users1.csv")
print(usersA.col_names)
usersA.describe
## ------ Results ----------
Name	Age	Zip	City	State
Jim	24	94401	San Mateo	CA
John	30	98001	Bellevue	WA
Tim	35	94402	Foster City	CA
Tom	25	98003	Redmond	WA
Tina	32	94401	San Mateo	C
```
Note: In python the row and columns index are based on 0. 

### Replacing specific values from the data based on row and column index: ###
```
users[1,1]
Result will have second row and second column 

users[1,1] = 55
The value at second row and second column will be replaced with 55.
```

### Replacing whole column with new fix or calculated value: ###
```
users[1] = 100
The second column "Age" will have all values set to 100.

users[1] = users[1]*2
The second column "Age" will have all values set to double.
```

### Replace missing values with 0: ###
```
users[users["Age"].isna(), "Age"] = 0
Result: If any Age value is NA, it will be replaced by 0.
```
### Replace values based on ifelse condition: ###
```
users['Age']= (users["Age"] < 30).ifelse(100, users['Age'])
Result: All age values which are less then 30 will be replaced to 100
```
### Replace values based on masked conditions: ###
```
users[users["Age"] <= 30, "Age"] = 50
Result: All the values which are less then 30 will be replaced with 50
```


## R ##

Loading Dataset:
```
> userA = h2o.importFile("/Users/avkashchauhan/Downloads/users1.csv")
> h2o.colnames(userA)
[1] "Name"  "Age"   "Zip"   "City"  "State"
> userA
## ------ Results ----------
Name Age   Zip        City State
1  Jim  24 94401   San Mateo    CA
2 John  30 98001    Bellevue    WA
3  Tim  35 94402 Foster City    CA
4  Tom  25 98003     Redmond    WA
5 Tina  32 94401   San Mateo    CA
```

Note: In R the row and columns index are based on 1. You must make sure that the number column in R is not a categorical. The values must be a number to replace correctly.

### Replacing specific values from the data based on row and column index: ###
```
users[1,1]
Result will have first row and first column 

users[2,2]
Result will have second row and second column 

users[2,2] = 55
The value at second row and second column will be replaced with 55.
```

### Replacing whole column with new fix or calculated value: ###
```
users$Age =  100
users[,2] = 100
users['Age'] = 100
The second column "Age" will have all values set to 100.

users[,2] = users[,2] * 2
users$Age =  users$Age * 2
users['Age'] = users['Age'] * 2
The second column "Age" will have all values set to double.
```

### Replace missing values with 0: ###
```
users[is.na(users[,"Age"]), "Age"] = 0
Result: If any Age value is NA, it will be replaced by 0.
```
### Replace values based on ifelse condition: ###
```
users[,"Age"] <- h2o.ifelse(users[,"Age"] < 30, 100, users[,"Age"])

Result: All age values which are less then 30 will be replaced to 100
```
### Replace values based on masked conditions: ###
```
users[users[,"Age"] < 30, "Age"] = 99
Result: All the values which are less then 30 will be replaced with 99
```


