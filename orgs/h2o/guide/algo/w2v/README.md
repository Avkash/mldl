# Word2vec in H2O #

The Word2vec algorithm takes a text corpus as an input and produces the word vectors as output. The algorithm first creates a vocabulary from the training text data and then learns vector representations of the words. The vector space can include hundreds of dimensions, with each unique word in the sample corpus being assigned a corresponding vector in the space. In addition, words that share similar contexts in the corpus are placed in close proximity to one another in the space. The result is an H2O Word2vec model that can be exported as a binary model or as a MOJO. This file can be used as features in many natural language processing and machine learning applications. Learn more about Word2Vec in H2O [here](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/word2vec.html).

Note: This Word2vec implementation is written in Java and is not compatible with other implementations that, for example, are written in C++. In addition, importing models in binary format is not supported.

## Word2Vec Sample Code ##
 - [Python](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-python.md)
 - [R](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-R.md)
 - [Scala](https://github.com/Avkash/mldl/blob/master/orgs/h2o/guide/algo/w2v/h2o-w2v-craigslistjobs-scala.md)

## Helpful Links ##
 - [How to Develop Word Embeddings in Python with Gensim](https://machinelearningmastery.com/develop-word-embeddings-python-gensim/)
