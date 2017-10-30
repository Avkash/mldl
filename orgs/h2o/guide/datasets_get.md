

## A list of Public Datasets to use with H2O ##

- [arrhythmia: http://archive.ics.uci.edu/ml/datasets/Arrhythmia](http://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/arrhythmia.csv.gz)
- [Abalone: http://archive.ics.uci.edu/ml/machine-learning-databases/abalone](https://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/abalone.csv.gz)
- Airline Dataset of various sizes [RITA](http://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp)
   - [2K Rows](https://s3.amazonaws.com/h2o-airlines-unpacked/allyears2k.csv)
   - [5.8M Rows](https://s3.amazonaws.com/h2o-airlines-unpacked/airlines_all.05p.csv)
   - [152M Rows](https://s3.amazonaws.com/h2o-airlines-unpacked/allyears.1987.2013.csv)
- [Titanic](http://s3.amazonaws.com/h2o-public-test-data/smalldata/gbm_test/titanic.csv)   
- [SMS Data](https://raw.githubusercontent.com/h2oai/sparkling-water/master/examples/smalldata/smsData.txt)
- [Million Songs](https://archive.ics.uci.edu/ml/datasets/YearPredictionMSD)
   - 515k observations, 90 numerical predictors, no missing values, origin: 
   - Pre-split data (463k train / 51k test), and binary labels for release year <2004 or >= 2004
      - [Training Data](https://h2o-public-test-data.s3.amazonaws.com/bigdata/laptop/milsongs/milsongs-cls-train.csv.gz)
      - [Test Data](https://h2o-public-test-data.s3.amazonaws.com/bigdata/laptop/milsongs/milsongs-cls-test.csv.gz)
- [Seeds Dataset](http://archive.ics.uci.edu/ml/datasets/seeds)
   - [http://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/seeds_dataset.txt](http://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/seeds_dataset.txt)
- [MNIST Dataset](http://yann.lecun.com/exdb/mnist/)
  - [Training](https://s3.amazonaws.com/h2o-public-test-data/bigdata/laptop/mnist/train.csv.gz)
  - [Test](https://s3.amazonaws.com/h2o-public-test-data/bigdata/laptop/mnist/test.csv.gz)
  
## Loading above dataset or any other dataset into H2O ##

### FLOW ###
This is how you can import a file into H2O FLOW:
![](https://github.com/Avkash/mldl/blob/master/images/flow-import-file.png?raw=true)

### Python ###
```
import h2o
df = h2o.import_file("http://s3.amazonaws.com/h2o-public-test-data/smalldata/flow_examples/arrhythmia.csv.gz")
```

### R ###
```
library(h2o)
df_train = h2o.importFile("https://s3.amazonaws.com/h2o-public-test-data/bigdata/laptop/mnist/train.csv.gz")
df_test = h2o.importFile(""https://s3.amazonaws.com/h2o-public-test-data/bigdata/laptop/mnist/test.csv.gz")
```

### Spark & Scala ###

NEED SAMPLE
