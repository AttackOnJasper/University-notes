# Functions
## Definitions
- $$ f(a) = b $$: function (every vertical line cuts f in one place), domain, range  
- Composition $$ f(g(x)) $$ != $$ g(f(x)) $$
- Odd function: $$ f(-x) = -f(x) $$ e.g. $$f(x) = x^3 $$
- One-to-one mapping
- Function types: polynomial, rational, trigonometric, exponential, log, parametrically defined, polar

# Limit and Continuity
- $$\lim\limits_{x \to c}f(x) = L $$ exists when L is relatively same value when x approximates to c from left or right
- One-sided limit: - for left hand, + for right hand

## Asymptotes
Horizontal asymptotes; vertical asymtotes


## Theorems
If $$\lim f(x) $$ and $$\lim g(x) $$ are finite numbers, then  
$$\lim kf(x) = k\lim f(x) $$  
$$ \lim[f(x) + g(x)] = \lim f(x) + \lim g(x) $$  
Sandwitch Theorem  
Trigonometric limit: $$ \lim\limits_{x \to 0}\frac{sinx}{x} = 1 $$  
e can be defined as $$ e = \lim\limits_{n \to \infty}(1 + \frac{1}{n})^n $$

## Continuity
- Definition: continous at c when f(c) exists (i.e. c is in domain of f) & $$\lim\limits_{x \to c}f(x) = f(c)$$

### Theorems
- Extreme value theorem
- Intermediate value theorem
- Continous function theorem

# Differentiation
## Definition
$$f'(a) = \lim\limits_{h \to 0}\frac{f(a+h) - f(a)}{h}$$

## Chain rule

## Differentiability and Continuity
- If f has derivative in c, then f is continuous at c
	- Proof: If $$ f'(c) $$ exists, then $$ \lim\limits_{x \to c}f(x) = f(c) $$, thus f is continous at x = c
- The other way is not true: Continuity does not imply differentiability

## Derivatives of parametrically defined functions
- If $$x = f(t), y = g(t) $$, then $$\frac{dy}{dx} = \frac{\frac{dy}{dt}}{\frac{dx}{dt}}$$

## Implicit Differentiation
e.g. F(x, y) = 0 and wanna get $$\frac{dy}{dx}$$

## L'Hopital's Rule
- In many extreme cases $$ \lim\frac{f(x)}{g(x)} = \lim\frac{f'(x)}{g'(x)} $$

# Applications of Differential Calculus
- Critical points: slope is 0
- Tangent & normal
- Maximum, minimum (depends on second derivative), and inflection points (second derivative = 0)
- Motion along lines and curves
- Tangent line approximation

## Slope of polar curves
- $$ x = f(\theta)cos\theta, y = f(\theta)sin\theta $$, then we can get derivative by using chain rules

# Antidifferentiation

# Statistical Applications
## Distributions
### Normal distribution
- Continous probability distribution
- Curve depends on mean and s.d. ($$ \sigma = \sqrt{\frac{1}{N}\sum^N_{i=1}(x_i - \mu)^2} $$)

### Correlation
- Formula: $$ r_{xy} = \frac{\sigma_{xy}}{\sigma_x\sigma_y} = \frac{\sum(x_i - \mu_x)(y_i - \mu_y)}{\sqrt{\sum(x_i - \mu_y)^2\sum(y_i - \mu_y)^2}} $$