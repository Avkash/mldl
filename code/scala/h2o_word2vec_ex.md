## H2O Word2Vec Example in Scala ##


```
import org.apache.spark.h2o._
val h2oContext = H2OContext.getOrCreate(spark)

import scala.io.Source
import _root_.hex.word2vec.{Word2Vec, Word2VecModel}
import _root_.hex.word2vec.Word2VecModel.Word2VecParameters
import water.fvec.Vec

val STOP_WORDS = Set("ourselves", "hers", "between", "yourself", "but", "again", "there", "about", "once", "during", "out", "very", "having", "with", "they", "own", "an", "be", "some", "for", "do", "its", "yours", "such", "into", "of", "most", "itself", "other", "off", "is", "s", "am", "or", "who", "as", "from", "him", "each", "the", "themselves", "until", "below", "are", "we", "these", "your", "his", "through", "don", "nor", "me", "were", "her", "more", "himself", "this", "down", "should", "our", "their", "while", "above", "both", "up", "to", "ours", "had", "she", "all", "no", "when", "at", "any", "before", "them", "same", "and", "been", "have", "in", "will", "on", "does", "yourselves", "then", "that", "because", "what", "over", "why", "so", "can", "did", "not", "now", "under", "he", "you", "herself", "has", "just", "where", "too", "only", "myself", "which", "those", "i", "after", "few", "whom", "t", "being", "if", "theirs", "my", "against", "a", "by", "doing", "it", "how", "further", "was", "here", "than")


// Note: Choose either Section ONE or Section TWO

// Section ONE : Reading Text from the local file system

val filename = "/Users/avkashchauhan/Downloads/TheAdventuresOfSherlockHolmes.txt"
val lines = Source.fromFile(filename).getLines.toArray
val sparkframe = sc.parallelize(lines)

// Section TWO : Passing a text collection as an Array 
val sparkframe = sc.parallelize(Array("McBride fell 12 stories, hitting the pavement like a Hefty bag filled with vegetable soup. Her hair glistened in the rain like a nose hair after a sneeze. He was as tall as a six-foot, three-inch tree"))


def tokenize(line: String) = {
  //get rid of nonWords such as punctuation as opposed to splitting by just " "
  line.split("""\W+""")
    .map(_.toLowerCase)

    //Lets remove stopwords defined above
    .filterNot(word => STOP_WORDS.contains(word)) :+ null
}

val allLabelledWords = sparkframe.flatMap(d => tokenize(d))

val h2oFrame = h2oContext.asH2OFrame(allLabelledWords)

val w2vParams = new Word2VecParameters
w2vParams._train = h2oFrame._key
w2vParams._epochs = 500
w2vParams._min_word_freq = 0
w2vParams._init_learning_rate = 0.05f
w2vParams._window_size = 20
w2vParams._vec_size = 20
w2vParams._sent_sample_rate = 0.0001f

val w2v = new Word2Vec(w2vParams).trainModel().get()


w2v.findSynonyms("love", 3)
w2v.findSynonyms("help", 2)
w2v.findSynonyms("hate", )


val newSparkFrame = w2v.transform(h2oFrame.vec(0), Word2VecModel.AggregateMethod.NONE).toTwoDimTable()
```



