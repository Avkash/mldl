## Machine Learning/Deep Learning Terminology(Glossary) - S ##
Skewed Data | Sparse Matrix
___
### Skewed Data ###
In probability theory and statistics, skewness is a measure of the asymmetry of the probability distribution of a real-valued random variable about its mean. The skewness value can be positive or negative, or undefined. The qualitative interpretation of the skew is complicated and unintuitive.
- Negative Skew > Tail is on left
- Positive Skew > Tail is on right
- Normal Distribution has no skew.  Symmetry is consider as normal..

You can build histogram with 0 included to see the tail clearly..
https://www.mathsisfun.com/data/skewness.html
If data is skewed, its good to models in the following order and use grid search + hyper-parameter. 
 - 1. Generalized Linear Models
 - 2. Random Forest and GBM
 - 3. Multilayer perceptron
![](https://github.com/Avkash/mldl/blob/master/images/skewed-data.png)
### Sparse Matrix ###
In a matrix the data is represented into row and columns. 
Ther are two 3 tpyes of matrix:
 - 1. Balanced Matrics
    - A matrix with almost equal number of rows and columns called balanced matrix.
 - 2. Sparse Matrix
    - In this matrix the data is mostly 0 almost 90-98% andremaining values i.e. 1.
    - Wide Matrix: 
      - A matrics with high number of columns and very low number of rows is called wide matrix
    - Deep Matrix: 
      - A matrics with high number of rows and very low number of columns is called deep matrix


## Credits/Resources ##
 - []()

