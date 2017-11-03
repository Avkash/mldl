## Machine Learning/Deep Learning Terminology(Glossary) - D ##
Data Leakage | Dataflow Graph
___
### [Data Leakage](https://www.kaggle.com/wiki/Leakage) ###
Data Leakage is the creation of unexpected additional information in the training data, allowing a model or machine learning algorithm to make unrealistically good predictions.

Leakage is a pervasive challenge in applied machine learning, causing models to over-represent their generalization error and often rendering them useless in the real world. It can caused by human or mechanical error, and can be intentional or unintentional in both cases.

### Dataflow Graph ###
A data-flow graph (DFG) is a graph which represents a data dependancies between a number of operations. Any algorithm consists of a number of ordered operations. In a data flow graph, nodes are computations that send and receive data messages. Some nodes may only send messages, others may only receive messages, and others may send messages in response to messages that they receive.
- Ex: Tensorflow, Theano, Torch, Caffe
- Dataflow graph computing
   - Imperative
     - An API interface like numpy
     - Based on NDArray - Holds a tensor (multi dimension array)
     - Stores a pointer about where the memory is
   - Symbolic
     - An API interface lets user define computation graph like Tensorflow/Theano 



## Credits/Resources ##
 - []()
