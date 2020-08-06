# Improving DNN

## Module 2 Optimization Algorithms
### Part 7 RMSprop

### Part 8 Adam optimization algorithm
Combination of RMSprop and momentum

## Module 3 Batch Normalization
### Part 4 Normalizing activations in a network
Previously, we learned that normalizing inputs speed up DNN   
Now, try to normalize hidden layers (before or after activation functions) to speed up   
Assume apply to Z before activation function, then the Z would be normalized (with mean and variance controlled by $$ \beta $$ and $$ \gamma $$ - optimization variables that can be learned)   

### Part 5 Adding Batch Norm to a network