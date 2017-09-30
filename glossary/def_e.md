## Machine Learning/Deep Learning Terminology(Glossary) - E ##
Error R^2 (r2) | Negative R^2 | 
___

## Error R^2 (r2) R-Square ##
R-squared is a statistical measure of how close the data are to the fitted regression line. It is also known as the coefficient of determination, or the coefficient of multiple determination for multiple regression.

The definition of R-squared is fairly straight-forward; it is the percentage of the response variable variation that is explained by a linear model. Or:

 - R-squared = Explained variation / Total variation
 - R-squared is always between 0 and 100%:
   - 0% indicates that the model explains none of the variability of the response data around its mean.
   - 100% indicates that the model explains all the variability of the response data around its mean.
   
In general, the higher the R-squared, the better the model fits your data.[Read this post for more](http://blog.minitab.com/blog/adventures-in-statistics-2/regression-analysis-how-do-i-interpret-r-squared-and-assess-the-goodness-of-fit)

## Negative R^2 ##
A negative R^2 is not a peculiar interpretation. It is flat out MEANINGLESS. I thought we straightened this out. A squared quantity CANNOT be negative. People will laugh at this. This condition requires posting a NULL or some value with a footnote along the lines of what Arno just said.  The fact that someone blithely figured that it was OK to do this makes me think that some ML software elsewhere does this. If they do, if EVERYONE does, then it's time to assert that the emperor has no clothes and to do the right thing. FYI, I used to highlight negative R^2, Variance, and Chisquare values printed in outputs as a way of lampooning crappy statistical software packages.


## Credits/Resources ##
 - []()

