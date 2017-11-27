# H2O Word2vec in R #

The Word2vec algorithm takes a text corpus as an input and produces the word vectors as output. The algorithm first creates a vocabulary from the training text data and then learns vector representations of the words. The vector space can include hundreds of dimensions, with each unique word in the sample corpus being assigned a corresponding vector in the space. In addition, words that share similar contexts in the corpus are placed in close proximity to one another in the space. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [craigslistJobTitles.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/craigslistJobTitles.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample R  Code ##
  - [H2O Word2Vec Sample in R](https://github.com/Avkash/mldl/blob/master/code/R/H2O-Word2Vec-CraigslistTitles.R)

## Sample code in R ## 

###: Importing H2O Library
```python
library(h2o)
```

###: Initializing  H2O
```python
h2o.init()
```

###: Location of dataset
```python
jobs_data_path = "https://raw.githubusercontent.com/h2oai/sparkling-water/rel-1.6/examples/smalldata/craigslistJobTitles.csv"
```

###: Importing the dataset with the given header
```python
jobs_data = h2o.importFile(jobs_data_path, destination_frame = "jobtitles",
                             col.names = c("category", "jobtitle"), col.types = c("Enum", "String"), header = TRUE)
```

###: Understanding Jobs Dataset
```python
h2o.describe(jobs_data)
```

###: List of all categories in the job data
```python
h2o.levels(jobs_data$category)
```

###: Definition of stop words which will be removed from the dataset
```python
STOP_WORDS = c("ax","i","you","edu","s","t","m","subject","can","lines","re","what",
               "there","all","we","one","the","a","an","of","or","in","for","by","on",
               "but","is","in","a","not","with","as","was","if","they","are","this","and","it","have",
               "from","at","my","be","by","not","that","to","from","com","org","like","likes","so")
```

###: A custom function to tokenize all the words into given dataset 
```python
tokenize = function(sentences, stop.words = STOP_WORDS) {
    tokenized <- h2o.tokenize(sentences, "\\\\W+")

    # convert to lower case
    tokenized.lower <- h2o.tolower(tokenized)
    # remove short words (less than 2 characters)
    tokenized.lengths <- h2o.nchar(tokenized.lower)
    tokenized.filtered <- tokenized.lower[is.na(tokenized.lengths) || tokenized.lengths >= 2,]
    # remove words that contain numbers
    tokenized.words <- tokenized.filtered[h2o.grep("[0-9]", tokenized.filtered, invert = TRUE, output.logical = TRUE),]

    # remove stop words
    tokenized.words[is.na(tokenized.words) || (! tokenized.words %in% STOP_WORDS),]
}
```


###: Converting job dataset into sequence of words using tokenize function
```python
words = tokenize(jobs_data$jobtitle)
```

###: Understanding Words dataset
```python
h2o.describe(words)
```

###: Building H2O word2vec model by passing tokenize dataset
```python
h2o_w2v_model = h2o.word2vec(words, sent_sample_rate = 1, epochs = 50)
```

###: Using H2O Word2vec synonyms finding (h2o.findSynonyms) function to find similar words by given a word
```python
h2o.findSynonyms(h2o_w2v_model, "money", count = 5)
h2o.findSynonyms(h2o_w2v_model, "education", count = 5)
h2o.findSynonyms(h2o_w2v_model, "student", count = 5)
h2o.findSynonyms(h2o_w2v_model, "teacher", count = 5)
```

###: Calculating vector for every categorical (i.e. job in this case)
```python
job_title_vecs = h2o.transform(h2o_w2v_model, words, aggregate_method = "AVERAGE")
job_title_vecs
```

###: Filtering all the valid job names and removing empty and invalid entries
```python
valid_jobs_data = ! is.na(job_title_vecs$C1)
```

###: Combining categories with valid job data to generate the final data set which will be used to build H2O GBM Model
```python
data = h2o.cbind(jobs_data[valid_jobs_data, "category"], job_title_vecs[valid_jobs_data, ])
```

###: Understanding final dataset which will be used for H2O GBM model building
```python
h2o.describe(data)
```

###: Understanding all the job categories in given datasets
```python
h2o.levels(data$category)
```

###: findng the distribution of categories in the given dataset  
```python
category_freq = h2o.group_by(data, by = "category", nrow("category"))
h2o.hist(category_freq$nrow)
```

###: Creating training and validation dataset from the source dataset
```python
df_split = h2o.splitFrame(data, ratios = 0.8)
train = df_split[[1]]
valid = df_split[[2]]
```

###: Building H2O GBM model
```python
gbm_model = h2o.gbm(x = names(job_title_vecs), y = "category",
                     training_frame = train, validation_frame = valid)
```

###: Understanding H2O Model performance
```python
h2o.performance(gbm_model, valid = TRUE)
```

###: A custom function to perform prediction by passing a test sentence and word2vec and H2O model
```python
predict = function(job.title, w2v, gbm) {
    words <- tokenize(as.character(as.h2o(job.title)))
    job.title.vec <- h2o.transform(w2v, words, aggregate_method = "AVERAGE")
    h2o.predict(gbm, job_title_vecs)
}
```

###: Performing prediction using custom sentences
```python
print(predict("school teacher having holidays every month", h2o_w2v_model, gbm_model))
print(predict("dirt digging in the back yard and haul mud", h2o_w2v_model, gbm_model))
print(predict("financial consultant with accounting experience", h2o_w2v_model, gbm_model))
print(predict("developer with 3+ Java experience, jumping", h2o_w2v_model, gbm_model))
print(predict("Wall art designer and painer needed", h2o_w2v_model, gbm_model))
```

###: Shutting down H2O cluster
```python
h2o.shutdown(prompt = F)
```
