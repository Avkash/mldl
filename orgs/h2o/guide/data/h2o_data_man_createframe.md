# Createing Test dataset with H2O of any size and any type #

## The need of Test Dataset ##
Sometimes you may need to test certain machine learning algo or a concept and needs a dataset of required size or very specific format. 

H2O comes with API where you can create a dataset of your need very quickly and go ahead with you work. H2O createFrame API reates a data frame in H2O with real-valued, categorical, integer, and binary columns specified by the user.

## FLOW ##
You can call "createFrame" command into H2O FLOW cell and then fill our the desired parameters to generate a test dataset:

![](https://github.com/Avkash/mldl/blob/master/images/flow-createFrame.png?raw=true)

## Python ##
H2O create_frame API
```
h2o.create_frame(frame_id=None, rows=10000, cols=10, randomize=True, real_fraction=None, categorical_fraction=None, integer_fraction=None, binary_fraction=None, time_fraction=None, string_fraction=None, value=0, real_range=100, factors=100, integer_range=100, binary_ones_fraction=0.02, missing_fraction=0.01, has_response=False, response_factors=2, positive_response=False, seed=None, seed_for_column_types=None)
```
Parameters:
```
:param frame_id: the destination key. If empty, this will be auto-generated.
:param rows: the number of rows of data to generate.
:param cols: the number of columns of data to generate. Excludes the response column if has_response is True.
:param randomize: If True, data values will be randomly generated. This must be True if either
    categorical_fraction or integer_fraction is non-zero.
:param value: if randomize is False, then all real-valued entries will be set to this value.
:param real_range: the range of randomly generated real values.
:param real_fraction: the fraction of columns that are real-valued.
:param categorical_fraction: the fraction of total columns that are categorical.
:param factors: the number of (unique) factor levels in each categorical column.
:param integer_fraction: the fraction of total columns that are integer-valued.
:param integer_range: the range of randomly generated integer values.
:param binary_fraction: the fraction of total columns that are binary-valued.
:param binary_ones_fraction: the fraction of values in a binary column that are set to 1.
:param time_fraction: the fraction of randomly created date/time columns.
:param string_fraction: the fraction of randomly created string columns.
:param missing_fraction: the fraction of total entries in the data frame that are set to NA.
:param has_response: A logical value indicating whether an additional response column should be prepended to the
    final H2O data frame. If set to True, the total number of columns will be ``cols + 1``.
:param response_factors: if has_response is True, then this variable controls the type of the "response" column:
    setting response_factors to 1 will generate real-valued response, any value greater or equal than 2 will
    create categorical response with that many categories.
:param positive_reponse: when response variable is present and of real type, this will control whether it
    contains positive values only, or both positive and negative.
:param seed: a seed used to generate random values when ``randomize`` is True.
:param seed_for_column_types: a seed used to generate random column types when ``randomize`` is True.
```
Note: The sum of all the selected fraction must be 1. 

### Creating Dataframe with 50% of missing Data:
```
df = h2o.create_frame(rows=20,
                      cols=5,
                      real_fraction=1.0,
                      real_range=100,
                      missing_fraction=0.5,
                      seed=123)                      
```
Result: The dataset will have 50% data missing.

### Creating Dataframe with string and numeric data:
```
df = h2o.create_frame(rows=20,
                      cols=5,
                      real_fraction=0.2,
                      real_range=100,
                      string_fraction = 0.4,
                      missing_fraction=0.1,
                      seed=123)                      
```
Result: The dataset will have 50% data missing.

### Creating Dataframe with response column:
```
df = h2o.create_frame(rows=10,
                      cols=5,
                      real_fraction=1.0,
                      real_range=100,
                      missing_fraction=0.5,
                      has_response = True,
                      response_factors = 2,
                      seed=123) 
```
Result: The dataset will have a column name response with 0 and 1. To add multiple responses set response_factors to desired value. 

### Create Dataframe with binary, string, categorical, real and integer data types: ###
Here is the script to create a dataframe with all kinds of supported datatype (besides UUID):
```
demo_df = h2o.create_frame(binary_fraction=0.2, categorical_fraction= 0.2, has_response=True, real_fraction=0.1,
                 cols=10, string_fraction= 0.3, 
                 time_fraction=0.1, 
                 rows=20, integer_fraction=0.1)
```

## R ##
R createFrame API
```
h2o.createFrame(rows = 10000, cols = 10, randomize = TRUE, value = 0, real_range = 100, categorical_fraction = 0.2, 
factors = 100, integer_fraction = 0.2, integer_range = 100, binary_fraction = 0.1, binary_ones_fraction = 0.02, 
time_fraction = 0, string_fraction = 0, missing_fraction = 0.01, response_factors = 2, has_response = FALSE,
seed, seed_for_column_types)
```
Parameters:
 - rows	 : The number of rows of data to generate. 
 - cols	 :The number of columns of data to generate. Excludes the response column if has_response = TRUE.
 - randomize	: A logical value indicating whether data values should be randomly generated. This must be TRUE if either categorical_fraction or integer_fraction is non-zero.
 - value : If randomize = FALSE, then all real-valued entries will be set to this value.
 - real_range : The range of randomly generated real values.
 - categorical_fraction	: The fraction of total columns that are categorical.
 - factors	: The number of (unique) factor levels in each categorical column.
 - integer_fraction	 : The fraction of total columns that are integer-valued.
 - integer_range	: The range of randomly generated integer values.
 - binary_fraction	: The fraction of total columns that are binary-valued.
 - binary_ones_fraction	: The fraction of values in a binary column that are set to 1.
 - time_fraction:  The fraction of randomly created date/time columns.
 - string_fraction: The fraction of randomly created string columns. 
 - missing_fraction	: The fraction of total entries in the data frame that are set to NA.
 - response_factors	: If has_response = TRUE, then this is the number of factor levels in the response column.
 - has_response	: A logical value indicating whether an additional response column should be pre-pended to the final H2O data frame. If set to TRUE, the total number of columns will be cols+1.
 - seed :	A seed used to generate random values when randomize = TRUE.
 - seed_for_column_types	:  A seed used to generate random column types when randomize = TRUE.

### Creating Dataframe with 50% of missing Data:
```
df =  h2o.createFrame(rows = 100, cols = 10, 
        missing_fraction = 0.5, randomize = TRUE)                      
```
Result: The dataset will have 50% data missing.

### Creating Dataframe with string and numerics columns Data:
```
df =  h2o.createFrame(rows = 100, cols = 10, 
        missing_fraction = 0.2, randomize = TRUE, real_range=100,
        string_fraction = 0.3)                      
```
Result: The dataset will have 50% data missing.

### Creating Dataframe with response column:
```
df =  h2o.createFrame(real_range = 10, response_factors = 2, has_response = TRUE, 
      missing_fraction = 0.5, randomize = TRUE, string_fraction = 0.1,
      seed = 12345)
```
Result: The dataset will have a column name response with 0 and 1. To add multiple responses set response_factors to desired value. 
