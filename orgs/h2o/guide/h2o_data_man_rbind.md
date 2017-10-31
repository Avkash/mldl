# Combining Rows from Two Datasets #

- Columns must be same between 2 datasets
- Columns changed for factor/enum must have done onto both dataset
- All rows will be added at the end of the first dataset

## Python ##
Here is the rbind API in Python:
```
result = dataset1.rbind(dataset2)
```

Loading Dataset 1:
```
usersA = h2o.import_file("/Users/avkashchauhan/Downloads/users1.csv")
print(usersA.col_names)
[u'Name', u'Age', u'Zip', u'City', u'State']
print(usersA.shape)
(5, 5)
usersA.describe
## --- This is how dataset looks like -----
Name	Age	Zip	City	State
Jim	24	94401	San Mateo	CA
John	30	98001	Bellevue	WA
Tim	35	94402	Foster City	CA
Tom	25	98003	Redmond	WA
Tina	32	94401	San Mateo	CA
```

Loading Dataset 2:
```
usersB = h2o.import_file("/Users/avkashchauhan/Downloads/users2.csv")
print(usersB.col_names)
[u'Name', u'Age', u'Zip', u'City', u'State']
print(usersB.shape)
(5, 5)
usersB.describe
## --- This is how dataset looks like -----
Name	Age	Zip	City	State
Rowe	24	94401	San Mateo	CA
Kat	30	98001	Bellevue	WA
Mark	35	94402	Foster City	CA
Eric	25	98003	Redmond	WA
Tomas	32	94401	San Mateo	CA
```

### Using rbind to merge dataset 1 with Dataset 2: ###
```
resultsA = usersA.rbind(usersB)
print(resultsA.shape)
(10,5)
resultsA.describe
## You will see total 10 rows as results
```
Result: As you can see the rows from dataset 2 are added into Dataset 1

### Using rbind to merge dataset 2 with Dataset 1: ###
```
resultsB = usersB.rbind(usersA)
print(resultsB.shape)
(10,5)
resultsB.describe
## You will see total 10 rows as results
```
Result: As you can see the rows from dataset 1 are added into Dataset 2

## R ##
Here is the rbind API in R:
```
result = h2o.rbind(dataset1, dataset2)
```

Loading Dataset 1:
```
usersA = h2o.import_file("/Users/avkashchauhan/Downloads/users1.csv")
> h2o.colnames(userA)
[1] "Name"  "Age"   "Zip"   "City"  "State"
> h2o.nrow(userA)
[1] 5
> h2o.ncol(userA)
[1] 5
```

Loading Dataset 2:
```
usersB = h2o.import_file("/Users/avkashchauhan/Downloads/users2.csv")
> h2o.colnames(userB)
[1] "Name"  "Age"   "Zip"   "City"  "State"
> h2o.nrow(userB)
[1] 5
> h2o.ncol(userB)
[1] 5
```

### Using rbind to merge dataset 1 with Dataset 2: ###
```
resultA = h2o.rbind(userA, userB)
> h2o.nrow(resultA)
[1] 10
> h2o.ncol(resultA)
[1] 5
## You will see total 10 rows as results
```
Result: As you can see the rows from dataset 2 are added into Dataset 1

### Using rbind to merge dataset 2 with Dataset 1: ###
```
resultB = h2o.rbind(userB, userA)
> h2o.nrow(resultB)
[1] 10
> h2o.ncol(resultB)
[1] 5
## You will see total 10 rows as results
```
Result: As you can see the rows from dataset 1 are added into Dataset 2

