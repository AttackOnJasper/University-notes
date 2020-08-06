# Math 136 Review Linear Algebra

## Lecture 1
- **Vector** n-tuple of real numbers
	- Elements in a vector are called **entries**, **components**, or **coordinates**
	- Column vector / row vector
- **Collinear** one vector is a scalar multiple of the other
- **Linear combinations of vectors** a sum of scalar multiples of vectors
- Vectors within 3-d can be represented as **Direct Line Segment** (starting from 0 and end from ($$x_1, x_2, x_3 $$))

**Vector Equation** of the line L: $$ \vec x = \vec a + t\vec d $$, where d is **direction vector**

2 lines $$ L_{1} $$ and $$ L_{2} $$ are parallel if direction vector $$ d_{1} $$ is a scalar multiple of direction vector $$ d_{2} $$

## Lecture 2
- **Linearly independent set** (each vector is not a linear combination of any other vectors in the set)
	- each L.I. set cannot contain 0 
	- If a vector $$ \vec v $$ in U is a linear combination of others, we say $$ \vec v $$ is **redundant in U**

- $$ z = s\vec v + t\vec w + \vec b $$ represents a plane in 3-d
- If $$ \vec b \in \Re^n $$, then $$ \vec z = \vec b + a_1\vec v_1 + a_2\vec v_2 + ... + a_k\vec v_k $$ where k < n is **k-flat** in $$\Re^n$$.
	- Plane in $$\Re^3$$ is 2-flat 
	- Hyperplane ($$\Re^n$$ where n > 3): (n-1)-flat

## Lecture 3
- $$ \Re^n $$ is not only the set of all n-tuples of real numbers but also as a vector space
- a subset W of $$ \Re^n $$ is a subspace of $$ \Re^n $$ if W is a non-empty subset (i.e. has some vectors and contains 0) and is 'closed under scalar multiplication' and 'closed under addition' (i.e. if $$ \vec u, \vec w \in W $$, then $$ \alpha \vec u \in W $$ and $$ \vec u + \vec w \in W $$)
	- Straight lines $$ \vec x = t\vec v $$ and planes $$ \vec x = s\vec v + t\vec w $$ are subspaces in $$ \Re^3 $$

### Span
- $$ S = span\{v_{1}, v_{2}, ..., v_{k}\} $$ means S is the set of all linear combinations of the vectors $$ \vec v_{1} ... \vec v_{k} $$
	- the vectors $$ \vec v_{1} ... \vec v_{k} $$ is a **spanning family** of S or a **spanning set** of S
	- The set {$$ e_{1}, e_{2}, ... e_{n} $$} spans $$ \Re^n $$
	- Span is a subspace, and every subspace S of $$ \Re^n $$ has a finite spanning family
- If S = span{$$ v_{1}, v_{2}, ..., v_{k} $$} where {$$ v_{1}, v_{2}, ..., v_{k} $$} is L.I., then {$$ v_{1}, v_{2}, ..., v_{k} $$} is a **basis** of subspace S
	- {$$ e_{1}, e_{2}, ... e_{n} $$} is the standard basis of $$ \Re^n $$

## Lecture 4
### Dot product
### Norm (length) of x, denoted by $$ \lVert x \rVert $$, is $$ \lVert x \rVert = \sqrt{x*x} $$
- for every $$ \vec x $$, $$ \lVert x \rVert \geqslant 0 $$ 
- $$ \lVert x + y \rVert \leqslant \lVert x \rVert + \lVert y \rVert $$ 
- Cauchy-Schwartz inequality: $$ \lVert x * y \rVert \leqslant \lVert x \rVert * \lVert y \rVert $$ 
- **Unit vector in direction of a** is $$ \frac{a}{\lVert a \rVert} $$
	- if b has the same direction as a, then $$ \frac{a}{\lVert a \rVert} = \frac{b}{\lVert b \rVert} $$
- Let a and b be 2 vectors in $$ \Re^n $$, distance between 2 vectors is $$ \lVert b - a \rVert $$
	- angle between a and b: $$ \cos\theta = \frac{a * b}{\lVert b \rVert * \lVert a \rVert}  $$

### Orthogonal / orthogonal set
- orthonormal set: orthogonal set & $$ \lVert v_{i} \rVert = 1 $$ for i = 1 to k
- In $$ \Re^{2}, \Re^{3} $$, orthogonal non-zero vectors are perpendicular

## Lecture 5 Cross Product in $$ \Re^{3} $$
- Properties
	- $$ a \times b $$ is orthogonal to both a and b
	- $$ a \times 0 = 0 = 0 \times a $$
	- $$ a \times b = - (b \times a) $$
	- $$ \lVert a \times b \rVert = \lVert b \rVert * \lVert a \rVert * \sin\theta $$
- Right-hand rule

## Lecture 6 Planes in $$ \Re^{3} $$
- P(n,a) as being all vectors s.t. $$ x - a \perp n $$
	- \vec n is the **normal to the plane**
- if $$ \Re^{n} $$ where n > 3, then the set of vectors is called a **hyperplane**
- **Scalar equation of the plane**: $$ n_1x_1 + n_2x_2 + n_3x_3 = d $$

## Lecture 8 Systems of linear equations
- **Linear equations** $$ a_1x_1 + a_2x_1 + ... + a_nx_n = b $$, where x's are variables, a's are coefficients, b is constant
- Systems of linear equations
- 2 systems of linear equations are **equivalent systems** if they have the same set of solutions
- Coefficient matrix / augmented coefficient matrix
- **Pivot**: the first non-zero number in a row of a matrix
- Reduced row echelon form (RREF)
	- All pivots are leading-1s
	- A leading-1 is the only entry in its column which is not zero

## Lecture 9 Solutions of RREF systems
- Thm: if a system of linear equatins has more than 1 solution, then it has infinitely many solutions
- Basic unknowns / free unknowns
- Rank of coefficient matrix A = number of basic variables

## Lecture 10 Gaussian elimination

## Lecture 11 Homogeneous systems
- Homogeneous system: [A | 0]
	- associated homogeneous system for [A | b]

## Lecture 12 Matrices and matrix algebra
- $$ A \in \Re^{m*n} $$ means m rows & n columns
- row-vectors, column-vectors, column matrix, row matrix
- Transpose
- Symmetric: $$ A = A^T $$
- Trace of A is the sum of the numbers on the main diagonal
- Matrix-vector multiplication
	- allows us express a system of m linear equations with n unknowns
	- can be seen as a linear combination of column vectors

## Lecture 13 Matrix multiplication
- Block multiplication

## Lecture 14 Linear mappings I

## Lecture 15 Linear mappings II

## Lecture 16 Subspaces assoicated to linear mappings


	
 