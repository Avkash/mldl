# Dataframe manipulation in Python and R #
When data is ingested into H2O using h2o import API, it is loaded into memory as H2O data frame. Panads and Numpy dataframes are very popular in python so here we will see how to move back and forth among H2O, pandas and numpy data frames:

## Dataframe manipulation in Python ## 

### Lets ingest the data into H2O ###
First we ingested data into H2O and now we will convert it into pandas and numpy data frames and back to H2O Data frame.
```
titanic = h2o.import_file("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
```

### H2O to Pandas: ###
```
type(titanic)
h2o.frame.H2OFrame
pdf = titanic.as_data_frame()
type(pdf)
pandas.core.frame.DataFrame
```

### Pandas to H2O: ###
```
type(pdf)
pandas.core.frame.DataFrame
hdf = h2o.H2OFrame(pdf)
type(hdf)
h2o.frame.H2OFrame
```

### H2O to Numpy: ###
```
type(hdf)
h2o.frame.H2OFrame
npdf = hdf.as_data_frame().as_matrix()
type(npdf)
numpy.ndarray
```
### Numpy to H2O ###
```
type(npdf)
numpy.ndarray
hdf = h2o.H2OFrame(npdf)
type(hdf)
h2o.frame.H2OFrame
````


## Dataframe manipulation types in Python ## 

### Lets ingest the data into H2O ###
First we ingested data into H2O and now we will convert it into pandas and numpy data frames and back to H2O Data frame.
```
titanic = h2o.importFile("https://raw.githubusercontent.com/Avkash/mldl/master/data/titanic_list.csv")
> class(titanic)
[1] "H2OFrame"
```

### H2O to R Dataframe: ###
```
> class(titanic)
[1] "H2OFrame"
> rdf = as.data.frame(titanic)
> class(rdf)
[1] "data.frame"
> h2o.colnames(rdf)
 [1] "pclass"    "survived"  "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"
> h2o.colnames(titanic)
 [1] "pclass"    "survived"  "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"

```

### R Dataframe to H2O : ###
```
> h2o.colnames(rdf)
 [1] "pclass"    "survived"  "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     > > class(rdf)
[1] "data.frame"
> hdf = as.h2o(rdf)
> h2o.colnames(hdf)
 [1] "pclass"    "survived"  "name"      "sex"       "age"       "sibsp"     "parch"     "ticket"    "fare"      "cabin"     "embarked"  "boat"      "body"      "home.dest"
```

