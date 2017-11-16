# Offsite Training

## Acceptance Tests
### Acceptance vs End-to-End

### Basic elements for selenium tests
- WebDriver
- WebElement
	- represents a single HTML tag
- By
	- descirbes a locator for an element

### Page Object Model
- Principles
	- No assertions in PageObject
	- Don't reveal page structure
	- Use permanent locators - 'tid'
	- try never need to rewrite the test based on function change
- PageObject: a single page 
- Block: part of a single page

- @Timeout annotation


## Automation Tests
- Don't do assertTrue(boolean); do assertTrue(String, boolean) instead
- Issue: people confuse the parameter order for assertEquals
	- Solution: assertThat

## Resilience
- Definition: 
- Solutions
	- Fallback
	- Circuit Break
	- Bulkhead

## DOM (Document Object Model)
### Frontend code is harder to write and maintain than backend code
- Why can't we write front-end code like back-end code?
	- SOY template rendering
	- changes to DOM are expensive
- Solution: Incremental DOM
	- a virtual DOM developed by Google
	- Event binding would be easier to write and maintain without looking into JS code
	- **Declarative Programming**: describes what to do instead of how to do

## Application Security
### Physical Security
### Identity and Access
### OWASP Top 10
- XSS, SQL, Shell injection
- CSRF
- IDOR

## Software Design
- Steps
	- System design: determine infrastructure and contracts
	- Project design: organize project, focus on team and agility
	- Component design: organize code, optimize individual comprehension and productivity
- Component design happens everytime we add / change a component of code
- Justify every line of code added
- Practices
	- Separate every class and method into its contract and implementation
	- Use consistent, precise language
	- Expose minimum info needed to do the job
	- Document / comment if necessary
	- Embrace Dumb Models
	- Use factory methods librally
	- Default to Immutability
	- Use Semantic logging
		- e.g. logger.info("process {}", id);
	- Wrap manipulation of Collection (e.g. stream() operation) into an object to increase readability

## How Google deliver software
- Cider: web based IDE
	- be able to work & submit CR during commute
- Code coverage (a measure used to describe the degree to which the source code of a program is executed when a particular test suite runs) visibility

## Software Architecture
- Layer
	- presentation
	- application
	- infrastrcture
- Clean 
- Hex
- Onion architecture

## JSON Schema
- A meta language on top of JSON to validate JSON

## Elastic Search Issue
Lesson:
- find the right tool
- know the tool
- keep it simple

## Guice