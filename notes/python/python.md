# Python
## Overview
OOP, dynamic typing, interpreted (no compilation and linking necessary, interactive), 

Package imports: pip3 install ...

## Syntax
- Method declaration: def func_name(param)  
- Comment: # 
- Call other modules’ functions: module.function

### Operators
- **, // (floor division which returns an integer), % 
- in / not in
- is / is not
- Operations can be chained: e.g. a < b == c -> a < b and b == c

### Functions
* max(x, y, …), pow(x,y) == **, round(x, ndigits?), int(float) == floor, 
* dir(built ins)
* print, input, 
* range(start?, end, step?)

## Data structures
### String
- Python strings are immutable; they can be expressed as '' or ""
- operators: +, *
- [::-1] — reverse

### List
- lists are mutable
- a = [,,]
- element access: a[i] == a[-(length - i)]
- functions: a[n:m], min(a), max(a), len(a), sum(a), a.sort(), a.append(x), a.extend(iterable), a.clear() , a.count(x)
	- a.insert(i, x) # adds a value at position i
	- a.remove(x) # remove the first item from the list whose value is equal to x
	- a.pop() - removes and returns the last item in the list; a.pop(i) - pops specific element
	- a.copy() == a[:]
- loop:
  	- for variable in list:
  	- for i in range(len(list)):
  	- for count, value in enumerate(list):
- list can be used as stacks. **deque** is better for queues (operations: append, popleft)
- List comprehension
	- commonly used to make new lists where each element is the result of some operations applied to each member of another sequence or iterable, or to create a subsequence of those elements that satisfy a certain condition

## Modules
### Overview
- A module is a file containing Python definitions and statements.
- the module’s name (as a string) is available as the value of the global variable **\_\_name\_\_**
- ```import lib``` would not add the function names to symbol table. i.e. functions can only be invoked by lib.f()
- ```from lib import f``` adds the function name to symbol table

## IO
- ```f = open(name, mode)``` 
	- Good practice: 

## Classes
### Definitions
- **Namespace**: a mapping from names to objects (typically implemented as dictionaries)
	- examples: 
		- set of built-in names
		- global names in a module
		- local names in a function invocation
	- created at different moments and have different lifetimes
		- namespace containing the built-in names is created when the Python interpreter starts up, and is never deleted
		- global namespace for a module is created when the module definition is read in; typically lasts until interpreter quits
- **Attribute**
	- If the same attribute name occurs in both an instance and in a class, then attribute lookup prioritizes the instance
	- search for attributes inherited from a parent class as depth-first, left-to-right, not searching twice in the same class where there is an overlap in the hierarchy

### Features
- the class inheritance mechanism allows multiple base classes
- a derived class can override any methods of its base class or classes
- created at runtime, and can be modified further after creation
- built-in types can be used as base classes for extension by the user
- objects are passed by reference

### Syntax
- A name prefixed with an underscore e.g. __\_attribute__ refers to a private variable inside the class

## Standard Library
- logging, sys, math, statistics

## Virtual Environments and Packages


## Coding styles
- Use 4-space indentation, and no tabs
- Wrap lines so that they don’t exceed 79 characters
- When possible, put comments on a line of their own
- Use docstrings

## Tools
### Jupyter

### Binder
- An open community that makes it possible to create sharable, interactive, reproducible environments
- Preparing for a repository
	- Repo is in public location with some configuration files

### Anaconda
