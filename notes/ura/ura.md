# Undergrad Research Assistant Project

## Terms
### MDP: Markov decision process
#### Markov Process
* Describes an environment for reinforcement learning
	* Environment is fully observable
	* State completely characterises the process
	* Almost all RL problems can be formalised as MDPs
* "The future is independent of past given the present"
	* $$ P[S_{t+1}|S_t] = P[S_{t+1} | S_1, ..., S_t] $$ where P stands for probability and S stands for state.
	* i.e. the current state is a sufficient statistic of the future
* State Transition Probability from s to s': $$ P_{ss'} = P[S_{t+1} = s' | S_{t} = s] $$
* State Transition Matrix 

#### Markov chain
* A stochastic model describing a sequence of possible events in which the probability of each event depends **only** on the state attained in the previous event
* Can be represented by finite state machine in which transitions are probability driven
* Sample episodes
	* A sequence of passed states e.g. 011001010111
* Background
	* Independent events have been proven to follow certain patterns after repeated trials
		* Estimating unknown probabilities of events based on number of times that the event occurs in independent trials
		* E.g. draw 1 ball with replacement from a bag of black and white balls repeatedly to see what's the ratio between black and white
		* This not only applies for convergence (e.g. determine the exact ratio), but also applies for distribution (e.g. normal distribution)
			* Central Limit Theorem
	* Andrey Markov claimed that the pattern applied for **dependent variables** as well.
		* e.g. If coin flip result depends on the previous flip, then equilibrum can still be achieved if run in sequence
		* States can be modeled in transition matrices
	* Concept of modeling sequences of random events using states and transition between states is known as a Markov chain

#### POMDP: Partially observable Markov decision process

### SNAP: Syndetic Assistance Processes
* 
