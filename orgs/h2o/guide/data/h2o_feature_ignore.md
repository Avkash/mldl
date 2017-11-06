# Ignore the features not needed in machine leaning #
Sometime when you ingested a dataset into H2O, you might not want to select all the features from the given dataset instead you just want to use few selected features as your model building exercise. Here we will see how you can ignore certain features from the given feature list before model building

## FLOW ##
For every supervise and unsupervise algorithm, H2O FLOW UI has drop down list with check box to select specific columns from the selected training dataset and check them out to ignore from the selection as below:

![](https://github.com/Avkash/mldl/blob/master/images/flow-ignore-column.png?raw=true)

## Python ##
This is how you ignore columns from your dataset in python:
```
titanic = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
features = titanic.col_names
print(features)
----------------------
[u'pclass', u'survived', u'name', u'sex', u'age', u'sibsp', u'parch', u'ticket', u'fare', u'cabin', u'embarked', u'boat', u'body', u'home.dest']
```
Now we will select the response column first and remove that from the feature list:
```
response = "survived"
features.remove(response)
print(features)
---------------
[u'pclass', u'name', u'sex', u'age', u'sibsp', u'parch', u'ticket', u'fare', u'cabin', u'embarked', u'boat', u'body', u'home.dest']
```
Now we will select a feature which we dont want and remove it as below:
```
remove_column = "name"
features.remove(remove_column)
print(features)
[u'pclass', u'sex', u'age', u'sibsp', u'parch', u'ticket', u'fare', u'cabin', u'embarked', u'boat', u'body', u'home.dest']
---------------
```
Note: Above you can see that the selected feature is not listed. You can create a list of features to remove and walkthrough the list to remove those items.

## R ##
Lets ingest datainto H2O
```
> titanic = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
> h2o.colnames(titanic)
---------------
 [1] "pclass"    "survived"  "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"
```
Lets select the target column first and then remove it from the featires list first:
```
> response = "survived"
> features = setdiff(colnames(titanic), response)
> features
---------------
 [1] "pclass"    "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"
```
Now lets set the feature we dont want to be part of overall list we will use for final features:
```
> dont_want = "name"
> features = setdiff(features, dont_want)
> features
---------------
 [1] "pclass"    "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"
```
