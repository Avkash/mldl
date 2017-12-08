## Creating Variable Importance table in Python from an H2O Model ##

Once you have model object, you can create your own Variable Metrics tables in python as below:
```
mymodel = gbm_model_cv
import matplotlib.pyplot as plt
import numpy as np

plt.rcdefaults()
fig, ax = plt.subplots()
variables = mymodel._model_json['output']['variable_importances']['variable']
y_pos = np.arange(len(variables))
scaled_importance = mymodel._model_json['output']['variable_importances']['scaled_importance']
ax.barh(y_pos, scaled_importance, align='center', color='green', ecolor='black')
ax.set_yticks(y_pos)
ax.set_yticklabels(variables)
ax.invert_yaxis()
ax.set_xlabel('Scaled Importance')
ax.set_title('Variable Importance')
plt.show()
```

The variable importance tables look as below:
![](https://github.com/Avkash/mldl/blob/master/images/h2o_flow_varimp_plot.png?raw=true)

You can also call the following API to get the variable importance table and plot:
```
gbm_model_cv.varimp()
gbm_model_cv.varimp_plot()
```
