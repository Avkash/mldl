# Slicing Rows from an H2O data frame #
You can use various method within H2O dataframe to slice rows to achieve your objective.

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
users[range(1,3),:]
Result will have rows from 1 to 3. You must make sure the second number must be greater then the first.
```
### Case 5: Slicing rows based on condition mask: ###
First we will create a mask to setup the condition then we will use mask to filter
```
mask = users['Age'] > 30
users[mask,:]
The result will have all the rows with Age above 30
```
### Case 6: Slicing rows based selected columns: ###
```
users[:,['Name','City', 'Age']]
Result will have all the rows from columns "Name", "City" and "Age"

users[4:,['Name','City', 'Age']]
Result will have all the rows from 5th (row Index is 0) onwards from columns "Name", "City" and "Age"
```
## R ##

Loading Dataset 1:
```
> users = h2o.importFile("/Users/avkashchauhan/Downloads/users1.csv")
> h2o.colnames(users)
[1] "Name"  "Age"   "Zip"   "City"  "State"
> users
## ------ Results ----------
Name Age   Zip        City State
1  Jim  24 94401   San Mateo    CA
2 John  30 98001    Bellevue    WA
3  Tim  35 94402 Foster City    CA
4  Tom  25 98003     Redmond    WA
5 Tina  32 94401   San Mateo    CA
```

### Case 1: Listing All Rows and Columns ###
```
users[,]
Results Will have all the rows and columns
```
### Case 2: Getting a particular Row by index: ###
```
users[1,]
Result will have first row only. 
users[3,]
Result will have 3rd row only. 
Note: If Index is not availalbe, empty data will be shown

```
### Case 3: Listing rows by a range or start index to end index ###
```
users[1:2,]
Result will have all the rows from index 1 to 2. 
users[3:5,]
Result will have all the rows from index 3 to 5. 
Note: If the second Index is higher then at the end of the rows will be sliced.
```
### Case 4: Slicing rows based on condition mask: ###
First we will create a mask to setup the condition then we will use mask to filter
```
mask = users['Age'] > 30
users[mask,]
The result will have all the rows with Age above 30
```
### Case 5: Slicing rows based on NOT condition mask: ###
First we will create a mask to setup the condition then we will use mask to filter
```
mask = users['Age'] > 30
users[!mask,]
The result will have all the rows with Age NOT > 30
```
