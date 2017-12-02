# Analyzing data in H2O memory #


You can analyze the dataset into H2O memory using FLOW as well as other API:
 - Once data is ingested into H2O memory you can always look at the data distribution into H2O memory at dataset level. 
 - Use FLOW to see the distribution of dataset into all the nodes based on records and data size.
 - This should help you to understand if data was evenly distributed among all the nodes. An even distribution helps faster training time on given dataset.
 - In the FLOW UI will will see how the data is compressed into H2O memory and how it is distributed in chunks and vecs.


## Listing and Remove objects from H2O Memory: ## 

### R ### 
 - Use h2o.ls() to get list of objects into H2O memory
 - Use h2o.removeAll() to remove all the objects from memory
 - Use h2o.rm("object_id") to remove a single object from H2O memory 
 
### Python ###
 - Use h2o.ls() to get list of objects into H2O memory
 - Use h2o.remove_all() to remove all the objects from memory
 - Use h2o.remove("object_id") to remove a single object from H2O memory 

