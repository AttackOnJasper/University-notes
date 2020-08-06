# Convolutional Neural Network (Andrew Ng, deeplearning.ai)

## Module 1
### Part 1 Computer vision
To deal with image recognition / transformation, cannot have fully connected neural network any more (dimension too large)

### Part 2 Edge Detection
- To detect vertial / horizontal edges of an image, need to construct a filter F (a.k.a. kernel, e.g. a 3 * 3 matrix)  
- Then convolve the image with the filter
	- if we assume the image A is greyscale (no RGB) with dimension 6 * 6, then $$ A * F = M $$ (this is **convolution**, not matrix product), where M is $$ \Re^{4 * 4} $$. We can interpret M as another image
- side note: $$ size(M) = \frac{size(A) - size(F) + 2 * P}{S} + 1  $$ , where P is the amount of zero paddings and S is stride (how to slide the filters)

### Part 3 Filters
- Existing filters
	- Sobel filter   
	- Schorr filter   
- We could train a new filter instead of using existing filters