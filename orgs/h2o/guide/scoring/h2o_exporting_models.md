# Exporting Models in H2O #

Once your algorithm is done and the result model is ready to meet your need you can export the model from H2O to perform scoring. Here are more details about H2O exported models: 
 - Binary model needs exact same version of H2O import the model back
 - You can generate POJO and MOJO models form a binary model after it is successfully imported
 - With POJO and MOJO you must export h2o-genmodel.jar also and keep it together with exported models
 - POJO models are in plan code so you can read and understand the code however MOJO models are compressed and in zip ormat so not human readable

Binary Model
  - FLOW (Import model | Export model)
  - Python (Import model | Export model)
  - R (Import model | Export model)
  - Scala (Import model | Export model)

POJO Model 
  - FLOW
  - Python
  - R
  - Scala


MOJO Model 
  - FLOW
  - Python
  - R
  - Scala
