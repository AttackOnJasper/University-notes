# React JS
## Overview
### Fundamentals
- Components
	- Encapsulated components manage their own state and can be composed to make complex UIs
	- ```React.Component```: takes in parameters and returns a hierarchy of views to display via the ```render``` method
- Props (properties)
- State
	- component can remember state when ```this.state``` is set

### Declaritive


## Official Tutorial (https://reactjs.org/tutorial/tutorial.html)
- ```render``` method returns a description of what you want to see on the screen  
- JSX is typically used to write the description
- All React component classes that have a constructor should start it with a ```super(props)``` call.
- Since ```state``` is considered to be private to a component that defines it, we cannot update the one class' state directly from its instance variables' methods.
- **Function components** are a simpler way to write components that only contain a render method and don’t have their own state.
	- Instead of defining a component, define a function which is the render method.

## Official Documentation (https://reactjs.org/docs/hello-world.html)