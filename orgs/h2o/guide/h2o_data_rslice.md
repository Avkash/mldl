# Slicing Rows from an H2O data frame #

## Python ##


Loading a Dataset:
```
users = h2o.import_file("/Users/avkashchauhan/Downloads/users1.csv")
print(users.col_names)
[u'Name', u'Age', u'Zip', u'City', u'State']
print(users.shape)
(5, 5)
users.describe
Name	Age	Zip	City	State
Jim	24	94401	San Mateo	CA
John	30	98001	Bellevue	WA
Tim	35	94402	Foster City	CA
Tom	25	98003	Redmond	WA
Tina	32	94401	San Mateo	CA
```
### Case 1: Listing All Rows and Columns ###
```
users[:]
Results Will have all the rows and columns
```
### Case 2: Getting a particular Row by index: ###
```
users[1,:]
Result will have first row only. If Index is not availalbe, empty data will be shown
```
### Case 3: Listing rows by a range: ###
```
users[range(4),:]
Result will have all the first 4 rows. You will get error is the range is higher then total row count
```
### Case 4: Listing rows from start index to end index: ###
```
usersA[range(1,3),:]
Result will have rows from 1 to 3. You must make sure the second number must be greater then the first.
```
### Case 5: Slicing rows based on condition mask: ###
First we will create a mask to setup the condition then we will use mask to filter
```
mask = usersA['Age'] > 30
usersA[mask,:]
The result will have all the rows with Age above 30
```

## R ##
