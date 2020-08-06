# Javascript
## ES 6
### Syntax changes
- ```const```: new keyword for defining immutable variables (cannot be re-assigned)
	- useful for targeting the selectors e.g. buttons - ```const btn = document.getElementById('btn1');```
- ```let```: creates mutable variables
- **Arrow functions** makes code more readable / clean. (like map paramter to output)
	- e.g. ```const func= name => 'Hi, ${name}';```
	- can be used together with ```map```, ```filter``` and ```reduce```
		- e.g. ```let arr2 = arr.map(item => item + 'suffix');```
	