# H2O Word2vec in Python #

The Word2vec algorithm takes a text corpus as an input and produces the word vectors as output. The algorithm first creates a vocabulary from the training text data and then learns vector representations of the words. The vector space can include hundreds of dimensions, with each unique word in the sample corpus being assigned a corresponding vector in the space. In addition, words that share similar contexts in the corpus are placed in close proximity to one another in the space. 

## Dataset ##
The dataset used in this example can be obtained from here:
 - [craigslistJobTitles.csv](https://raw.githubusercontent.com/Avkash/mldl/master/data/craigslistJobTitles.csv)

Note: Use "wget" and above links to pull the the data locally or use the URL above directly to load data into H2O.

## Get the Sample Python  Code ##
  - [H2O Word2Vec Sample in Python](https://github.com/Avkash/mldl/blob/master/code/R/H2O-Word2Vec-CraigslistTitles.R)

## Sample code in Python ## 

###: Importing H2O 
```python
import h2o
```

###: Initalizing H2O cluster
```python
h2o.init()
```

###: Importing craigslist jobs title and description dataset into H2O cluster memory
```python
jobs_data= h2o.import_file(col_names=['category', 'jobtitle'], header=1, col_types = ["enum", "string"],
                        path="https://raw.githubusercontent.com/h2oai/sparkling-water/rel-1.6/examples/smalldata/craigslistJobTitles.csv")
```

###: Understanding the dataset
```python
jobs_data.summary()
```

###: Definition of stop words which will be removed from the list of words in out job details
```python
STOP_WORDS = ["ax","i","you","edu","s","t","m","subject","can","lines","re","what",
               "there","all","we","one","the","a","an","of","or","in","for","by","on",
               "but","is","in","a","not","with","as","was","if","they","are","this","and","it","have",
               "from","at","my","be","by","not","that","to","from","com","org","like","likes","so"]
```

###: Local Tokenize function to tokenize all the words in a list
```python
def tokenize(sentences, stop_word = STOP_WORDS):
    tokenized = sentences.tokenize("\\W+")
    tokenized_lower = tokenized.tolower()
    tokenized_filtered = tokenized_lower[(tokenized_lower.nchar() >= 2) | (tokenized_lower.isna()),:]
    tokenized_words = tokenized_filtered[tokenized_filtered.grep("[0-9]",invert=True,output_logical=True),:]
    tokenized_words = tokenized_words[(tokenized_words.isna()) | (~ tokenized_words.isin(STOP_WORDS)),:]
    return tokenized_words
```

###: Calling the tokenize function to tokenize all the words in the job details 
```python
##words_token = local_tokenize(all_sentences)
words_token = tokenize(jobs_data['jobtitle'])
```

###: Getting total number of tokens
```python
print(len(words_token))
```

###: The tokens type
```python
type(words_token)
```

###: Understanding Words Token Data as H2O Dataframe
```python
words_token.describe()
```

###: Importing H2O Word2VEC Estimator
```python
from h2o.estimators.word2vec import H2OWord2vecEstimator
```

###: Setting Word2Vec estimator configuration
```python
h2o_w2v_model =  H2OWord2vecEstimator(sent_sample_rate = .9, epochs = 10, model_id = "h2o_w2v_model_python")
```

###: Training Word2Vec Model
```python
h2o_w2v_model.train(training_frame = words_token)
```

###: Understanding Word2Vec Model
```python
h2o_w2v_model
```

###: Testing simlar word Experiment from the model with the word "money"
```python
h2o_w2v_model.find_synonyms( "money", count = 5)
```

###: Testing simlar word Experiment from the model with the word "account"
```python
h2o_w2v_model.find_synonyms( "account", count = 5)
```

###: Calculating vector for every job title by passing original job title category data 
```python
job_title_vecs = h2o_w2v_model.transform(words_token, aggregate_method = "AVERAGE")
print(job_title_vecs.shape)
job_title_vecs
```

###: Understanding and matching the jobs data we have ingested earlier
```python
print(jobs_data.shape)
print(jobs_data['category'].shape)
```

###: Checking if any of the job title vectors are empty or NAs
```python
valid_job_titles = ~ job_title_vecs["C1"].isna()
valid_job_titles
```

###: Combining categories with valid job data to generate the final data set which will be used to build H2O GBM Model
```python
#final_words_data = jobs_data['category'].cbind(job_title_vecs)
final_words_data = jobs_data[valid_job_titles,:].cbind(job_title_vecs[valid_job_titles,:])
```

###: Creating training, validation & test dataset from the source dataset
```python
train, valid, test = final_words_data.split_frame(ratios=[0.8, 0.1])
```

###: Setting the response column
```python
response = "category"
```

###: Setting the response column as enum/categorical in all train, valid and test dataset
```python
train[response] = train[response].asfactor()
valid[response] = valid[response].asfactor()
test[response] = test[response].asfactor()
```

###: Setting features columns list for training
```python
features = train.col_names
features.remove(response)
```

###: Importing H2O GBM Estimator
```python
from h2o.estimators.gbm import H2OGradientBoostingEstimator
```

###: Setting H2O GBM configuration
```python
h2o_gbm = H2OGradientBoostingEstimator(nfolds = 5)
```

###: Traning the H2O GBM model based on jobs data
```python
h2o_gbm.train(x = features, y = response, training_frame= train)
```

###: H2O GBM Model performance
```python
h2o_gbm.model_performance(xval=True)
```

###: Performing the prediction with the test dataset
```python
pred_result = h2o_gbm.predict(test_data=test)
```

###: Checking the prediction results
```python
pred_result
```

###: H2O GBM Model performance on test data
```python
h2o_gbm.model_performance(test_data=test)
```

###: Creating a local function to perform prediction by passing a custom job description
```python
def predict_with_h2o_w2v(job_title,w2v, gbm):
    words = tokenize(h2o.H2OFrame(job_title).ascharacter())
    job_title_vec = w2v.transform(words, aggregate_method="AVERAGE")
    print(gbm.predict(test_data=job_title_vec))
```

###: Calling the local prediction function to predict category of given job details
```python
predict_local = predict_with_h2o_w2v(["food kitchen sandwich"], h2o_w2v_model, h2o_gbm)
print(predict_local)
```



### Helpful Links ###
 - [https://github.com/h2oai/h2o-3/blob/master/h2o-py/demos/word2vec_craigslistjobtitles.ipynb](https://github.com/h2oai/h2o-3/blob/master/h2o-py/demos/word2vec_craigslistjobtitles.ipynb)
