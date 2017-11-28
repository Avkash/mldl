import org.apache.spark.sql.DataFrame
import org.apache.spark.SparkFiles
import java.io.File
import water.api.TestUtils
import water.support.SparkContextSupport

import org.apache.spark.h2o._
val h2oContext = H2OContext.getOrCreate(spark)

def isHeader(line: String) = line.contains("category")

SparkContextSupport.addFiles(sc, TestUtils.locate("craigslistJobTitles.csv"))
// Load and split data based on ","
val jobData = sc.textFile(SparkFiles.get("craigslistJobTitles.csv")).filter(x => !isHeader(x)).map(d => d.split(','))

// Get more info on ingested data
jobData.map(l => l(0)).first // Should show you the first record from category column
jobData.map(l => l(1)).first // Should show you the first record from job details column

// Extract job category from job description and counting different job categories
val jobCategories = jobData.map(l => l(0))
val jobCategoriesCounts = jobCategories.map(n => (n, 1)).reduceByKey(_+_).collect.mkString("\n")

// Stop words list to remove from the original data corpus
val stopwords = Set("ourselves", "hers", "between", "yourself", "but", "again", "there", "about", 
    "once", "during", "out", "very", "having", "with", "they", "own", "an", "be", "some", "for", "do", 
    "its", "yours", "such", "into", "of", "most", "itself", "other", "off", "is", "s", "am", "or", "who", "as", 
     "from", "him", "each", "the", "themselves", "until", "below", "are", "we", "these", "your", "his", "through", "don", "nor", "me", "were", "her", "more", "himself", "this", "down", "should", "our", "their", "while", "above", "both", "up", 
    "to", "ours", "had", "she", "all", "no", "when", "at", "any", "before", "them", "same", "and", "been", "have", "in", "will", "on", "does", "yourselves", "then", "that", "because", "what", "over", "why", "so", "can", 
    "did", "not", "now", "under", "he", "you", "herself", "has", "just", "where", "too", "only", "myself", "which", "those", "i", "after", "few", "whom", "t", "being", "if", "theirs", "my", "against", "a", "by", "doing", 
    "it", "how", "further", "was", "here", "than")


val jobDescriptions = jobData.map(l => l(1))
// Compute rare words
val rareWords = jobDescriptions.flatMap(t => t.split("""\W+""").map(_.toLowerCase)).filter(word => """[^0-9]*""".r.pattern.matcher(word).matches).
  map(w => (w, 1)).reduceByKey(_+_).
  filter { case (k, v) => v < 2 }.map { case (k, v) => k }.
  collect.
  toSet

// Define tokenizer function
def token(line: String): Seq[String] = {
  //get rid of nonWords such as puncutation as opposed to splitting by just " "
  line.split("""\W+""")
    .map(_.toLowerCase)

    //remove mix of words+numbers
    .filter(word => """[^0-9]*""".r.pattern.matcher(word).matches)

    //remove stopwords defined above (you can add to this list if you want)
    .filterNot(word => stopwords.contains(word))

    //leave only words greater than 1 characters.
    //this deletes A LOT of words but useful to reduce our feature-set
    .filter(word => word.size >= 2)

    //remove rare occurences of words
    .filterNot(word => rareWords.contains(word))
}

val tokenizedJobData = jobData.map(d => (d(0), token(d(1)).toSeq)).filter(s => s._2.length > 0)

val tokenizedCategory = tokenizedJobData.map(v => v._1)
val tokenizedJobDescription = tokenizedJobData.map(v => v._2)


val jobDescriptionsToken = jobDescriptions.flatMap(d => token(d))

// Get distinct count values we have in token
jobDescriptionsToken.distinct.count

// Creating H2O frame from Tokenize Data
val jobDescriptionsTokenFrame = h2oContext.asH2OFrame(jobDescriptionsToken)
jobDescriptionsTokenFrame

// Importing H2O Word2Vec Libraries
import _root_.hex.word2vec.{Word2Vec, Word2VecModel}
import _root_.hex.word2vec.Word2VecModel.Word2VecParameters

// Confguring H2O Word2Vec algorithm
val w2vParams = new Word2VecParameters
w2vParams._train = jobDescriptionsTokenFrame._key
w2vParams._epochs = 10
w2vParams._min_word_freq = 0
w2vParams._init_learning_rate = 0.05f
w2vParams._window_size = 20
w2vParams._vec_size = 100
w2vParams._sent_sample_rate = 0.0001f

// Building H2O Word2Vec Model
val h2oWord2Vec = new Word2Vec(w2vParams).trainModel().get()

// Finding Synonymss values from the given model 
h2oWord2Vec.findSynonyms("love", 3)
h2oWord2Vec.findSynonyms("help", 2)
h2oWord2Vec.findSynonyms("hate", 1)


// Transforming/Vectorizing job description text into vectors based on word2vec model and AVERAGE aggregate method
val jobDescriptionsVecs = h2oWord2Vec.transform(jobDescriptionsTokenFrame.vec(0), Word2VecModel.AggregateMethod.NONE).toTwoDimTable()
jobDescriptionsVecs

// Now we will cbind jobTitles and jobTitleVecs together

val h2oLabeledFrame_rdd = H2ODataFrame.asDataFrame(jobTitleVecs)(sqlContext)
