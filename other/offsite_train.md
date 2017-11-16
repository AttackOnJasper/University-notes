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
