
# Python sample code to perform MOJO Scoring:

The actual Java Command looks like as below:

java -Xmx4g -cp .:/Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring/h2o-genmodel.jar:/Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring:genmodel.jar:/ water.util.H2OPredictor  /Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring/gbm_prostate_new.zip '{\"AGE\":\"68\", \"RACE\":\"2\", \"DCAPS\":\"2\", \"VOL\":\"0\",\"GLEASON\":\"6\"  }'


```
> import subprocess

> gen_model_arg = '.:/Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring/h2o-genmodel.jar:/Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring:genmodel.jar:/'

> h2o_predictor_class = 'water.util.H2OPredictor'
> mojo_model_args = '/Users/avkashchauhan/src/github.com/h2oai/h2o-tutorials/tutorials/python_mojo_scoring/gbm_prostate_new.zip'
> json_data = {"AGE":"68","RACE":"2", "DCAPS":"2", "VOL":"0","GLEASON":"6"}

> output = subprocess.check_output(["java" , "-Xmx4g", "-cp", gen_model_arg, h2o_predictor_class, 
mojo_model_args, json_data], shell=False).decode()

> output
```

