# Sequnce Models

## Recurrent Neural Network
### Part 1 Sequence data
Examples: speech recognition, music generation, sentiment classification, video activity recognition   
Input and/or output is a sequence; could have different lengths

### RNN model
- Limitations of standard NN:
	- Input & output have different lengths for different examples
	- no feature sharing
- RNN: use some information from previous time stamps to help prediction of current timestamp
	- limitation: only uses information earlier in the sequence
	- can be resolved by BRNN