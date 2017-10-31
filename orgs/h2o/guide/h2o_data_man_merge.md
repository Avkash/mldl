# Merging 2 Datasets into one #

Sometime you may have 2 datasets which have common columns and you want to merge these two datasets based on column name as key. H2O merge function performs a merge operation between two H2O datasets based on common column name. It combines two datasets that share a common column name. 

- You must have at least one column in common with this frame, and all columns in common are used as the merge key.  
- If you want to use only a subset of the columns in common, rename the other columns so the columns are unique in the merged result.

## Python ##
Here is the Python API to merge 2 H2O Datasets based on Column Names. 
```
h2o_dataframe_left.merge(h2o_df_to_be_merged, all_x=False, all_y=False, by_x=None, by_y=None, method=u'auto')
```
### Parameters Description ###
- h2o_df_to_be_merged will be merged into h2o_dataframe_main, unless new dataframe is 
- all_x: If True, include all rows from the left/self frame
- all_y: If True, include all rows from the right/other frame
Note: 
 - If all_x and all_y both parameters are given, only first parameter will be used
 
Lets load 2 dataset into H2O
#### Dataset 1 : users1 ####
```
users1 = h2o.import_file("/Users/avkashchauhan/Downloads/users1.csv")
print(users1.col_names)
users1['Name'] = users1['Name'].asfactor()
users1.describe
##----------- Result is as below --------
Name	Age	Zip	City	State
Jim	24	94401	San Mateo	CA
John	30	98001	Bellevue	WA
Tim	35	94402	Foster City	CA
Tom	25	98003	Redmond	WA
Tina	32	94401	San Mateo	CA
```
#### Dataset 2 : users2 ####
```
users2 = h2o.import_file("/Users/avkashchauhan/Downloads/users2.csv",col_names=["Name", "Country"])
print(users2.col_names)
users2['Name'] = users2['Name'].asfactor()
users2.describe

Name	Country
Jim	USA
John	USA
Tim	USA
Tom	USA
Ravi	USA
```
As you can see above, there is a common column as "Name" and mow we will merge these 2 datasets based on common column "Name" with various cases.

### Case 1 ###
Merging first dataset with second dataset where user1 dataset is the main(first/left) and user2 dataset is second(right):
```
resultsA = users1.merge(users2)
resultsA.describe
## ------ Result Merged Dataset
Name	Country	Age	Zip	City	State
Jim	USA	24	94401	San Mateo	CA
John	USA	30	98001	Bellevue	WA
Tim	USA	35	94402	Foster City	CA
Tom	USA	25	98003	Redmond	WA
```
Result: You can see that all the columns from the both dataset are included and all the rows which are common in both datasets are included. 

### Case 2 ###
Merging user2(first/main/left) dataset with the users1(right/second) dataset:
```
resultsB = users2.merge(users1)
resultsB.describe
## ------ Result Merged Dataset
Name	Age	Zip	City	State	Country
Jim	24	94401	San Mateo	CA	USA
John	30	98001	Bellevue	WA	USA
Tim	35	94402	Foster City	CA	USA
Tom	25	98003	Redmond	WA	USA
```
Result: You can see that all the columns from both datasets are used and all the common rows are included in the result dataset.

### Case 3 ###
Merging user1 (first/main/left) dataset with the user2 (second/right) dataset select all the items from the left/main dataset even when if second/right dataset does not include the common value:
```
resultsC = users1.merge(users2, all_x=True)
resultsC.describe
## ------ Result
Name	Age	Zip	City	State	Country
Jim	24	94401	San Mateo	CA	USA
John	30	98001	Bellevue	WA	USA
Tim	35	94402	Foster City	CA	USA
Tom	25	98003	Redmond	WA	USA
Tina	32	94401	San Mateo	CA	
```
Result: Above you can see that all the items from the first dataset are included even when right side does not have a common. Also the empty value is used for the missing value for the select row. 

### Case 4 ###
Merging user1 (first/main/left) dataset with the user2 (second/right) dataset select all the items from the right/second dataset even when if first/left dataset does not include the common value:
```
resultsD = users1.merge(users2, all_y=True)
resultsD.describe
## ------ Result
Name	Country	Age	Zip	City	State
Jim	USA	24	94401	San Mateo	CA
John	USA	30	98001	Bellevue	WA
Tim	USA	35	94402	Foster City	CA
Tom	USA	25	98003	Redmond	WA
Ravi	USA	nan	nan	
```
Result: Above you can see all the items from the right/second datasets are selected and for any missing item from second dataset which is not available into first, the nan is added. 

## R ##

