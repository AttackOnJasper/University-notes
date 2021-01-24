# Spring Framework
## Overview
- developed by Rod Johnson in 2003

### Key Concept: Inversion of Control
- **Definition** a programming principle which inverts the flow of control as compared to traditional control flow.
	- in traditional programming, the custom code that expresses the purpose of the program calls into reusable libraries to take care of generic tasks (e.g. main method is the entry point), but with inversion of control, it is the framework that calls into the custom, or task-specific, code.
- **Benefits**:
	- increases modularity of the program; makes the code loosely coupled so easy to maintain (removes dependency)
	- makes program extensible
	- makes the code easy to test
- **Concept**
	- Terms
		- **Component** a glob of software that's intended to be used, without change, by an application that is out of the control of the writers of the component
		- **Service** similar to a component in that it's used by foreign applications via remote interface either synchronous or asynchronous
	- Assumption: class A needs to use class BImpl via interface B
	- Explanation
		- In traditional approach: A directly depends on B and BImpl
			- If there are more **plugins**, how to assemble those plugins into the application? Answer: IoC
		- **IoC**: 
			- What is **inverted**? The inversion is about how those lightweight containers lookup a plugin implementation
			- Since **IoC** is too broad, we will use a specific term to refer to the inversion of plugin lookup as **dependency injection**. (Note that DI is not the only way to achieve IoC, which can also be achieved via Service Locator)
	- Dependency Injection achieves IoC
		- Idea: have an assembler to populate a field in class A with an appropriate implementation for interface B
		- Approaches
			- Setter injection
			- Constructor injection
			- Interface injection
		- Benefits
			- Prevent one class from directly depending on another class, resulting in less dependencies.
- References
	- https://martinfowler.com/articles/injection.html#InversionOfControl

### Benefits
- Pre-defined templates
- Loose coupling (via DI)
- Easy to test (via DI)
- Lightweight: does not force implementing / inheriting interfaces or superclasses; non-invasive

### Modules
e.g. core, beans, context, expression language, AOP, Aspects, Instrumentation, JDBC, ORM, OXM, JMS, Transaction, Web, Servlet, Struts

## IoC / DI
### IoC Container
- Responsible for instantiating the application class, configuring the object, and assembling the dependencies between the objects
- Types
	- `BeanFactory`
	- `ApplicationContext`
		- built on top of the BeanFactory interface
		- extra features: simple integration with Spring's AOP, message resource handling (for I18N), event propagation, application layer specific context (e.g. WebApplicationContext) for web application

### DI via Constructor

### DI via Setter

### Autowiring
- Features
	- enables injecting the object dependency implicitly
	- internally uses setter or constructor injection
	- can't be used to inject primitive and string values. It works with reference only.

### Annotations
- Autowired




