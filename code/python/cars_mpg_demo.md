## Cars and MPG Machine Learning Demo ##

```
# import the cars dataset:
# this dataset is used to classify whether or not a car is economical based on
# the car's displacement, power, weight, and acceleration, and the year it was made
cars = h2o.import_file("https://s3.amazonaws.com/h2o-public-test-data/smalldata/junit/cars_20mpg.csv")

# convert response column to a factor
cars["economy_20mpg"] = cars["economy_20mpg"].asfactor()

# set the predictor names and the response column name
predictors = ["displacement","power","weight","acceleration","year"]
response = "economy_20mpg"

# create a fold column with 5 folds
# randomly assign fold numbers 0 through 4 for each row in the column
fold_numbers = cars.kfold_column(n_folds = 2, seed = 1234)

# rename the column "fold_numbers"
fold_numbers.set_names(["fold_numbers"])

# append the fold_numbers column to the cars dataset
cars = cars.cbind(fold_numbers)

# print the fold_assignment column
print(cars['fold_numbers'])

# initialize the estimator then train the model
cars_gbm = H2OGradientBoostingEstimator(nfolds=5)
cars_gbm.train(x=predictors, y=response, training_frame=cars)

# print the auc for the cross-validated data
cars_gbm.auc()

cars["cylinders"] = cars["cylinders"].asfactor()
cars['cylinders'].levels()

cars_gbm1 = H2OGradientBoostingEstimator()
cars_gbm1.train(x=predictors, y=response, training_frame=cars,  fold_column="cylinders")

# print the auc for the cross-validated data
cars_gbm1.auc()

cars_gbm1 = H2OGradientBoostingEstimator()
cars_gbm1.train(x=predictors, y=response, training_frame=cars,  fold_column="cylinders")

```
