##  Recommendation Systems ##

## Librarires:

 - [Fast Python Collaborative Filtering for Implicit Datasets](https://github.com/benfred/implicit)
 - [pysyggest](https://code.google.com/archive/p/pysuggest/downloads)


## Tutorials ##

### [Stanford : Recommender Systems Tutorials](https://www.coursera.org/learn/machine-learning/lecture/f26nH/collaborative-filtering-algorithm) ###
When you buy a product online, most websites automatically recommend other products that you may like. Recommender systems look at patterns of activities between different users and different products to produce these recommendations. In this module, we introduce recommender algorithms such as the collaborative filtering algorithm and low-rank matrix factorization.

### [Quick Guide to Build a Recommendation Engine in Python and Graphlab](https://www.analyticsvidhya.com/blog/2016/06/quick-guide-build-recommendation-engine-python/)

- Content based algorithms:
  - Idea: If you like an item then you will also like a “similar” item
  - Based on similarity of the items being recommended
  - It generally works well when its easy to determine the context/properties of each item. For instance when we are recommending the same kind of item like a movie recommendation or song recommendation.
- Collaborative filtering algorithms:
  - Idea: If a person A likes item 1, 2, 3 and B like 2,3,4 then they have similar interests and A should like item 4 and B should like item 1.
  - This algorithm is entirely based on the past behavior and not on the context. This makes it one of the most commonly used algorithm as it is not dependent on any additional information.
  - For instance: product recommendations by e-commerce player like Amazon and merchant recommendations by banks like American Express.
  - Further, there are several types of collaborative filtering algorithms :
     - **User-User Collaborative filtering:** Here we find look alike customers (based on similarity) and offer products which first customer’s look alike has chosen in past. This algorithm is very effective but takes a lot of time and resources. It requires to compute every customer pair information which takes time. Therefore, for big base platforms, this algorithm is hard to implement without a very strong parallelizable system.
     - **Item-Item Collaborative filtering:** It is quite similar to previous algorithm, but instead of finding customer look alike, we try finding item look alike. Once we have item look alike matrix, we can easily recommend alike items to customer who have purchased any item from the store. This algorithm is far less resource consuming than user-user collaborative filtering. Hence, for a new customer the algorithm takes far lesser time than user-user collaborate as we don’t need all similarity scores between customers. And with fixed number of products, product-product look alike matrix is fixed over time.
     - **Other simpler algorithms:** There are other approaches like [market basket analysis](https://www.analyticsvidhya.com/blog/2014/08/visualizing-market-basket-analysis/), which generally do not have high predictive power than the algorithms described above.

### Other articles on building Recommendation Systems ###
 - [How to Build a Recommender System](https://blogs.gartner.com/martin-kihn/how-to-build-a-recommender-system-in-python/) 
 - [Amazon.com Recommendation System Document](https://github.com/Avkash/mldl/blob/master/pages/docs/articles/Amazon-Recommendations.pdf 
 - [Collaborative Filtering with Python](http://www.salemmarafi.com/code/collaborative-filtering-with-python/)
 - [Design Of Recommender Systems: SlideShare](https://www.slideshare.net/rashmi/design-of-recommender-systems)
 - [Recommender Systems Collaborative Filtering: Domino Data Labs](https://blog.dominodatalab.com/recommender-systems-collaborative-filtering/)
 - [Implementing your own recommender systems in Python](https://cambridgespark.com/content/tutorials/implementing-your-own-recommender-systems-in-Python/index.html)

