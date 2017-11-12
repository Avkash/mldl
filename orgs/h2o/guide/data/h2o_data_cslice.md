# Slicing columns from an H2O data frame #
Sometime you may want to look and/or work only with certain columns from H2O dataframe. H2O does lazy evaluation to column slicing which triggers mostly with a subsequent action after the slicing operation is set. We will work on some of those criterias here:

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
### Case 2: Getting a particular Column by Name: ###
```
users['Name']
All rows for the column "Name" will be selected.
users['Age']
All rows for the column "Age" will be selected.
```

### Case 3: Getting a particular Column by index: ###
```
users[0]
Result will have very first column. If Index is greater then column count you will get an error.

users[3]
Result will have only 3rd column. If Index is greater then column count you will get an error.

users[:,0]
Result will have very first column as the index is based on 0.

users[:,1]
Result will have second column as the index is based on 0.

users[,3]
Result will have all the columns from 1st to 3rd. If values is larger then columns, all the columns will be in result.
```
### Case 4: Getting rows based on particular Column or Columns Names: ###
```
users[:,'City']
Result will have all the rows from column name "City".

users[:,['City', 'Age']]
Result will have all the rows from columns "City" and "Age".

users[4:,['Name','City', 'Age']]
Result will have all the rows from 5th (row Index is 0) onwards from columns "Name", "City" and "Age"
```
### Case 5: Getting rows based on particular Column Index or Column Range: ###
```
users[:,range(0,3)]
Result will have all the rows from columns 0 to 3rd > Only 3 columns

users[:,range(2,3)]
Result will have all the rows from columns 2nd to 3rd > Only One column

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
### Case 2: Getting a particular Column by Name: ###
```
users$Name
Result will have all the rows from column "Name"

users$Age
Result will have all the rows from column "Age"
```

### Case 3: Getting a particular Column by index: ###
```
users[,1]
Result will have very first column (Column index start from 1). If Index is greater then column count you will get empty results.

users[,2]
Result will have only 2nd column. 

users[,1:2]
Result will have very first and second column as the index is based on 1.

users[,2:4]
Result will have second, 3rd and 4th column as the index is based on 1.

```
### Case 4: Getting rows based on particular Column or Columns Names: ###
```
users[,'City']
Result will have all the rows from column name "City".

users[,c('City', 'Age')]
Result will have all the rows from columns "City" and "Age".

users[1:,c('Name','City', 'Age')]
Result will have 1st row from columns "Name", "City" and "Age", row index starts from 1.

users[4:,['Name','City', 'Age']]
Result will have 4th row from columns "Name", "City" and "Age"
```
### Case 5: Getting rows based on particular Column Index or Column Range: ###
```
users[1,c('Name','Age')]
Result will have only first row from columns "Name and Age"

users[3,c('Name','Age', "State")]
Result will have only 3rd row from columns "Name Age and State"

users[2:4,c('Name','Age', "State")]
Result will have only 2nd to 4th row (Total 3) based on Row Index 0 from columns "Name Age and State"
```
