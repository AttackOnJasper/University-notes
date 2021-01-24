# STAT 230 (Winter 2014)

## Intro to Probability
### Definitions of Probability
- **Relative frequency** Prob of an event is the (limiting) proportion of times the event occurs in a very long series of repetitions of an experiment or process.
- **Subjective probability** Prob of an event is a measure of how sure the person making the statement is that the event will happen

## Math Probability Model
- **Sample space** S is a set of distinct outcomes for an experiment or process, with the property that in a single trial, one and only one of these outcomes occurs.
	- discrete vs continuous
- **Probability Model** 
	- sample space of possible outcomes is defined
	- set of events, subsets of the sample space to which we can assign probabilities, is defined
- An event in a **Discrete sample space** is a subset $$A \in S$$ 
	- **Simple event** the event is indivisible - only 1 event e.g. a1
	- **Compound event** made up of 2 or more simple events e.g. A
	- **Probabilities**: P(a1), P(a2)
	- P(ai) is called probability distribution over S
	- $$ P(A) = \sum_{a \in A}P(a)$$


## Permutations & Combinations
- Permutation: $$ n^{(k)} = \frac{n!}{(n-k)!} $$
- Combination: not interested in arrangement $$ \begin{pmatrix} n \\ k \end{pmatrix} = \frac{n!}{(n-k)!k!} = \begin{pmatrix} n \\ n - k \end{pmatrix} $$

### Series
- Geometric series
- Binomial Theorem
- Multinomial Theorem
- Hypergeometric Identity
- Exponential series

## Probability rules and Conditional probability
### Intersections of events and Independence
- Events A and B are independent iff $$P(AB) = P(A)P(B)$$

### Conditional Probability
- Determine the probability of A given that B has already occurred: P(A|B)
- $$P(A|B) = \frac{P(AB)}{P(B)} $$
- $$P(A|B) = P(A)$$ if A and B are independent

### Multiplication and Partition
- Product rules: $$P(ABCD) = P(A)P(B|A)P(C|AB)P(D|ABC)$$
- Partition rule: if $$A_1, A_2, ... A_k $$ partitions S, then $$P(B) = \sum^k_{i=1}P(B|A_i)P(A_i)$$

