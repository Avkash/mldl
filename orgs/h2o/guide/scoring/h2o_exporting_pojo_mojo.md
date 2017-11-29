# Downloading POJO  Models #

### FLOW ###
In the FLOW, you just need to click "Download POJO" button to download the POJO model to local disk:
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_download_pojo.png)

### Python ###
We can save the POJO (model_id.java) using the command below:
```
model_on_disk = model.download_pojo(path="/Users/avkashchauhan/Download/", get_genmodel_jar=True)
[output] Model saved to /Users/avkashchauhan/Download/GBM_model_python_prostate.java
```
### R ###
We can save the POJO (model_id.java) using the command below:
```
model_on_disk = h2o.download_pojo(gbm_r_model,path="/Users/avkashchauhan/Download/", get_genmodel_jar=TRUE)
[output] Model saved to /Users/avkashchauhan/Download/GBM_model_r_prostate.java
```
### Scala ###

# Downloading  MOJO Models #

### FLOW ###
In the FLOW, you just need to click "Download Model Deployment Package (MOJO)" button to download the MOJO model to local disk:
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_download_pojo.png)

### Python ###
We can save the POJO (model_id.zip) using the command below:
```
model_on_disk = model.download_mojo(path="/Users/avkashchauhan/Download/", get_genmodel_jar=True)
[output] Model saved to /Users/avkashchauhan/Download/GBM_model_python_prostate.zip
```
### R ###
We can save the POJO (model_id.zip) using the command below:
```
model_on_disk = h2o.download_mojo(gbm_r_model,path="/Users/avkashchauhan/Download/", get_genmodel_jar=TRUE)
[output] Model saved to /Users/avkashchauhan/Download/GBM_model_r_prostate.zip
```

### Scala ###
