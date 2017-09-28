## H2O MOJO Tree Visualization ##

Detailed Description: [Visualizing H2O GBM and Random Forest MOJO Models Trees in python](https://aichamp.wordpress.com/2017/09/27/visualizing-h2o-gbm-and-random-forest-mojo-models-trees-in-python/)

Full working Python Code

```
import h2o
import subprocess
from IPython.display import Image
h2o.init()
df = h2o.import_file('https://raw.githubusercontent.com/h2oai/sparkling-water/master/examples/smalldata/prostate.csv')
y = 'CAPSULE'
x = df.col_names
x.remove(y)
df[y] = df[y].asfactor()
train, valid, test = df.split_frame(ratios=[.8,.1])
from h2o.estimators.gbm import H2OGradientBoostingEstimator
gbm_cv3 = H2OGradientBoostingEstimator(nfolds=3)
gbm_cv3.train(x=x, y=y, training_frame=train)

## Getting all cross validated models 
all_models = gbm_cv3.cross_validation_models()
print("Total cross validation models: " + str(len(all_models)))

## Defining the parameters
mojo_file_name = "/Users/avkashchauhan/Downloads/my_gbm_mojo.zip"
h2o_jar_path= '/Users/avkashchauhan/tools/h2o-3/h2o-3.14.0.3/h2o.jar'
mojo_full_path = mojo_file_name
gv_file_path = "/Users/avkashchauhan/Downloads/my_gbm_graph.gv"

## Defining Image file name which we will generate from the Trees
image_file_name = "/Users/avkashchauhan/Downloads/my_gbm_tree"
# Based on Tree ID the image file will have my_gbm_tree_ID.png file name

## Downloading GBM MOJO Model and saving to disk
gbm_cv3.download_mojo(mojo_file_name)

import subprocess
from IPython.display import Image

## Defining Functions

def generateTree(h2o_jar_path, mojo_full_path, gv_file_path, image_file_path, tree_id = 0):
    image_file_path = image_file_path + "_" + str(tree_id) + ".png"
    result = subprocess.call(["java",  "-cp", h2o_jar_path, "hex.genmodel.tools.PrintMojo", "--tree", str(tree_id), "-i",  mojo_full_path , "-o", gv_file_path ], shell=False)
    result = subprocess.call(["ls",gv_file_path], shell = False)
    if result is 0:
        print("Success: Graphviz file " + gv_file_path + " is generated.")
    else:    
        print("Error: Graphviz file " + gv_file_path + " could not be generated.")
        

# -------------------        
# I had to do in 2 steps. If I put all in 1 step the process hung after graphviz is created. Still investigating
# -------------------
def generateTreeImage(gv_file_path, image_file_path, tree_id):
    image_file_path = image_file_path + "_" + str(tree_id) + ".png"
    result = subprocess.call(["dot", "-Tpng", gv_file_path, "-o", image_file_path], shell=False)
    result = subprocess.call(["ls",image_file_path], shell = False)
    if result is 0:
        print("Success: Image File " + image_file_path + " is generated.")
        print("Now you can execute the follow line as-it-is to see the tree graph:") 
        print("Image(filename='" + image_file_path + "\')")
    else:
        print("Error: Image file " + image_file_path + " could not be generated.")


# Note just change the tree id in the function below to get which particular tree you want
generateTree(h2o_jar_path, mojo_full_path, gv_file_path, image_file_name, 3)


generateTreeImage(gv_file_path, image_file_name,  3)
# Note: If this step hangs, you can look at "dot" active process in osx and try killing it


# Just pass the Tree Image file name depending on your tree
Image(filename='/Users/avkashchauhan/Downloads/my_gbm_tree_0.png')


# Just pass the Tree Image file name depending on your tree
Image(filename='/Users/avkashchauhan/Downloads/my_gbm_tree_1.png')


# Just pass the Tree Image file name depending on your tree
Image(filename='/Users/avkashchauhan/Downloads/my_gbm_tree_2.png')

# Just pass the Tree Image file name depending on your tree
Image(filename='/Users/avkashchauhan/Downloads/my_gbm_tree_3.png')
```



 
