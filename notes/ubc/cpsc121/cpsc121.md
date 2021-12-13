# CPSC 121

## 2.1 Logical Form and Logical Equivalence
### Logical Form
- Statement (proposition): a sentence that's either true or false
	- If a sentence could be true or could be false, then it's not a proposition
- Statement form (or propositional form) 
	- an expression made up of statement variables (such as p,q, and r) and logical connectives (such as ∼,∧, and ∨) that becomes a statement when actual statements are substituted for the component state- ment variables


### Logical Equivalence
- Can be checked via truth table
- Laws
	1. Associative laws 
	1. Commutative laws (交换律) e.g. $$ p \vee q \equiv q \vee p $$
	1. Distributive laws
	1. Double Negation
	1. Identity laws: $$ p \wedge T \equiv p, p \vee C \equiv p $$
- Tautology
	- a statement form that is always true regardless of the truth values of the individual statements substituted for its statement variables
	- e.g. $$ \neg q \vee q $$
- Contradiction
	- e.g. $$ \neg q \wedge q $$

## 2.4 Digital Logic Circuit

### Transistors
- Components
	1. Base
	1. Collector
	1. Emitter
- Acts as a switch
	- If there is a current from base to emitter, then it switches the transistor on and allows a larger current from collector to emitter
- Gates via transistors
	1. NOT gate
		- Parallel connection between collector + emitter and a light blob
		- Switch on base -> collector and emitter connected -> no more positive voltage for light blob -> light blob switches off -> NOT gate
	1. AND gate
		- Serial connection of 2 transistors
	1. OR gate
		- Parallel connections of 2 transistors
	1. XOR gate: 5 transistors
	1. NAND gate
	1. NOR gate
	1. XNOR gate

