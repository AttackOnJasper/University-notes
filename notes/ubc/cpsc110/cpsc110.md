# CPSC 110
## Expressions
- Format: ({primitive} {expression/value})
- e.g. `(* (+ 1 2) 5)`, `(sqrt (+ (sqr 3) (sqr 4)))`
- Racket evaluates expressions to produce values

## DrRacket Setup + Overview
- Language selection: 'Language' tab -> 'Teaching Language' -> 'Beginning Student'
- Interface
	1. Definition area
	1. Interaction area
- Stepper
- Help desk
	- right click a built-in function -> 'Search in Help Desk'

## Racket reference
- Comment: ';'
- Inexact number: represented by `#i`
- Primitive data
	1. Number
	1. String operators (primitive)
		1. `string-append` e.g. `(string-append "a" "b")`
		1. `string-length`
		1. `(substring "abcd" 1 2)` -> `"b"`. starting index is inclusive, and ending index is not
	1. Images
		- Dependency: `(require 2htdp/image)`
		- Shapes
			1. Circle: `(circle {radius} {painting scheme} {color})` e.g. `(circle 10 "solid" "red")`
			1. Triangle
			1. Text: `(text "{text}" {font} {color})` 
		- Operations
			1. Rotation: `(rotate {angle} {shape})`
			1. `image-width`
			1. `image-height`
		- Arrangements
			1. `above`
			1. `overlay`
- Constants
	- Faciliates readability & changability (maintainability)
	- `(define {name} {expression/value})`

## Functions
- Benefits
	1. avoid duplicate code
	1. clean & concise
	1. readability
- `(define ({function-name} {param}) ({expression}))`

## Boolean and If statements
- Predicates examples
	1. >, >=, =, <, <=
	1. string=?
	1. and, or, not (short circuited)
- If  
	- format: (if {predicate} {true-expression} {false-expression})


## HtDF (How to Define Functions) Recipe
- Components
	1. Signature (contract), purpose, stub (dummy implementation)
	1. Examples (`check-expect`)
	1. Inventory - templates and constants
	1. Code
	1. Unit tests

## cond Expression
- `(cond 
		[{predicate} {expression}]
		[{predicate} {expression}]
		...
		[else {expression}])`


## HtDD (How to Data Definition) 
- Includes
	1. A type comment that defines a new type name and describes how to represent information as data
		- Depends on data types (primitive, non-primitive)
	1. how to interpret data as information (decribes the correspondence between information and data)
	1. data examples
	1. template for operating on data

### Data Definition Example
```
;; CityName is String                   # Type comment
;; interp. the name of the city         # Interpretation
(define CN1 "Boston")                   # Examples
(define CN2 "Vancouver")

(define (fn-for-city-name cn) (... cn)) # A template

;; Template rules used: - atomic non-distinct: String
```

### Non-primitive data definitions
- Types
	1. Custom types (class)
	1. Atomic
		- Cannot be broken down further into pieces that are meaningfully part of the same problem domain
		- E.g. `Vancouver` no longer makes sense as a city name when we divide this into characters
	1. Distinct e.g. `false`, items in an enum
	1. Enumeration
	1. Itemization 
		- Interval e.g. integer from 0 - 10

## HtDW (How to Design Worlds)
### Big-bang Mechanism
- Big-bang expression
	- Format: `(big-bang {initial-world-state} (on-tick {func-to-get-next-world-state}) (to-draw {func-to-render-based-on-world-state}))`
	- Polymorphic
		- works for any type of world state
	- This expression is a simple user-interface framework